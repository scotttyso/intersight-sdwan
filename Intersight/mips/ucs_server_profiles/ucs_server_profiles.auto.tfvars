#______________________________________________
#
# UCS Server Profile Variables
#______________________________________________

ucs_server_profiles = {
  "pa-server1" = {
    action                        = "No-op"
    description                   = "pa-server1 UCS Server Profile"
    organization                  = "mips"
    serial_number                 = "WZP23230WAE"
    server_assignment_mode        = "Static"
    ucs_server_profile_template   = "mips_template_1"
    tags = []
  }
  "mi-server1" = {
    action                        = "No-op"
    description                   = "mi-server1 UCS Server Profile"
    organization                  = "mips"
    serial_number                 = "WZP22020L3V"
    server_assignment_mode        = "Static"
    ucs_server_profile_template   = "mips_template_2"
    tags = []
  }
  "mi-server2" = {
    action                        = "No-op"
    description                   = "mi-server2 UCS Server Profile"
    organization                  = "mips"
    serial_number                 = "WZP22020L71"
    server_assignment_mode        = "Static"
    ucs_server_profile_template   = "mips_template_2"
    tags = []
  }
}