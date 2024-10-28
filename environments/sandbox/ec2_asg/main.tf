module "ec2_asg" {
  source                                = "../../../modules/ec2_asg"
  ami_id                                = "ami-049332278e728bdb7"
  asg_health_check_grace_period_seconds = "120"
  asg_name                              = "ec2_asg_test"
  aws_region                            = "ca-central-1"
  default_asg_cooldown_seconds          = "300"
  desired_asg_nodes                     = "1"
  external_ip_address                   = "209.161.252.130/32"
  iam_role_name                         = "ec2_asg_test"
  instance_size                         = "t3.micro"
  launch_template_name                  = "ec2_asg_test"
  max_asg_nodes                         = "1"
  min_asg_nodes                         = "0"
  private_subnet_az1                    = "subnet-045b4a769553fbd73"
  private_subnet_az2                    = "subnet-046214ec8ca0efa1b"
  security_group_name                   = "ec2_asg_test"
  ssh_keypair_name                      = "homelab"
  vpc_identifier                        = "vpc-05b7362e0240314d0"
}