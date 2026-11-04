locals {
  stack_name = "notifications"
  notification_attachments_writer_role_arns = { for env in var.user_principals_envs : 
    env => "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.stack_name}-${env}-upload"
  }
}
