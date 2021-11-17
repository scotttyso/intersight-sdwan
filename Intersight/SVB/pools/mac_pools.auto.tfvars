#______________________________________________
#
# MAC Pool Variables
#______________________________________________

mac_pools = {
  "SVB_pool_a" = {
    assignment_order = "sequential"
    mac_blocks       = [
      {
        from = "00:25:B5:00:A0:00"
        to = "00:25:B5:00:A3:E7"
      },
    ]
    organization     = "SVB"
    tags             = []
  }
  "SVB_pool_b" = {
    assignment_order = "sequential"
    mac_blocks       = [
      {
        from = "00:25:B5:00:B0:00"
        to = "00:25:B5:00:B3:E7"
      },
    ]
    organization     = "SVB"
    tags             = []
  }
}