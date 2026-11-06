data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "notifications_attachment_bucket" {
  statement {
    sid       = "RestrictWriteToAllowedRoles"
    effect    = "Deny"
    actions   = ["s3:PutObject", "s3:AbortMultipartUpload"]
    resources = ["${aws_s3_bucket.notification_attachments.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "StringNotEquals"
      variable = "aws:PrincipalArn"
      values   = local.notification_attachments_writer_role_arns
    }
  }
  dynamic "statement" {
    for_each = local.notification_attachments_writer_role_arns

    content {
      sid           = "RestrictWriter${statement.key}ToPrefix"
      effect        = "Deny"
      actions       = ["s3:PutObject", "s3:AbortMultipartUpload"]
      not_resources = ["${aws_s3_bucket.notification_attachments.arn}/${statement.key}/*"]

      principals {
        type        = "AWS"
        identifiers = ["*"]
      }

      condition {
        test     = "ArnEquals"
        variable = "aws:PrincipalArn"
        values   = [statement.value]
      }
    }
  }
  statement {
    sid       = "DenyHTTP"
    effect    = "Deny"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.notification_attachments.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}
