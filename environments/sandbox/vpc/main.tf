module "vpc" {
  source                  = "../../../modules/vpc_2az"
  availability_zone_1     = "ca-central-1a"
  availability_zone_2     = "ca-central-1b"
  aws_region              = "ca-central-1"
  igw_name                = "terraform-igw"
  private_subnet_az1_cidr = "10.0.3.0/24"
  private_subnet_az2_cidr = "10.0.4.0/24"
  public_subnet_az1_cidr  = "10.0.1.0/24"
  public_subnet_az2_cidr  = "10.0.2.0/24"
  vpc_cidr_block          = "10.0.0.0/16"
  vpc_name                = "terraform-vpc"
}