#______________________________________________
#
# SSH Policy Variables
#______________________________________________

ssh_policies = {
  "SSH" = {
    description  = "MIPS SSH Policy"
    enable_ssh   = true
    organization = "mips"
    ssh_port     = 22
    ssh_timeout  = 1800
    tags         = []
  }
}