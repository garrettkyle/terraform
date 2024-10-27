output "instance_arn" {
  description = "ARN of the EC2 bastion instance"
  value       = aws_instance.main.arn
}

output "instance_id" {
  description = "InstanceID of the EC2 bastion instance"
  value       = aws_instance.main.id
}

output "instance_ip" {
  description = "Public IP of the EC2 bastion instance"
  value       = aws_instance.main.public_ip
}