locals {
  localvnetAddressSpace = {
    dev = "10.7.71.192/27"
    test = "10.7.71.160/27"
    uat = "10.7.71.96/27"
    prod = "10.7.74.192/27"
    }
  local_address_prefixes = {
     dev = "10.7.71.208/28"
     test = "10.7.71.160/28"
     uat = "10.7.71.96/28"
     prod = "10.7.74.192/28"
    }
  local_vmss_add_prefix = {
    dev = "10.7.71.192/28"
    test = "10.7.71.176/28"
    uat = "10.7.71.112/28"
    prod = "10.7.74.208/28"
    }
}

resource "azurerm_virtual_network" "local-vnet" {
  name                = var.localvnetName[local.environment]
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = [local.localvnetAddressSpace[local.environment]]
  location            = var.location
  

}

resource "azurerm_subnet" "localIRsubnet" {
  name                 = var.localsubnetName1[local.environment]
  virtual_network_name = azurerm_virtual_network.local-vnet.name 
  resource_group_name  = data.azurerm_resource_group.rg.name
  address_prefixes     = [local.local_address_prefixes[local.environment]]
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "localvmsssubnet" {
  name                 = var.localsubnetName2[local.environment]
  virtual_network_name = azurerm_virtual_network.local-vnet.name 
  resource_group_name  = data.azurerm_resource_group.rg.name
  address_prefixes      = [local.local_vmss_add_prefix[local.environment]]
  service_endpoints = ["Microsoft.Storage"]
}
