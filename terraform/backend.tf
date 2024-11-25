terraform {
  backend "s3" {
    # Dynamic configuration in deploy-infra.tf script
    encrypt = true
  }
}
