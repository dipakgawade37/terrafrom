resource "azurerm_resource_group" "rg-dipak" {
    name      = var.resource_group
    location  = var.location

}

resource "azurerm_virtual_network" "vnets" {
  count               = length(var.env1)
  name                = var.vnet[count.index]
  location            = var.location
  address_space       = [var.address[count.index]]
  resource_group_name = var.resource_group
}

resource "azurerm_resource_group" "rg" {
    for_each = (var.env1)
    name     = each.key
    location = var.location
    tags = {
        Environment = each.value
    }
}