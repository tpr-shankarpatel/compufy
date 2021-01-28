  output "cluster_arn" {
  value = aws_ecs_cluster.this.*.arn
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
}
  /**
output "capacity_provider_name" {
  value       = aws_ecs_capacity_provider.this.*.name
  description = "Name of the provisioned capacity provider"
}

output "capacity_provider_id" {
  value = aws_ecs_capacity_provider.this.*.id
  description = "id of capacity provider"
}

output "capacity_provider_arn" {
  value = aws_ecs_capacity_provider.this.*.arn
  description = "The Amazon Resource Name (ARN) that identifies the capacity provider."
}

output "cluster_name" {
  value = aws_ecs_cluster.this.*.name
  description = "Name of cluster"
}

output "cluster_id" {
  value = aws_ecs_cluster.this.*.id
  description = "id of cluster"
}



output "ecs_service_name" {
  value = aws_ecs_service.this.*.name
  description = "Name of The service"
}

output "ecs_service_id" {
  value = aws_ecs_service.this.*.id
  description = "id of ecs service"
}

output "ecs_service_iam_role" {
  value = aws_ecs_service.this.*.iam_role
  description = "The ARN of IAM role used for ELB"
}

output "ecs_service_cluster" {
  value = aws_ecs_service.this.*.cluster
  description = "The Amazon Resource Name (ARN) of cluster which the service runs on"
}

output "ecs_service_desired_count" {
  value = aws_ecs_service.this.*.desired_count
  description = "The number of instances of the task definition"
}

output "aws_ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.this.*.arn 
  description = "Full ARN of the Task Definition (including both family and revision)."
}

output "aws_ecs_task_definition_family" {
  value       = aws_ecs_task_definition.this.*.family
  description = "The family of the Task Definition."
}

output "aws_ecs_task_definition_revision" {
  value       = aws_ecs_task_definition.this.*.revision
  description = "The revision of the task in a particular family."
}

# output "autoscaling_group_arn" {
#   value       = aws_autoscaling_group.this.arn
#   description = "aws autoscaling group arn"
# }

**/