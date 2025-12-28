rgs = {
  rg-dev-pompu = {
    location = "southcentralus"
  }
}

vnets_subnets = {
  vnet_pompu = {
    location            = "southcentralus"

    resource_group_name = "rg-dev-pompu"
    
    address_space       = ["10.0.0.0/16"]

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
    resource_group_name = "rg-dev-pompu"
    location            = "southcentralus"
    vnet_name           = "vnet_pompu"
    subnet_name         = "frontend-subnet"
    size                = "Standard_F2s_v2"
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
    resource_group_name = "rg-dev-pompu"
    location            = "southcentralus"
    vnet_name           = "vnet_pompu"
    subnet_name         = "backend-subnet"
    size                = "Standard_F2s_v2"
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

loadbalancers = {
  lb-pompu = {
    location                       = "southcentralus"
    resource_group_name            = "rg-dev-pompu"
    frontend_ip_configuration_name = "PublicIPAddress"
    sku                            = "Standard"
  }
}

backend_pools = {
  frontend-pool = {
    port        = 80
    lb_name     = "lb-pompu"
    backend_vms = ["frontendvm1", "frontendvm2"]
  }
}
