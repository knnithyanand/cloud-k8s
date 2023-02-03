module "azure_k8s" {
  source = "./modules/azure"

  tenant_id        = var.az_tenant_id
  subscription_id  = var.az_sub_id
  sp_client_id     = var.az_client_id
  sp_client_secret = var.az_client_secret

  ssh_key = var.ssh_key
}
