terraform {
  backend "azurerm" {
    resource_group_name  = "do-not-delete"

    storage_account_name = "saunaccount" 

    container_name       = "tfstate"
    
    key = "deploymentInfra.tfstate"
  }
}
