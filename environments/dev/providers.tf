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
  subscription_id = "90962acf-4eb1-4b17-bd99-6688b0f73100"
}