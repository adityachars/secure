resource "azurerm_private_dns_zone" "pvtdnszone" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_endpoint" "kvendpoint" {
  name                = var.pvtendpointname[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.localIRsubnet.id

  private_dns_zone_group {
    name                 = var.dnszonegrp[local.environment]
    private_dns_zone_ids = [azurerm_private_dns_zone.pvtdnszone.id]
  }

  private_service_connection {
    name                           = azurerm_key_vault.key_vault.name
    private_connection_resource_id = azurerm_key_vault.key_vault.id
    is_manual_connection           = false
    subresource_names              = ["Vault"]
  }
}


resource "azurerm_private_dns_zone_virtual_network_link" "virtual_network_link" {
  name                  = var.vnetlink[local.environment]
  resource_group_name   = data.azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.pvtdnszone.name
  virtual_network_id    = azurerm_virtual_network.local-vnet.id
}
