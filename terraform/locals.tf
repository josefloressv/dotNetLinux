locals {
  common_tags = {
    Platform       = var.platform
    Environment    = var.environment
    Provisioned_by = "Terraform"
  }
}