provider "aws" {
  region = var.aws_region
}

data "aws_secretsmanager_secret" "main" {
  name = var.rds_db_credentials_secret_arn
}

data "aws_secretsmanager_secret_version" "main" {
  secret_id = data.aws_secretsmanager_secret.main.id
}

resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = "Access to RDS Instance"
  vpc_id      = var.vpc_identifier
  ingress {
    from_port   = var.db_port_number
    to_port     = var.db_port_number
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.db_subnet_id_az1,var.db_subnet_id_az2]
}

resource "aws_db_instance" "main" {
  allocated_storage           = var.db_storage_amount_gb
  allow_major_version_upgrade = var.allow_db_major_version_upgrade
  auto_minor_version_upgrade  = var.allow_db_minor_version_upgrade
  db_subnet_group_name        = var.db_subnet_group_name
  engine                      = var.db_engine
  engine_version              = var.db_engine_version
  instance_class              = var.db_instance_class
  multi_az                    = "false"
  password                    = jsondecode(data.aws_secretsmanager_secret_version.main.secret_string)["password"]
  publicly_accessible         = "false"
  skip_final_snapshot         = "true"
  username                    = jsondecode(data.aws_secretsmanager_secret_version.main.secret_string)["username"]
  vpc_security_group_ids      = [aws_security_group.main.id]
}