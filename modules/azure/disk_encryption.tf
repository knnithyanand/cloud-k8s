data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_key" "acr_key" {
  name         = "key-acr-${local.deployment_suffix}"
  key_vault_id = azurerm_key_vault.k8s_vault.id

  depends_on = [
    azurerm_key_vault_access_policy.current_user
  ]

  key_type = "RSA"
  key_size = 4096
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  expiration_date = timeadd("${formatdate("YYYY-MM-DD", timestamp())}T00:00:00Z", "168h")
  lifecycle {
    ignore_changes = [expiration_date]
  }
}

resource "azurerm_key_vault_key" "des_key" {
  name         = "key-des-${local.deployment_suffix}"
  key_vault_id = azurerm_key_vault.k8s_vault.id

  depends_on = [
    azurerm_key_vault_access_policy.current_user
  ]

  key_type = "RSA"
  key_size = 4096
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  expiration_date = timeadd("${formatdate("YYYY-MM-DD", timestamp())}T00:00:00Z", "168h")
  lifecycle {
    ignore_changes = [expiration_date]
  }
}

resource "azurerm_disk_encryption_set" "des" {
  name                = "des-${local.deployment_suffix}"
  location            = local.resource_group.location
  resource_group_name = local.resource_group.name
  key_vault_key_id    = azurerm_key_vault_key.des_key.id

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_key_vault_access_policy" "des" {
  key_vault_id = azurerm_key_vault.k8s_vault.id
  object_id    = azurerm_disk_encryption_set.des.identity[0].principal_id
  tenant_id    = azurerm_disk_encryption_set.des.identity[0].tenant_id

  key_permissions = [
    "Get",
    "WrapKey",
    "UnwrapKey"
  ]
}

resource "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.k8s_vault.id
  object_id    = data.azurerm_client_config.current.object_id //coalesce(var.managed_identity_principal_id, data.azurerm_client_config.current.object_id)
  tenant_id    = data.azurerm_client_config.current.tenant_id

  key_permissions = [
    "Get",
    "Create",
    "Delete",
  ]
}
