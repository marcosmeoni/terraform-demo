terraform {
  required_version = ">= 1.3.0"
  required_providers {
    null = { source = "hashicorp/null", version = "~> 3.0" }
  }
}

module "demo_cluster" {
  source       = "../../modules/demo-cluster"
  cluster_name = var.cluster_name
  node_count   = var.node_count
  environment  = var.environment
  tags         = merge(local.common_tags, { role = "cluster" })
}

output "cluster_id"   { value = module.demo_cluster.cluster_id }
output "cluster_name" { value = module.demo_cluster.cluster_name }
