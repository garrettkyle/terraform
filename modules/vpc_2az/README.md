# Terraform 2xAZ VPC Module

This module creates a VPC that spans TWO Availability Zones(AZs).  This is both for cost savings in terms of NAT Gateways, but also in Regions where there may be only two AZs provisioned (ie: ca-central-1 when it first launched).

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
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone_1"></a> [availability\_zone\_1](#input\_availability\_zone\_1) | AWS Name of AZ1 ie ca-central-1a | `any` | n/a | yes |
| <a name="input_availability_zone_2"></a> [availability\_zone\_2](#input\_availability\_zone\_2) | AWS Name of AZ2 ie ca-central-1b | `any` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region that resources will be created in | `any` | n/a | yes |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | Name of the internet gateway | `string` | `"terraform_igw"` | no |
| <a name="input_private_subnet_az1_cidr"></a> [private\_subnet\_az1\_cidr](#input\_private\_subnet\_az1\_cidr) | CIDR of the private subnet in AZ1 | `any` | n/a | yes |
| <a name="input_private_subnet_az2_cidr"></a> [private\_subnet\_az2\_cidr](#input\_private\_subnet\_az2\_cidr) | CIDR of the private subnet in AZ2 | `any` | n/a | yes |
| <a name="input_public_subnet_az1_cidr"></a> [public\_subnet\_az1\_cidr](#input\_public\_subnet\_az1\_cidr) | CIDR of the public subnet in AZ1 | `any` | n/a | yes |
| <a name="input_public_subnet_az2_cidr"></a> [public\_subnet\_az2\_cidr](#input\_public\_subnet\_az2\_cidr) | CIDR of the public subnet in AZ2 | `any` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR of the VPC | `any` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_id_az1"></a> [private\_subnet\_id\_az1](#output\_private\_subnet\_id\_az1) | Subnet ID for private subnet in AZ1 |
| <a name="output_private_subnet_id_az2"></a> [private\_subnet\_id\_az2](#output\_private\_subnet\_id\_az2) | Subnet ID for private subnet in AZ2 |
| <a name="output_public_subnet_id_az1"></a> [public\_subnet\_id\_az1](#output\_public\_subnet\_id\_az1) | Subnet ID of public subnet in AZ1 |
| <a name="output_public_subnet_id_az2"></a> [public\_subnet\_id\_az2](#output\_public\_subnet\_id\_az2) | Subnet ID for public subnet in AZ2 |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPCID |
<!-- END_TF_DOCS -->