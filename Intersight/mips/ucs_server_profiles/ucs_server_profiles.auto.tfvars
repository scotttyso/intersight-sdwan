#______________________________________________
#
# UCS Server Profile Variables
#______________________________________________

ucs_server_profiles = {
  "mips-srv01" = {
    action                        = "No-op"
    description                   = "mips-srv01 UCS Server Profile"
    organization                  = "mips"
    serial_number                 = "WZP22020L3V"
    server_assignment_mode        = "Static"
    ucs_server_profile_template   = "mips_template_2"
    tags = []
  }
  "mips-srv02" = {
    action                        = "No-op"
    description                   = "mips-srv02 UCS Server Profile"
    organization                  = "mips"
    serial_number                 = "WZP22020L71"
    server_assignment_mode        = "Static"
    ucs_server_profile_template   = "mips_template_2"
    tags = []
  }
}