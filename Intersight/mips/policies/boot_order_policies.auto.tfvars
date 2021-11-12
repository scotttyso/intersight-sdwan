#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_order_policies = {
  "mips_boot_order" = {
    boot_mode          = "Uefi"
    description        = "mips_boot_order Boot Order Policy"
    enable_secure_boot = false
    organization       = "mips"
    tags         = []
    boot_devices = {
      "CIMC_DVD" = {
        enabled     = true
        object_type = "boot.VirtualMedia"
        Subtype     = "cimc-mapped-dvd"
      },
      "KVM_DVD" = {
        enabled     = true
        object_type = "boot.VirtualMedia"
        Subtype     = "kvm-mapped-dvd"
      },
      "MRAID" = {
        enabled                = true
        object_type            = "boot.LocalDisk"
        Slot                   = "MRAID"
      },
    }
  }
  "mips_nvme" = {
    boot_mode          = "Uefi"
    description        = "mips_nvme Boot Order Policy"
    enable_secure_boot = false
    organization       = "mips"
    tags         = []
    boot_devices = {
      "KVM_DVD" = {
        enabled     = true
        object_type = "boot.VirtualMedia"
        Subtype     = "kvm-mapped-dvd"
      },
      "MRAID" = {
        enabled                = true
        object_type            = "boot.LocalDisk"
        Slot                   = "MRAID"
      },
      "UEFI" = {
        enabled                = true
        object_type            = "boot.UefiShell"
      },
    }
  }
}