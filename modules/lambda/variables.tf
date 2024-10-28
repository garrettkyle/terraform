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

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
}

variable "lambda_iam_role_name" {
  description = "Name of the Lambda function IAM role"
  type        = string
}

variable "lambda_function_description" {
  description = "Description of the Lambda function"
  type        = string
}


variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_artifact_s3_bucket_name" {
  description = "S3 bucket name the Lambda function artifact is stored in"
  type        = string
}

variable "lambda_artifact_s3_bucket_key" {
  description = "S3 bucket key filename the Lambda function artifact is stored in"
  type        = string
}

variable "lambda_function_timeout_seconds" {
  description = "Time in seconds before the Lambda function times out"
  type        = number
}

variable "subnet_id" {
  description = "SubnetID to deploy the Lambda function into"
  type        = string
}