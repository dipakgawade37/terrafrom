
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
}
 
terraform {
  cloud {
   
    organization = "dipakgawade37"
 
    workspaces {
      name = "demo1"
    }
  }
}
 
 
provider "azurerm" {
  subscription_id = var.sub_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {} # Required for azurerm provider
}
 

