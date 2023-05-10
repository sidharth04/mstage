resource "azurerm_resource_group" "resource_groups" {
  name     = upper("RES_${var.environment}_sid_${var.name}")
  location = "westeurope"
}