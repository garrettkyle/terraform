variable "aws_region" {
  description = "AWS region that resources will be created in"
  type        = string
}

variable "ec2_security_group_name" {
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

variable "ec2_subnet_az1" {
  description = "Subnet ID for EC2 instances in AZ1"
  type        = string
}

variable "ec2_subnet_az2" {
  description = "Subnet ID for EC2 instances in AZ2"
  type        = string
}

variable "lb_security_group_name" {
  description = "Load balancer security group name"
  type        = string
}

variable "lb_name" {
  description = "Load balancer name"
  type        = string
}

variable "internal_lb" {
  description = "Internal load balancer"
  type        = bool
  default     = "false"
}

variable "type_of_load_balancer" {
  description = "Load balancer type"
  type        = string
  default     = "application"
}

variable "lb_subnet_az1" {
  description = "SubnetID for Load Balancer in AZ1"
  type        = string
}

variable "lb_subnet_az2" {
  description = "SubnetID for Load Balancer in AZ2"
  type        = string
}

variable "lb_target_group_name" {
  description = "Target group name for load balancer"
  type        = string
}

variable "lb_port_number" {
  description = "Load balancer listening port number"
  type        = string
  default     = "80"
}

variable "lb_protocol_type" {
  description = "Load balancer listening protocol type"
  type        = string
  default     = "HTTP"
}

variable "lb_healthcheck_path" {
  description = "Load balancer health check path"
  type        = string
  default     = "/"
}

variable "lb_healthcheck_interval_seconds" {
  description = "Load balancer health check interval in seconds"
  type        = number
  default     = "30"
}

variable "lb_timeout_seconds" {
  description = "Load balancer health check timeout in seconds"
  type        = number
  default     = "5"
}

variable "lb_healthy_threshold" {
  description = "Load balancer health check healthy threshold"
  type        = number
  default     = "2"
}

variable "lb_unhealthy_threshold" {
  description = "Load balancer health check unhealthy threshold"
  type        = number
  default     = "2"
}