variable "vnets_subnets" {}
variable "rgs" {}
# variable "vms" {}
# variable "dbms"{}
# variable "loadbalancers" {}
# variable "backend_pools" {}

variable "aks_clusters" {
  description = "Map of AKS cluster configurations"
  type = map(object({
    location            = string
    resource_group_name = string
    dns_prefix          = string
    kubernetes_version  = string
    vnet_name           = string
    subnet_name         = string
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })
  }))
}
