resource "azurerm_storage_account" "sa" {
  name                      = "northstarfunappstr${local.environment}"
  resource_group_name       = data.azurerm_resource_group.rg.name
  location                  = data.azurerm_resource_group.rg.location
  account_tier              = var.account_tier[local.environment]
  account_replication_type  = "LRS"
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true
  blob_properties {
    last_access_time_enabled = true
  }
}
