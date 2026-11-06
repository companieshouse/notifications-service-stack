terraform {
  required_version = ">= 1.3, < 2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0, < 7.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 5.0.0, < 6.0.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

module "notification_attachments_key" {
  source = "git@github.com:companieshouse/terraform-modules//aws/kms?ref=1.0.448"

  description             = "Encrypts email attachments for the notifications stack"
  kms_key_alias           = "notification-attachments"
  enable_key_rotation     = true
  deletion_window_in_days = 30

  kmsuser_principals = flatten([for env in var.user_principals_envs : [
    "role/${local.stack_name}-${env}-upload",
    "role/${local.stack_name}-${env}-read"
  ]])

}
