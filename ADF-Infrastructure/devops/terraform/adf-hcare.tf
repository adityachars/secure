locals{
  globalparamertshcare = [{
      name   = "Environment"
      type   = "String"
      value  = var.gpenvironmentbau[local.environment]
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
      value  = var.gporaclebaseurlbau[local.environment]
    },
    {
      name   = "OracleFusionUsername"
      type   = "String"
      value  = var.gporaclefusionnamebau[local.environment]
    },
    {
      name   = "SnowSFTPBasePath"
      type   = "String"
      value  = var.gpsnowsftppath[local.environment]
    },
    {
      name   = "MepcoPath_HCM_1009"
      type   = "String"
      value  = var.gpmepcohcm1009path[local.environment]
    },
    {
      name   = "MepcoPath_HCM_1094"
      type   = "String"
      value  = var.gpmepcohcm1094path[local.environment]
    },
    {
      name   = "MepcoPath_HCM_1095"
      type   = "String"
      value  = var.gpmepcohcm1095path[local.environment]
    },
    {
      name   = "MepcoPath_WFM_1015"
      type   = "String"
      value  = var.gpmepcowfm1015path[local.environment]
    },
    {
      name   = "MepcoPath_WFM_1025"
      type   = "String"
      value  = var.gpmepcoefm1025path[local.environment]
    },
    {
      name   = "MepcoPath_WFM_1029"
      type   = "String"
      value  = var.gpmepcoefm1029path[local.environment]
    },
    {
      name   = "MepcoPath_WFM_1030_1031_1032"
      type   = "String"
      value  = var.gpmepco10303132path[local.environment]
    },
    {
      name   = "MepcoPath_ERP_1019"
      type   = "String"
      value  = var.gpmepcoerp1019path[local.environment]
    },
    {
      name   = "MepcoPath_HCM_1049"
      type   = "String"
      value  = var.gpmepcohcm1049path[local.environment]
    },
    {
      name   = "MepcoPath_ERP_1047"
      type   = "String"
      value  = var.gpmepcohcm1047path[local.environment]
    },
    {
      name   = "GermanySFTPPathDatevOutbound"
      type   = "String"
      value  = var.grsftpdatevoutbound[local.environment]
    },
    {
      name   = "GermanySFTPPathDPP"
      type   = "String"
      value  = var.grsftpdpp[local.environment]
    },
     {
      name   = "GermanySFTPPathGroundStar"
      type   = "String"
      value  = var.grsftpgroundstar[local.environment]
    },
    {
      name   = "GermanySFTPPathDisponic"
      type   = "String"
      value  = var.grsftpdisponic[local.environment]
    },
    {
      name   = "GermanySFTPPathDatevInbound"
      type   = "String"
      value  = var.grsftpdatevinbound[local.environment]
    },
    {
      name   = "CommonApiEnvironmentIdentifier"
      type   = "String"
      value  = var.commonapienvironmentidentifierbau[local.environment]
    },
    {
      name   = "LMSSFTPPathEmpData"
      type   = "String"
      value  = var.lmssftppathempdata[local.environment]
    },
    {
      name   = "OrtechPath_WFM_1022"
      type   = "String"
      value  = var.ortechpathwfm1022[local.environment]
    },
    {
      name   = "ClientIdForOracleAPIs"
      type   = "String"
      value  = var.clientidfororacleapis[local.environment]
    },
    {
      name   = "GipScope"
      type   = "String"
      value  = var.gipscope[local.environment]
    },
    {
      name   = "WFMFilePathPayrollExport_1018"
      type   = "String"
      value  = var.wfmfilepathpayrollexport1018[local.environment]
    },
    {
      name   = "AFASFilePathBalanceImport_1033"
      type   = "String"
      value  = var.afasfilepathbalanceexport1033[local.environment]
    },
    {
      name   = "WFMGRS1014SRC"
      type   = "String"
      value  = var.wfmgrs1014src[local.environment]
    },
    {
      name   = "EmailNotificationOn"
      type   = "String"
      value  = var.emailNotificationOn[local.environment]
    },
    {
      name   = "NorthStarApiUri"
      type   = "String"
      value  = var.northstarapiurihcare[local.environment]
    },
    {
      name   = "WFM1001UBA"
      type   = "String"
      value  = var.gpwfm1001uba[local.environment]
    },
    {
      name   = "WFM1001UBA_Archive"
      type   = "String"
      value  = var.gpwfm1001ubaarchive[local.environment]
    },
    {
      name   = "WFM1014WaitTime"
      type   = "Int"
      value  = var.wfm1014waittime[local.environment]
    },
    {
      name   = "CommonOICApiEnvironmentIdentifier"
      type   = "String"
      value  = var.oicapienvironmentidentifierbau[local.environment]
    },
    {
      name   = "AzureToWFM_TriopsisFilePath_1021"
      type   = "String"
      value  = var.azuretowfmtriopsisfile[local.environment]
    },
    {
      name   = "WFMToAzure_TriopsisFilePath_1021"
      type   = "String"
      value  = var.wfmtoazuretriopsisfile[local.environment]
    },
    {
      name   = "WFM_1014_FileSharePath"
      type   = "String"
      value  = var.wfm1014filesharepath[local.environment]
    },
    {
      name   = "WFM_1021_FileSharePath"
      type   = "String"
      value  = var.wfm1021filesharepath[local.environment]
    },
    {
      name   = "WFM_1001_UBA_Archive"
      type   = "String"
      value  = var.wfm1001ubaarchive[local.environment]
    },
    {
      name   = "Mepco_UBA_1004 "
      type   = "String"
      value  = var.mepcouba1004[local.environment]
    },
    {
      name   = "Mepco_UBA_1004_Archive "
      type   = "String"
      value  = var.mepcouba1004archive[local.environment]
    },
    {
      name   = "ERP_1053_Nomentia_Target_Path"
      type   = "String"
      value  = var.nomentia1053[local.environment]
    },
    {
      name   = "ERP_1020_Nomentia_Source_Path"
      type   = "String"
      value  = var.nomentia1020[local.environment]
    },
    {
      name   = "ERP_1153_Nomentia_Source_Path"
      type   = "String"
      value  = var.nomentia1153source[local.environment]
    },
    {
      name   = "ERP_1094_SourcePath"
      type   = "String"
      value  = var.erp1094sourcepath[local.environment]
    },
    {
      name   = "ERP_1094_TargetPath"
      type   = "String"
      value  = var.erp1094targetpath[local.environment]
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
    }
  ]
}

resource "azurerm_data_factory" "northstarhcareadf" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                = var.hcareadfname[local.environment]
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
      repository_name = "Northstar.securitas.Adf.Hcare"
      root_folder     = "/"
      tenant_id       = data.azurerm_client_config.current.tenant_id
    }
  }

  dynamic "global_parameter" {
    for_each = local.globalparamertshcare
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



