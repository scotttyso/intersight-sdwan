#______________________________________________
#
# SMTP Policy Variables
#______________________________________________

smtp_policies = {
  "mips_smtp" = {
    description               = "mips_smtp SMTP Policy"
    enable_smtp               = true
    mail_alert_recipients = [
        "rich-lab@cisco.com",
    ]
    minimum_severity          = "critical"
    organization              = "mips"
    smtp_alert_sender_address = "rich-lab@cisco.com"
    smtp_port                 = 25
    smtp_server_address       = "smtp-ext.cisco.com"
    tags         = []
  }
}