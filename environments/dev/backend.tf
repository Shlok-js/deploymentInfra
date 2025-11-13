 terraform {
    backend "azurerm" {
        resource_group_name   = "rg-pompu"
        storage_account_name  = "pompustorage"
        container_name        = "tfstate"
        key                   = "dev.terraform.tfstate"
    }
 }