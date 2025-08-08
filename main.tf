resource "azurerm_resource_group" "RG-dipak1" {
  location = "eastus2"
  name     = "RG-dipak1"

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}

# Intentionally insecure: Open to all public IPs
resource "azurerm_virtual_network" "vnet1_dipak1" {
  name                = "vnet1"
  location            = azurerm_resource_group.RG-dipak1.location
  resource_group_name = azurerm_resource_group.RG-dipak1.name
  address_space       = ["0.0.0.0/0"] # <-- Insecure: allows all IPs

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}

resource "azurerm_network_security_group" "nsg_insecure" {
  name                = "nsg-insecure"
  location            = azurerm_resource_group.RG-dipak1.location
  resource_group_name = azurerm_resource_group.RG-dipak1.name

  security_rule {
    name                       = "AllowAllInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = "Development"
    Owner       = "Dipak"
  }
}

#adding code QL checkign line
#Another insecure example: duplicate resource name with no security
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
