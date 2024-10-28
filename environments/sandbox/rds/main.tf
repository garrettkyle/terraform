module "rds" {
  source               = "../../../modules/rds"
  security_group_name  = "rds_instance"
  vpc_identifier       = "vpc-0139b19677144f19a"
  db_port_number       = "5432"
  vpc_cidr             = "10.0.0.0/16"
  db_subnet_group_name = "rds_instance"
  db_subnet_id         = "subnet-025b04a95fb8c9424"
  db_storage_amount_gb = "10"
  db_engine            = "postgres"
  db_engine_version    = "16.3"
  db_instance_class    = "db.t3.micro"
  allow_db_major_version_upgrade = "false"
  allow_db_minor_version_upgrade = "false"
  rds_db_credentials_secret_arn  = "arn:aws:secretsmanager:ca-central-1:715788907281:secret:rds_credentials-PGtdZI"
}