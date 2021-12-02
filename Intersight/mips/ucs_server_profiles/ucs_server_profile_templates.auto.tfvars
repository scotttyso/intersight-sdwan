#______________________________________________
#
# UCS Server Profile Template Variables
#______________________________________________

ucs_server_profile_templates = {
  "mips_template_1" = {
    description     = "mips_template UCS Server Profile Template"
    organization    = "mips"
    target_platform = "Standalone"
    #___________________________
    #
    # Compute Configuration
    #___________________________
    bios_policy              = "Virtualization"
    boot_order_policy        = "Uefi_MRAID"
    persistent_memory_policy = ""
    virtual_media_policy     = ""
    #___________________________
    #
    # Management Configuration
    #___________________________
    device_connector_policy     = ""
    ipmi_over_lan_policy        = "IPMI"
    ldap_policy                 = ""
    local_user_policy           = "Local_Users"
    network_connectivity_policy = "DNS"
    ntp_policy                  = "NTP"
    serial_over_lan_policy      = "SoL"
    smtp_policy                 = "SMTP"
    snmp_policy                 = "SNMP"
    ssh_policy                  = "SSH"
    syslog_policy               = "Syslog"
    virtual_kvm_policy          = "vKVM"
    #___________________________
    #
    # Storage Configuration
    #___________________________
    sd_card_policy = "sdcard_disabled"
    storage_policy = "RAID1"
    #___________________________
    #
    # Network Configuration
    #___________________________
    adapter_configuration_policy = ""
    lan_connectivity_policy      = ""
    san_connectivity_policy      = ""
    tags = []
  }
  "mips_template_2" = {
    description     = "mips_template UCS Server Profile Template"
    organization    = "mips"
    target_platform = "Standalone"
    #___________________________
    #
    # Compute Configuration
    #___________________________
    bios_policy              = "Virtualization"
    boot_order_policy        = "Uefi_NVMe"
    persistent_memory_policy = ""
    virtual_media_policy     = ""
    #___________________________
    #
    # Management Configuration
    #___________________________
    device_connector_policy     = ""
    ipmi_over_lan_policy        = "IPMI"
    ldap_policy                 = ""
    local_user_policy           = "Local_Users"
    network_connectivity_policy = "DNS"
    ntp_policy                  = "NTP"
    serial_over_lan_policy      = "SoL"
    smtp_policy                 = "SMTP"
    snmp_policy                 = "SNMP"
    ssh_policy                  = "SSH"
    syslog_policy               = "Syslog"
    virtual_kvm_policy          = "vKVM"
    #___________________________
    #
    # Storage Configuration
    #___________________________
    sd_card_policy = ""
    storage_policy = "RAID1v2"
    #___________________________
    #
    # Network Configuration
    #___________________________
    adapter_configuration_policy = ""
    lan_connectivity_policy      = ""
    san_connectivity_policy      = ""
    tags = []
  }
}