#______________________________________________
#
# NTP Policy Variables
#______________________________________________

ntp_policies = {
  "mips_ntp" = {
    description  = "mips_ntp NTP Policy"
    enabled      = true
    organization = "mips"
    timezone     = "America/New_York"
    ntp_servers = [
      "0.north-america.pool.ntp.org",
      "1.north-america.pool.ntp.org",
    ]
    tags         = []
  }
}