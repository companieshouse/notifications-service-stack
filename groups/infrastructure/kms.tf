resource "aws_kms_key" "notification_attachments_key" {
  description             = "This key is used to encrypt objects ub the notification_attachments S3 bucket"
  deletion_window_in_days = 30
  policy                  = data.aws_iam_policy_document.kms_key_policy.json
  enable_key_rotation     = true
}

resource "aws_kms_alias" "notification_attachments_key_alias" {
  name          = "alias/notification-attachments-${var.environment}"
  target_key_id = aws_kms_key.notification_attachments_key.key_id
}
