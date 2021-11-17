#______________________________________________
#
# WWPN Pool Variables
#______________________________________________

wwpn_pools = {
  "SVB_pool_a" = {
    assignment_order = "sequential"
    id_blocks        = [
      {
        from = "20:00:00:25:B5:00:A0:00"
        to = "20:00:00:25:B5:00:A3:E7"
      },
    ]
    organization     = "SVB"
    pool_purpose     = "WWPN"
    tags             = []
  }
  "SVB_pool_b" = {
    assignment_order = "sequential"
    id_blocks        = [
      {
        from = "20:00:00:25:B5:00:B0:00"
        to = "20:00:00:25:B5:00:B3:E7"
      },
    ]
    organization     = "SVB"
    pool_purpose     = "WWPN"
    tags             = []
  }
}