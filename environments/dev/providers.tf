terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"

      version = "4.51.0"

    }
  }
}

provider "azurerm" {

  features {}
  subscription_id = "5d24ed5a-049c-4f8d-914f-cdd61e0e7902"
}