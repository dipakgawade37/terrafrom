resource "azurerm_resource_group" "RG-dipak1" {
  location = "eastus2"
  name     = "RG-dipak1"

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}

resource "azurerm_virtual_network" "vnet1_dipak1" {
  name                = "vnet1"
  location            = azurerm_resource_group.RG-dipak1.location
  resource_group_name = azurerm_resource_group.RG-dipak1.name
  address_space       = ["10.10.0.0/16"]

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}

resource "azurerm_virtual_network" "vnet1_dipak2" {
  name                = "vnet4"
  location            = azurerm_resource_group.RG-dipak1.location
  resource_group_name = azurerm_resource_group.RG-dipak1.name
  address_space       = ["10.10.1.0/24"]

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}
