#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_order_policies = {
  "Uefi_MRAID" = {
    boot_mode          = "Uefi"
    description        = "Uefi_MRAID Boot Order Policy"
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
        bootloader_description = "Uefi_Bootloader",
        bootloader_name        = "BOOTX64.EFI",
        bootloader_path        = "\\EFI\\BOOT\\",
        enabled                = true
        object_type            = "boot.LocalDisk"
        Slot                   = "MRAID"
      },
    }
  }
  "Uefi_NVMe" = {
    boot_mode          = "Uefi"
    description        = "Uefi_NVMe Boot Order Policy"
    enable_secure_boot = false
    organization       = "mips"
    tags         = []
    boot_devices = {
      "KVM_DVD" = {
        enabled     = true
        object_type = "boot.VirtualMedia"
        Subtype     = "kvm-mapped-dvd"
      },
      "NVMe" = {
        bootloader_description = "Uefi_Bootloader",
        bootloader_name        = "BOOTX64.EFI",
        bootloader_path        = "\\EFI\\BOOT\\",
        enabled                = true
        object_type            = "boot.Nvme"
      },
      "UEFI" = {
        enabled                = true
        object_type            = "boot.UefiShell"
      },
    }
  }
}