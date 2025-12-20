resource "azurerm_resource_group" "rg" {
  for_each = var.rgs
  name     = each.key
  location = each.value.location
}


output "rg_ids" {
  value = { for key, value in azurerm_resource_group.rg: value.name => value.id }
}