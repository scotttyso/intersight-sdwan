#______________________________________________
#
# IP Pool Variables
#______________________________________________

ip_pools = {
  "SVB_kvm_pool" = {
    assignment_order = "sequential"
    ipv4_block       = [
      {
        from = "198.18.0.10"
        to = "198.18.0.254"
      },
    ]
    ipv4_config      = {
      config = {
        gateway = "198.18.0.1"
        netmask = "255.255.255.0"
        primary_dns = "255.255.255.0"
        secondary_dns = ""
      }
    }
    ipv6_block       = []
    ipv6_config      = {}
    organization     = "SVB"
    tags             = []
  }
}