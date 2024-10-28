provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "main" {
  name        = var.ec2_security_group_name
  description = "Access to EC2 Host"
  vpc_id      = var.vpc_identifier
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.external_ip_address]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
  image_id               = var.ami_id
  instance_type          = var.instance_size
  key_name               = var.ssh_keypair_name
  name                   = var.launch_template_name
  vpc_security_group_ids = [aws_security_group.main.id]
  #user_data             = filebase64("${path.module}/example.sh")
  user_data              = base64encode(<<-EOF
                           #!/bin/bash
                           set -x
                           sudo yum install nginx -y
                           sudo systemctl start nginx.service
                           sudo systemctl enable nginx.service
                           EOF
                           )
}

resource "aws_autoscaling_group" "main" {
  default_cooldown          = var.default_asg_cooldown_seconds
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
  vpc_zone_identifier       = [var.ec2_subnet_az1, var.ec2_subnet_az2]
  tag {
    key                 = "Foo"
    value               = "Bar"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "loadbalancer" {
  name        = var.lb_security_group_name
  description = "Load balancer"
  vpc_id      = var.vpc_identifier
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = var.internal_lb
  load_balancer_type = var.type_of_load_balancer
  security_groups    = [aws_security_group.loadbalancer.id]
  subnet_mapping {
    subnet_id     = var.lb_subnet_az1
  }
  subnet_mapping {
    subnet_id     = var.lb_subnet_az2
  }
}

resource "aws_lb_target_group" "main" {
  name     = var.lb_target_group_name
  port     = var.lb_port_number
  protocol = var.lb_protocol_type
  vpc_id   = var.vpc_identifier

  health_check {
    path                = var.lb_healthcheck_path
    interval            = var.lb_healthcheck_interval_seconds
    timeout             = var.lb_timeout_seconds
    healthy_threshold   = var.lb_healthy_threshold
    unhealthy_threshold = var.lb_unhealthy_threshold
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.lb_port_number
  protocol          = var.lb_protocol_type
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_autoscaling_attachment" "main" {
  autoscaling_group_name = aws_autoscaling_group.main.name
  lb_target_group_arn    = aws_lb_target_group.main.arn
}