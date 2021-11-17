#______________________________________________
#
# WWNN Pool Variables
#______________________________________________

wwnn_pools = {
  "SVB_pool" = {
    assignment_order = "sequential"
    id_blocks        = [
      {
        from = "20:00:00:25:B5:00:00:00"
        to = "20:00:00:25:B5:00:03:E7"
      },
    ]
    organization     = "SVB"
    pool_purpose     = "WWNN"
    tags             = []
  }
}