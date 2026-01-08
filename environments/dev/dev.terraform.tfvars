rgs = {
  rg-dev-pompar = {
    location = "Brazil South"++
  }
}

vnets_subnets = {
  vnet_pompar = {
    location = "Brazil South"

    resource_group_name = "rg-dev-pompar"

    address_space = ["10.0.0.0/16"]

    enable_bastion = false
    subnets = {
      frontend-subnet = {
        address_prefix = ["10.0.0.0/24"]
      }

      backend-subnet = {
        address_prefix = ["10.0.1.0/24"]
      }
      AzureBastionSubnet = {
        address_prefix = ["10.0.2.0/24"]
      }
    }
  }
}

vms = {
  "frontendvm" = {
    resource_group_name = "rg-dev-pompar"
    location            = "Brazil South"
    vnet_name           = "vnet_pompar"
    subnet_name         = "frontend-subnet"
    size                = "Standard_E2s_v3"
    admin_username      = "devopsadmin"
    admin_password      = "P@ssw01rd@123"
    inbound_open_ports  = [22, 80]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = false
  }
  "backendvm" = {
    resource_group_name = "rg-dev-pompar"
    location            = "Brazil South"
    vnet_name           = "vnet_pompar"
    subnet_name         = "backend-subnet"
    size                = "Standard_E2s_v3"
    admin_username      = "devopsadmin"
    admin_password      = "P@ssw01rd@123"
    inbound_open_ports  = [22, 80]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = true
  }
}

# loadbalancers = {
#   lb-pompar = {
#     location                       = "southcentralus"
#     resource_group_name            = "rg-dev-pompar"
#     frontend_ip_configuration_name = "PublicIPAddress"
#     sku                            = "Standard"
#   }
# }

# backend_pools = {
#   frontend-pool = {
#     port        = 80
#     lb_name     = "lb-pompar"
#     backend_vms = ["frontendvm1", "frontendvm2"]
#   }
# }
++++
