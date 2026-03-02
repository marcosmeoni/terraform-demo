# envs/demo/main.tf

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }

  # Uncomment to use remote state (recommended for teams):
  # backend "s3" {
  #   bucket = "my-tfstate-bucket"
  #   key    = "demo/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

module "demo_cluster" {
  source = "../../modules/demo-cluster"

  cluster_name = var.cluster_name
  node_count   = var.node_count
  environment  = var.environment

  tags = {
    env       = var.environment
    managed   = "terraform"
    team      = "sre"
  }
}

output "cluster_id" {
  value = module.demo_cluster.cluster_id
}

output "cluster_name" {
  value = module.demo_cluster.cluster_name
}
