#______________________________________________
#
# Ethernet QoS Policy Variables
#______________________________________________

ethernet_qos_policies = {
  "mips_qos" = {
    description           = "mips_qos Ethernet QoS Policy"
    enable_trust_host_cos = false
    mtu                   = 1500
    organization          = "mips"
    rate_limit            = 0
    tags                  = []
  }
}