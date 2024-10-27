variable "aws_region" {
  description = "AWS region that resources will be created in"
  type        = string
}

variable "availability_zone_1" {
  description = "AWS Name of AZ1 ie ca-central-1a"
  type        = string
}

variable "availability_zone_2" {
  description = "AWS Name of AZ2 ie ca-central-1b"
  type        = string
}

variable "igw_name" {
  description = "Name of the internet gateway"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "CIDR of the public subnet in AZ1"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "CIDR of the public subnet in AZ2"
  type        = string
}

variable "private_subnet_az1_cidr" {
  description = "CIDR of the private subnet in AZ1"
  type        = string
}

variable "private_subnet_az2_cidr" {
  description = "CIDR of the private subnet in AZ2"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR of the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

