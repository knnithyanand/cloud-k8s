resource "azurerm_user_assigned_identity" "k8s_uai" {
  name                = "uai-test-${local.deployment_suffix}"
  location            = local.resource_group.location
  resource_group_name = local.resource_group.name
}

resource "azurerm_user_assigned_identity" "acr_uai" {
  name                = "uai-acr-${local.deployment_suffix}"
  location            = local.resource_group.location
  resource_group_name = local.resource_group.name
}
