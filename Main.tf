terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

#Values passing for vareables
module "ResourceGroup" {
  source   = "./modules/ResourceGroup"
  name     = "testing"
  location = "eastus"
}

module "Vnet" {
  source              = "./modules/Vnet"
  name                = "${module.ResourceGroup.name}-Vnet"
  location            = module.ResourceGroup.location
  address_space       = ["10.0.0.0/16"]
  resource_group_name = module.ResourceGroup.name
}
