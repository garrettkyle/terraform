terraform {
  backend "s3" {
    bucket         = "terraform-sandbox-testing"
    key            = "sandbox/vpc.tfstate"
    region         = "ca-central-1"
    encrypt        = "false"
  }
}