#______________________________________________
#
# UUID Pool Variables
#______________________________________________

uuid_pools = {
  "SVB_pool" = {
    assignment_order = "sequential"
    prefix           = "000025B5-0000-0000"
    uuid_blocks = [
      {
        from = "0000-000000000000"
        size = "1000"
      },
    ]
    organization     = "SVB"
    tags             = []
  }
}