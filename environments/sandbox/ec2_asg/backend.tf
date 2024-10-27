terraform {
  backend "s3" {
    bucket         = "terraform-sandbox-testing"
    key            = "sandbox/ec2_asg.tfstate"
    region         = "ca-central-1"
    encrypt        = "false"
  }
}