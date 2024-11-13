terraform {
  backend "s3" {
    bucket         = "terraform-sandbox-testing"
    key            = "sandbox/prometheus_alertmgr.tfstate"
    region         = "ca-central-1"
    encrypt        = "false"
  }
}