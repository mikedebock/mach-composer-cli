# This file is auto-generated by MACH composer
# site: test-1
terraform {
  backend "local" {
    path = "./states/test-1.tfstate"
  }
  required_providers {
    aws = {
      version = "~> 3.74.1"
    }
  }
}

# File sources
# Resources
# Configuring AWS
provider "aws" {
  region = "eu-west-1"
}

locals {
  tags = {
    Site        = "test-1"
    Environment = "test"
  }
}

# Component: component
module "component" {
  source  = "some/test/module"
  version = "test"
  variables = {
    component_variable = "component_variable_value"
    global_variable    = "global_variable_value"
    site_variable      = "site_variable_value"
  }
  secrets = {
    component_secret = "component_secret_value"
    global_secret    = "global_secret_value"
    site_secret      = "site_secret_value"
  }
  component_version = "test"
  environment       = "test"
  site              = "test-1"
  tags              = local.tags
  providers = {
    aws = aws,
  }
}

output "component" {
  description = "The module outputs for component"
  sensitive   = true
  value       = module.component
}
