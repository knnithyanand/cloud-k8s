resource "azurerm_resource_group" "rg" {
  location = var.default_region
  name     = var.rg_name
}
