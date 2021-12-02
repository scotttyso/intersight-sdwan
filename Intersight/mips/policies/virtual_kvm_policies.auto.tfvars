#______________________________________________
#
# Virtual KVM Policy Variables
#______________________________________________

virtual_kvm_policies = {
  "vKVM" = {
    description               = "Virtual KVM Policy"
    enable_local_server_video = true
    enable_video_encryption   = true
    enable_virtual_kvm        = true
    maximum_sessions          = 4
    organization              = "mips"
    remote_port               = 2068
    tags                      = []
  }
}