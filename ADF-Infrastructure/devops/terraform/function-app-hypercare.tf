variable "disabled_functions_hcare" {
  type = map(string)
  default = {
    "AzureWebJobs.SendDeadLetterAlert.Disabled" = "1"
  }
}

data "azurerm_application_insights" "ai_hcare"{
   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
   name                = var.appins_namehcare[local.environment]
   resource_group_name = data.azurerm_resource_group.rg.name
   //depends_on          = [module.appins]
}

resource "azurerm_service_plan" "service_plan_hypercare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  name                = "northstar-service-plan-hcare-dfix${local.environment}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = var.sku_name[local.environment].size
}

resource "azurerm_linux_function_app" "function_app_hypercare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  name                        = "northstar-function-app-hcare-dfix${local.environment}"
  resource_group_name         = data.azurerm_resource_group.rg.name
  location                    = data.azurerm_resource_group.rg.location
  storage_account_name        = azurerm_storage_account.sa.name
  storage_account_access_key  = azurerm_storage_account.sa.primary_access_key
  service_plan_id             = azurerm_service_plan.service_plan_hypercare[count.index].id
  https_only                  = true
  functions_extension_version = "~4"
  builtin_logging_enabled     = false

app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"                        = "1"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"             = true
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"                 = true
    "WEBSITE_ADD_SITENAME_BINDINGS_IN_APPHOST_CONFIG" = "1"
    "AzureWebJobsDisableHomepage"                     = true
    "Queue.QueueName"                                 = azurerm_servicebus_queue.squeue_hcare[count.index].name
    "Queue.QueueName.Create"                          = "northstar-sr-create-user"
    "Queue.QueueName.Update"                          = "northstar-sr-update-user"
    "Queue.QueueName.Delete"                          = "northstar-sr-delete-user"
    "LineItemMessageQueueName"                        = "northstar-erp-lineitem-message"
    "Queue.ServiceBusConnectionString"                = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault_hcare.name};SecretName=${azurerm_key_vault_secret.northstar-servicebusqueue-connectionstring-hcare[count.index].name})"
    "EndPoints__APIMHOST"                              = var.apimhosturl[local.environment]
    "EndPoints__ORACLE_HCM_EMPUPDATE_ATOMFEED_API"     = var.oraclehcmempupdateatomfeedapihcare[local.environment]
    "EndPoints__ORACLE_HCM_EMPASSIGNMENT_ATOMFEED_API" = var.oraclehcmempassignmentatomfeedapihcare[local.environment]
    "EndPoints__ORACLE_HCM_EMPTERMINATE_ATOMFEED_API"  = var.oraclehcmempterminateatomfeedapihcare[local.environment]
    "EndPoints__ORACLE_HCM_EMPNEWHIRE_ATOMFEED_API"    = var.oraclehcmempnewhiretomfeedapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETEMP_API"                 = var.oraclehcmgetempapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETWORKER_API"              = var.oraclehcmgetworkerapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETPUBLICWORKER_API"        = var.oraclehcmgetpublicworkerapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETPUBLICWORKER_USING_WORKERNUMBER_API" = var.oraclehcmgetpublicworkerusingworkernumberapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETLOCATION_API"            = var.oraclehcmgetlocationapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETUSERACCOUNT_API"         = var.oraclehcmgetuseraccountapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETMANAGERUSERACCOUNT_API"  = var.oraclehcmgetmanageruseraccountapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETSALARY_API"              = var.oraclehcmgetsalaryapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETADDRESS_API"             = var.oraclehcmgetaddressapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETPHONE_API"               = var.oraclehcmgetphoneapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETEXTERNALIDENTIFIERS_API" = var.oraclehcmgetexternalidentifiersapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETNATIONALIDENTIFIERS_API" = var.oraclehcmgetnationalidentifiersapihcare[local.environment]
    "EndPoints__ORACLE_HCM_GETCULTURE_API"             = var.oraclehcmgetcultureapihcare[local.environment]
    "EndPoints__SR_USERSYNC_CREATE"                    = "${var.functionappconfigsrvalues[local.environment]}/user-api/v201804/users"
    "EndPoints__SR_USERSYNC_ACTIVATE"                  = "${var.functionappconfigsrvalues[local.environment]}/user-api/v201804/users/{0}/activation"
    "EndPoints__SR_USERSYNC_GETUSERID"                 = "${var.functionappconfigsrvalues[local.environment]}/user-api/v201804/users?q={0}"
    "EndPoints__SR_USERSYNC_UPDATEUSER"                = "${var.functionappconfigsrvalues[local.environment]}/user-api/v201804/users/{0}"
    "EndPoints__SR_USERSYNC_DELETEUSER"                = "${var.functionappconfigsrvalues[local.environment]}/user-api/v201804/users/{0}/activation"
    "EndPoints__UPDATE_FINNISH_NUMBER"                 = var.updatefinnishnumberhcare[local.environment]
    "EndPoints__UPDATE_PURCHASE"                       = var.updatepurchasehcare[local.environment]
    "EndPoints__INVOICINGFEE_BIREPORT_ENDPOINT"        = var.invoicingfeebireportendpointhcare[local.environment]
    "EndPoints__INVOICINGFEE_CREATEADJUSTMENT"         = var.invoicingfeecreateadjustmenthcare[local.environment]
    "EndPoints__SalesOrder_CreateAttachment"           = var.salesordercreateattachmenthcare[local.environment]
    "EndPoints__PricelistChargeUpdateEndDateEndpoint"  = var.pricelistchargeupdateenddateendpointhcare[local.environment]
    "EndPoints__PricelistChargeCreateEndpoint"         = var.pricelistchargecreateendpointhcare[local.environment]
    "EndPoints__SubscriptionProductUpdateEndateEndpoint" = var.subscriptionproductupdateendateendpointhcare[local.environment]
    "EndPoints__SubscriptionProductcreateEndpoint"     = var.subscriptionproductcreateendpointhcare[local.environment]
    "AuthenticationConfig__TENANT_ID"                  = var.tenantid[local.environment]
    "AuthenticationConfig__CLIENT_ID"                  = var.clientid[local.environment]
    "AuthenticationConfig__AUDIENCE"                   = var.audience[local.environment]
    "AuthenticationConfig__NORTHSTARAUDIENCE"          = var.northstaraudience[local.environment]
    "KeyVault__VaultUri"                               = var.keyvaulthcareurl[local.environment]
    "AzureStorage__StorageAccountName"                 = azurerm_storage_account.sa.name
    "AppConfig__ORACLE_ATOMFEED_TRIGGER_STARTDATE"     = var.atomfeedtriggerdate[local.environment]
    "StorageAccountKey"                                = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault_hcare.name};SecretName=${azurerm_key_vault_secret.northstar-storage-account-key-hcare[count.index].name})"
    "ScheduleTriggerTime_UserSync"                     = var.triggertimeusersync[local.environment]
    "ServiceBusConnectionString"                       = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault_hcare.name};SecretName=${azurerm_key_vault_secret.northstar-servicebusqueue-connectionstring-hcare[count.index].name})"
    "BlobName"                                         = "erp-container-bau/PriceRevisions"
    "BlobContainerName"                                = "erp-container-bau/PriceRevisions/{name}"
    "BlobStorageConnectionString"                      = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault_hcare.name};SecretName=${data.azurerm_key_vault_secret.northstar-adf-storage-connection-string-hcare[count.index].name})"
    "EndPoints__BASWARE_API_GENERIC_LISTG1"            = "/v1/lists/ACC_LIST_23"
    "EndPoints__BASWARE_API_GENERIC_LISTG2"            = "/v1/lists/ACC_LIST_24"
    "EndPoints__NotificationTrigger"                   = var.notificationtrigger[local.environment]
    "EndPoints__SuccessNotificationTrigger"            = "true"
    "EndPoints__ExceptionHandlingURI"                  = var.exceptionhandlinguri[local.environment]
    "AppConfig__Oracle_AtomFeed_Trigger_TimeDifference_InMinutes" = 30
    "AppConfig__SR_GetHiredCandidates_PageSize"        = var.limit[local.environment]
    "EndPoints__BASWARE_APIHOST"                       = var.baswareapihosturl[local.environment]
    "EndPoints__BASWARE_TOKEN_API"                     = var.baswaretokenapi[local.environment]
    "EndPoints__AzureEnvironment"                      = var.env[local.environment]
    "Endpoints__GetAllHiredCandidates"                 = "${var.functionappconfigsrvalues[local.environment]}/candidates?limit={0}&status={1}&onboardingStatus={2}"
    "Endpoints__GetjobDetails"                         = "${var.functionappconfigsrvalues[local.environment]}/jobs/{0}"
    "Endpoints__GetCandidateDetails"                   = "${var.functionappconfigsrvalues[local.environment]}/candidates/{0}/jobs/{1}/properties"
    "EndPoints__Oracle_GetEmployeeAssignmenDFFDetails" = var.oraclegetemployeeassignmendffdetailshcare[local.environment]
    "EndPoints__Oracle_UpdateOnboardingCordinator"     = var.oracleupdateonboardingcordinatorhcare[local.environment]
    "Endpoints__UpdateOnboardingStatus"                = "${var.functionappconfigsrvalues[local.environment]}/candidates/{0}/jobs/{1}/onboardingStatus"
    "EndPoints__Oracle_GetJobDetails"                  = var.oraclegetjobdetailshcare[local.environment]
    "EndPoints__Oracle_GetPositionDetails"             = var.oraclegetpositiondetailshcare[local.environment]
    "EndPoints__CreatePendingWorker"                   = var.creatependingworkerhcare[local.environment]
    "EndPoints__Oracle_GetPersonNumberUsingNationalId" = var.oraclegetpersonnumberusingnationalidhcare[local.environment]
    "Endpoints__Oracle_GetAllURLS"                     = var.oraclegetallurlshcare[local.environment]
    "Endpoints__Oracle_CreateWorkRelationships"        = var.oraclecreateworkrelationshipshcare[local.environment]
    "Endpoints__Oracle_UpdateEmployeeName"             = var.oracleupdateemployeenamehcare[local.environment]
    "Endpoints__Oracle_UpdateEmployeePhone"            = var.oracleupdateemployeephonehcare[local.environment]
    "Endpoints__Oracle_UpdateEmployeeEmail"            = var.oracleupdateemployeeemailhcare[local.environment]
    "Endpoints__Oracle_UpdateEmployeeAddress"          = var.oracleupdateemployeeaddresshcare[local.environment]
    "ScheduleTriggerTime_OnboardingSync"               = var.triggertimeonboardingsync[local.environment]
    "AzureAppConfigurationConnectionstring"            = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault_hcare.name};SecretName=${azurerm_key_vault_secret.northstar-azapp-configuration-connectionstring-hcare[count.index].name})"
    "EndPoints__MATCHINGORDERS_BASWARE_API"            = "/v1/matchingOrders"
    "EndPoints__MATCHINGORDERLINES_BASWARE_API"        = "/v1/matchingOrderLines"
    "EndPoints__LISTS_BASWARE_API"                     = "/v1/lists/"
    "EndPoints__ACCOUNTS_BASWARE_API"                  = "/v1/accounts/"
    "EndPoints__COSTCENTERS_BASWARE_API"               = "/v1/costCenters/"
    "Endpoints__SRGetJobProperties"                    = "${var.functionappconfigsrvalues[local.environment]}/configuration/job-properties"
    "Endpoints__SRGetJobPropertyEntityId"              = "configuration/job-properties/{0}/values"
    "Endpoints__CreateJobProperty"                     = "configuration/job-properties/{0}/values"
    "Endpoints__UpdateJobProperty"                     = "configuration/job-properties/{0}/values/{1}"
    "Endpoints__ArchiveJobProperty"                    = "configuration/job-properties/{0}/archive-values/{1}"
    "Endpoints__UnarchiveJobProperty"                  = "configuration/job-properties/{0}/archive-values/{1}"
    "Endpoints__SRPostDependency"                      = "configuration/job-properties/{0}/values/{1}/dependents/{2}/values"
    "DisableIntegration__IntegrationListToDisable"     = var.disableintegrationlist[local.environment]
    "ScheduleTriggerTime_HCM_1035_EmployeeDataTrigger" = var.triggertimeusersync[local.environment]
    "ScheduleTriggerTime_DependencySync"               = var.triggertimedependencysync[local.environment]
    "SmartRecruitersBaseUrl"                           = "https://api.smartrecruiters.com/"
    "SmartRecruitersToken"                             = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault_hcare.name};SecretName=${data.azurerm_key_vault_secret.northstar-smart-recruiters-access-token-hcare[count.index].name})"
    "AppConfig__PAYLOAD_LOGGING_ENABLED"               = var.payloadlog[local.environment]
    "ScheduleTriggerTime_HCM_1088_MasterListQualificationsTrigger" = var.hcm1088masterqualificationscheduler[local.environment]
    "ScheduleTriggerTime_HCM_1085_AbsenceDataTrigger"              = var.hcm1085absencedatascheduler[local.environment]
    "ScheduleTriggerTime_HCM_1086_EmployeeQualificationTrigger"    = var.hcm1086employeequalificationscheduler[local.environment]
    "EndPoints__GIP_UPDATE_ABSENCEDATA_API"              = var.gipupdateabsencedataapihcare[local.environment],
    "EndPoints__GIP_UPDATE_MASTERLISTQUALIFICATIONS_API" = var.gipupdatemasterqualificationsapihcare[local.environment],
    "EndPoints__GIP_UPDATE_EMPLOYEEQUALIFICATION_API"    = var.gipupdateemployeequalificationsapihcare[local.environment],
    "EndPoints__CreateOrderEndpoint"                     = "/api/v1/creditors/{0}/orders/add",
    "EndPoints__UpdateOrderEndpoint"                     = "/api/v1/creditors/{0}/orders/update",
    "Endpoints__UpdateOkPerintaPaymentStatus"            = var.updateokperintapaymentstatushcare[local.environment]
    "Endpoints__UpdateOrderInBIReport"                   = var.updateorderinbireporthcare[local.environment]
    "AppConfig__Oracle_AtomFeed_Trigger_PageSize"        = var.oracleatomfeedtriggerpagesize[local.environment]
    "EndPoints__Oracle_GetProposedUserPersonTypeId"      = var.getproposeduserpersontypeidhcare[local.environment]
    "EndPoints__WEBAPI_GETEMP_ENDPOINT"                  = var.webapigettempendpointhcare[local.environment]
    "EndPoints__Oracle_GetEmployeeAssignmenDFFDetails"   = var.oraclegetemployeeassignmentdffdetailshcare[local.environment]
    "EndPoints__Legislation_Code"                        = var.legislationcodehcare[local.environment]
    "EndPoints__UPDATE_PRODUCT_DESCRIPTION"              = var.salesordersfororderhubhcare[local.environment]
    "EndPoints__GetNewOrExistingProductWithBillLineDetails" = var.getneworexistingproductwithbilllinedetailshcare[local.environment]
    "EndPoints__GetBillToDetails"                        = var.getbilltodetailshcare[local.environment]
    "EndPoints__GetPriceListDetails"                     = var.getpricelistdetailshcare[local.environment]
    "EndPoints__UploadSubCSVfilesInUCM"                  = var.uploadsubcsvfilesinucmhcare[local.environment]
    "EndPoints__GetSubscriptionJobStatus"                = var.getsubscriptionjobstatushcare[local.environment]
    "EndPoints__RunSubscriptionUploadCSVJob"             = var.runsubscriptionuploadcsvjobhcare[local.environment]
    "EndPoints__WebAPI_ERP_PriceRevisions1177"           = var.webapierppricerevisions1177hcare[local.environment]
    "EndPoints__ActivateSubscription"                    = var.activatesubscriptionhcare[local.environment]
    "EndPoints__PriceRevisionsSubscriptionReprice"       = var.pricerevisionssubscriptionrepricehcare[local.environment]
    "EndPoints__NewSubscriptionProductDetails"           = var.newsubscriptionproductdetailshcare[local.environment]
    "EndPoints__SubscriptionProductCloseEndpoint"        = var.subscriptionproductcloseendpointhcare[local.environment]
    "AzureStorage__DevStorageAccountName"                = var.adf_blob_storage_account_name[local.environment]
    "EndPoints__Triopsis_GetMileagedata"                 = var.triopsisgetmileagedata[local.environment]
    "Endpoints__GRS_SCHEDULE_EXPORT_API"                 = var.grsscheduleexport[local.environment]
    "AuthenticationConfig__GRS_CLIENT_ID"                = var.grsclientid[local.environment]
    "AuthenticationConfig__GRSAUDIENCE"                  = var.grsaudience[local.environment]
    "AuthenticationConfig__GIP_AUDIENCE_ID"              = var.gipaudience[local.environment]
    "EndPoints__OnboardingNationalIdentifier_Germany"    = var.nationalidentifiergermany[local.environment]
    "EndPoints__OnboardingNationalIdentifier_Finland"    = var.nationalidentifierfinland[local.environment]
    "EndPoints__PostPriceListItemToCpq"                  = var.postpricelistitemtocpqhcare[local.environment]
    "EndPoints__PostCustomCostToCpq"                     = var.postcustomcosttocpqhcare[local.environment]
    "EndPoints__PostLandedCostToCpq"                     = var.postlandedcosttocpqhcare[local.environment]
    "EndPoints__PostFOBCostToCpq"                        = var.postfobcosttocpqhcare[local.environment]
    "EndPoints__GetEximpProgress"                        = var.geteximprogreshcare[local.environment]
    "EndPoints__CheckEXIMPStatus"                        = var.checkeximpstatushcare[local.environment]
    "EndPoints__CreateImportSlot"                        = var.createimportslothcare[local.environment]
    "EndPoints__UploadXMLOnSlot"                         = var.uploadxmlonslothcare[local.environment]
    "EndPoints__LaunchImport"                            = var.launchimporthcare[local.environment]
    "EndPoints__CPQProductCostImport"                    = var.cpqproductcostimporthcare[local.environment]
    "EndPoints__AzureEnvironmentPL"                      = var.envplhcare[local.environment]
    "EndPoints__AzureEnvironmentNO"                      = var.envnohcare[local.environment]
    "EndPoints__AzureEnvironmentFI"                      = var.envfihcare[local.environment]
    "EndPoints__AzureEnvironmentTR"                      = var.envtrhcare[local.environment]
    "EndPoints__AzureBaseEnvironment"                    = var.envhcare[local.environment]
    "EndPoints__PostProductToCpq"                        = var.postprodtocpqhcare[local.environment]
    "EndPoints__CPQCreateNewVersion"                     = var.cpqcreatenewversionhcare[local.environment]
    "EndPoints__PostStrategicPriceMarkupToCpq"           = var.poststrategicpricemarkuptocpqhcare[local.environment]
    "EndPoints__CountryIsoUsingBuName"                   = var.countryisousingbunamehcare[local.environment]
    "EndPoints__LegislationCodeWithBuName"               = var.legislationcodewithbunamehcare[local.environment]
    "EndPoints__CPQProductVersioning"                    = var.cpqproductversioninghcare[local.environment]
    "AppConfig__CPQVersioningEnabled"                    = var.cpqversioningenabled[local.environment]
    "EndPoints__AzureEnvironmentDE"                      = var.envhcare[local.environment]
    "EndPoints__NorthstarEventGridTopic"                 = var.northstareventgridtopichcare[local.environment]
    "DnbBlobTriggerPath"                                 = "erp-container-bau/DNB/CAMT53SourceFile"
    "ScheduleTriggerTime_ERP_1042_CPQProductImportTableCleanupTrigger" = var.erp1042cpqproductimporttablecleanupscheduler[local.environment]
    "ScheduleTriggerTime_ERP_1042_CPQProductVersioningTrigger"         = var.erp1042versioningscheduler[local.environment]
    "ScheduleTriggerTime_ERP_1151_ERPtoOKPFaillerRecordTrigger"  = var.erp1151faillerscheduler[local.environment]
    "EndPoints__GetVersionProgressCheck"                 = var.getversionprogresscheckhcare[local.environment]
    "EndPoints__LaunchFullTextIndex"                     = var.launchfulltextindexhcare[local.environment]
    "EndPoints__LaunchCacheClear"                        = var.launchcacheclearhcare[local.environment]
    "Endpoints__UnforceForcedObjects"                    = var.unforcedobjectshcare[local.environment]
    "Endpoints__GraphAPI_BaseAddress"                    = var.graphapibaseaddresshcare[local.environment]
    "AppConfig__VersionPrefix"                           = var.versionprefixhcare[local.environment]
    "AppConfig__CleanupDateRange"                        = var.cleanupdaterange[local.environment]
    "EndPoints__CLIENTINVOICESBASWARE_ENDPOINT"          = var.clientinvoicebaswarehcare[local.environment]
    "ScheduleTriggerTime_BaswareInvoice"                 = var.schedulebaswareinvoicehcare[local.environment]
  }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                              = var.alwayson[local.environment]
    http2_enabled                          = true
    ftps_state                             = "Disabled"
   // health_check_path                      = "/api/healthcheck"
    application_insights_key               = data.azurerm_application_insights.ai_hcare[count.index].instrumentation_key
    application_insights_connection_string = data.azurerm_application_insights.ai_hcare[count.index].connection_string

    application_stack {
      dotnet_version                       = "6.0"
      use_dotnet_isolated_runtime          = false
    }

    ip_restriction {
      virtual_network_subnet_id = azurerm_subnet.frontend.id
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

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegration_hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  app_service_id = azurerm_linux_function_app.function_app_hypercare[count.index].id
  subnet_id      = azurerm_subnet.backend.id
}

resource "azurerm_linux_function_app_slot" "app_slot_hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  function_app_id             = azurerm_linux_function_app.function_app_hypercare[count.index].id
  name                        = "deploy"
  storage_account_name        = azurerm_storage_account.sa.name
  storage_account_access_key  = azurerm_storage_account.sa.primary_access_key
  https_only                  = true
  functions_extension_version = "~4"
  builtin_logging_enabled     = false
  app_settings                = merge(azurerm_linux_function_app.function_app_hypercare[count.index].app_settings, var.disabled_functions_hcare)

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                              = var.alwayson[local.environment]
    http2_enabled                          = true
    ftps_state                             = "Disabled"
    //health_check_path                      = "/api/healthcheck"
    application_insights_key               = data.azurerm_application_insights.ai_hcare[count.index].instrumentation_key
    application_insights_connection_string = data.azurerm_application_insights.ai_hcare[count.index].connection_string

    application_stack {
      dotnet_version              = "6.0"
      use_dotnet_isolated_runtime = false
    }

    cors {
      support_credentials = false
      allowed_origins     = ["*"]
    }

    ip_restriction {
      virtual_network_subnet_id = azurerm_subnet.frontend.id
    }
  }
  lifecycle {
    ignore_changes = [ virtual_network_subnet_id ]
  }
}

resource "azurerm_app_service_slot_virtual_network_swift_connection" "slot_vnet_hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  slot_name      = azurerm_linux_function_app_slot.app_slot_hcare[count.index].name
  app_service_id = azurerm_linux_function_app.function_app_hypercare[count.index].id
  subnet_id      = azurerm_subnet.backend.id
}

