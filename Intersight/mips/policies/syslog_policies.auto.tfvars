#______________________________________________
#
# Syslog Policy Variables
#______________________________________________

syslog_policies = {
  "Syslog" = {
    description        = "MIPS Syslog Policy"
    local_min_severity = "warning"
    organization       = "mips"
    remote_clients    = [
      {
        enabled      = true
        hostname     = "lnx1.rich.ciscolabs.com"
        min_severity = "warning"
        port         = 514
        protocol     = "udp"
      },
      {
        enabled      = true
        hostname     = "lnx2.rich.ciscolabs.com"
        min_severity = "warning"
        port         = 514
        protocol     = "udp"
      }
    ]
    tags         = []
  }
}