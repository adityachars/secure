variable "disabled_functions_ns" {
  type = map(string)
  default = {
    "AzureWebJobs.SendDeadLetterAlert.Disabled" = "1"
  }
}

data "azurerm_application_insights" "ai_ns"{
   name                = var.appins_name[local.environment]
   resource_group_name = data.azurerm_resource_group.rg.name
   //depends_on          = [module.appins]
}

resource "azurerm_service_plan" "service_plan_ns" {
  name                = "ns-service-plan-${local.environment}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = var.sku_name[local.environment].size
}

resource "azurerm_linux_function_app" "function_app_ns" {
  name                        = "ns-function-app-${local.environment}"
  resource_group_name         = data.azurerm_resource_group.rg.name
  location                    = data.azurerm_resource_group.rg.location
  storage_account_name        = azurerm_storage_account.sa.name
  storage_account_access_key  = azurerm_storage_account.sa.primary_access_key
  service_plan_id             = azurerm_service_plan.service_plan_ns.id
  https_only                  = true
  functions_extension_version = "~4"
  builtin_logging_enabled     = false

app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"                        = "1"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"             = true
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"                 = true
    "WEBSITE_ADD_SITENAME_BINDINGS_IN_APPHOST_CONFIG" = "1"
    "AzureWebJobsDisableHomepage"                     = true
    "Queue.QueueName"                                 = azurerm_servicebus_queue.squeue.name
    "Queue.QueueName.Create"                          = "northstar-sr-create-user"
    "Queue.QueueName.Update"                          = "northstar-sr-update-user"
    "Queue.QueueName.Delete"                          = "northstar-sr-delete-user"
    "LineItemMessageQueueName"                        = "northstar-erp-lineitem-message"
    "Queue.ServiceBusConnectionString"                = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-servicebusqueue-connectionstring.name})"
    "EndPoints__APIMHOST"                              = var.apimhosturl[local.environment]
    "EndPoints__ORACLE_HCM_EMPUPDATE_ATOMFEED_API"     = var.oraclehcmempupdateatomfeedapi[local.environment]
    "EndPoints__ORACLE_HCM_EMPASSIGNMENT_ATOMFEED_API" = var.oraclehcmempassignmentatomfeedapi[local.environment]
    "EndPoints__ORACLE_HCM_EMPTERMINATE_ATOMFEED_API"  = var.oraclehcmempterminateatomfeedapi[local.environment]
    "EndPoints__ORACLE_HCM_EMPNEWHIRE_ATOMFEED_API"    = var.oraclehcmempnewhiretomfeedapi[local.environment]
    "EndPoints__ORACLE_HCM_GETEMP_API"                 = var.oraclehcmgetempapi[local.environment]
    "EndPoints__ORACLE_HCM_GETWORKER_API"              = var.oraclehcmgetworkerapi[local.environment]
    "EndPoints__ORACLE_HCM_GETPUBLICWORKER_API"        = var.oraclehcmgetpublicworkerapi[local.environment]
    "EndPoints__ORACLE_HCM_GETPUBLICWORKER_USING_WORKERNUMBER_API" = var.oraclehcmgetpublicworkerusingworkernumberapi[local.environment]
    "EndPoints__ORACLE_HCM_GETLOCATION_API"            = var.oraclehcmgetlocationapi[local.environment]
    "EndPoints__ORACLE_HCM_GETUSERACCOUNT_API"         = var.oraclehcmgetuseraccountapi[local.environment]
    "EndPoints__ORACLE_HCM_GETMANAGERUSERACCOUNT_API"  = var.oraclehcmgetmanageruseraccountapi[local.environment]
    "EndPoints__ORACLE_HCM_GETSALARY_API"              = var.oraclehcmgetsalaryapi[local.environment]
    "EndPoints__ORACLE_HCM_GETADDRESS_API"             = var.oraclehcmgetaddressapi[local.environment]
    "EndPoints__ORACLE_HCM_GETPHONE_API"               = var.oraclehcmgetphoneapi[local.environment]
    "EndPoints__ORACLE_HCM_GETEXTERNALIDENTIFIERS_API" = var.oraclehcmgetexternalidentifiersapi[local.environment]
    "EndPoints__ORACLE_HCM_GETNATIONALIDENTIFIERS_API" = var.oraclehcmgetnationalidentifiersapi[local.environment]
    "EndPoints__ORACLE_HCM_GETCULTURE_API"             = var.oraclehcmgetcultureapi[local.environment]
    "EndPoints__SR_USERSYNC_CREATE"                    = "smartrecruiters/user-api/v201804/users"
    "EndPoints__SR_USERSYNC_ACTIVATE"                  = "smartrecruiters/user-api/v201804/users/{0}/activation"
    "EndPoints__SR_USERSYNC_GETUSERID"                 = "smartrecruiters/user-api/v201804/users?q={0}"
    "EndPoints__SR_USERSYNC_UPDATEUSER"                = "smartrecruiters/user-api/v201804/users/{0}"
    "EndPoints__SR_USERSYNC_DELETEUSER"                = "smartrecruiters/user-api/v201804/users/{0}/activation"
    "EndPoints__UPDATE_FINNISH_NUMBER"                 = var.updatefinnishnumber[local.environment]
    "EndPoints__UPDATE_PURCHASE"                       = var.updatepurchase[local.environment]
    "EndPoints__INVOICINGFEE_BIREPORT_ENDPOINT"        = var.invoicingfeebireportendpoint[local.environment]
    "EndPoints__INVOICINGFEE_CREATEADJUSTMENT"         = var.invoicingfeecreateadjustment[local.environment]
    "EndPoints__SalesOrder_CreateAttachment"           = var.salesordercreateattachment[local.environment]
    "EndPoints__PricelistChargeUpdateEndDateEndpoint"  = var.pricelistchargeupdateenddateendpoint[local.environment]
    "EndPoints__PricelistChargeCreateEndpoint"         = var.pricelistchargecreateendpoint[local.environment]
    "EndPoints__SubscriptionProductUpdateEndateEndpoint" = var.subscriptionproductupdateendateendpoint[local.environment]
    "EndPoints__SubscriptionProductcreateEndpoint"     = var.subscriptionproductcreateendpoint[local.environment]
    "AuthenticationConfig__TENANT_ID"                  = var.tenantid[local.environment]
    "AuthenticationConfig__CLIENT_ID"                  = var.clientid[local.environment]
    "AuthenticationConfig__AUDIENCE"                   = var.audience[local.environment]
    "AuthenticationConfig__NORTHSTARAUDIENCE"          = var.northstaraudience[local.environment]
    "KeyVault__VaultUri"                               = var.keyvaulturl[local.environment]
    "AzureStorage__StorageAccountName"                 = azurerm_storage_account.sa.name
    "AppConfig__ORACLE_ATOMFEED_TRIGGER_STARTDATE"     = var.atomfeedtriggerdate[local.environment]
    "StorageAccountKey"                                = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-storage-account-key.name})"
    "ScheduleTriggerTime_UserSync"                     = var.triggertimeusersync[local.environment]
    "ServiceBusConnectionString"                       = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-servicebusqueue-connectionstring.name})"
    "BlobName"                                         = "erp-container/PriceRevisions"
    "BlobContainerName"                                = "erp-container/PriceRevisions/{name}"
    "BlobStorageConnectionString"                      = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${data.azurerm_key_vault_secret.northstar-adf-storage-connection-string.name})"
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
    "Endpoints__GetAllHiredCandidates"                 = "smartrecruiters/candidates?limit={0}&status={1}&onboardingStatus={2}"
    "Endpoints__GetjobDetails"                         = "smartrecruiters/jobs/{0}"
    "Endpoints__GetCandidateDetails"                   = "smartrecruiters/candidates/{0}/jobs/{1}/properties"
    "EndPoints__Oracle_GetEmployeeAssignmenDFFDetails" = var.oraclegetemployeeassignmendffdetails[local.environment]
    "EndPoints__Oracle_UpdateOnboardingCordinator"     = var.oracleupdateonboardingcordinator[local.environment]
    "Endpoints__UpdateOnboardingStatus"                = "smartrecruiters/candidates/{0}/jobs/{1}/onboardingStatus"
    "EndPoints__Oracle_GetJobDetails"                  = var.oraclegetjobdetails[local.environment]
    "EndPoints__Oracle_GetPositionDetails"             = var.oraclegetpositiondetails[local.environment]
    "EndPoints__CreatePendingWorker"                   = var.creatependingworker[local.environment]
    "EndPoints__Oracle_GetPersonNumberUsingNationalId" = var.oraclegetpersonnumberusingnationalid[local.environment]
    "Endpoints__Oracle_GetAllURLS"                     = var.oraclegetallurls[local.environment]
    "Endpoints__Oracle_CreateWorkRelationships"        = var.oraclecreateworkrelationships[local.environment]
    "Endpoints__Oracle_UpdateEmployeeName"             = var.oracleupdateemployeename[local.environment]
    "Endpoints__Oracle_UpdateEmployeePhone"            = var.oracleupdateemployeephone[local.environment]
    "Endpoints__Oracle_UpdateEmployeeEmail"            = var.oracleupdateemployeeemail[local.environment]
    "Endpoints__Oracle_UpdateEmployeeAddress"          = var.oracleupdateemployeeaddress[local.environment]
    "ScheduleTriggerTime_OnboardingSync"               = var.triggertimeonboardingsync[local.environment]
    "AzureAppConfigurationConnectionstring"            = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${azurerm_key_vault_secret.northstar-azapp-configuration-connectionstring.name})"
    "EndPoints__MATCHINGORDERS_BASWARE_API"            = "/v1/matchingOrders"
    "EndPoints__MATCHINGORDERLINES_BASWARE_API"        = "/v1/matchingOrderLines"
    "EndPoints__LISTS_BASWARE_API"                     = "/v1/lists/"
    "EndPoints__ACCOUNTS_BASWARE_API"                  = "/v1/accounts/"
    "EndPoints__COSTCENTERS_BASWARE_API"               = "/v1/costCenters/"
    "Endpoints__SRGetJobProperties"                    = "smartrecruiters/configuration/job-properties"
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
    "SmartRecruitersToken"                             = "@Microsoft.KeyVault(VaultName=${data.azurerm_key_vault.key_vault.name};SecretName=${data.azurerm_key_vault_secret.northstar-smart-recruiters-access-token.name})"
    "AppConfig__PAYLOAD_LOGGING_ENABLED"               = var.payloadlog[local.environment]
    "ScheduleTriggerTime_HCM_1088_MasterListQualificationsTrigger" = var.hcm1088masterqualificationscheduler[local.environment]
    "ScheduleTriggerTime_HCM_1085_AbsenceDataTrigger"              = var.hcm1085absencedatascheduler[local.environment]
    "ScheduleTriggerTime_HCM_1086_EmployeeQualificationTrigger"    = var.hcm1086employeequalificationscheduler[local.environment]
    "EndPoints__GIP_UPDATE_ABSENCEDATA_API"              = var.gipupdateabsencedataapi[local.environment],
    "EndPoints__GIP_UPDATE_MASTERLISTQUALIFICATIONS_API" = var.gipupdatemasterqualificationsapi[local.environment],
    "EndPoints__GIP_UPDATE_EMPLOYEEQUALIFICATION_API"    = var.gipupdateemployeequalificationsapi[local.environment],
    "EndPoints__CreateOrderEndpoint"                     = "/api/v1/creditors/{0}/orders/add",
    "EndPoints__UpdateOrderEndpoint"                     = "/api/v1/creditors/{0}/orders/update",
    "Endpoints__UpdateOrderInBIReport"                   = var.updateorderinbireport[local.environment]
    "AppConfig__Oracle_AtomFeed_Trigger_PageSize"        = var.oracleatomfeedtriggerpagesize[local.environment]
    "EndPoints__Oracle_GetProposedUserPersonTypeId"      = var.getproposeduserpersontypeid[local.environment]
    "EndPoints__WEBAPI_GETEMP_ENDPOINT"                  = var.webapigettempendpoint[local.environment]
    "EndPoints__Oracle_GetEmployeeAssignmenDFFDetails"   = var.oraclegetemployeeassignmentdffdetails[local.environment]
    "EndPoints__Legislation_Code"                        = var.legislationcode[local.environment]
    "EndPoints__UPDATE_PRODUCT_DESCRIPTION"              = var.salesordersfororderhub[local.environment]
    "EndPoints__GetNewOrExistingProductWithBillLineDetails" = var.getneworexistingproductwithbilllinedetails[local.environment]
    "EndPoints__GetBillToDetails"                        = var.getbilltodetails[local.environment]
    "EndPoints__GetPriceListDetails"                     = var.getpricelistdetails[local.environment]
    "EndPoints__UploadSubCSVfilesInUCM"                  = var.uploadsubcsvfilesinucm[local.environment]
    "EndPoints__GetSubscriptionJobStatus"                = var.getsubscriptionjobstatus[local.environment]
    "EndPoints__RunSubscriptionUploadCSVJob"             = var.runsubscriptionuploadcsvjob[local.environment]
    "EndPoints__WebAPI_ERP_PriceRevisions1177"           = var.webapierppricerevisions1177[local.environment]
    "EndPoints__ActivateSubscription"                    = var.activatesubscription[local.environment]
    "EndPoints__PriceRevisionsSubscriptionReprice"       = var.pricerevisionssubscriptionreprice[local.environment]
    "EndPoints__NewSubscriptionProductDetails"           = var.newsubscriptionproductdetails[local.environment]
    "EndPoints__SubscriptionProductCloseEndpoint"        = var.subscriptionproductcloseendpoint[local.environment]
    "AzureStorage__DevStorageAccountName"                = var.adf_blob_storage_account_name[local.environment]
    "EndPoints__Triopsis_GetMileagedata"                 = var.triopsisgetmileagedata[local.environment]
    "Endpoints__GRS_SCHEDULE_EXPORT_API"                 = var.grsscheduleexport[local.environment]
    "AuthenticationConfig__GRS_CLIENT_ID"                = var.grsclientid[local.environment]
    "AuthenticationConfig__GRSAUDIENCE"                  = var.grsaudience[local.environment]
    "AuthenticationConfig__GIP_AUDIENCE_ID"              = var.gipaudience[local.environment]
    "EndPoints__OnboardingNationalIdentifier_Germany"    = var.nationalidentifiergermany[local.environment]
    "EndPoints__OnboardingNationalIdentifier_Finland"    = var.nationalidentifierfinland[local.environment]
    "EndPoints__PostPriceListItemToCpq"                  = var.postpricelistitemtocpq[local.environment]
    "EndPoints__PostCustomCostToCpq"                     = var.postcustomcosttocpq[local.environment]
    "EndPoints__PostLandedCostToCpq"                     = var.postlandedcosttocpq[local.environment]
    "EndPoints__PostFOBCostToCpq"                        = var.postfobcosttocpq[local.environment]
    "EndPoints__GetEximpProgress"                        = var.geteximprogres[local.environment]
    "EndPoints__CheckEXIMPStatus"                        = var.checkeximpstatus[local.environment]
    "EndPoints__CreateImportSlot"                        = var.createimportslot[local.environment]
    "EndPoints__UploadXMLOnSlot"                         = var.uploadxmlonslot[local.environment]
    "EndPoints__LaunchImport"                            = var.launchimport[local.environment]
    "EndPoints__CPQProductCostImport"                    = var.cpqproductcostimport[local.environment]
    "EndPoints__AzureEnvironmentPL"                      = var.envpl[local.environment]
    "EndPoints__AzureEnvironmentNO"                      = var.envno[local.environment]
    "EndPoints__AzureEnvironmentFI"                      = var.envfi[local.environment]
    "EndPoints__AzureEnvironmentTR"                      = var.envtr[local.environment]
    "EndPoints__AzureBaseEnvironment"                    = var.env[local.environment]
    "EndPoints__PostProductToCpq"                        = var.postprodtocpq[local.environment]
    "EndPoints__CPQCreateNewVersion"                     = var.cpqcreatenewversion[local.environment]
    "EndPoints__PostStrategicPriceMarkupToCpq"           = var.poststrategicpricemarkuptocpq[local.environment]
    "EndPoints__CountryIsoUsingBuName"                   = var.countryisousingbuname[local.environment]
    "EndPoints__LegislationCodeWithBuName"               = var.legislationcodewithbuname[local.environment]
    "EndPoints__CPQProductVersioning"                    = var.cpqproductversioning[local.environment]
    "AppConfig__CPQVersioningEnabled"                    = var.cpqversioningenabled[local.environment]
    "EndPoints__AzureEnvironmentDE"                      = var.env[local.environment]
    "EndPoints__AzureEnvironmentTS"                      = var.envtr[local.environment]
    "EndPoints__NorthstarEventGridTopic"                 = var.northstareventgridtopic[local.environment]
    "DnbBlobTriggerPath"                                 = "erp-container/DNB/CAMT53SourceFile"
    "ScheduleTriggerTime_ERP_1042_CPQProductImportTableCleanupTrigger" = var.erp1042cpqproductimporttablecleanupscheduler[local.environment]
    "ScheduleTriggerTime_ERP_1042_CPQProductVersioningTrigger"         = var.erp1042versioningscheduler[local.environment]
    "ScheduleTriggerTime_ERP_1151_ERPtoOKPFaillerRecordTrigger"  = var.erp1151faillerscheduler[local.environment]
    "EndPoints__UpdateOkPerintaPaymentStatus"            = var.updateokperintapaymentstatus[local.environment]
    "EndPoints__GetVersionProgressCheck"                 = var.getversionprogresscheck[local.environment]
    "EndPoints__LaunchFullTextIndex"                     = var.launchfulltextindex[local.environment]
    "EndPoints__LaunchCacheClear"                        = var.launchcacheclear[local.environment]
    "Endpoints__UnforceForcedObjects"                    = var.unforcedobjects[local.environment]
    "Endpoints__GraphAPI_BaseAddress"                    = var.graphapibaseaddress[local.environment]
    "AppConfig__VersionPrefix"                           = var.versionprefix[local.environment]
    "AppConfig__CleanupDateRange"                        = var.cleanupdaterange[local.environment]
    "AppConfig__RetryCount"                              = 3
    "AppConfig__WaitingTimeInSeconds"                    = 2
    "EndPoints__CLIENTINVOICESBASWARE_ENDPOINT"          = var.clientinvoicebasware[local.environment]
    "ScheduleTriggerTime_BaswareInvoice"                 = var.schedulebaswareinvoice[local.environment]
  }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                              = var.alwayson[local.environment]
    http2_enabled                          = true
    ftps_state                             = "Disabled"
   // health_check_path                      = "/api/healthcheck"
    application_insights_key               = data.azurerm_application_insights.ai_ns.instrumentation_key
    application_insights_connection_string = data.azurerm_application_insights.ai_ns.connection_string

    application_stack {
      dotnet_version                       = "6.0"
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

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegration_ns" {
  app_service_id = azurerm_linux_function_app.function_app_ns.id
  subnet_id      = azurerm_subnet.backend_ns.id
}

resource "azurerm_linux_function_app_slot" "app_slot_ns" {
  function_app_id             = azurerm_linux_function_app.function_app_ns.id
  name                        = "deploy"
  storage_account_name        = azurerm_storage_account.sa.name
  storage_account_access_key  = azurerm_storage_account.sa.primary_access_key
  https_only                  = true
  functions_extension_version = "~4"
  builtin_logging_enabled     = false
  app_settings                = merge(azurerm_linux_function_app.function_app_ns.app_settings, var.disabled_functions_ns)

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                              = var.alwayson[local.environment]
    http2_enabled                          = true
    ftps_state                             = "Disabled"
    //health_check_path                      = "/api/healthcheck"
    application_insights_key               = data.azurerm_application_insights.ai_ns.instrumentation_key
    application_insights_connection_string = data.azurerm_application_insights.ai_ns.connection_string

    application_stack {
      dotnet_version              = "6.0"
      use_dotnet_isolated_runtime = false
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

resource "azurerm_app_service_slot_virtual_network_swift_connection" "slot_vnet_ns" {
  slot_name      = azurerm_linux_function_app_slot.app_slot_ns.name
  app_service_id = azurerm_linux_function_app.function_app_ns.id
  subnet_id      = azurerm_subnet.backend_ns.id
}

