#!/usr/bin/env python3
"""Intersight Device Connector API configuration and device claim via the Intersight API."""
from intersight.intersight_api_client import IntersightApiClient
from intersight.apis import asset_device_claim_api
from time import sleep
import argparse
import device_connector
import json
import os.path
import sys
import stdiomask
import validators


if __name__ == "__main__":
    return_code = 0

    valid = False
    while valid == False:
        if os.environ.get('api_base_uri') is None:
            api_base_uri = input('What is the api_base_uri?'\
                '\nPress Enter to choose the default uri of [https://intersight.com/api/v1]: ')
            if api_base_uri == '':
                api_base_uri = 'https://intersight.com/api/v1'
        else:
            api_base_uri = os.environ.get('api_base_uri')

        if validators.url(api_base_uri):
            valid = True
        else:
            print('Invalid URL.  Please Re-Enter the api_base_uri.')

    valid = False
    while valid == False:
        if os.environ.get('api_key_id') is None:
            api_key_id = stdiomask.getpass(prompt='Enter the api_key_id: ')
        else:
            api_key_id = os.environ.get('api_key_id')

        if validators.length(api_key_id, min=74, max=74):
            valid = True
        else:
            print('Invalid API Key.  Please Re-Enter the api_key_id.')

    valid = False
    while valid == False:
        if os.environ.get('api_private_key_file') is None:
            api_private_key_file = input('Enter the api_private_key_file location: ')
        else:
            api_private_key_file = os.environ.get('api_private_key_file')

        if os.path.isfile(api_private_key_file):
            valid = True
        else:
            print('Invalid Private Key File.  Please Re-Enter the api_private_key_file.')

    intersight_api_params = {
        "api_base_uri":api_base_uri,
        "api_key_id":api_key_id,
        "api_private_key_file":api_private_key_file
    }

    try:
        parser = argparse.ArgumentParser()
        help_str = 'JSON file with device access information (device hostname, username, password, and proxy settings if required)'
        parser.add_argument('-d', '--devices', required=True, help=help_str)
        args = parser.parse_args()
        if os.path.isfile(args.devices):
            with open(args.devices, 'r') as devices_file:
                devices_list = json.load(devices_file)
        else:
            # Argument devices can be a JSON string instead of file.
            # JSON string input can be used with Ansible to directly pass all info on the command line.
            devices_list = json.loads(args.devices)

        valid = False
        while valid == False:
            if os.environ.get('username') is None:
                username = input('Enter the username to authenticate to the devices: ')
            else:
                username = os.environ.get('username')

            if not username == '':
                valid = True
            else:
                print('Invalid Username.  Please Re-Enter the username.')

        valid = False
        while valid == False:
            if os.environ.get('password') is None:
                password = stdiomask.getpass(prompt='Enter the password to authenticate to the devices: ')
            else:
                password = os.environ.get('password')

            if not password == '':
                valid = True
            else:
                print('Invalid Password.  Please Re-Enter the password.')

        for device in devices_list:
            result = dict(changed=False)
            result['msg'] = "  Host: %s" % device['hostname']
            # default access mode to allow control (Read-only False) and set to a boolean value if a string
            if not device.get('read_only'):
                device['read_only'] = False
            else:
                if device['read_only'] == 'True' or device['read_only'] == 'true':
                    device['read_only'] = True
                elif device['read_only'] == 'False' or device['read_only'] == 'false':
                    device['read_only'] = False
            
            device['username'] = username
            device['password'] = password

            # create device connector object based on device type
            if device['device_type'] == 'ucs' or device['device_type'] == 'ucsm' or device['device_type'] == 'ucspe':
                dc_obj = device_connector.UcsDeviceConnector(device)
            elif device['device_type'] == 'hx':
                dc_obj = device_connector.HxDeviceConnector(device)
            elif device['device_type'] == 'imc':
                # attempt ucs connection and if that doesn't login revert to older imc login
                dc_obj = device_connector.UcsDeviceConnector(device)
                if not dc_obj.logged_in:
                    dc_obj = device_connector.ImcDeviceConnector(device)
            else:
                result['msg'] += "  Unknown device_type %s" % device['device_type']
                return_code = 1
                print(json.dumps(result))
                continue

            if not dc_obj.logged_in:
                result['msg'] += "  Login error"
                return_code = 1
                print(json.dumps(result))
                continue

            ro_json = dc_obj.configure_connector()
            if not ro_json['AdminState']:
                return_code = 1
                if ro_json.get('ApiError'):
                    result['msg'] += ro_json['ApiError']
                print(json.dumps(result))
                continue

            # set access mode (ReadOnlyMode True/False) to desired state
            if (ro_json.get('ReadOnlyMode') is not None) and (ro_json['ReadOnlyMode'] != device['read_only']):
                ro_json = dc_obj.configure_access_mode(ro_json)
                if ro_json.get('ApiError'):
                    result['msg'] += ro_json['ApiError']
                    return_code = 1
                    print(json.dumps(result))
                    continue
                result['changed'] = True

            # configure proxy settings (changes reported in called function)
            ro_json = dc_obj.configure_proxy(ro_json, result)
            if ro_json.get('ApiError'):
                result['msg'] += ro_json['ApiError']
                return_code = 1
                print(json.dumps(result))
                continue

            # wait for a connection to establish before checking claim state
            for _ in range(10):
                if ro_json['ConnectionState'] != 'Connected':
                    sleep(1)
                    ro_json = dc_obj.get_status()
                else:
                    break

            result['msg'] += "  AdminState: %s" % ro_json['AdminState']
            result['msg'] += "  ConnectionState: %s" % ro_json['ConnectionState']
            result['msg'] += "  Claimed state: %s" % ro_json['AccountOwnershipState']

            if ro_json['ConnectionState'] != 'Connected':
                return_code = 1
                print(json.dumps(result))
                continue

            if ro_json['AccountOwnershipState'] != 'Claimed':
                # attempt to claim
                (claim_resp, device_id, claim_code) = dc_obj.get_claim_info(ro_json)
                if claim_resp.get('ApiError'):
                    result['msg'] += claim_resp['ApiError']
                    return_code = 1
                    print(json.dumps(result))
                    continue

                result['msg'] += "  Id: %s" % device_id
                result['msg'] += "  Token: %s" % claim_code

                # Create Intersight API instance and post ID/claim code
                # ----------------------
                api_instance = IntersightApiClient(
                    host=intersight_api_params['api_base_uri'],
                    private_key=intersight_api_params['api_private_key_file'],
                    api_key_id=intersight_api_params['api_key_id'],
                )

                # create device claim API handle
                api_handle = asset_device_claim_api.AssetDeviceClaimApi(api_instance)

                # post ID/Claim Code
                claim_body = {'SecurityToken': claim_code, 'SerialNumber': device_id}
                claim_result = api_handle.asset_device_claims_post(claim_body)
                result['changed'] = True

            print(json.dumps(result))

            # logout of any open sessions
            dc_obj.logout()

    except Exception as err:
        print("Exception:", str(err))
        import traceback
        print('-' * 60)
        traceback.print_exc(file=sys.stdout)
        print('-' * 60)
        sys.exit(1)

    finally:
        # logout of any sessions active after exception handling
        if ('dc_obj' in locals() or 'dc_obj' in globals()):
            dc_obj.logout()

    sys.exit(return_code)