terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-backend"
    storage_account_name = "pompu"
    container_name       = "tfstate"
 
    key                  = "deploymentInfra.tfstate"
  }
}