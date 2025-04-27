# # Northstar adf storage account
# data "azurerm_storage_account" "northstar-adf-storage" {

#   name                = var.adf_blob_storage_account_name[local.environment]
#   resource_group_name = var.resourceGroupName[local.environment]
# }

# #Private end points for Northstar adf storage  northstarstorage
# # Private dns zone for blob storage
# # resource "azurerm_private_dns_zone" "pvt-dns-zone-blob" {

# #   name                = "privatelink.blob.core.windows.net"
# #   resource_group_name = var.resourceGroupName[local.environment]
# # }

# # # # Private dns zone for file share
# # resource "azurerm_private_dns_zone" "pvt-dns-zone-file" {

# #   name                = "privatelink.file.core.windows.net"
# #   resource_group_name = var.resourceGroupName[local.environment]
# # }

# data "azurerm_private_dns_zone" "pvt-dns-zone-blob" {

#   name                = var.dnszoneblob[local.environment]
#   resource_group_name = var.resourceGroupName[local.environment]
# }

# data "azurerm_private_dns_zone" "pvt-dns-zone-file" {

#   name                = var.dnszonefile[local.environment]
#   resource_group_name = var.resourceGroupName[local.environment]
# }

# data "azurerm_private_dns_zone" "pvt-dns-zone-table" {

#   name                = var.dnszonetable[local.environment]
#   resource_group_name = var.resourceGroupName[local.environment]
# }

# #Private end point for blob storage
# resource "azurerm_private_endpoint" "northstar-blob-endpoint" {

#   name                = var.pvtendpointnameblob[local.environment]
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = var.resourceGroupName[local.environment]
#   subnet_id           = azurerm_subnet.frontend_ns.id

#   private_dns_zone_group {
    
#     name                 = "default"
#     private_dns_zone_ids = [data.azurerm_private_dns_zone.pvt-dns-zone-blob.id]
#   }

#   private_service_connection {
#     name                           = data.azurerm_storage_account.northstar-adf-storage.name
#     private_connection_resource_id = data.azurerm_storage_account.northstar-adf-storage.id
#     is_manual_connection           = false
#     subresource_names              = ["blob"]
#   }

# }

# # Private end point for file share
# resource "azurerm_private_endpoint" "northstar-file-endpoint" {

#   name                = var.pvtendpointnamefile[local.environment]
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = var.resourceGroupName[local.environment]
#   subnet_id           = azurerm_subnet.frontend_ns.id

#   private_dns_zone_group {
    
#     name                 = "default"
#     private_dns_zone_ids = [data.azurerm_private_dns_zone.pvt-dns-zone-file.id]
#   }

#     private_service_connection {
#     name                           = data.azurerm_storage_account.northstar-adf-storage.name
#     private_connection_resource_id = data.azurerm_storage_account.northstar-adf-storage.id
#     is_manual_connection           = false
#     subresource_names              = ["file"]
#   }
# }

# resource "azurerm_private_endpoint" "northstar-table-endpoint" {

#   name                = var.pvtendpointnametable[local.environment]
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = var.resourceGroupName[local.environment]
#   subnet_id           = azurerm_subnet.frontend_ns.id

#   private_dns_zone_group {
    
#     name                 = "default"
#     private_dns_zone_ids = [data.azurerm_private_dns_zone.pvt-dns-zone-table.id]
#   }

#     private_service_connection {
#     name                           = data.azurerm_storage_account.northstar-adf-storage.name
#     private_connection_resource_id = data.azurerm_storage_account.northstar-adf-storage.id
#     is_manual_connection           = false
#     subresource_names              = ["table"]
#   }
# }
# # Vnet link for blob storage
# resource "azurerm_private_dns_zone_virtual_network_link" "virtual-network-link-blob" {

#   name                  = var.vnetlinkblob[local.environment]
#   resource_group_name   = var.resourceGroupName[local.environment]
#   private_dns_zone_name = data.azurerm_private_dns_zone.pvt-dns-zone-blob.name
#   virtual_network_id    = azurerm_virtual_network.vnet_ns.id
# }

# # Vnet link for file share
# resource "azurerm_private_dns_zone_virtual_network_link" "virtual-network-link-file" {

#   name                  = var.vnetlinkfile[local.environment]
#   resource_group_name   = var.resourceGroupName[local.environment]
#   private_dns_zone_name = data.azurerm_private_dns_zone.pvt-dns-zone-file.name
#   virtual_network_id    = azurerm_virtual_network.vnet_ns.id
# }

# # Vnet link for table
# resource "azurerm_private_dns_zone_virtual_network_link" "virtual-network-link-table" {

#   name                  = var.vnetlinktable[local.environment]
#   resource_group_name   = var.resourceGroupName[local.environment]
#   private_dns_zone_name = data.azurerm_private_dns_zone.pvt-dns-zone-table.name
#   virtual_network_id    = azurerm_virtual_network.vnet_ns.id
# }
