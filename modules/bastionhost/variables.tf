variable "aws_region" {
  description = "AWS region that resources will be created in"
  type        = string
}

variable "security_group_name" {
  description = "Name of the EC2 Instance Security Group"
  type        = string
}


variable "external_ip_address" {
  description = "External IP address CIDR to allow access to the EC2 instance from"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role associated with EC2 instance"
  type        = string
}


variable "ami_id" {
  description = "EC2 AMI to use"
  type        = string
}

variable "instance_size" {
  description = "EC2 instance type"
  default     = "t3.micro"
  type        = string
}

variable "ssh_keypair_name" {
  description = "SSH keypair to use with the EC2 instance"
  type        = string
}

variable "vpc_identifier" {
  description = "VPC ID for the VPC you wish to create the security group in"
  type        = string
}

variable "ec2_subnet_id" {
  description = "Subnet ID of the subnet to launch the EC2 instance into"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}