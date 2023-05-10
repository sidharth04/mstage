terraform {
    required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.55.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "5a0855b9-426d-429e-83a9-ea7c4796e9a4"
    resource_group_name  = "rgstsidtest"
    storage_account_name = "mystsidtestqsoct5"
    container_name       = "tftstate" # this is overridden on command line in QA, PREPROD & PROD
    key                  = "terraformmultistage.tfstate"
    #use_azuread_auth     = false # This flag makes TF use AD auth (RBAC) to access backend storage.
  }
}

provider "azurerm" {
  features {
    
  }
}
  # "Backend" is used to save the state to Azure Blob in order to avoid developing conflicts. 


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