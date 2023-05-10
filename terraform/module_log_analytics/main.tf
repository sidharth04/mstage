resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.name
  location            = "westeurope"
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
output "log_analytics_id" {
  value = azurerm_log_analytics_workspace.log_analytics.id
}