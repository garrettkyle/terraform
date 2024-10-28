<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_secretsmanager_secret.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_db_major_version_upgrade"></a> [allow\_db\_major\_version\_upgrade](#input\_allow\_db\_major\_version\_upgrade) | Allow RDS to automatically upgrade DB to new major version | `string` | n/a | yes |
| <a name="input_allow_db_minor_version_upgrade"></a> [allow\_db\_minor\_version\_upgrade](#input\_allow\_db\_minor\_version\_upgrade) | Allow RDS to automatically upgrade DB to new minor version | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region that resources will be created in | `string` | n/a | yes |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | RDS DB instance engine type ie: mysql | `string` | n/a | yes |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | RDS DB instance engine version | `string` | n/a | yes |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | Instance size\_class for the DB instance | `string` | n/a | yes |
| <a name="input_db_port_number"></a> [db\_port\_number](#input\_db\_port\_number) | Port number the database listens to | `number` | n/a | yes |
| <a name="input_db_storage_amount_gb"></a> [db\_storage\_amount\_gb](#input\_db\_storage\_amount\_gb) | Max storage size for the RDS instance in GB | `number` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of the RDS DB subnet group | `string` | n/a | yes |
| <a name="input_db_subnet_id"></a> [db\_subnet\_id](#input\_db\_subnet\_id) | SubnetID to deploy RDS instance into | `string` | n/a | yes |
| <a name="input_rds_db_credentials_secret_arn"></a> [rds\_db\_credentials\_secret\_arn](#input\_rds\_db\_credentials\_secret\_arn) | ARN of the AWS Secrets Manager credentials for RDS | `string` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the RDS instance security group | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR Range for the VPC the DB is deployed into | `string` | n/a | yes |
| <a name="input_vpc_identifier"></a> [vpc\_identifier](#input\_vpc\_identifier) | VPC ID for the VPC you wish to create the security group in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_endpoint"></a> [db\_endpoint](#output\_db\_endpoint) | n/a |
<!-- END_TF_DOCS -->