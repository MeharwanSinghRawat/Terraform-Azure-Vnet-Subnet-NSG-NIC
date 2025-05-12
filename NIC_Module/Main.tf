resource "azurerm_network_interface" "nics" {
  for_each = var.subnet_ids

  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value
    private_ip_address_allocation = "Dynamic"
  }
}