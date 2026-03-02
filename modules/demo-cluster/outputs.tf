# modules/demo-cluster/outputs.tf

output "cluster_id" {
  description = "Simulated cluster ID"
  value       = null_resource.demo_cluster.id
}

output "cluster_name" {
  description = "Name of the demo cluster"
  value       = var.cluster_name
}

output "environment" {
  description = "Environment"
  value       = var.environment
}
