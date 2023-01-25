variable "default_region" {
  default     = "southeastasia"
  description = "Location of the resource group."
}

variable "rg_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "rg_name" {
  default     = "rg-terraform"
  description = "Name of the resource group."
}

variable "rg_tags" {
  default     = {}
  description = "Tags to apply to the resource group."
}
