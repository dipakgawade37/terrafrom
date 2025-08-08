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
  name                = "vnet3"
  location            = azurerm_resource_group.RG-dipak1.location
  resource_group_name = azurerm_resource_group.RG-dipak1.name
  address_space       = ["10.10.1.0/24"]

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}

# 🚨 Intentional Vulnerability: Open inbound access to all IPs
resource "azurerm_network_security_group" "nsg_public" {
  name                = "nsg-public"
  location            = azurerm_resource_group.RG-dipak1.location
  resource_group_name = azurerm_resource_group.RG-dipak1.name

  security_rule {
    name                       = "Allow-All-Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "0.0.0.0/0"   # ❌ Open to the world
    destination_address_prefix = "*"
  }

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}
