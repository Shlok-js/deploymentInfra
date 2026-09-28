resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks_clusters
  
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = each.value.kubernetes_version

  # Add this block to fix the error
  node_provisioning_profile {
    mode = "Manual"
  }

  # Best Practice: SystemAssigned identity is preferred over Service Principals
  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name           = each.value.default_node_pool.name
    node_count     = each.value.default_node_pool.node_count
    vm_size        = each.value.default_node_pool.vm_size
    
    # Matches the lookup pattern from your VM NIC configuration
    vnet_subnet_id = lookup(lookup(var.vnet_subnet_ids, each.value.vnet_name), each.value.subnet_name)
  }

  # Best Practice: Azure CNI for advanced VNet integration 
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"

    service_cidr   = "172.16.0.0/16"
    dns_service_ip = "172.16.0.10"
  }

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count # Ignore if using cluster autoscaler later
    ]
  }
}