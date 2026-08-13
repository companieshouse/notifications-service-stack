resource "aws_s3_bucket" "notification_attachments" {
  bucket = "notification_attachments-${var.environment}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "notification_attachments" {
  bucket = aws_s3_bucket.notification_attachments.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.notification_attachments_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "notification_attachments" {
  bucket = aws_s3_bucket.notification_attachments

  rule {
    id = "AttachmentRetention"

    expiration {
      days = 180
    }

    status = "Enabled"
  }
}
