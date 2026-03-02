# modules/demo-cluster/variables.tf

variable "cluster_name" {
  description = "Name of the demo cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes to simulate"
  type        = number
  default     = 2
}

variable "environment" {
  description = "Environment name (must not be prd/production)"
  type        = string
  validation {
    condition     = !contains(["prd", "prod", "production"], lower(var.environment))
    error_message = "This module must not be used in production environments."
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
