resource "azurerm_resource_group" "main" {
  count = var.create_rg ? 1 : 0

  location = var.default_region
  name     = var.rg_name
}
