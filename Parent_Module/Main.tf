
resource "azurerm_resource_group" "rg" {
  name     = "Mehar_Rg"
  location = "East US"
}

module "vnet" {
  source              = "../VNet_Module"
  vnet_name           = "mehar-vnet"
  address_space       = "10.0.0.0/16"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "subnets" {
  source              = "../Subnet_Module"
  vnet_name           = module.vnet.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  subnets = {
    "Subnet1" = "10.0.0.0/24"
    "Subnet2" = "10.0.1.0/24"
    "Subnet3" = "10.0.2.0/24"
    "Subnet4" = "10.0.3.0/24"
  }
}

module "nsgs" {
  source              = "../NSG_Module"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  nsgs = {
    "Subnet1" = "nsg-1"
    "Subnet2" = "nsg-2"
    "Subnet3" = "nsg-3"
    "Subnet4" = "nsg-4"
  }
  subnet_ids = module.subnets.subnet_ids
}

module "nics" {
  source              = "../NIC_Module"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_ids          = module.subnets.subnet_ids
}