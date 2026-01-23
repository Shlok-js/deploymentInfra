terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dont-delete"
    storage_account_name = "bhagadbilla" 
    container_name       = "tfstate"
    key = "deploymentInfra.tfstate"
  }
}
