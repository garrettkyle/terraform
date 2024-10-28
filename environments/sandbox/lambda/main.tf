module "lambda" {
  source                          = "../../../modules/lambda"
  aws_region                      = "ca-central-1"
  lambda_artifact_s3_bucket_key   = "lambda_function.zip"
  lambda_artifact_s3_bucket_name  = "terraform-sandbox-testing"
  lambda_function_description     = "python function that does stuff"
  lambda_function_name            = "lambda_function"
  lambda_function_timeout_seconds = "30"
  lambda_iam_role_name            = "lambda_function"
  security_group_name             = "lambda_function"
  subnet_id                       = "subnet-0c6833d11ef299fbf"
  vpc_cidr                        = "10.0.0.0/16"
  vpc_identifier                  = "vpc-0d8d02696fc489437"
}