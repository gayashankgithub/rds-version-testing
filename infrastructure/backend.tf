# TODO: Move this comment to the README.md once template is migrated out of repo.
# Using the backend.hcl.example file within this directory, please create a backend.hcl file in each of the following directories:
# - qa
# - staging
# - production
terraform {
  backend "s3" {
  }
}
