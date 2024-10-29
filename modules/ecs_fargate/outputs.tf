output "ecs_task_security_group_id" {
  value = aws_security_group.main.id
}

output "ecs_cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.main.arn
}

output "ecs_service_arn" {
  value = aws_ecs_service.main.id
}