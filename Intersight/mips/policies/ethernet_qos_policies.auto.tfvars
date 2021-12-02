#______________________________________________
#
# Ethernet QoS Policy Variables
#______________________________________________

ethernet_qos_policies = {
  "MIPS_qos" = {
    description           = "Ethernet QoS Policy"
    enable_trust_host_cos = false
    mtu                   = 1500
    organization          = "mips"
    rate_limit            = 0
    tags                  = []
  }
}