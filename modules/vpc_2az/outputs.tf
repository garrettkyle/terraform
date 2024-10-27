output "vpc_id" {
  description = "VPCID"
  value       = aws_vpc.main.id
}

output "public_subnet_id_az1" {
  description = "Subnet ID of public subnet in AZ1"
  value       = aws_subnet.public_az1.id
}

output "public_subnet_id_az2" {
  description = "Subnet ID for public subnet in AZ2"
  value       = aws_subnet.public_az2.id
}

output "private_subnet_id_az1" {
  description = "Subnet ID for private subnet in AZ1"
  value       = aws_subnet.private_az1.id
}

output "private_subnet_id_az2" {
  description = "Subnet ID for private subnet in AZ2"
  value       = aws_subnet.private_az2.id
}