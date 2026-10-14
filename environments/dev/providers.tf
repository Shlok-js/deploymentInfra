terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

provider "azurerm" {

  features {}
  subscription_id = "dacedd9d-d879-40f7-84cc-abfeac9cb41d"
}
