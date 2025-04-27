# Locals
locals {
  next_year       = tonumber(formatdate("YYYY", timestamp())) + 1
  expiration_date = format("%d-12-31T23:59:59Z", local.next_year) // make it valid till end of next year
}

data "azurerm_key_vault" "key_vault" {
  name                = var.keyvalutname[local.environment]
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_key_vault_access_policy" "acces_policy_deploy_agent" {
  count = local.environment == "dev" || local.environment == "test" || local.environment == "prod" ? 1 : 0
  name                = "Key, Secret, & Certificate Management"
    //resource_group_name        = data.azurerm_resource_group.rg.name
}

resource "azurerm_key_vault_access_policy" "acces_policy_deploy_agent" {
  count = local.environment == "uat" ? 1 : 0
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.client_config.tenant_id
  object_id    = data.azurerm_client_config.client_config.object_id

  key_permissions         = ["Backup", "Create", "Delete", "Get", "Import", "List", "Purge", "Recover", "Restore", "Update"]
  secret_permissions      = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
  certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
  storage_permissions     = []
}

resource "azurerm_key_vault_access_policy" "acces_policy_function_app" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.client_config.tenant_id
  object_id    = azurerm_linux_function_app.function_app_ns.identity[0].principal_id

  secret_permissions = ["Get", "List"]
}


resource "azurerm_key_vault_access_policy" "acces_policy_function_app_deploy_slot" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.client_config.tenant_id
  object_id    = azurerm_linux_function_app_slot.app_slot_ns.identity[0].principal_id

  secret_permissions = ["Get", "List"]
}

resource "azurerm_key_vault_secret" "northstar-sa-connection-string" {
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  name            = "northstar-storage-connection-string"
  value           = azurerm_storage_account.sa.primary_connection_string
  content_type    = "access_key"
  expiration_date = local.expiration_date
  depends_on      = [azurerm_key_vault_access_policy.acces_policy_deploy_agent]
}

resource "azurerm_key_vault_secret" "northstar-servicebusqueue-connectionstring" {
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  name            = "northstar-servicebus-connectionstring"
  value           = azurerm_servicebus_namespace.snamespace.default_primary_connection_string
  content_type    = "access_key"
  expiration_date = local.expiration_date
  depends_on      = [azurerm_key_vault_access_policy.acces_policy_deploy_agent] 
}

resource "azurerm_key_vault_secret" "northstar-storage-account-key" {
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  name            = "northstar-storage-account-key"
  value           = azurerm_storage_account.sa.primary_access_key
  content_type    = "access_key"
  expiration_date = local.expiration_date
  depends_on      = [azurerm_key_vault_access_policy.acces_policy_deploy_agent]
}

resource "azurerm_key_vault_secret" "northstar-azapp-configuration-connectionstring" {
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  name            = "northstar-azureapp-configuration-connectionstring"
  value           = azurerm_app_configuration.api_app_configurations.primary_write_key[0].connection_string
  content_type    = "access_key"
  expiration_date = local.expiration_date
  depends_on      = [azurerm_key_vault_access_policy.acces_policy_deploy_agent]
}

data "azurerm_key_vault_secret" "northstar-adf-storage-connection-string" {
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  name            = "northstar-adf-storage-connection-string"
}

data "azurerm_key_vault_secret" "northstar-smart-recruiters-access-token" {
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  name            = "northstar-smart-recruiters-access-token"
}

