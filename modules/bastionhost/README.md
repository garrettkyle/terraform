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
| [aws_iam_instance_profile.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | EC2 AMI to use | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region that resources will be created in | `string` | n/a | yes |
| <a name="input_ec2_subnet_id"></a> [ec2\_subnet\_id](#input\_ec2\_subnet\_id) | Subnet ID of the subnet to launch the EC2 instance into | `string` | n/a | yes |
| <a name="input_external_ip_address"></a> [external\_ip\_address](#input\_external\_ip\_address) | External IP address CIDR to allow access to the EC2 instance from | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role associated with EC2 instance | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the EC2 instance | `string` | n/a | yes |
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the EC2 Instance Security Group | `string` | n/a | yes |
| <a name="input_ssh_keypair_name"></a> [ssh\_keypair\_name](#input\_ssh\_keypair\_name) | SSH keypair to use with the EC2 instance | `string` | n/a | yes |
| <a name="input_vpc_identifier"></a> [vpc\_identifier](#input\_vpc\_identifier) | VPC ID for the VPC you wish to create the security group in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | ARN of the EC2 bastion instance |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | InstanceID of the EC2 bastion instance |
| <a name="output_instance_ip"></a> [instance\_ip](#output\_instance\_ip) | Public IP of the EC2 bastion instance |
<!-- END_TF_DOCS -->