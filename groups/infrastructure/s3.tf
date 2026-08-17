resource "aws_s3_bucket" "notification_attachments" {
  bucket = "notification-attachments-${var.environment}"
}

resource "aws_s3_bucket_public_access_block" "notification_attachments" {
  bucket = aws_s3_bucket.notification_attachments.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "notification_attachments" {
  bucket = aws_s3_bucket.notification_attachments.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = module.notification_attachments_key.key_arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true # Caches the key instead of calling KMS for every object
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "notification_attachments" {
  bucket = aws_s3_bucket.notification_attachments.id

  rule {
    id = "AttachmentRetention"
    filter {}
    expiration {
      days = 180
    }

    status = "Enabled"
  }
}
