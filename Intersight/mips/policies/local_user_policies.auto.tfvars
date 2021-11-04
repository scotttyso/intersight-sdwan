#______________________________________________
#
# Local User Policy Variables
#______________________________________________

local_user_policies = {
  "mips_local_users" = {
    always_send_user_password = false
    description               = "mips_local_users Local User Policy"
    enable_password_expiry    = true
    enforce_strong_password   = true
    grace_period              = 0
    notification_period       = 15
    organization              = "mips"
    password_expiry_duration  = 90
    password_history          = 5
    users = {
      "admin" = {
        enabled = true
        password = 1
        role     = "admin"
      },
    }
    tags         = []
  }
}