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

resource "aws_launch_template" "main" {
  iam_instance_profile {
    name = var.iam_role_name
  }
  image_id = var.ami_id
  instance_type = var.instance_size
  key_name = var.ssh_keypair_name
  name = var.launch_template_name
  vpc_security_group_ids = [aws_security_group.main.id]
  #user_data = filebase64("${path.module}/example.sh")
}

resource "aws_autoscaling_group" "main" {
  default_cooldown = var.default_asg_cooldown_seconds
  desired_capacity          = var.desired_asg_nodes
  health_check_grace_period = var.asg_health_check_grace_period_seconds
  health_check_type         = "ELB"
  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
  max_size                  = var.max_asg_nodes
  min_size                  = var.min_asg_nodes
  name                      = var.asg_name
  vpc_zone_identifier       = [var.private_subnet_az1, var.private_subnet_az2]
  tag {
    key                 = "Foo"
    value               = "Bar"
    propagate_at_launch = true
  }
}