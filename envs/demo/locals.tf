# ------------------------------------------------------------------------------
# Common tags applied to resources in this environment. Merged with
# module-specific tags in main.tf for consistent labeling and cost tracking.
# ------------------------------------------------------------------------------

locals {
  common_tags = {
    project    = "terraform-demo"
    env        = "demo"
    managed-by = "terraform"
    team       = "sre"
  }
}
