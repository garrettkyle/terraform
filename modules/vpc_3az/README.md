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
| [aws_eip.nat_gw_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.nat_gw_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.nat_gw_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.private_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone_1"></a> [availability\_zone\_1](#input\_availability\_zone\_1) | AWS Name of AZ1 ie ca-central-1a | `string` | n/a | yes |
| <a name="input_availability_zone_2"></a> [availability\_zone\_2](#input\_availability\_zone\_2) | AWS Name of AZ2 ie ca-central-1b | `string` | n/a | yes |
| <a name="input_availability_zone_3"></a> [availability\_zone\_3](#input\_availability\_zone\_3) | AWS Name of AZ3 ie ca-central-1c | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region that resources will be created in | `string` | n/a | yes |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | Name of the internet gateway | `string` | n/a | yes |
| <a name="input_private_subnet_az1_cidr"></a> [private\_subnet\_az1\_cidr](#input\_private\_subnet\_az1\_cidr) | CIDR of the private subnet in AZ1 | `string` | n/a | yes |
| <a name="input_private_subnet_az2_cidr"></a> [private\_subnet\_az2\_cidr](#input\_private\_subnet\_az2\_cidr) | CIDR of the private subnet in AZ2 | `string` | n/a | yes |
| <a name="input_private_subnet_az3_cidr"></a> [private\_subnet\_az3\_cidr](#input\_private\_subnet\_az3\_cidr) | CIDR of the private subnet in AZ3 | `string` | n/a | yes |
| <a name="input_public_subnet_az1_cidr"></a> [public\_subnet\_az1\_cidr](#input\_public\_subnet\_az1\_cidr) | CIDR of the public subnet in AZ1 | `string` | n/a | yes |
| <a name="input_public_subnet_az2_cidr"></a> [public\_subnet\_az2\_cidr](#input\_public\_subnet\_az2\_cidr) | CIDR of the public subnet in AZ2 | `string` | n/a | yes |
| <a name="input_public_subnet_az3_cidr"></a> [public\_subnet\_az3\_cidr](#input\_public\_subnet\_az3\_cidr) | CIDR of the public subnet in AZ3 | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR of the VPC | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_id_az1"></a> [private\_subnet\_id\_az1](#output\_private\_subnet\_id\_az1) | n/a |
| <a name="output_private_subnet_id_az2"></a> [private\_subnet\_id\_az2](#output\_private\_subnet\_id\_az2) | n/a |
| <a name="output_private_subnet_id_az3"></a> [private\_subnet\_id\_az3](#output\_private\_subnet\_id\_az3) | n/a |
| <a name="output_public_subnet_id_az1"></a> [public\_subnet\_id\_az1](#output\_public\_subnet\_id\_az1) | n/a |
| <a name="output_public_subnet_id_az2"></a> [public\_subnet\_id\_az2](#output\_public\_subnet\_id\_az2) | n/a |
| <a name="output_public_subnet_id_az3"></a> [public\_subnet\_id\_az3](#output\_public\_subnet\_id\_az3) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->