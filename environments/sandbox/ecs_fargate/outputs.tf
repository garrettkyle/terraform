output "ecs_task_security_group_id" {
  value = module.ecs_fargate.ecs_task_security_group_id
}

output "ecs_cluster_arn" {
  value = module.ecs_fargate.ecs_cluster_arn
}

output "ecs_task_definition_arn" {
  value = module.ecs_fargate.ecs_task_definition_arn
}

output "ecs_service_arn" {
  value = module.ecs_fargate.ecs_service_arn
}