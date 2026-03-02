variable "cluster_name" { type = string }
variable "node_count" { type = number; default = 2 }
variable "environment" {
  type = string
  validation {
    condition     = !contains(["prd","prod","production"], lower(var.environment))
    error_message = "Must not be used in production."
  }
}
variable "tags" { type = map(string); default = {} }
