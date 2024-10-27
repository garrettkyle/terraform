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
| [aws_autoscaling_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_launch_template.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | EC2 AMI to use | `string` | n/a | yes |
| <a name="input_asg_health_check_grace_period_seconds"></a> [asg\_health\_check\_grace\_period\_seconds](#input\_asg\_health\_check\_grace\_period\_seconds) | ASG scaling health check grace period in seconds | `number` | `"120"` | no |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | Name of the autoscaling group | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region that resources will be created in | `string` | n/a | yes |
| <a name="input_default_asg_cooldown_seconds"></a> [default\_asg\_cooldown\_seconds](#input\_default\_asg\_cooldown\_seconds) | ASG scaling action cooldown in seconds | `number` | `"300"` | no |
| <a name="input_desired_asg_nodes"></a> [desired\_asg\_nodes](#input\_desired\_asg\_nodes) | Desired number of autoscaling group nodes | `number` | `"1"` | no |
| <a name="input_external_ip_address"></a> [external\_ip\_address](#input\_external\_ip\_address) | External IP address CIDR to allow access to the EC2 instance from | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role associated with EC2 instance | `string` | n/a | yes |
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_launch_template_name"></a> [launch\_template\_name](#input\_launch\_template\_name) | Name of the launch template associated with the ASG | `string` | n/a | yes |
| <a name="input_max_asg_nodes"></a> [max\_asg\_nodes](#input\_max\_asg\_nodes) | Max number of autoscaling group nodes | `number` | `"1"` | no |
| <a name="input_min_asg_nodes"></a> [min\_asg\_nodes](#input\_min\_asg\_nodes) | Min number of autoscaling group nodes | `number` | `"0"` | no |
| <a name="input_private_subnet_az1"></a> [private\_subnet\_az1](#input\_private\_subnet\_az1) | Subnet ID for AZ1 | `string` | n/a | yes |
| <a name="input_private_subnet_az2"></a> [private\_subnet\_az2](#input\_private\_subnet\_az2) | Subnet ID for AZ2 | `string` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the EC2 Instance Security Group | `string` | n/a | yes |
| <a name="input_ssh_keypair_name"></a> [ssh\_keypair\_name](#input\_ssh\_keypair\_name) | SSH keypair to use with the EC2 instance | `string` | n/a | yes |
| <a name="input_vpc_identifier"></a> [vpc\_identifier](#input\_vpc\_identifier) | VPC ID for the VPC you wish to create the security group in | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->