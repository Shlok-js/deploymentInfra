module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "networking" {
  depends_on    = [module.azurerm_resource_group]
  source        = "../../modules/azurerm_networking"
  vnets_subnets = var.vnets_subnets
}

module "vms" {
  depends_on      = [module.azurerm_resource_group, module.networking]
  source          = "../../modules/azurerm_virtual_machine"
  vms             = var.vms
  vnet_subnet_ids = module.networking.vnet_subnet_ids
}

# module "loadbalancers" {
#   depends_on    = [module.rgs, module.networking, module.vms]
#   source        = "../modules/LoadBalancer"
#   loadbalancers = var.loadbalancers
#   backend_pools = var.backend_pools
#   nic_ids       = module.vms.vm_nic_ids
# }
