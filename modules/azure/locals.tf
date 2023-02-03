resource "random_id" "prefix" {
  byte_length = 3
}

locals {
  resource_group = {
    name     = azurerm_resource_group.main[0].name
    location = var.default_region
  }
  deployment_suffix = random_id.prefix.hex
}
