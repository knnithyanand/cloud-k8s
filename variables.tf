# Azure Variables
variable "az_client_id" {
  description = "The Service Principal Client ID."
}

variable "az_client_secret" {
  description = "The Service Principal Client Secret."
}

variable "az_tenant_id" {
  description = "Azure Tenant ID."
}

variable "az_sub_id" {
  description = "Azure Subscription ID."
}

variable "ssh_key" {
  description = "SSH public key used to manage the cluster."
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDQeiDiC23SyK2guTrtFfqI5NRr+LAKd+6L9/hNmwkrWfUYeD3S4GiCyK1vk/f2zx08ggh9Vi9P3P1By8jAEmEXpyxD1X2jYKxaDh7hKfg7PShd1zdAXSBLvwjKgyyVDpRhD2kPueLKYpoZXH02EsSebjIT1K2xf1NuhlO+nKfYja9dblvpyEM90/HVoz5gTZTtbrF+z/QXiKmVyK9YYw4n0aZFFTx+gm0gmIr2HrEYFxDHTy/rBnmhb3NGSkX7JDDpFr8+Kdf/Bb7jGiCmKTsu7uhWhI7uzu5CXwTME7Hk6anwd4+PQ7sTM4gLOzBITmw4/rqDRmIkywiAelO6yItPAPaBiAmdUo1m/jimifFouZcfr78UT/4yhaUhFaPF+RVBUcea5NPhgPHC6nOTXxaO6o/JIXXw5/uFDzN2L4IN/pLnRrWUMRHClCHMU8ci+rD97MDzivEhIgirki6Uun38+axb1/ju9Erz5q39U7oY7IQJburUMat2P1it8xDAGX20gsjQS4J/GbSfNfTVJfbN7HhNSQCnY8ABmp7ZjHwkSYC/tKRCm90wTjRx2Z8bQiAlucV2cI3bkppoDUVxDdlLep3hOKt9inEA/ozX+8fatFbNaVwQHOqyQEL6hFEJM1+wX7Vmmd/O55+jpFa3Cf9uwotYz1CivkiAo9eQTq8O6Q== ansible"
}

variable "kubernetes_version" {
  description = "Kubernetes version to use."
  default     = "1.22.2"
}
