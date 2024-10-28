terraform {
  backend "s3" {
    bucket         = "terraform-sandbox-testing"
    key            = "sandbox/lambda.tfstate"
    region         = "ca-central-1"
    encrypt        = "false"
  }
}