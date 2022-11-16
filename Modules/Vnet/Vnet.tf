resource "azurerm_virtual_network" "Vnet" {
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}
output name {
  value       = var.name
}
