module "bastionhost" {
  source              = "../../../modules/bastionhost"
  ami_id              = "ami-049332278e728bdb7"
  aws_region          = "ca-central-1"
  ec2_subnet_id       = "subnet-01f4a228a8d6b84d9"
  external_ip_address = "209.161.252.130/32"
  iam_role_name       = "bastionhost"
  instance_name       = "bastionhost"
  instance_size       = "t3.micro"
  security_group_name = "bastionhost"
  ssh_keypair_name    = "homelab"
  vpc_identifier      = "vpc-05b7362e0240314d0"
}