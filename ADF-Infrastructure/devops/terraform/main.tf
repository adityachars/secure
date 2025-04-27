data "azurerm_resource_group" "rg" {
  name = var.resourceGroupName[local.environment]
}

data "azurerm_client_config" "client_config" {
}

data "azurerm_subscription" "current" {
}
