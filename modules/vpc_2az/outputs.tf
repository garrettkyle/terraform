output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id_az1" {
  value = aws_subnet.public_az1.id
}

output "public_subnet_id_az2" {
  value = aws_subnet.public_az2.id
}

output "private_subnet_id_az1" {
  value = aws_subnet.private_az1.id
}

output "private_subnet_id_az2" {
  value = aws_subnet.private_az1.id
}