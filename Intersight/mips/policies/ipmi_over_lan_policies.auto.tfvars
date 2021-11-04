#______________________________________________
#
# IPMI over LAN Policy Variables
#______________________________________________

ipmi_over_lan_policies = {
  "mips_ipmi" = {
    description    = "mips_ipmi IPMI over LAN Policy"
    enabled        = true
    ipmi_key       = 1
    organization   = "mips"
    privilege      = "admin"
    tags           = []
  }
}