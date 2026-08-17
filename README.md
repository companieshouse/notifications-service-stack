<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0, < 6.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 5.0.0, < 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_chs-notification-api-alb"></a> [chs-notification-api-alb](#module\_chs-notification-api-alb) | git@github.com:companieshouse/terraform-modules//aws/application_load_balancer | 1.0.408 |
| <a name="module_ecs-cluster"></a> [ecs-cluster](#module\_ecs-cluster) | git@github.com:companieshouse/terraform-modules//aws/ecs/ecs-cluster | 1.0.408 |
| <a name="module_notification_attachments_key"></a> [notification\_attachments\_key](#module\_notification\_attachments\_key) | git@github.com:companieshouse/terraform-modules//aws/kms | 1.0.408 |
| <a name="module_secrets"></a> [secrets](#module\_secrets) | git@github.com:companieshouse/terraform-modules//aws/parameter-store | 1.0.408 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_public_access_block.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.notification_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_ec2_managed_prefix_list.admin_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_managed_prefix_list) | data source |
| [aws_kms_key.stack_configs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_subnet.management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.routing_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [vault_generic_secret.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_desired_instance_count"></a> [asg\_desired\_instance\_count](#input\_asg\_desired\_instance\_count) | The desired number of instances in the autoscaling group for the cluster. Must fall within the min/max instance count range. | `number` | `0` | no |
| <a name="input_asg_max_instance_count"></a> [asg\_max\_instance\_count](#input\_asg\_max\_instance\_count) | The maximum allowed number of instances in the autoscaling group for the cluster. | `number` | `0` | no |
| <a name="input_asg_min_instance_count"></a> [asg\_min\_instance\_count](#input\_asg\_min\_instance\_count) | The minimum allowed number of instances in the autoscaling group for the cluster. | `number` | `0` | no |
| <a name="input_asg_scaledown_schedule"></a> [asg\_scaledown\_schedule](#input\_asg\_scaledown\_schedule) | The schedule to use when scaling down the number of EC2 instances to zero. | `string` | `""` | no |
| <a name="input_asg_scaleup_schedule"></a> [asg\_scaleup\_schedule](#input\_asg\_scaleup\_schedule) | The schedule to use when scaling up the number of EC2 instances to their normal desired level. | `string` | `""` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use for deployment. | `string` | `"development-eu-west-2"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region for deployment. | `string` | `"eu-west-2"` | no |
| <a name="input_cert_domain"></a> [cert\_domain](#input\_cert\_domain) | The certificate domain to use. | `string` | n/a | yes |
| <a name="input_create_eventbridge_scheduler_group"></a> [create\_eventbridge\_scheduler\_group](#input\_create\_eventbridge\_scheduler\_group) | Whether to create the ECS EventBridge scheduler group | `bool` | `true` | no |
| <a name="input_create_eventbridge_scheduler_role"></a> [create\_eventbridge\_scheduler\_role](#input\_create\_eventbridge\_scheduler\_role) | Whether to enable eventbridge scheduler iam role in ecs cluster. | `bool` | `true` | no |
| <a name="input_create_route53_aliases"></a> [create\_route53\_aliases](#input\_create\_route53\_aliases) | Whether to create Route53 aliases pointing to the ALB | `bool` | `false` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | n/a | yes |
| <a name="input_ec2_image_id"></a> [ec2\_image\_id](#input\_ec2\_image\_id) | The machine image name for the ECS cluster launch configuration. | `string` | `"ami-04018f95156d810bc"` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | The instance type for ec2 instances in the clusters. | `string` | `"t3.medium"` | no |
| <a name="input_ec2_key_pair_name"></a> [ec2\_key\_pair\_name](#input\_ec2\_key\_pair\_name) | The key pair for SSH access to ec2 instances in the clusters. | `string` | n/a | yes |
| <a name="input_enable_asg_autoscaling"></a> [enable\_asg\_autoscaling](#input\_enable\_asg\_autoscaling) | Whether to enable auto-scaling of the ASG by creating a capacity provider for the ECS cluster. | `bool` | `true` | no |
| <a name="input_enable_chs_notification_api_alb"></a> [enable\_chs\_notification\_api\_alb](#input\_enable\_chs\_notification\_api\_alb) | Defines whether an ALB for the chs-notification-api should be created (true) or not (false) | `bool` | `true` | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | A boolean value indicating whether to enable Container Insights or not | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name, defined in envrionments vars. | `string` | n/a | yes |
| <a name="input_hashicorp_vault_password"></a> [hashicorp\_vault\_password](#input\_hashicorp\_vault\_password) | The password used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_hashicorp_vault_username"></a> [hashicorp\_vault\_username](#input\_hashicorp\_vault\_username) | The username used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_route53_aliases_chs_notification_api"></a> [route53\_aliases\_chs\_notification\_api](#input\_route53\_aliases\_chs\_notification\_api) | The Route53 aliases to create for chs-notification-api lb. | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
