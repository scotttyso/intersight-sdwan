#______________________________________________
#
# UCS Server Profile Template Variables
#______________________________________________

ucs_server_profile_templates = {
  "mips_template" = {
    description     = "mips_template UCS Server Profile Template"
    organization    = "mips"
    target_platform = "Standalone"
    #___________________________
    #
    # Compute Configuration
    #___________________________
    bios_policy                = "mips_Virtualization"
    boot_order_policy          = ""
    persistent_memory_policies = "[{}]"
    virtual_media_policy       = ""
    #___________________________
    #
    # Management Configuration
    #___________________________
    device_connector_policies     = "[{'mips_devcon': [{'configuration_lockout': True, 'description': 'mips_devcon Device Connector Policy', 'organization': 'mips', 'tags': []}]}]"
    ipmi_over_lan_policy          = "mips_ipmi"
    ldap_policy                   = ""
    local_user_policy             = "mips_local_users"
    network_connectivity_policy   = "mips_dns"
    ntp_policy                    = "mips_ntp"
    serial_over_lan_policy        = "mips_sol"
    smtp_policy                   = "mips_smtp"
    snmp_policy                   = "mips_snmp"
    ssh_policy                    = "mips_ssh"
    syslog_policy                 = "mips_syslog"
    virtual_kvm_policy            = "mips_vkvm"
    #___________________________
    #
    # Storage Configuration
    #___________________________
    sd_card_policy = ""
    storage_policy = ""
    #___________________________
    #
    # Network Configuration
    #___________________________
    adapter_configuration_policy = ""
    lan_connectivity_policy      = ""
    san_connectivity_policy      = ""
    tags = []
  }
}