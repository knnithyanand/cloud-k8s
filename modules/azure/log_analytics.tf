resource "azurerm_log_analytics_workspace" "main" {
  name                = "la-${local.deployment_suffix}"
  location            = local.resource_group.location
  resource_group_name = local.resource_group.name
  retention_in_days   = 30
  sku                 = "PerGB2018"
}
