module "aks" {
  source  = "Azure/aks/azurerm"
  version = "6.5.0"

  depends_on = [
    azurerm_resource_group.main,
  ]

  prefix                 = "aks-${local.deployment_suffix}"
  cluster_name           = "aks-${local.deployment_suffix}"
  resource_group_name    = local.resource_group.name
  admin_username         = null
  azure_policy_enabled   = true
  disk_encryption_set_id = azurerm_disk_encryption_set.des.id
  identity_type          = "UserAssigned"
  identity_ids           = [azurerm_user_assigned_identity.k8s_uai.id]

  kubernetes_version  = var.kubernetes_version
  enable_auto_scaling = var.enable_auto_scaling
  agents_min_count    = var.min_count
  agents_max_count    = var.max_count
  agents_count        = var.enable_auto_scaling ? null : var.min_count
  agents_size         = var.node_size

  log_analytics_workspace_enabled = true
  log_analytics_workspace = {
    id   = azurerm_log_analytics_workspace.main.id
    name = azurerm_log_analytics_workspace.main.name
  }

  net_profile_pod_cidr               = "10.1.0.0/16"
  private_cluster_enabled            = true
  rbac_aad_managed                   = true
  role_based_access_control_enabled  = true
  key_vault_secrets_provider_enabled = true
  microsoft_defender_enabled         = true
  secret_rotation_enabled            = true

  maintenance_window = {
    allowed = [
      {
        day   = "Sunday",
        hours = [22, 23]
      },
    ]
    not_allowed = []
  }

}

resource "azurerm_role_assignment" "example" {
  principal_id                     = azurerm_user_assigned_identity.k8s_uai.id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
