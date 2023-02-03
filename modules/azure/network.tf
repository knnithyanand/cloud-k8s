# resource "azurerm_virtual_network" "test" {
#   name                = "vn-${local.deployment_suffix}"
#   location            = local.resource_group.location
#   resource_group_name = local.resource_group.name
#   address_space       = ["10.52.0.0/16"]
# }

# resource "azurerm_subnet" "test" {
#   name                                      = "sn-${local.deployment_suffix}"
#   resource_group_name                       = local.resource_group.name
#   address_prefixes                          = ["10.52.0.0/24"]
#   virtual_network_name                      = azurerm_virtual_network.test.name
#   private_endpoint_network_policies_enabled = true
# }
