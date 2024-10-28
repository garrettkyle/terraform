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
| [aws_autoscaling_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_eip.lb_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.lb_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_launch_template.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.loadbalancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
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
| <a name="input_ec2_security_group_name"></a> [ec2\_security\_group\_name](#input\_ec2\_security\_group\_name) | Name of the EC2 Instance Security Group | `string` | n/a | yes |
| <a name="input_ec2_subnet_az1"></a> [ec2\_subnet\_az1](#input\_ec2\_subnet\_az1) | Subnet ID for EC2 instances in AZ1 | `string` | n/a | yes |
| <a name="input_ec2_subnet_az2"></a> [ec2\_subnet\_az2](#input\_ec2\_subnet\_az2) | Subnet ID for EC2 instances in AZ2 | `string` | n/a | yes |
| <a name="input_external_ip_address"></a> [external\_ip\_address](#input\_external\_ip\_address) | External IP address CIDR to allow access to the EC2 instance from | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role associated with EC2 instance | `string` | n/a | yes |
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_internal_lb"></a> [internal\_lb](#input\_internal\_lb) | Internal load balancer | `bool` | `"false"` | no |
| <a name="input_launch_template_name"></a> [launch\_template\_name](#input\_launch\_template\_name) | Name of the launch template associated with the ASG | `string` | n/a | yes |
| <a name="input_lb_healthcheck_interval_seconds"></a> [lb\_healthcheck\_interval\_seconds](#input\_lb\_healthcheck\_interval\_seconds) | Load balancer health check interval in seconds | `number` | `"30"` | no |
| <a name="input_lb_healthcheck_path"></a> [lb\_healthcheck\_path](#input\_lb\_healthcheck\_path) | Load balancer health check path | `string` | `"/"` | no |
| <a name="input_lb_healthy_threshold"></a> [lb\_healthy\_threshold](#input\_lb\_healthy\_threshold) | Load balancer health check healthy threshold | `number` | `"2"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Load balancer name | `string` | n/a | yes |
| <a name="input_lb_port_number"></a> [lb\_port\_number](#input\_lb\_port\_number) | Load balancer listening port number | `string` | `"80"` | no |
| <a name="input_lb_protocol_type"></a> [lb\_protocol\_type](#input\_lb\_protocol\_type) | Load balancer listening protocol type | `string` | `"HTTP"` | no |
| <a name="input_lb_security_group_name"></a> [lb\_security\_group\_name](#input\_lb\_security\_group\_name) | Load balancer security group name | `string` | n/a | yes |
| <a name="input_lb_subnet_az1"></a> [lb\_subnet\_az1](#input\_lb\_subnet\_az1) | SubnetID for Load Balancer in AZ1 | `string` | n/a | yes |
| <a name="input_lb_subnet_az2"></a> [lb\_subnet\_az2](#input\_lb\_subnet\_az2) | SubnetID for Load Balancer in AZ2 | `string` | n/a | yes |
| <a name="input_lb_target_group_name"></a> [lb\_target\_group\_name](#input\_lb\_target\_group\_name) | Target group name for load balancer | `string` | n/a | yes |
| <a name="input_lb_timeout_seconds"></a> [lb\_timeout\_seconds](#input\_lb\_timeout\_seconds) | Load balancer health check timeout in seconds | `number` | `"5"` | no |
| <a name="input_lb_unhealthy_threshold"></a> [lb\_unhealthy\_threshold](#input\_lb\_unhealthy\_threshold) | Load balancer health check unhealthy threshold | `number` | `"2"` | no |
| <a name="input_max_asg_nodes"></a> [max\_asg\_nodes](#input\_max\_asg\_nodes) | Max number of autoscaling group nodes | `number` | `"1"` | no |
| <a name="input_min_asg_nodes"></a> [min\_asg\_nodes](#input\_min\_asg\_nodes) | Min number of autoscaling group nodes | `number` | `"0"` | no |
| <a name="input_ssh_keypair_name"></a> [ssh\_keypair\_name](#input\_ssh\_keypair\_name) | SSH keypair to use with the EC2 instance | `string` | n/a | yes |
| <a name="input_type_of_load_balancer"></a> [type\_of\_load\_balancer](#input\_type\_of\_load\_balancer) | Load balancer type | `string` | `"application"` | no |
| <a name="input_vpc_identifier"></a> [vpc\_identifier](#input\_vpc\_identifier) | VPC ID for the VPC you wish to create the security group in | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->