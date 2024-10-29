variable "aws_region" {
  description = "AWS region that resources will be created in"
  type        = string
}

variable "security_group_name" {
  description = "Name of the Lambda function security group"
  type        = string
}

variable "vpc_identifier" {
  description = "VPC ID"
  type        = string
}

variable "service_port_number" {
  description = "Network port number the container listens on"
  default     = "80"
  type        = number
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "task_definition_name" {
  description = "ECS task definition name"
  type        = string
}

variable "container_name" {
  description = "Custom name of the container"
  type        = string
}

variable "docker_image" {
  description = "docker image ie nginx"
  default     = "nginx:latest"
  type        = string
}

variable "task_cpu_limit" {
  description = "CPU limit for the ECS task 1024 units is 1vcpu"
  default     = "256"
  type        = number
}

variable "task_memory_limit" {
  description = "Memory limit in mb for ECS task between 512 and 2048"
  default     = "512"
  type        = number
}

variable "host_port_number" {
  description = "Network port on the underlying ECS host"
  default     = "80"
  type        = number
}

variable "availability_zone_1" {
  description = "AZ1 to restrict ECS deployments into"
  type        = string
}

variable "availability_zone_2" {
  description = "AZ2 to restrict ECS deployments into"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "subnet_id" {
  description = "SubnetID to deploy the Lambda function into"
  type        = string
}