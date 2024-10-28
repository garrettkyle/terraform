variable "aws_region" {
  description = "AWS region that resources will be created in"
  type        = string
}

variable "security_group_name" {
  description = "Name of the RDS instance security group"
  type        = string
}

variable "vpc_identifier" {
  description = "VPC ID for the VPC you wish to create the security group in"
  type        = string
}

variable "db_port_number" {
  description = "Port number the database listens to"
  type        = number
}

variable "vpc_cidr" {
  description = "CIDR Range for the VPC the DB is deployed into"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of the RDS DB subnet group"
  type        = string
}

variable "db_subnet_id_az1" {
  description = "SubnetID to deploy RDS instance into in AZ1"
  type        = string
}

variable "db_subnet_id_az2" {
  description = "SubnetID to deploy RDS instance into in AZ2"
  type        = string
}

variable "db_storage_amount_gb" {
  description = "Max storage size for the RDS instance in GB"
  type        = number
}

variable "db_engine" {
  description = "RDS DB instance engine type ie: mysql"
  type        = string
}

variable "db_engine_version" {
  description = "RDS DB instance engine version"
  type        = string
}

variable "db_instance_class" {
  description = "Instance size_class for the DB instance"
  type        = string
}

variable "allow_db_major_version_upgrade" {
  description = "Allow RDS to automatically upgrade DB to new major version"
  type        = string
}

variable "allow_db_minor_version_upgrade" {
  description = "Allow RDS to automatically upgrade DB to new minor version"
  type        = string
}

variable "rds_db_credentials_secret_arn" {
  description = "ARN of the AWS Secrets Manager credentials for RDS"
  type        = string
}