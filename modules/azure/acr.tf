resource "azurerm_container_registry" "acr" {
  name                = "acr-${local.deployment_suffix}"
  resource_group_name = local.resource_group.name
  location            = local.resource_group.location
  sku                 = var.acr_sku

  admin_enabled = true
  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.acr_uai.id
    ]
  }

  encryption = var.acr_sku != "Premium" ? null : [{
    enabled            = true
    identity_client_id = azurerm_user_assigned_identity.acr_uai.client_id
    key_vault_key_id   = azurerm_key_vault_key.acr_key.id
  }]
}
