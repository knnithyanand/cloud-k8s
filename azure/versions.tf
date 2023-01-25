terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "8201cb45-74d0-474d-b3bd-48e38404b43e"
  tenant_id       = "848fbce9-4d11-419f-acec-71324d6ec164"
  client_id       = "90c225a4-e669-4dfc-8931-9028d11bbb06"
  client_secret   = "S8J8Q~0qczlN3Rq5LnujBGUlDrZxo-VmUgsbjbrL"
}
