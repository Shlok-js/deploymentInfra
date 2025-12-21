terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-backend"
    storage_account_name = "pompya"
    container_name       = "tfstate"
    key                  = "deploymentInfra.tfstate"
  }
}