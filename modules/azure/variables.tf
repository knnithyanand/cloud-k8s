variable "default_region" {
  description = "Location of the resource group."
  default     = "southeastasia"
}

variable "create_rg" {
  description = "Create a resource group for the cluster."
  default     = true
}

variable "rg_name_prefix" {
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "rg_name" {
  description = "Name of the resource group."
  default     = "rg-terraform"
}

variable "rg_tags" {
  description = "Tags to apply to the resource group."
  default     = {}
}

variable "sp_client_id" {
  description = "The Service Principal Client ID."
}

variable "sp_client_secret" {
  description = "The Service Principal Client Secret."
}

variable "tenant_id" {
  description = "Azure Tenant ID."
}

variable "subscription_id" {
  description = "Azure Subscription ID."
}

variable "ssh_key" {
  description = "SSH public key used to manage the cluster."
}

variable "kubernetes_version" {
  description = "Kubernetes version to use."
  default     = "1.25.4"
}

variable "min_count" {
  description = "Minimum number of nodes in the node pool."
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes in the node pool."
  default     = 3
}

variable "enable_auto_scaling" {
  description = "Enable auto scaling for the node pool."
  default     = true
}

variable "node_size" {
  description = "Size of the nodes in the node pool."
  default     = "Standard_D2s_v3"
}

variable "key_vault_firewall_bypass_ip_cidr" {
  description = "List of IP CIDRs to bypass the key vault firewall."
  default     = ["0.0.0.0/0"]
}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry."
  default     = "Basic"
  type        = string
}
