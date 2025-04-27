variable "disabled_functions_ns_win" {
  type = map(string)
  default = {
    "AzureWebJobs.SendDeadLetterAlert.Disabled" = "1"
  }
}

data "azurerm_application_insights" "ai_ns_win"{
   name                = var.appins_name[local.environment]
   resource_group_name = data.azurerm_resource_group.rg.name
   //depends_on          = [module.appins]
}

resource "azurerm_service_plan" "service_plan_ns_win" {
  name                = "ns-service-plan-win-${local.environment}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_name            = var.sku_name_win[local.environment].size
}

resource "azurerm_windows_function_app" "function_app_ns_win" {
  name                        = "ns-function-app-win-${local.environment}"
  resource_group_name         = data.azurerm_resource_group.rg.name
  location                    = data.azurerm_resource_group.rg.location
  storage_account_name        = azurerm_storage_account.sa.name
  storage_account_access_key  = azurerm_storage_account.sa.primary_access_key
  service_plan_id             = azurerm_service_plan.service_plan_ns_win.id
  https_only                  = true
  functions_extension_version = "~4"
  builtin_logging_enabled     = false

app_settings = {
    "AppConfig__PAYLOAD_LOGGING_ENABLED"               = var.payloadlog[local.environment]
    "AppConfig__RetryCount"                            = 3
    "AuthenticationConfig__AUDIENCE"                   = var.audience[local.environment]
    "AuthenticationConfig__GIP_AUDIENCE_ID"            = var.gipaudience[local.environment]
    "AuthenticationConfig__TENANT_ID"                  = var.tenantid[local.environment]
    "AzureAppConfigurationConnectionstring"            = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-azapp-configuration-connectionstring.name})"
    "AzureStorage__StorageAccountName"                 = azurerm_storage_account.sa.name
    "BlobContainerName"                                = "erp-container/fiinvoice/{legalentity}"
    "BlobStorageConnectionString"                      = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${data.azurerm_key_vault_secret.northstar-adf-storage-connection-string.name})"
    "EndPoints__APIMHOST"                              = var.apimhosturl[local.environment]
    "EndPoints__AzureBaseEnvironment"                  = var.env[local.environment]
    "EndPoints__AzureEnvironmentFI"                    = var.envfi[local.environment]
    "KeyVault__VaultUri"                               = var.keyvaulturl[local.environment]
    "Queue.ServiceBusConnectionString"                 = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-servicebusqueue-connectionstring.name})"
    "StorageAccountKey"                                = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-storage-account-key.name})"
    "InvoiceQueueName"                                 = "northstar-erp-fiinvoice-pdf-queue"
    "EndPoints__EXTRACT_ATTACHMENT"                    = "northstar-integration/erp/erpextractattachment"
    "AzureStorage__ExceptionsTableStorageName"         = "FinlandInvoicingPDFExceptions"
    "AzureStorage__BatchTableStorageName"              = "FinlandInvoicing"
    "ServiceBusConnectionString"                       = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-servicebusqueue-connectionstring.name})"
    "EndPoints__ARInvoiceUpdatePrintFlag"              = "northstar-integration/erp/arinvoice/{0}"
    "EndPoints__ARCreditMemoUpdatePrintFlag"           = "northstar-integration/erp/updatecreditmemo"
    "AzureStorage__DevStorageAccountName"              = var.adf_blob_storage_account_name[local.environment]
    "EndPoints__NotificationTrigger"                   = "false"
    "EndPoints__SuccessNotificationTrigger"            = "true"
    "EndPoints__AzureBaseEnvironment"                  = var.env[local.environment]
    "DisableIntegration__IntegrationListToDisable"     = var.disableintegrationlist[local.environment]
    "EndPoints__ExceptionHandlingURI"                  = var.exceptionhandlinguri[local.environment]
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"              = true
    "AzureStorage__StorageAccountName"                 = azurerm_storage_account.sa.name
    "EndPoints__BASWARE_APIHOST"                       = var.baswareapihosturl[local.environment]
    "AuthenticationConfig__CLIENT_ID"                  = var.clientid[local.environment]
    "EndPoints__ARTransactionsXmlGenerator"            = var.artxmlgen[local.environment]
    "AppConfig__CleanupDateRange"                      = var.cleanupdaterange[local.environment]
    "WEBSITE_RUN_FROM_PACKAGE"                        = "1"
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"                 = true

      }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                              = var.alwayson[local.environment]
    http2_enabled                          = true
    ftps_state                             = "Disabled"
   // health_check_path                      = "/api/healthcheck"
    application_insights_key               = data.azurerm_application_insights.ai_ns_win.instrumentation_key
    application_insights_connection_string = data.azurerm_application_insights.ai_ns_win.connection_string
    use_32_bit_worker                      = false
    application_stack {
      dotnet_version                       = "v6.0"
      use_dotnet_isolated_runtime          = false
    }

    ip_restriction {
      virtual_network_subnet_id = azurerm_subnet.frontend_ns.id
    }

    cors {
      support_credentials = false
      allowed_origins     = ["*"]
    }
  }

    sticky_settings {
    app_setting_names = ["AzureWebJobs.SendDeadLetterAlert.Disabled"]
   }
   //depends_on      = [azurerm_key_vault_access_policy.acces_policy_function_app,data.azurerm_key_vault_secret.northstar-adf-storage-connection-string]
  lifecycle {
    ignore_changes = [ virtual_network_subnet_id ]
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegration_ns_win" {
  app_service_id = azurerm_windows_function_app.function_app_ns_win.id
  subnet_id      = azurerm_subnet.backend_ns.id
}

resource "azurerm_windows_function_app_slot" "app_slot_ns_win" {
  function_app_id             = azurerm_windows_function_app.function_app_ns_win.id
  name                        = "deploy"
  storage_account_name        = azurerm_storage_account.sa.name
  storage_account_access_key  = azurerm_storage_account.sa.primary_access_key
  https_only                  = true
  functions_extension_version = "~4"
  builtin_logging_enabled     = false
  app_settings                = merge(azurerm_windows_function_app.function_app_ns_win.app_settings, var.disabled_functions_ns_win)

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                              = var.alwayson[local.environment]
    http2_enabled                          = true
    ftps_state                             = "Disabled"
    //health_check_path                      = "/api/healthcheck"
    application_insights_key               = data.azurerm_application_insights.ai_ns_win.instrumentation_key
    application_insights_connection_string = data.azurerm_application_insights.ai_ns_win.connection_string
    
    application_stack {
      dotnet_version                       = "v6.0"
      use_dotnet_isolated_runtime          = false
    }

    cors {
      support_credentials = false
      allowed_origins     = ["*"]
    }

    ip_restriction {
      virtual_network_subnet_id = azurerm_subnet.frontend_ns.id
    }
  }
  lifecycle {
    ignore_changes = [ virtual_network_subnet_id ]
  }
}

resource "azurerm_app_service_slot_virtual_network_swift_connection" "slot_vnet_ns_win" {
  slot_name      = azurerm_windows_function_app_slot.app_slot_ns_win.name
  app_service_id = azurerm_windows_function_app.function_app_ns_win.id
  subnet_id      = azurerm_subnet.backend_ns.id
}

