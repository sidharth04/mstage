terraform {
    required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.55.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}
  ## "Backend" is used to save the state to Azure Blob in order to avoid developing conflicts. 
  # backend "azurerm" {
  #   subscription_id      = ""
  #   resource_group_name  = ""
  #   storage_account_name = ""
  #   container_name       = "" # this is overridden on command line in QA, PREPROD & PROD
  #   key                  = "terraform.tfstate"
  #   use_azuread_auth     = true # This flag makes TF use AD auth (RBAC) to access backend storage.
  # }


module "resource_groups" {
  source                                    = "./module_resource_groups"
  name                                      = var.rgname
  environment                               = var.ENVIRONMENT_TYPE
}

module "log_analytics" {
  source              = "./module_log_analytics"
  name                = "LA-${upper(var.ENVIRONMENT_TYPE)}sid-DIAG-01"
  resource_group_name = upper("RES_${var.ENVIRONMENT_TYPE}sid_COMMON_SERVICES_01")
  depends_on = [
    module.resource_groups
  ]
}