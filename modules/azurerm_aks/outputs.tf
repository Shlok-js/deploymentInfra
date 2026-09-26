output "aks_cluster_ids" {
  description = "The IDs of the AKS clusters"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.id }
}

output "aks_kube_configs" {
  description = "The raw kubeconfig files for the AKS clusters"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kube_config_raw }
  sensitive   = true
}

output "aks_fqdns" {
  description = "The FQDNs of the AKS clusters"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.fqdn }
}