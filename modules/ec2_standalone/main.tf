provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = "Access to EC2 Host"
  vpc_id      = var.vpc_identifier
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.external_ip_address]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "main" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "main" {
  name = var.iam_role_name
  role = aws_iam_role.main.name
}

resource "aws_instance" "main" {
  depends_on             = [aws_security_group.main,aws_iam_instance_profile.main]
  ami                    = var.ami_id
  instance_type          = var.instance_size
  key_name               = var.ssh_keypair_name
  vpc_security_group_ids = [aws_security_group.main.id]
  iam_instance_profile   = aws_iam_instance_profile.main.name
  subnet_id              = var.ec2_subnet_id
  tags = {
    Name = var.instance_name
  }
  user_data = <<-EOF
              #!/bin/bash
              set -x
              echo "Hello World!"
              EOF
}