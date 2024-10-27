provider "aws" {
  region = var.aws_region
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  tags = {
    Name = var.vpc_name
  }
}

# IGW
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}

# Public Subnet AZ1
resource "aws_subnet" "public_az1" {
  availability_zone       = var.availability_zone_1
  cidr_block              = var.public_subnet_az1_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Public_AZ1"
  }
  vpc_id = aws_vpc.main.id
}

# Public Subnet AZ2
resource "aws_subnet" "public_az2" {
  availability_zone       = var.availability_zone_2
  cidr_block              = var.public_subnet_az2_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Public_AZ2"
  }
  vpc_id = aws_vpc.main.id
}

# Public Subnet AZ3
resource "aws_subnet" "public_az3" {
  availability_zone       = var.availability_zone_3
  cidr_block              = var.public_subnet_az3_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Public_AZ3"
  }
  vpc_id = aws_vpc.main.id
}

# Private Subnet AZ1
resource "aws_subnet" "private_az1" {
  availability_zone       = var.availability_zone_1
  cidr_block              = var.private_subnet_az1_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "Private_AZ1"
  }
  vpc_id = aws_vpc.main.id
}

# Private Subnet AZ2
resource "aws_subnet" "private_az2" {
  availability_zone       = var.availability_zone_2
  cidr_block              = var.private_subnet_az2_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "Private_AZ2"
  }
  vpc_id = aws_vpc.main.id
}

# Private Subnet AZ3
resource "aws_subnet" "private_az3" {
  availability_zone       = var.availability_zone_3
  cidr_block              = var.private_subnet_az3_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "Private_AZ3"
  }
  vpc_id = aws_vpc.main.id
}

# EIP AZ1
resource "aws_eip" "nat_gw_az1" {
  domain = "vpc"
}

# EIP AZ2
resource "aws_eip" "nat_gw_az2" {
  domain = "vpc"
}

# EIP AZ3
resource "aws_eip" "nat_gw_az3" {
  domain = "vpc"
}

# NAT GW AZ1
resource "aws_nat_gateway" "az1" {
  depends_on    = [aws_internet_gateway.main]
  allocation_id = aws_eip.nat_gw_az1.id
  subnet_id     = aws_subnet.public_az1.id
  tags = {
    Name = "terraform_nat_gw_az1"
  }
}

# NAT GW AZ2
resource "aws_nat_gateway" "az2" {
  depends_on    = [aws_internet_gateway.main]
  allocation_id = aws_eip.nat_gw_az2.id
  subnet_id     = aws_subnet.public_az2.id
  tags = {
    Name = "terraform_nat_gw_az2"
  }
}

# NAT GW AZ3
resource "aws_nat_gateway" "az3" {
  depends_on    = [aws_internet_gateway.main]
  allocation_id = aws_eip.nat_gw_az3.id
  subnet_id     = aws_subnet.public_az3.id
  tags = {
    Name = "terraform_nat_gw_az3"
  }
}

# PUBLIC ROUTE TABLE AZ1
resource "aws_route_table" "public_az1" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public_az1"
  }
}

# PUBLIC ROUTE TABLE AZ2
resource "aws_route_table" "public_az2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public_az2"
  }
}

# PUBLIC ROUTE TABLE AZ3
resource "aws_route_table" "public_az3" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public_az3"
  }
}

# PRIVATE ROUTE TABLE AZ1
resource "aws_route_table" "private_az1" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_az1"
  }
}

# PRIVATE ROUTE TABLE AZ2
resource "aws_route_table" "private_az2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_az2"
  }
}

# PRIVATE ROUTE TABLE AZ3
resource "aws_route_table" "private_az3" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_az3"
  }
}

# RT ASSOCIATION PUBLIC SUBNET AZ1
resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_az1.id
  route_table_id = aws_route_table.public_az1.id
}

# RT ASSOCIATION PUBLIC SUBNET AZ2
resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_az2.id
  route_table_id = aws_route_table.public_az2.id
}

# RT ASSOCIATION PUBLIC SUBNET AZ3
resource "aws_route_table_association" "public_az3" {
  subnet_id      = aws_subnet.public_az3.id
  route_table_id = aws_route_table.public_az3.id
}

# RT ASSOCIATION PRIVATE SUBNET AZ1
resource "aws_route_table_association" "private_az1" {
  subnet_id      = aws_subnet.private_az1.id
  route_table_id = aws_route_table.private_az1.id
}

# RT ASSOCIATION PRIVATE SUBNET AZ2
resource "aws_route_table_association" "private_az2" {
  subnet_id      = aws_subnet.private_az2.id
  route_table_id = aws_route_table.private_az2.id
}

# RT ASSOCIATION PRIVATE SUBNET AZ3
resource "aws_route_table_association" "private_az3" {
  subnet_id      = aws_subnet.private_az3.id
  route_table_id = aws_route_table.private_az3.id
}

# PUBLIC ROUTE AZ1
resource "aws_route" "public_az1" {
  route_table_id         = aws_route_table.public_az1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

# PUBLIC ROUTE AZ2
resource "aws_route" "public_az2" {
  route_table_id         = aws_route_table.public_az2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

# PUBLIC ROUTE AZ3
resource "aws_route" "public_az3" {
  route_table_id         = aws_route_table.public_az3.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

# PRIVATE ROUTE AZ1
resource "aws_route" "private_az1" {
  route_table_id         = aws_route_table.private_az1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.az1.id
}

# PRIVATE ROUTE AZ2
resource "aws_route" "private_az2" {
  route_table_id         = aws_route_table.private_az2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.az2.id
}

# PRIVATE ROUTE AZ3
resource "aws_route" "private_az3" {
  route_table_id         = aws_route_table.private_az3.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.az3.id
}