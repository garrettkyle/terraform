provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "main" {
  name          = var.security_group_name
  description   = "Access to ECS Fargate Service"
  vpc_id        = var.vpc_identifier
  ingress {
    from_port   = var.service_port_number
    to_port     = var.service_port_number
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

resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "main" {
  cpu                      = var.task_cpu_limit
  family                   = var.task_definition_name
  memory                   = var.task_memory_limit # 512mb-2048mb 
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  #execution_role_arn = ""
  container_definitions = jsonencode([
    {
      name           = var.container_name
      image          = var.docker_image
      essential      = true
      interactive    = true
      pseudoTerminal = true
      portMappings = [
        {
          containerPort = var.service_port_number
          hostPort      = var.host_port_number
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [var.subnet_id]
    security_groups  = [aws_security_group.main.id]
    assign_public_ip = true
  }
}