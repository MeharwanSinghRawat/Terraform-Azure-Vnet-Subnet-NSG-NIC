resource "azurerm_network_security_group" "nsgs" {
  for_each = var.nsgs

  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each = var.subnet_ids

  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}