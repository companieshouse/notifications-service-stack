module "notification_attachments_key" {
  source = "git@github.com:companieshouse/terraform-modules//aws/kms?ref=1.0.408"

  description             = "Encrypts email attachments for the notifications stack"
  kms_key_alias           = "notification-attachments-${var.environment}"
  enable_key_rotation     = true
  deletion_window_in_days = 30

  kmsuser_principals = [
    "role/${local.name_prefix}-upload",
    "role/${local.name_prefix}-read",
  ]

}
