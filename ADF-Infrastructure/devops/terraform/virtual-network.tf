locals {
  vnetAddressSpace = {
    dev = "10.3.0.0/16"
    test = "10.2.0.0/16"
    uat  = "10.5.0.0/16"
    prod = "10.4.0.0/16"
    }
  backendaddress_prefixes = {
     dev = "10.3.11.0/24"
     test = "10.2.10.0/28"
     uat  = "10.5.9.0/28"
     prod = "10.4.9.0/28"
    }
  frontendaddress_prefixes = {
      dev = "10.3.7.0/24"
      test = "10.2.5.0/28"
      uat  = "10.5.8.0/28"
      prod = "10.4.10.0/28"
    }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-funapp${local.environment}"
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = [local.vnetAddressSpace[local.environment]]
  location            = data.azurerm_resource_group.rg.location
  
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.frontendaddress_prefixes[local.environment]]
  service_endpoints    = ["Microsoft.Web"]
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
  address_prefixes     = [local.backendaddress_prefixes[local.environment]]
  service_endpoints    = ["Microsoft.Web"]

  delegation {
    name = "acctestdelegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  
}
