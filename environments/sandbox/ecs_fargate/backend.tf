terraform {
  backend "s3" {
    bucket         = "terraform-sandbox-testing"
    key            = "sandbox/ecs_fargate.tfstate"
    region         = "ca-central-1"
    encrypt        = "false"
  }
}