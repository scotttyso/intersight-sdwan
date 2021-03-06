#______________________________________________
#
# SNMP Policy Variables
#______________________________________________

snmp_policies = {
  "SNMP" = {
    description             = "MIPS SNMP Policy"
    enable_snmp             = true
    organization            = "mips"
    snmp_community_access   = "Disabled"
    snmp_engine_input_id    = ""
    snmp_port               = 161
    system_contact          = "Richfield Admins"
    system_location         = "Richfield, Ohio"
    tags         = []
    snmp_trap_destinations  = {}
    snmp_users = {
      "snmp_user" = {
        auth_password    = 1,
        auth_type        = "SHA",
        privacy_password = 1,
        privacy_type     = "AES",
        security_level   = "AuthPriv",
      },
    }
  }
}