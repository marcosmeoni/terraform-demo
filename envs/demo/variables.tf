# envs/demo/variables.tf

variable "cluster_name" {
  description = "Name of the demo cluster"
  type        = string
  default     = "demo-cluster-01"
}

variable "node_count" {
  description = "Number of simulated nodes"
  type        = number
  default     = 2
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "demo"
}
