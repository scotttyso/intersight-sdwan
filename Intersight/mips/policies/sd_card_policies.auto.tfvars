#______________________________________________
#
# Sd Card Policy Variables
#______________________________________________

sd_card_policies = {
  "sdcard_os" = {
    description        = ""
    enable_diagnostics = false
    enable_drivers     = false
    enable_huu         = false
    enable_os          = true
    enable_scu         = false
    organization       = "mips"
    tags               = []
  }
  "sdcard_disabled" = {
    description        = ""
    enable_diagnostics = false
    enable_drivers     = false
    enable_huu         = false
    enable_os          = false
    enable_scu         = false
    organization       = "mips"
    tags               = []
  }
  "sdcard_utility" = {
    description        = ""
    enable_diagnostics = false
    enable_drivers     = false
    enable_huu         = true
    enable_os          = true
    enable_scu         = true
    organization       = "mips"
    tags               = []
  }
}
