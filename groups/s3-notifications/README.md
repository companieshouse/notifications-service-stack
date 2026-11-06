<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3, < 2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0, < 7.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 5.0.0, < 6.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.71.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_notification_attachments_key"></a> [notification\_attachments\_key](#module\_notification\_attachments\_key) | git@github.com:companieshouse/terraform-modules//aws/kms | 1.0.448 |

## Resources

| Name | Type |
| ---- | ---- |
| [aws_s3_bucket.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.notifications_attachment_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use for deployment. | `string` | `"development-eu-west-2"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region for deployment. | `string` | `"eu-west-2"` | no |
| <a name="input_user_principals_envs"></a> [user\_principals\_envs](#input\_user\_principals\_envs) | The environments for which user principals are defined. | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->