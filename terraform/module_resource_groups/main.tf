resource "azurerm_resource_group" "resource_groups" {
  name     = var.name
  location = "westeurope"
}