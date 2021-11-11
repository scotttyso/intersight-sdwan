#______________________________________________
#
# Storage Policy Variables
#______________________________________________

storage_policies = {
  "M2_RAID" = {
    description = "M2 Storage Policy"
    drive_group = {}
    m2_configuration = {
      "M2" = {
        controller_slot = "MSTOR-RAID-1,MSTOR-RAID-2"
        enable          = false
      }
    }
    organization = "mips"
    tags         = []
  }
  "RAID1" = {
    description = "RAID1 Storage Policy"
    drive_group = {
      "BOOT" = {
        manual_drive_group = {
          "dg0" = {
            drive_array_spans = {
              "span_0" = {
                slots = "1,2"
              }
            }
          }
        }
        raid_level = "Raid1"
        virtual_drives = {
          "VD0" = {
            access_policy       = "Default"
            boot_drive          = true
            disk_cache          = "Default"
            expand_to_available = false
            read_policy         = "ReadAhead"
            size                = 1
            strip_size          = 64
            write_policy        = "WriteBackGoodBbu"
          }
        }
      }
    }
    organization             = "mips"
    tags                     = []
    unused_disks_state       = "NoChange"
    use_jbod_for_vd_creation = true
  }
  "RAID1v2" = {
    description = "RAID1 Version 2 Storage Policy"
    drive_group = {
      "RAID1v2_DG0" = {
        manual_drive_group = {
          "RAID1v2_DG0" = {
            drive_array_spans = {
              "RAID1v2_span_0" = {
                slots = "3,4"
              }
            }
          }
        }
        raid_level = "Raid1"
        virtual_drives = {
          "RAID1v2_VD0" = {
            access_policy       = "Default"
            boot_drive          = true
            disk_cache          = "Default"
            expand_to_available = false
            read_policy         = "ReadAhead"
            size                = 1
            strip_size          = 64
            write_policy        = "WriteBackGoodBbu"
          }
        }
      }
    }
    organization             = "mips"
    tags                     = []
    unused_disks_state       = "NoChange"
    use_jbod_for_vd_creation = true
  }
}
