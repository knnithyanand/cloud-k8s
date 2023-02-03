resource "azurerm_key_vault" "k8s_vault" {
  location                    = local.resource_group.location
  name                        = "kv-${local.deployment_suffix}"
  resource_group_name         = local.resource_group.name
  sku_name                    = "standard"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    ip_rules       = var.key_vault_firewall_bypass_ip_cidr
  }
}
