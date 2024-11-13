provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

# This will need to be restricted to home/external IP
# but also on a port basis instead of wide open
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

resource "aws_sns_topic" "main" {
  name = var.sns_topic_name
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

resource "aws_iam_role_policy" "ecr_access" {
  name = "${var.iam_role_name}_ecr_policy"
  role = aws_iam_role.main.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ecr:BatchGetImage",
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetImage"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "s3_access_policy" {
  name = "${var.iam_role_name}_s3_policy"
  role = aws_iam_role.main.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.s3_bucket}/${var.s3_key}"
      }
    ]
  })
}

resource "aws_iam_role_policy" "sns_access_policy" {
  name = "${var.iam_role_name}_sns_policy"
  role = aws_iam_role.main.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sns:Publish"
        Resource = "arn:aws:sns:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${var.sns_topic_name}"
      }
    ]
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
  image_id               = var.ami_id
  instance_type          = var.instance_size
  key_name               = var.ssh_keypair_name
  name                   = var.launch_template_name
  update_default_version = "true"
  user_data = filebase64("${var.user_data_script}")
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_autoscaling_group" "main" {
  default_cooldown = var.default_asg_cooldown_seconds
  desired_capacity          = var.desired_asg_nodes
  health_check_grace_period = var.asg_health_check_grace_period_seconds
  health_check_type         = "EC2"
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