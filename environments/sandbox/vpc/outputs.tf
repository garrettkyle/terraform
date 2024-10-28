output "vpc_id" {
  value = module.vpc_2az.vpc_id
}

output "public_subnet_id_az1" {
  value = module.vpc_2az.public_subnet_id_az1
}

output "public_subnet_id_az2" {
  value = module.vpc_2az.public_subnet_id_az2
}

output "private_subnet_id_az1" {
  value = module.vpc_2az.private_subnet_id_az1
}

output "private_subnet_id_az2" {
  value = module.vpc_2az.private_subnet_id_az2
}