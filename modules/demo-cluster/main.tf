# modules/demo-cluster/main.tf
# Demo cluster module — uses null_resource to simulate without real cloud calls

terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "demo_cluster" {
  triggers = {
    cluster_name = var.cluster_name
    node_count   = var.node_count
    environment  = var.environment
  }

  provisioner "local-exec" {
    command = "echo '[demo-cluster] Simulating cluster: ${var.cluster_name} (env: ${var.environment}, nodes: ${var.node_count})'"
  }
}
