variable "aws_region" {
  description = "AWS region that resources will be created in"
  type        = string
}

variable "security_group_name" {
  description = "Name of the EC2 Instance Security Group"
  type        = string
}

variable "vpc_identifier" {
  description = "VPC ID for the VPC you wish to create the security group in"
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

variable "launch_template_name" {
  description = "Name of the launch template associated with the ASG"
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

variable "asg_name" {
  description = "Name of the autoscaling group"
  type        = string
}

variable "max_asg_nodes" {
  description = "Max number of autoscaling group nodes"
  type        = number
  default     = "1"
}

variable "min_asg_nodes" {
  description = "Min number of autoscaling group nodes"
  type        = number
  default     = "0"
}

variable "desired_asg_nodes" {
  description = "Desired number of autoscaling group nodes"
  type        = number
  default     = "1"
}

variable "default_asg_cooldown_seconds" {
  description = "ASG scaling action cooldown in seconds"
  type        = number
  default     = "300"
}

variable "asg_health_check_grace_period_seconds" {
  description = "ASG scaling health check grace period in seconds"
  type        = number
  default     = "120"
}

variable "private_subnet_az1" {
  description = "Subnet ID for AZ1"
  type        = string
}

variable "private_subnet_az2" {
  description = "Subnet ID for AZ2"
  type        = string
}

variable "user_data_script" {
  description = "The name of the shell script to be used as user data"
  type        = string
  default     = "placeholder.sh"
}

variable "s3_bucket" {
  description = "S3 bucket name the prometheus_alertmgt docker compose file is in"
  type        = string
}

variable "sns_topic_name" {
  description = "SNS topic name that alertmanager will send alerts to"
  type        = string
  default     = "prometheus_alarms"
}

variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
}