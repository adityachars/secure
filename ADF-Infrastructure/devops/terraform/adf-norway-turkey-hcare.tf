locals{
  gpnorwayturkeyhcare = [{
      name   = "Environment"
      type   = "String"
      value  = var.gpenvironmenthcare[local.environment]
    },
    {
      name   = "BlobBaseUrl"
      type   = "String"
      value  = var.gpblobaseurl[local.environment]
    },
    {
      name   = "APIMBaseUrl"
      type   = "String"
      value  = var.gpapimbaseurl[local.environment]
    },
    {
      name   = "KeyVaultBaseUrl"
      type   = "String"
      value  = var.gpkeyvaluturl[local.environment]
    },
    {
      name   = "TenantId"
      type   = "String"
      value  = var.gptenantid[local.environment]
    },
    {
      name   = "ClientId"
      type   = "String"
      value  = var.gpclientid[local.environment]
    },
    {
      name   = "GrantType"
      type   = "String"
      value  = var.gpgranttype[local.environment]
    },
    {
      name   = "Scope"
      type   = "String"
      value  = var.gpscope[local.environment]
    },
    {
      name   = "OracleNotificationBaseUrl"
      type   = "String"
      value  = var.gporaclebaseurl[local.environment]
    },
    {
      name   = "OracleFusionUsername"
      type   = "String"
      value  = var.gporaclefusionname[local.environment]
    },
    {
      name   = "ERP_1207_Source_Path"
      type   = "String"
      value  = var.gperp1207sourcepath[local.environment]
    },
    {
      name   = "ERP_1207_Target_Path"
      type   = "String"
      value  = var.gperp1207targetpath[local.environment]
    },
    {
      name   = "EmailNotificationOn"
      type   = "String"
      value  = var.emailNotificationOn[local.environment]
    },
    {
      name   = "ERP_1097_Source_Path"
      type   = "String"
      value  = var.erp1097sourcepath[local.environment]
    },
    {
      name   = "ERP_1097_Target_Path"
      type   = "String"
      value  = var.erp1097targetpath[local.environment]
    },
    {
      name  = "ERP_1125_TargetPath"
      type  = "String"
      value = var.erp1125targetpath[local.environment]
    },
    {
      name  = "ERP_1146_Target_Path"
      type  = "String"
      value = var.erp1146targetpath[local.environment]
    },
    {
      name  = "AzureBaseEnvironment"
      type  = "String"
      value = var.azurebaseenvironmenthcare[local.environment]
    },
    {
      name  = "AzureEnvironmentPL"
      type  = "String"
      value = var.azureenvironmentplhcare[local.environment]
    },
    {
      name  = "AzureEnvironmentNO"
      type  = "String"
      value = var.azureenvironmentnohcare[local.environment]
    },
    {
      name  = "AzureEnvironmentTR"
      type  = "String"
      value = var.azureenvironmenttrhcare[local.environment]
    },
    {
      name   = "CommonApiEnvironmentIdentifier"
      type   = "String"
      value  = var.commonapienvironmentidentifierbau[local.environment]
    },
    {
      name   = "ERP_1106_LedgerName"
      type   = "String"
      value  = var.erp1106ledgername[local.environment]
    }
  ]
}

resource "azurerm_data_factory" "nshcareadf" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                = var.adfnorwayturkeynamehcare[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  identity {
    type = "SystemAssigned"
  }
  dynamic "vsts_configuration" {
    
    for_each = local.environment == "dev" ? [1] : []
    content {
      account_name    = "securitasglobalintegration"
      branch_name     = "develop"
      project_name    = "NorthStarIntegrations"
      repository_name = "Northstar-Poland-Norway-Turkey-adf-common-Hcare"
      root_folder     = "/"
      tenant_id       = data.azurerm_client_config.current.tenant_id
    }
  }

  dynamic "global_parameter" {
    for_each = local.gpnorwayturkeyhcare
    content {
      name        = global_parameter.value.name
      type        = global_parameter.value.type
      value       = global_parameter.value.value
    }
  } 
}
# resource "azurerm_management_lock" "northstaradf" {
#   name       = var.adfname[local.environment]
#   scope      = azurerm_data_factory.northstaradf.id
#   lock_level = "CanNotDelete"
#   notes      = "Locked because you are not authorized to delete"
# }

# resource "azurerm_data_factory_integration_runtime_self_hosted" "northstaradf" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                = "Northstar-common-self-hosted-runtime"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   data_factory_id = azurerm_data_factory.northstaradf.id
# }

# resource "azurerm_data_factory_integration_runtime_self_hosted" "northstaradfinternal" {
#   name                = "Northstar-common-internal-self-hosted-runtime-adf"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   data_factory_id = azurerm_data_factory.northstaradf.id
# }



