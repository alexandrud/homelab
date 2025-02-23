locals {
  terraform_state_name = replace(path_relative_to_include(), "/", "-")
}

terragrunt_version_constraint = "= 0.73.5"
terraform_binary = "tofu"
terraform_version_constraint = "= 1.9.0"

generate "backend" {
  path = "_generated_backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "local" {
    path = "${get_repo_root()}/tfstate/${path_relative_to_include()}/tfstate.json"
  }
  # backend "azure" {}
}
EOF
}

generate "versions" {
  path = "_generated_versions.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    unifi = {
      source = "ubiquiti-community/unifi"
      version = "~> 0.41"
    }
    # azurerm = {
    #   source = "hashicorp/azurerm"
    #   version = "~> 4.20"
    # }
  }
}

provider "unifi" {
  username       = var.username
  password       = var.password
  api_url        = var.api_url
  allow_insecure = var.insecure
}

# Install az cli and run `az login` for credentials
# provider "azurerm" {
#   features {}
#   subscription_id = "<>"
#   skip_provider_registration = true
# }
EOF
}

terraform {
  before_hook "copy_lock_file" {
    commands = ["init", "state", "apply", "plan", "destroy", "validate", "taint", "untaint", "refresh", "test", "graph"]
    execute  = ["/bin/bash", "-c", "cp ${get_parent_terragrunt_dir()}/terraform.lock.hcl ${get_original_terragrunt_dir()}/.terraform.lock.hcl"]
  }
  after_hook "cleanup" {
    commands = ["init", "state", "apply", "plan", "destroy", "validate", "taint", "untaint", "refresh", "test", "graph"]
    execute  = ["/bin/bash", "-c", "rm -rf .terraform* _* .terraform.lock.hcl"]
  }
  after_hook "remove_state" {
    commands = ["destroy"]
    execute  = ["/bin/bash", "-c", "${get_repo_root()}/tfstate/${path_relative_to_include()}/tfstate.json"]
  }
}