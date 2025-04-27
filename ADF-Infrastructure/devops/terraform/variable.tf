variable "resource_group" {
  type = map(string)
  default = {
    //Lab  = "RGAZ-SSEU-CIP-AKS-Lab"
    dev  = "RGAZ-SSEU-CIP-AKS-Dev"
    test = "RGAZ-SSEU-CIP-AKS-Test"
    uat  = "RGAZ-SSEU-CIP-AKS-Test"
    prod = "RGAZ-SSEU-CIP-AKS-Prod"
  }
}

variable "appins_name" {
  type = map(string)
  default = {
    //Lab  = "appins-lab"
    dev  = "Northstarcommon-dev"
    test = "Northstarcommon-test"
    uat  = "Northstarcommon-uat"
    prod = "Northstarcommon-prod"
  }
}

variable "appins_namehcare" {
  type = map(string)
  default = {
    //Lab  = "appins-lab"
    dev  = "northstar-AppInsights-Hypercare-Dev"
    test = "Northstarcommon-test"
    uat  = "northstar-appinsights-hcare-uat"
    prod = "Northstarcommon-prod"
  }
}
variable "api_app_configurations_name" {
  type = map(string)
  default = {
    dev  = "northstar-app-configurations-dev"
    test = "northstar-app-configurations-test"
    uat  = "northstar-app-configurations-uat"
    prod = "northstar-app-configurations-prod"
  }
}

variable "keyvalutname"{
   type = map(string)
   default = {
    dev  = "kv-cip-k8s-dev"
    test = "kv-cip-k8s-test"
    uat  = "KV-k8s-uat"
    prod = "KV-cip-k8s-prod"
  }
}

variable "apimhosturl" {
  type = map(string)
  default = {
    dev  = "https://api.dev.ei.securitas.net/"
    test = "https://api.test.ei.securitas.net/"
    uat  = "https://api.uat.ei.securitas.net/"
    prod = "https://api.ei.securitas.net/"
  }
}

variable "keyvaulturl" {
  type = map(string)
  default = {
    dev  = "https://kv-cip-k8s-dev.vault.azure.net/"
    test = "https://kv-cip-k8s-test.vault.azure.net/"
    uat  = "https://KV-k8s-uat.vault.azure.net/"
    prod = "https://KV-cip-k8s-prod.vault.azure.net/"
  }
}

variable "tenantid" {
  type = map(string)
  default = {
    dev  = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
    test = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
    uat  = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
    prod = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
  }
}

variable "clientid" {
  type = map(string)
  default = {
    dev  = "3bb39707-c6b9-4214-b803-786c58fa49b5"
    test = "3bb39707-c6b9-4214-b803-786c58fa49b5"
    uat  = "3bb39707-c6b9-4214-b803-786c58fa49b5"
    prod = "578224ab-651d-4037-8ffc-41fcda735027"
  }
}

variable "audience" {
  type = map(string)
  default = {
    dev  = "api://gip-events"
    test = "api://gip-events"
    uat  = "api://gip-events"
    prod = "api://gip"
  }
}

variable "northstaraudience" {
  type = map(string)
  default = {
    dev  = "api://northstarAPIs"
    test = "api://northstarAPIs"
    uat  = "api://northstarAPIs"
    prod = "api://northstarAPIs-prod"
  }
}

variable "atomfeedtriggerdate" {
  type = map(string)
  default = {
    dev  = "DateTime.UtcNow"
    test = "DateTime.UtcNow"
    uat  = "DateTime.UtcNow"
    prod = "DateTime.UtcNow"
  }
}

variable "triggertimeusersync" {
  type = map(string)
  default = {
    dev  = "0 */30 * * * *"
    test = "0 */30 * * * *"
    uat  = "0 */5 * * * *"
    prod = "0 */30 * * * *"
  }
}

variable "triggertimeonboardingsync" {
  type = map(string)
  default = {
    dev  = "0 */30 * * * *"
    test = "0 */30 * * * *"
    uat  = "0 */5 * * * *"
    prod = "0 */30 * * * *"
  }
}

variable "triggertimedependencysync" {
  type = map(string)
  default = {
    dev  = "0 */30 * * * *"
    test = "0 */30 * * * *"
    uat  = "0 */30 * * * *"
    prod = "0 0 * * * *"
  }
}

variable "sku" {
  type = map(string)
  default = {
    dev  = "Standard"
    test = "Premium"
    uat  = "Premium"
    prod = "Premium"
  }
}

variable "capacity"{
  type = map(string)
  default = {
    dev  = 0
    test = 1
    uat  = 1
    prod = 1
  }
}

# valid options: Standard,Premium
variable "account_tier" {
  type = map(string)
  default = {
    dev  = "Standard"
    test = "Standard"
    uat  = "Standard"
    prod = "Standard"
  }
}

variable "sku_name" {
  type = map(object({ tier : string, size : string, capacity : number }))
  default = {
    dev  = { tier : "PremiumV2", size : "P2v2", capacity : 1 }
    test = { tier : "PremiumV2", size : "P1v3", capacity : 3 }
    uat  = { tier : "PremiumV2", size : "P1v3", capacity : 3 }
    prod = { tier : "PremiumV2", size : "P1v3", capacity : 3 }
  }
}

variable "sku_name_win" {
  type = map(object({ tier : string, size : string, capacity : number }))
  default = {
    dev  = { tier : "PremiumV2", size : "P1v3", capacity : 3 }
    test = { tier : "PremiumV2", size : "P1v3", capacity : 3 }
    uat  = { tier : "PremiumV2", size : "P1v3", capacity : 3 }
    prod = { tier : "PremiumV2", size : "P1v3", capacity : 3 }
  }
}

variable "alwayson" {
type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "true"
  }
}

variable "env" {
type = map(string)
  default = {
    dev  = "DEV"
    test = "SIT"
    uat  = "UAT"
    prod = "PROD"
  }
}

variable "notificationtrigger"{
  type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "true"
  }
}

variable "hcm1003schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "hcm1103schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "hcm1035schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "hcm1105schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "hcm1026schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "disableintegrationlist"{
  type = map(string)
  default = {
    dev  = "1032,1098"
    test = "1032,1098"
    uat  = "xxxx,xxxx"
    prod = "1032,1098"
  }
}

variable "appdisableintegrationlist"{
  type = map(string)
  default = {
    dev  = "xxxx"
    test = "xxxx"
    uat  = "xxxx"
    prod = "xxxx"
  }
}

variable "erp1142deliverydateschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1135inventoryschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1149itembasepricey3ktrschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1133productschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1011technicianactualhoursschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1119exchangeratesschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1144projectactualschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1156finnishreferenceschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1188invoicingschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1157paymentfileinboundschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

# variable "erp10341071contractoutboundschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "false"
#   }
# }

variable "erp103410711125ficontractoutboundschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp103410711125plcontractoutboundschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp103410711125nocontractoutboundschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp103410711125trcontractoutboundschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

# variable "erp1159supplieroutboundschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

variable "erp1159supplieroutboundschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1159supplieroutboundschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

# variable "erp1187paymentstatusoutboundschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

variable "erp1187paymentstatusoutboundschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1187paymentstatusoutboundschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

# variable "erp1163projectoutboundschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

# variable "erp1164accountschedulerenabled"{ 
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

variable "erp1111trackingnumberschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1066customsbrokerschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1124licenseserverschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1226invoicedffschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "reademailschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringfinlandenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringpolandenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnorwayenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringturkeyenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnetherlandsenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringgermanyenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringprodenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringhypercareuatenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringtestenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringdevenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringtrwave2uatenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringtrwave2devenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringhypercaredevenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnowave2uatenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnowave2devenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringfailurereasonenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1216custombrokerinvoiceschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1026cleanupschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "true"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1227ewaybillschedulerenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1209kredinorpayupdateenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

# variable "erp1164contratsiteschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

# variable "erp1164departmentschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

# variable "erp1164genericaccountschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

# variable "erp1164genericdepartmentschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

# variable "erp1164typeofcostschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

# variable "erp1164typeofserviceschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }


variable "erp1164accountschedulerfienabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164contratsiteschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164departmentschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164genericaccountschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164genericdepartmentschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164typeofcostschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164typeofserviceschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}


variable "erp1164accountschedulernoenabled"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164contratsiteschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164departmentschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164genericaccountschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164genericdepartmentschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164typeofcostschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1164typeofserviceschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

# variable "erp1160purchaseorderschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

variable "erp1160purchaseorderschedulerfienabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1160purchaseorderschedulernoenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1003supplierinvoiceschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erptookperintaschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "hcm1107schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "baswareapihosturl"{
  type = map(string)
  default = {
    dev  = "https://test-api.basware.com"
    test = "https://test-api.basware.com"
    uat  = "https://test-api.basware.com"
    prod = "https://api.basware.com"
  }
}

variable "baswaretokenapi"{
  type = map(string)
  default = {
    dev  = "https://test-api.basware.com/v1/tokens"
    test = "https://test-api.basware.com/v1/tokens"
    uat  = "https://test-api.basware.com/v1/tokens"
    prod = "https://api.basware.com/v1/tokens"
  }
}

variable "okperintaapihost"{
  type = map(string)
  default = {
    dev  = "https://testapi.okperinta.fi"
    test = "https://testapi.okperinta.fi"
    uat  = "https://testapi.okperinta.fi"
    prod = "https://api.okperinta.fi"
  }
}

variable "exceptionhandlinguri"{
  type = map(string)
  default = {
    dev  = "https://sec-sit-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
    test = "https://sec-dev-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
    uat  = "https://sec-prog-uat-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
    prod = "https://sec-prod-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
  }
}

variable "hcareexceptionhandlinguri"{
  type = map(string)
  default = {
    dev  = "https://sec-test-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
    test = "https://sec-dev-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
    uat  = "https://sec-uat-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
    prod = "https://sec-prod-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com/ic/api/integration/v1/flows/rest/COMMON_LOG_AND_NOTIFY/1.0/postLogAndNotifyErrors"
  }
}

variable "endpointsnotificationtrigger"{
  type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "true"
  }
}

variable "successnotificationtrigger"{
  type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "true"
  }
}

variable "listofholidaysforwfmgrs"{
  type = map(string)
  default = {
    dev  = "25-12,26-12,01-01"
    test = "25-12,26-12,01-01"
    uat  = "25-12,26-12,01-01"
    prod = "25-12,26-12,01-01"
  }
}

variable "erp1026archivetrigger"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "standardprefix"{
  type = map(string)
  default = {
    dev  = "OKPerintaAPI"
    test = "OKPerintaAPI"
    uat  = "OKPerintaAPI"
    prod = "OKPerintaAPI"
  }
}

variable "erp1163bireportduration"{
  type = map(string)
  default = {
    dev  = "1440"
    test = "1440"
    uat  = "10"
    prod = "1440"
  }
}

variable "erp1144bireportduration"{
  type = map(string)
  default = {
    dev  = "30"
    test = "30"
    uat  = "30"
    prod = "1440"
  }
}

variable "erp1188bireportduration"{
  type = map(string)
  default = {
    dev  = "xxxx"
    test = "30"
    uat  = "30"
    prod = "30"
  }
}

variable "erp1142bireportduration"{
  type = map(string)
  default = {
    dev  = "30"
    test = "30"
    uat  = "30"
    prod = "30"
  }
}

variable "erp1135bireportduration"{
  type = map(string)
  default = {
    dev  = "30"
    test = "30"
    uat  = "30"
    prod = "30"
  }
}

variable "erp1149bireportduration"{
  type = map(string)
  default = {
    dev  = "35"
    test = "15"
    uat  = "30"
    prod = "30"
  }
}

variable "erp1133bireportduration"{
  type = map(string)
  default = {
    dev  = "30"
    test = "15"
    uat  = "30"
    prod = "30"
  }
}

variable "erp10341071bireportduration"{
  type = map(string)
  default = {
    dev  = "30"
    test = "30"
    uat  = "30"
    prod = "30"
  }
}

variable "erp103410711125bireportduration"{
  type = map(string)
  default = {
    dev  = "30"
    test = "10"
    uat  = "30"
    prod = "30"
  }
}

variable "erp1159bireportduration"{
  type = map(string)
  default = {
    dev  = "10"
    test = "10"
    uat  = "10"
    prod = "10"
  }
}

variable "erp1187bireportduration"{
  type = map(string)
  default = {
    dev  = "10"
    test = "10"
    uat  = "10"
    prod = "10"
  }
}

variable "erp1156bireportduration"{
  type = map(string)
  default = {
    dev  = "xxxx"
    test = "30"
    uat  = "1440"
    prod = "30"
  }
}

variable "erp1160bireportduration"{
  type = map(string)
  default = {
    dev  = "10"
    test = "10"
    uat  = "10"
    prod = "10"
  }
}

variable "erp1164accountbireportduration"{
  type = map(string)
  default = {
    dev  = "480"
    test = "480"
    uat  = "480"
    prod = "480"
  }
}

variable "erp1164contrasitebireportduration"{
  type = map(string)
  default = {
    dev  = "10"
    test = "10"
    uat  = "10"
    prod = "10"
  }
}

variable "erp1164departmentbireportduration"{
  type = map(string)
  default = {
    dev  = "480"
    test = "480"
    uat  = "480"
    prod = "480"
  }
}

variable "erp1164genericaccountbireportduration"{
  type = map(string)
  default = {
    dev  = "480"
    test = "480"
    uat  = "480"
    prod = "480"
  }
}

variable "erp1164genericdepartmentbireportduration"{
  type = map(string)
  default = {
    dev  = "480"
    test = "480"
    uat  = "480"
    prod = "480"
  }
}

variable "erp1164typeofcostbireportduration"{
  type = map(string)
  default = {
    dev  = "480"
    test = "480"
    uat  = "480"
    prod = "480"
  }
}

variable "erp1164typeofservicebireportduration"{
  type = map(string)
  default = {
    dev  = "480"
    test = "480"
    uat  = "480"
    prod = "480"
  }
}

variable "erp1119exchangeratedatacount"{
  type = map(string)
  default = {
    dev  = "4"
    test = "4"
    uat  = "4"
    prod = "4"
  }
}

# variable "erp1163projectoutboundscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0 2 ? * * *"
#     test = "0 0 2 ? * * *"
#     uat  = "0 5/10 * ? * * *"
#     prod = "0 0 2 ? * * *"
#   }
# }

variable "erp1144projectactualscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 0 ? * * *"
  }
}

# variable "erp1188invoicingscheduler"{
#   type = map(string)
#   default = {
#     dev  = "xxxx"
#     test = "0 0/30 * ? * *"
#     uat  = "0 0/30 * ? * *"
#     prod = "0 0/30 * ? * *"
#   }
# }

variable "erp1142deliverydatescheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0/30 * ? * *"
  }
}

variable "erp1157paymentfileinboundscheduler"{
  type = map(string)
  default = {
    dev  = "0 0 8 ? * MON,TUE,WED,THU,FRI *"
    test = "0 0 * ? * *"
    uat  = "0 0 9/1 ? * * *"
    prod = "0 0 6 ? * MON,TUE,WED,THU,FRI *"
  }
}

variable "erp1135inventoryscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0/30 * ? * *"
  }
}

variable "erp1149itembasepricey3ktrscheduler"{
  type = map(string)
  default = {
    dev  = "0 6/30 * ? * * *"
    test = "0 6/15 * ? * * *"
    uat  = "0 6/30 * ? * * *"
    prod = "0 6/30 * ? * * *"
  }
}

variable "hcm1107peakonscheduler"{
   type = map(string)
   default = {
    dev  = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
    test = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
    uat  = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
    prod = "0 0 18 ? * SUN,MON,TUE,WED,THU,FRI,SAT *"
  }
}

variable "erp1149pricelistschedulerhcare"{
  type = map(string)
  default = {
    dev  = "0 5/30 * ? * * *"
    test = "0 5/30 * ? * * *"
    uat  = "0 5/30 * ? * * *"
    prod = "0 6/30 * ? * * *"
  }
}

variable "erp1133productscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0/30 * ? * *"
  }
}

# variable "erp10341071contractoutboundscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0/30 * ? * *"
#     test = "0 0/30 * ? * *"
#     uat  = "0 0/30 * ? * *"
#     prod = "0 0/30 * ? * *"
#   }
# }

variable "erp103410711125ficontractoutboundscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * * *"
    test = "0 0/30 * ? * * *"
    uat  = "0 0/30 * ? * * *"
    prod = "0 0/30 * ? * * *"
  }
}

variable "erp103410711125plcontractoutboundscheduler"{
  type = map(string)
  default = {
    dev  = "0 3/30 * ? * * *"
    test = "0 3/30 * ? * * *"
    uat  = "0 3/30 * ? * * *"
    prod = "0 3/30 * ? * * *"
  }
}

variable "erp103410711125nocontractoutboundscheduler"{
  type = map(string)
  default = {
    dev  = "0 6/30 * ? * * *"
    test = "0 6/10 * ? * * *"
    uat  = "0 6/30 * ? * * *"
    prod = "0 6/30 * ? * * *"
  }
}

variable "erp103410711125trcontractoutboundscheduler"{
  type = map(string)
  default = {
    dev  = "0 9/30 * ? * * *"
    test = "0 9/30 * ? * * *"
    uat  = "0 9/30 * ? * * *"
    prod = "0 9/30 * ? * * *"
  }
}
variable "erp1119exchangeratesscheduler"{
  type = map(string)
  default = {
    dev  = "0 0 4 * * ?"
    test = "0 0 4 * * ?"
    uat  = "0 0 4 * * ?"
    prod = "0 0 4 * * ?"
  }
}

# variable "erp1159supplieroutboundscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0/10 * ? * *"
#     test = "0 0/10 * ? * *"
#     uat  = "0 0/10 * ? * * *"
#     prod = "0 0/10 * ? * *"
#   }
# }

variable "erp1159supplieroutboundschedulerno"{
  type = map(string)
  default = {
    dev  = "0 */10 * ? * *"
    test = "0 */10 * ? * *"
    uat  = "0 2/10 * ? * *"
    prod = "0 */10 * ? * *"
  }
}

variable "erp1159supplieroutboundschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 */10 * ? * *"
    test = "0 */10 * ? * *"
    uat  = "0 */10 * ? * *"
    prod = "0 */10 * ? * *"
  }
}

# variable "erp1187paymentstatusoutboundscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0/10 * ? * *"
#     test = "0 0/10 * ? * *"
#     uat  = "0 5/10 * ? * *"
#     prod = "0 5/10 * ? * *"
#   }
# }

variable "erp1187paymentstatusoutboundschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 */10 * ? * *"
    test = "0 */10 * ? * *"
    uat  = "0 5/10 * ? * *"
    prod = "0 5/10 * ? * *"
  }
}

variable "erp1187paymentstatusoutboundschedulerno"{
  type = map(string)
  default = {
    dev  = "0 */10 * ? * *"
    test = "0 */10 * ? * *"
    uat  = "0 7/10 * ? * *"
    prod = "0 5/10 * ? * *"
  }
}

variable "erp1011technicianactualhoursscheduler"{
  type = map(string)
  default = {
    dev  = "0 30 1 ? * * *"
    test = "0 30 1 ? * * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 30 1 ? * * *"
  }
}

# variable "erp1156finnishreferencescheduler"{
#   type = map(string)
#   default = {
#     dev  = "xxxx"
#     test = "0 0/30 * ? * *"
#     uat  = "0 0/30 * ? * *"
#     prod = "0 0/30 * ? * *"
#   }
# }

# variable "erp1160purchaseorderscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0/10 * ? * *"
#     test = "0 0/10 * ? * *"
#     uat  = "0 5/10 * ? * * *"
#     prod = "0 5/10 * ? * * *"
#   }
# }

variable "erp1160purchaseorderschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 */10 * ? * *"
    test = "0 */10 * ? * *"
    uat  = "0 */10 * ? * *"
    prod = "0 */10 * ? * *"
  }
}

variable "erp1160purchaseorderschedulerno"{
  type = map(string)
  default = {
    dev  = "0 */10 * ? * *"
    test = "0 */10 * ? * *"
    uat  = "0 2/10 * ? * *"
    prod = "0 */10 * ? * *"
  }
}

# variable "erp1164accountscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0 */8 ? * *"
#     test = "0 0 */8 ? * *"
#     uat  = "0 0 */8 ? * *"
#     prod = "0 0 */8 ? * *"
#   }
# }

# variable "erp1164contratsitescheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0/10 * ? * *"
#     test = "0 0/10 * ? * *"
#     uat  = "0 */10 * ? * *"
#     prod = "0 0/10 * ? * *"
#   }
# }

# variable "erp1164departmentscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0 */8 ? * *"
#     test = "0 0 */8 ? * *"
#     uat  = "0 0 */8 ? * *"
#     prod = "0 0 */8 ? * *"
#   }
# }

# variable "erp1164genericaccountscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0 */8 ? * *"
#     test = "0 0 */8 ? * *"
#     uat  = "0 0 */8 ? * *"
#     prod = "0 0 */8 ? * *"
#   }
# }

# variable "erp1164genericdepartmentscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0 */8 ? * *"
#     test = "0 0 */8 ? * *"
#     uat  = "0 0 */8 ? * *"
#     prod = "0 0 */8 ? * *"
#   }
# }

# variable "erp1164typeofcostscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0 */8 ? * *"
#     test = "0 0 */8 ? * *"
#     uat  = "0 0 */8 ? * *"
#     prod = "0 0 */8 ? * *"
#   }
# }

# variable "erp1164typeofservicescheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0 */8 ? * *"
#     test = "0 0 */8 ? * *"
#     uat  = "0 0 */8 ? * *"
#     prod = "0 0 */8 ? * *"
#   }
# }


variable "erp1164accountschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164contratsiteschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0/10 * ? * *"
    test = "0 0/10 * ? * *"
    uat  = "0 */10 * ? * *"
    prod = "0 0/10 * ? * *"
  }
}

variable "erp1164departmentschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164genericaccountschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164genericdepartmentschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164typeofcostschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164typeofserviceschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}


variable "erp1164accountschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 2/0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164contratsiteschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0/10 * ? * *"
    test = "0 0/10 * ? * *"
    uat  = "0 2/10 * ? * *"
    prod = "0 0/10 * ? * *"
  }
}

variable "erp1164departmentschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 2/0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164genericaccountschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 2/0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164genericdepartmentschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 2/0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164typeofcostschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 2/0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1164typeofserviceschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0 */8 ? * *"
    test = "0 0 */8 ? * *"
    uat  = "0 2/0 */8 ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "azurestorageaccountname"{
  type = map(string)
  default = {
    dev  = "northstarstoragedev"
    test = "northstarstoragetest"
    uat  = "northstarstorageacctuat"
    prod = "northstarstorageacntprod"
  }
}

variable "erp1003supplierinvoicescheduler"{
  type = map(string)
  default = {
    dev  = "0 0/10 * ? * *"
    test = "0 0/10 * ? * *"
    uat  = "0 0/10 * ? * * *"
    prod = "0 0/10 * ? * *"
  }
}

variable "payloadlog"{
  type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "false"
    prod = "false"
  }
}

variable "sftpcheckhost"{
  type = map(string)
  default = {
    dev  = "sftp-dub.p2p.basware.com"
    test = "sftp-dub.p2p.basware.com"
    uat  = "sftp-dub.p2p.basware.com"
    prod = "sftp-dub.p2p.basware.com"
  }
}

variable "sftpcheckuser"{
  type = map(string)
  default = {
    dev  = "securitastest2"
    test = "securitastest2"
    uat  = "securitastest2"
    prod = "securitastest2"
  }
}

variable "sftpchecksshsecret"{
  type = map(string)
  default = {
    dev  = "basware-sftpuser-privatekey2-base64"
    test = "basware-sftpuser-privatekey2-base64"
    uat  = "basware-sftpuser-privatekey2-base64"
    prod = "basware-sftpuser-privatekey2-base64"
  }
}

variable "salesorderurlmappingfield"{
  type = map(string)
  default = {
    dev  = "https://edm-dev.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
    test = "https://edm-test.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
    uat  = "https://edm-staging.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
    prod = "https://edm.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
  }
}

variable "salesorderurlmappingfieldhcare"{
  type = map(string)
  default = {
    dev  = "https://edm-test.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
    test = "https://edm-test.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
    uat  = "https://edm-staging.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
    prod = "https://edm.securitas.com/iframe?ctx={{\"EdmCoreSystem\":\"TechPlatform\",\"EdmCoreCountry\":{0},\"EdmCoreEntityType\":\"TpOpportunity\",\"EdmCoreEntityId\":{1},\"EdmCoreDocTypeGroup\":\"TpAsBuilt\",\"EdmCoreDocType\":\"TpQuoteSystemDesignBlueprint\"}}"
  }
}

variable "cpqversioningenabled"{
  type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "true"
  }
}


variable "payloadloggingenabled"{
  type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1151tookperintascheduler"{
  type = map(string)
  default = {
    dev  = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    test = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    uat  = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
    prod = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
  }
}

variable "erp1151tookperintaupdateschedulerhcare"{
  type = map(string)
  default = {
    dev  = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    test = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    uat  = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    prod = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
  }
}

variable "erp1151tookperintaupdatescheduler"{
  type = map(string)
  default = {
    dev  = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    test = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    uat  = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
    prod = "0 0 13 ? * MON,TUE,WED,THU,FRI *"
  }
}

variable "erppcustomerprofile"{
  type = map(string)
  default = {
    dev  = "SSE_FI_Default"
    test = "SSE_FI_Default"
    uat  = "SSE_FI_Default"
    prod = "SSE_FI_Default"
  }
}

variable "erpcreditornr"{
  type = map(number)
  default = {
    dev  = 1266863
    test = 1266863
    uat  = 126686
    prod = 1266863
    
  }
}

variable "hcm1086employeequalificationscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * * * *"
    test = "0 0 * * * *"
    uat  = "0 0/60 * * * *"
    prod = "0 0/60 * * * *"
  }
}

variable "hcm1086schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "hcm1088masterqualificationscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * * * *"
    test = "0 0 * * * *"
    uat  = "0 0/60 * * * *"
    prod = "0 0/60 * * * *"
  }
}

variable "hcm1085absencedatascheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * * * *"
    test = "0 0/30 * * * *"
    uat  = "0 0/30 * * * *"
    prod = "0 0/60 * * * *"
  }
}

variable "hcm1088schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "hcm1085schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1071crmsftpscheduler"{
  type = map(string)
  default = {
    dev  = "0 0 8 * * ?"
    test = "0 0 8 * * ?"
    uat  = "0 0 8 * * ?"
    prod = "0 0 8 * * ?"
  }
}

variable "erp1071schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}
variable "gipupdateabsencedataapi"{
  type = map(string)
  default = {
    dev  = "integration-platform/publish/v1/AbsenceDataUpdated"
    test = "integration-platform/publish/v1/AbsenceDataUpdated"
    uat  = "integration-platform-uat/publish/v1/AbsenceDataUpdated"
    prod = "integration-platform/publish/v1/AbsenceDataUpdated"
  }
}

variable "gipupdatemasterqualificationsapi"{
  type = map(string)
  default = {
    dev  = "integration-platform/publish/v1/MasterQualificationListUpdated"
    test = "integration-platform/publish/v1/MasterQualificationListUpdated"
    uat  = "integration-platform-uat/publish/v1/MasterQualificationListUpdated"
    prod = "integration-platform/publish/v1/MasterQualificationListUpdated"
  }
}

variable "gipupdateemployeequalificationsapi"{
  type = map(string)
  default = {
    dev  = "integration-platform/publish/v1/EmployeeQualificationsUpdated"
    test = "integration-platform/publish/v1/EmployeeQualificationsUpdated"
    uat  = "integration-platform-uat/publish/v1/EmployeeQualificationsUpdated"
    prod = "integration-platform/publish/v1/EmployeeQualificationsUpdated"
  }
}


# Endpoint Variables
variable "oraclehcmempupdateatomfeedapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmempassignmentatomfeedapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmempterminateatomfeedapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/employee/termination?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/termination?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration/hcm/employee/termination?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/termination?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmempnewhiretomfeedapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/employee/newHire?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/newHire?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration/hcm/employee/newHire?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/newHire?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmgetempapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers?personid={0}"
    test = "northstar-integration/hcm/workers?personid={0}"
    uat  = "northstar-integration/hcm/workers?personid={0}"
    prod = "northstar-integration/hcm/emps?personid={0}"
  }
  
}

variable "oraclehcmgetworkerapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers?personnumber={0}"
    test = "northstar-integration/hcm/workers?personnumber={0}"
    uat  = "northstar-integration/hcm/workers?personnumber={0}"
    prod = "northstar-integration/hcm/workers?personnumber={0}"
  }
  
}

variable "oraclehcmgetpublicworkerapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/publicWorkers?personnumber={0}"
    test = "northstar-integration/hcm/publicWorkers?personnumber={0}"
    uat  = "northstar-integration/hcm/publicWorkers?personnumber={0}"
    prod = "northstar-integration/hcm/publicWorkers?personnumber={0}"
  }
  
}

variable "oraclehcmgetpublicworkerusingworkernumberapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/publicWorkers?workernumber={0}"
    test = "northstar-integration/hcm/publicWorkers?workernumber={0}"
    uat  = "northstar-integration/hcm/publicWorkers?workernumber={0}"
    prod = "northstar-integration/hcm/publicWorkers?workernumber={0}"
  }
  
}

variable "oraclehcmgetlocationapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/locations?locationname={0}"
    test = "northstar-integration/hcm/locations?locationname={0}"
    uat  = "northstar-integration/hcm/locations?locationname={0}"
    prod = "northstar-integration/hcm/locations?locationname={0}"
  }
  
}

variable "oraclehcmgetuseraccountapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/userAccounts?personid={0}"
    test = "northstar-integration/hcm/userAccounts?personid={0}"
    uat  = "northstar-integration/hcm/userAccounts?personid={0}"
    prod = "northstar-integration/hcm/userAccounts?personid={0}"
  }
  
}

variable "oraclehcmgetmanageruseraccountapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/userAccounts?personnumber={0}"
    test = "northstar-integration/hcm/userAccounts?personnumber={0}"
    uat  = "northstar-integration/hcm/userAccounts?personnumber={0}"
    prod = "northstar-integration/hcm/userAccounts?personnumber={0}"
  }
  
}

variable "oraclehcmgetsalaryapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/salary?personnumber={0}"
    test = "northstar-integration/hcm/workers/salary?personnumber={0}"
    uat  = "northstar-integration/hcm/workers/salary?personnumber={0}"
    prod = "northstar-integration/hcm/workers/salary?personnumber={0}"
  }
  
}

variable "oraclehcmgetaddressapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/address?personnumber={0}"
    test = "northstar-integration/hcm/workers/address?personnumber={0}"
    uat  = "northstar-integration/hcm/workers/address?personnumber={0}"
    prod = "northstar-integration/hcm/workers/address?personnumber={0}"
  }
  
}

variable "oraclehcmgetphoneapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/phone?personnumber={0}"
    test = "northstar-integration/hcm/workers/phone?personnumber={0}"
    uat  = "northstar-integration/hcm/workers/phone?personnumber={0}"
    prod = "northstar-integration/hcm/workers/phone?personnumber={0}"
  }
  
}

variable "oraclehcmgetexternalidentifiersapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/badgetNumber?personnumber={0}"
    test = "northstar-integration/hcm/workers/badgetNumber?personnumber={0}"
    uat  = "northstar-integration/hcm/workers/badgetNumber?personnumber={0}"
    prod = "northstar-integration/hcm/workers/badgetNumber?personnumber={0}"
  }
  
}

variable "oraclehcmgetnationalidentifiersapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/nationalIdentifierNumber?personnumber={0}"
    test = "northstar-integration/hcm/workers/nationalIdentifierNumber?personnumber={0}"
    uat  = "northstar-integration/hcm/workers/nationalIdentifierNumber?personnumber={0}"
    prod = "northstar-integration/hcm/workers/nationalIdentifierNumber?personnumber={0}"
  }
  
}

variable "oraclehcmgetcultureapi" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/culture?personnumber={0}"
    test = "northstar-integration/hcm/workers/culture?personnumber={0}"
    uat  = "northstar-integration/hcm/workers/culture?personnumber={0}"
    prod = "northstar-integration/hcm/workers/culture?personnumber={0}"
  }
  
}

variable "updatefinnishnumber" {
  type = map(string)
  default = {
    dev  = "northstar-integration/finnishreferencenumber/{0}"
    test = "northstar-integration/finnishreferencenumber/{0}"
    uat  = "northstar-integration/finnishreferencenumber/{0}"
    prod = "northstar-integration/finnishreferencenumber/{0}"
  }
  
}

variable "updatepurchase" {
  type = map(string)
  default = {
    dev  = "northstar-integration/finnishreferencenumber/update"
    test = "northstar-integration/finnishreferencenumber/update"
    uat  = "northstar-integration/finnishreferencenumber/update"
    prod = "northstar-integration/finnishreferencenumber/update"
  }
  
}

variable "invoicingfeebireportendpoint" {
  type = map(string)
  default = {
    dev  = "northstar-integration/invoicingfee"
    test = "northstar-integration/invoicingfee"
    uat  = "northstar-integration/invoicingfee"
    prod = "northstar-integration/invoicingfee"
  }
  
}

variable "invoicingfeecreateadjustment" {
  type = map(string)
  default = {
    dev  = "northstar-integration/invoicingfee/adjustmentservice"
    test = "northstar-integration/invoicingfee/adjustmentservice"
    uat  = "northstar-integration/invoicingfee/adjustmentservice"
    prod = "northstar-integration/invoicingfee/adjustmentservice"
  }
  
}

variable "salesordercreateattachment" {
  type = map(string)
  default = {
    dev  = "northstar-integration/createattachment/{0}/child/lines/{1}/child/attachments"
    test = "northstar-integration/createattachment/{0}/child/lines/{1}/child/attachments"
    uat  = "northstar-integration/createattachment/{0}/child/lines/{1}/child/attachments"
    prod = "northstar-integration/createattachment/{0}/child/lines/{1}/child/attachments"
  }
  
}

variable "pricelistchargeupdateenddateendpoint" {
  type = map(string)
  default = {
    dev  = "northstar-integration/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
    test = "northstar-integration/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
    uat  = "northstar-integration/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
    prod = "northstar-integration/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
  }
  
}

variable "pricelistchargecreateendpoint" {
  type = map(string)
  default = {
    dev  = "northstar-integration/pricerevisions/{0}/child/items/{1}/child/charges"
    test = "northstar-integration/pricerevisions/{0}/child/items/{1}/child/charges"
    uat  = "northstar-integration/pricerevisions/{0}/child/items/{1}/child/charges"
    prod = "northstar-integration/pricerevisions/{0}/child/items/{1}/child/charges"
  }
  
}

variable "subscriptionproductupdateendateendpoint" {
  type = map(string)
  default = {
    dev  = "northstar-integration/subscriptionProducts/{0}"
    test = "northstar-integration/subscriptionProducts/{0}"
    uat  = "northstar-integration/subscriptionProducts/{0}"
    prod = "northstar-integration/subscriptionProducts/{0}"
  }
  
}

variable "subscriptionproductcreateendpoint" {
  type = map(string)
  default = {
    dev  = "northstar-integration/subscriptionProducts"
    test = "northstar-integration/subscriptionProducts"
    uat  = "northstar-integration/subscriptionProducts"
    prod = "northstar-integration/subscriptionProducts"
  }
  
}

variable "oraclegetemployeeassignmendffdetails" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    test = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    uat  = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    prod = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
  }
  
}

variable "oracleupdateonboardingcordinator" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/{0}/child/workRelationships/{1}/child/assignments/{2}/child/assignmentsDFF/{3}"
    test = "northstar-integration/hcm/workers/{0}/child/workRelationships/{1}/child/assignments/{2}/child/assignmentsDFF/{3}"
    uat  = "northstar-integration/hcm/workers/{0}/child/workRelationships/{1}/child/assignments/{2}/child/assignmentsDFF/{3}"
    prod = "northstar-integration/hcm/workers/{0}/child/workRelationships/{1}/child/assignments/{2}/child/assignmentsDFF/{3}"
  }
  
}

variable "oraclegetjobdetails" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/jobs?jobcode={0}"
    test = "northstar-integration/hcm/jobs?jobcode={0}"
    uat  = "northstar-integration/hcm/jobs?jobcode={0}"
    prod = "northstar-integration/hcm/jobs?jobcode={0}"
  }
  
}

variable "oraclegetpositiondetails" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/positions?positionname={0}"
    test = "northstar-integration/hcm/positions?positionname={0}"
    uat  = "northstar-integration/hcm/positions?positionname={0}"
    prod = "northstar-integration/hcm/positions?positionname={0}"
  }
  
}

variable "creatependingworker" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers"
    test = "northstar-integration/hcm/workers"
    uat  = "northstar-integration/hcm/workers"
    prod = "northstar-integration/hcm/workers"
  }
  
}

variable "oraclegetpersonnumberusingnationalid" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers?NationalId={0}"
    test = "northstar-integration/hcm/workers?NationalId={0}"
    uat  = "northstar-integration/hcm/workers?NationalId={0}"
    prod = "northstar-integration/hcm/workers?NationalId={0}"
  }
  
}

variable "oraclegetallurls" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers?PersonNumber={0}&expand={1}"
    test = "northstar-integration/hcm/workers?PersonNumber={0}&expand={1}"
    uat  = "northstar-integration/hcm/workers?PersonNumber={0}&expand={1}"
    prod = "northstar-integration/hcm/workers?PersonNumber={0}&expand={1}"
  }
  
}

variable "oraclecreateworkrelationships" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/{0}/child/workRelationships"
    test = "northstar-integration/hcm/workers/{0}/child/workRelationships"
    uat  = "northstar-integration/hcm/workers/{0}/child/workRelationships"
    prod = "northstar-integration/hcm/workers/{0}/child/workRelationships"
  }
  
}

variable "oracleupdateemployeename" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/{0}/child/names/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/names/{1}"
    uat  = "northstar-integration/hcm/workers/{0}/child/names/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/names/{1}"
  }
  
}

variable "oracleupdateemployeephone" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/{0}/child/phones/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/phones/{1}"
    uat  = "northstar-integration/hcm/workers/{0}/child/phones/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/phones/{1}"
  }
  
}

variable "oracleupdateemployeeemail" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/{0}/child/emails/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/emails/{1}"
    uat  = "northstar-integration/hcm/workers/{0}/child/emails/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/emails/{1}"
  }
  
}

variable "oracleupdateemployeeaddress" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/workers/{0}/child/addresses/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/addresses/{1}"
    uat  = "northstar-integration/hcm/workers/{0}/child/addresses/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/addresses/{1}"
  }
  
}

variable "updateorderinbireport" {
  type = map(string)
  default = {
    dev  = "northstar-integration/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
    test = "northstar-integration/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
    uat  = "northstar-integration/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
    prod = "northstar-integration/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
  }
}

variable "oracleatomfeedtriggerpagesize" {
  type = map(string)
  default = {
    dev  = "4000"
    test = "4000"
    uat  = "4000"
    prod = "4000"
  }
}

variable "getproposeduserpersontypeid" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/persontypeslov?userpersontype={0}"
    test = "northstar-integration/hcm/persontypeslov?userpersontype={0}"
    uat  = "northstar-integration/hcm/persontypeslov?userpersontype={0}"
    prod = "northstar-integration/hcm/persontypeslov?userpersontype={0}"
  }
}

variable "webapigettempendpoint" {
  type = map(string)
  default = {
    dev  = "northstar/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}&techplatformRole={5}"
    test = "northstar/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}&techplatformRole={5}"
    uat  = "northstar/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}&techplatformRole={5}"
    prod = "northstar/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}&techplatformRole={5}"
  }
}

variable "oraclegetemployeeassignmentdffdetails" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    test = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    uat  = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    prod = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
  }
}

variable "legislationcode" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/legislationcode/workers?personnumber={0}&expand={1}"
    test = "northstar-integration/hcm/legislationcode/workers?personnumber={0}&expand={1}"
    uat  = "northstar-integration/hcm/legislationcode/workers?personnumber={0}&expand={1}"
    prod = "northstar-integration/hcm/legislationcode/workers?personnumber={0}&expand={1}"
  }
}

variable "erp1026schedulerenabled" {
  type = map(string)
  default = {
    dev  = "true"
    test = "true"
    uat  = "false" 
    prod = "true"
  }
}

variable "erp1026bireportduration" {
  type = map(string)
  default = {
    dev  = "30"
    test = "30"
    uat  = "30" 
    prod = "30"
  }
}

variable "erp1026artransactionsscheduler" {
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *" 
    prod = "0 0/30 * ? * *"
  }
}

variable "salesordersfororderhub" {
  type = map(string)
  default = {
    dev  = "northstar-integration/salesOrdersForOrderHub/{0}"
    test = "northstar-integration/salesOrdersForOrderHub/{0}"
    uat  = "northstar-integration/salesOrdersForOrderHub/{0}"
    prod = "northstar-integration/salesOrdersForOrderHub/{0}"
  }
}

variable "pvtendpointnameblob" {
  type = map(string)
    default = {
      dev  = "ns-blob-funcapp-endpoint-dev"
      test = "ns-blob-funcapp-endpoint-test"
      uat  = "ns-blob-funcapp-endpoint-uat"
      prod = "ns-blob-funcapp-endpoint-prod"
  }
}

variable "pvtendpointnamefile" {
  type = map(string)
    default = {
      dev  = "ns-file-funcapp-endpoint-dev"
      test = "ns-file-funcapp-endpoint-test"
      uat  = "ns-file-funcapp-endpoint-uat"
      prod = "ns-file-funcapp-endpoint-prod"
  }
}

variable "pvtendpointnametable" {
  type = map(string)
    default = {
      dev  = "ns-table-funcapp-endpoint-dev"
      test = "ns-table-funcapp-endpoint-test"
      uat  = "ns-table-funcapp-endpoint-uat"
      prod = "ns-table-funcapp-endpoint-prod"
  }
}

variable "vnetlinkblob" {
  type = map(string)
    default = {
      dev  = "ns-vnet-funcapp-blob-dev"
      test = "ns-vnet-funcapp-blob-test"
      uat  = "ns-vnet-funcapp-blob-uat"
      prod = "ns-vnet-funcapp-blob-prod"
  }
}

variable "vnetlinkfile" {
  type = map(string)
    default = {
      dev  = "ns-vnet-funcapp-file-dev"
      test = "ns-vnet-funcapp-file-test"
      uat  = "ns-vnet-funcapp-file-uat"
      prod = "ns-vnet-funcapp-file-prod"
  }
}

variable "vnetlinktable" {
  type = map(string)
    default = {
      dev  = "ns-vnet-funcapp-table-dev"
      test = "ns-vnet-funcapp-table-test"
      uat  = "ns-vnet-funcapp-table-uat"
      prod = "ns-vnet-funcapp-table-prod"
  }
}

variable "dnszonegrpblob" {
  type = map(string)
    default = {
      dev  = "blob-funcapp-dns-zngrp-dev"
      test = "blob-funcapp-dns-zngrp-test"
      uat  = "blob-funcapp-dns-zngrp-uat"
      prod = "blob-funcapp-dns-zngrp-prod"
  }
}

variable "dnszonegrpfile" {
  type = map(string)
    default = {
      dev  = "file-funcapp-dns-zngrp-dev"
      test = "file-funcapp-dns-zngrp-test"
      uat  = "file-funcapp-dns-zngrp-uat"
      prod = "file-funcapp-dns-zngrp-prod"
  }
}

variable "resourceGroupName"{
  type = map(string)
  default = {
    dev  = "RGAZ-SSEU-ETL-CIP-dev"
    test = "RGAZ-SSEU-ETL-CIP-test"
    uat  = "RGAZ-SSEU-ETL-CIP-UAT"
    prod = "RGAZ-SSEU-ETL-CIP-prod"
  }
}

variable "adf_blob_storage_account_name" {
  type = map(string)
    default = {
      dev  = "northstarstoragedev"
      test = "northstarstoragetest"
      uat  = "northstarstorageacctuat"
      prod = "northstarstorageacntprod"
  }
}

variable "dnszoneblob" {
  type = map(string)
    default = {
      dev  = "privatelink.blob.core.windows.net"
      test = "privatelink.blob.core.windows.net"
      uat  = "privatelink.blob.core.windows.net"
      prod = "privatelink.blob.core.windows.net"
  }
}

variable "dnszonefile" {
  type = map(string)
    default = {
      dev  = "privatelink.file.core.windows.net"
      test = "privatelink.file.core.windows.net"
      uat  = "privatelink.file.core.windows.net"
      prod = "privatelink.file.core.windows.net"
  }
}

variable "dnszonetable" {
  type = map(string)
    default = {
      dev  = "privatelink.table.core.windows.net"
      test = "privatelink.table.core.windows.net"
      uat  = "privatelink.table.core.windows.net"
      prod = "privatelink.table.core.windows.net"
  }
}

variable "getneworexistingproductwithbilllinedetails" {
  type = map(string)
    default = {
      dev  = "/northstar-integration/pricerevisions/erp/erpbinewsubwithbilldetails"
      test = "/northstar-integration/pricerevisions/erp/erpbinewsubwithbilldetails"
      uat  = "/northstar-integration/pricerevisions/erp/erpbinewsubwithbilldetails"
      prod = "/northstar-integration/pricerevisions/erp/erpbinewsubwithbilldetails"
  }
}

variable "getbilltodetails" {
  type = map(string)
    default = {
      dev  = "/northstar-integration/erp/billtodetails"
      test = "/northstar-integration/erp/billtodetails"
      uat  = "/northstar-integration/erp/billtodetails"
      prod = "/northstar-integration/erp/billtodetails"
  }
}

variable "getpricelistdetails" {
  type = map(string)
    default = {
      dev  = "/northstar-integration/erp/pricelistdetails"
      test = "/northstar-integration/erp/pricelistdetails"
      uat  = "/northstar-integration/erp/pricelistdetails"
      prod = "/northstar-integration/erp/pricelistdetails"
  }
}

variable "uploadsubcsvfilesinucm" {
  type = map(string)
    default = {
      dev  = "northstar-integration/pricerevisions/uploadsubcsvfilesinucm"
      test = "northstar-integration/pricerevisions/uploadsubcsvfilesinucm"
      uat  = "northstar-integration/pricerevisions/uploadsubcsvfilesinucm"
      prod = "northstar-integration/pricerevisions/uploadsubcsvfilesinucm"
  }
}

variable "getsubscriptionjobstatus" {
  type = map(string)
    default = {
      dev  = "northstar-integration/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
      test = "northstar-integration/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
      uat  = "northstar-integration/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
      prod = "northstar-integration/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
  }
}

variable "runsubscriptionuploadcsvjob" {
  type = map(string)
    default = {
      dev  = "northstar-integration/pricerevisions"
      test = "northstar-integration/pricerevisions"
      uat  = "northstar-integration/pricerevisions"
      prod = "northstar-integration/pricerevisions"
  }
}

variable "webapierppricerevisions1177" {
  type = map(string)
    default = {
      dev  = "northstar/api/erp/PriceRevisionsSubscriptionImport"
      test = "northstar/api/erp/PriceRevisionsSubscriptionImport"
      uat  = "northstar/api/erp/PriceRevisionsSubscriptionImport"
      prod = "northstar/api/erp/PriceRevisionsSubscriptionImport"
  }
}

variable "activatesubscription" {
  type = map(string)
    default = {
      dev  = "northstar-integration/pricelists/subscriptions/{0}"
      test = "northstar-integration/pricelists/subscriptions/{0}"
      uat  = "northstar-integration/pricelists/subscriptions/{0}"
      prod = "northstar-integration/pricelists/subscriptions/{0}"
  }
}

variable "pricerevisionssubscriptionreprice" {
  type = map(string)
    default = {
      dev  = "/northstar-integration/pricerevisions/{0}/child/products/{1}"
      test = "/northstar-integration/pricerevisions/{0}/child/products/{1}"
      uat  = "/northstar-integration/pricerevisions/{0}/child/products/{1}"
      prod = "/northstar-integration/pricerevisions/{0}/child/products/{1}"
  }
}

variable "newsubscriptionproductdetails" {
  type = map(string)
    default = {
      dev  = "/northstar-integration/pricerevisions/erp/erpbinewsubsproddetails"
      test = "/northstar-integration/pricerevisions/erp/erpbinewsubsproddetails"
      uat  = "/northstar-integration/pricerevisions/erp/erpbinewsubsproddetails"
      prod = "/northstar-integration/pricerevisions/erp/erpbinewsubsproddetails"
  }
}

variable "subscriptionproductcloseendpoint" {
  type = map(string)
    default = {
      dev  = "northstar-integration/subscriptionProducts/{0}/action/close"
      test = "northstar-integration/subscriptionProducts/{0}/action/close"
      uat  = "northstar-integration/subscriptionProducts/{0}/action/close"
      prod = "northstar-integration/subscriptionProducts/{0}/action/close"
  }
}

variable "triopsisgetmileagedata" {
  type = map(string)
    default = {
      dev  = "triopsis/api/calculate/zip/{0}/{1}/{2}"
      test = "triopsis/api/calculate/zip/{0}/{1}/{2}"
      uat  = "triopsis/api/calculate/zip/{0}/{1}/{2}"
      prod = "triopsis/api/calculate/zip/{0}/{1}/{2}"
  }
}

variable "grsscheduleexport" {
  type = map(string)
    default = {
      dev  = "northstar-grs-apis/ScheduleExport"
      test = "northstar-grs-apis/ScheduleExport"
      uat  = "northstar-grs-apis/ScheduleExport"
      prod = "northstar-grs-apis/ScheduleExport"
  }
}

variable "enablenotification" {
  type = map(string)
    default = {
      dev  = "SSE-ERP-INT-1177,SSE-ERP-INT-1189,SSE-WFM-INT-1014,SSE-WFM-INT-1021,SSE-ERP-INT-1212,SSE-ERP-INT-1173,SSE-ERP-INT-1063,SSE-ERP-INT-1106,SSE-ERP-INT-1204,SSE-ERP-INT-1216,SSE-ERP-INT-1026"
      test = "SSE-ERP-INT-1177,SSE-ERP-INT-1189,SSE-WFM-INT-1014,SSE-WFM-INT-1021,SSE-ERP-INT-1212,SSE-ERP-INT-1173,SSE-ERP-INT-1063,SSE-ERP-INT-1106,SSE-ERP-INT-1204,SSE-ERP-INT-1216,SSE-ERP-INT-1026"
      uat  = "SSE-ERP-INT-1177,SSE-ERP-INT-1189,SSE-WFM-INT-1014,SSE-WFM-INT-1021,SSE-ERP-INT-1212,SSE-ERP-INT-1173,SSE-ERP-INT-1063,SSE-ERP-INT-1106,SSE-ERP-INT-1204,SSE-ERP-INT-1216,SSE-ERP-INT-1026"
      prod = "SSE-ERP-INT-1177,SSE-ERP-INT-1189,SSE-WFM-INT-1014,SSE-WFM-INT-1021,SSE-ERP-INT-1212,SSE-ERP-INT-1173,SSE-ERP-INT-1063,SSE-ERP-INT-1106,SSE-ERP-INT-1204,SSE-ERP-INT-1216,SSE-ERP-INT-1026"
  }
}

variable "grsclientid"{
  type = map(string)
    default = {
      dev  = "72a5eed8-5d23-4ac5-b54c-92c5ae3fb802"
      test = "72a5eed8-5d23-4ac5-b54c-92c5ae3fb802"
      uat  = "72a5eed8-5d23-4ac5-b54c-92c5ae3fb802"
      prod = "72a5eed8-5d23-4ac5-b54c-92c5ae3fb802"
    }
}

variable "grsaudience"{
  type = map(string)
    default = {
      dev  = "api://grs"
      test = "api://grs"
      uat  = "api://grs"
      prod = "api://grs"
    }
}

variable "erp1136polandbankstatementscheduler"{
  type = map(string)
  default = {
    dev  = "0 30 5 ? * MON,TUE,WED,THU,FRI *"
    test = "0 30 5 ? * MON,TUE,WED,THU,FRI *"
    uat  = "0 10/30 * ? * * *"
    prod = "0 30 5 ? * * *"
  }
}

variable "cepkeyvaultconstrid"{
  type = map(string)
  default = {
    dev  = "335b5d221eea454bbee07dba9f40df27"
    test = "af492ca7f01c492fb7af7742af5de54b"
    uat  = "6297fa43c4c44a32a8eba86002ce4e4a"
    prod = "5214b7f653be49269bdfd24933c2b910"
  }
}

variable "cepkeyvaultconstridhcare"{
  type = map(string)
  default = {
    dev  = "f8ed106345fe4eb98c5c94e8c47e989a"
    test = "af492ca7f01c492fb7af7742af5de54b"
    uat  = "48c362b8849d43c587c24fe67a2f95a1"
    prod = "5214b7f653be49269bdfd24933c2b910"
  }
}

variable "gipaudience"{
  type = map(string)
  default = {
    dev  = "26273b61-d2f2-4de9-9abc-8e557122ed78"
    test = "26273b61-d2f2-4de9-9abc-8e557122ed78"
    uat  = "26273b61-d2f2-4de9-9abc-8e557122ed78"
    prod = "7d24491f-f1d1-4243-9d2c-b597ad70da2b"
  }
}

variable "limit"{
  type = map(string)
  default = {
    dev  = "50"
    test = "50"
    uat  = "50"
    prod = "50"
  }
}

# Hypercare endpoint variables

variable "api_app_config_name_hcare_dfix" {
  type = map(string)
  default = {
    dev  = "northstar-app-config-hcare-defix-dev"
    test = "northstar-app-config-hcare-defix-test"
    uat  = "northstar-app-config-hcare-defix-uat"
    prod = "northstar-app-config-hcare-defix-prod"
  }
}

variable "oraclehcmempupdateatomfeedapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/empupdate?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmempassignmentatomfeedapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/empassignment?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmempterminateatomfeedapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/employee/termination?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/termination?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/employee/termination?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/termination?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmempnewhiretomfeedapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/employee/newHire?updatedmin={0}&page-size={1}"
    test = "northstar-integration/hcm/employee/newHire?updatedmin={0}&page-size={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/employee/newHire?updatedmin={0}&page-size={1}"
    prod = "northstar-integration/hcm/employee/newHire?updatedmin={0}&page-size={1}"
  }
  
}

variable "oraclehcmgetempapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/emps?personid={0}"
    test = "northstar-integration/hcm/emps?personid={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers?personid={0}"
    prod = "northstar-integration/hcm/emps?personid={0}"
  }
  
}

variable "oraclehcmgetworkerapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers?personnumber={0}"
    test = "northstar-integration/hcm/workers?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers?personnumber={0}"
    prod = "northstar-integration/hcm/workers?personnumber={0}"
  }
  
}

variable "oraclehcmgetpublicworkerapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/publicWorkers?personnumber={0}"
    test = "northstar-integration/hcm/publicWorkers?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/publicWorkers?personnumber={0}"
    prod = "northstar-integration/hcm/publicWorkers?personnumber={0}"
  }
  
}

variable "oraclehcmgetpublicworkerusingworkernumberapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/publicWorkers?workernumber={0}"
    test = "northstar-integration/hcm/publicWorkers?workernumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/publicWorkers?workernumber={0}"
    prod = "northstar-integration/hcm/publicWorkers?workernumber={0}"
  }
  
}

variable "oraclehcmgetlocationapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/locations?locationname={0}"
    test = "northstar-integration/hcm/locations?locationname={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/locations?locationname={0}"
    prod = "northstar-integration/hcm/locations?locationname={0}"
  }
  
}

variable "oraclehcmgetuseraccountapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/userAccounts?personid={0}"
    test = "northstar-integration/hcm/userAccounts?personid={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/userAccounts?personid={0}"
    prod = "northstar-integration/hcm/userAccounts?personid={0}"
  }
  
}

variable "oraclehcmgetmanageruseraccountapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/userAccounts?personnumber={0}"
    test = "northstar-integration/hcm/userAccounts?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/userAccounts?personnumber={0}"
    prod = "northstar-integration/hcm/userAccounts?personnumber={0}"
  }
  
}

variable "oraclehcmgetsalaryapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/salary?personnumber={0}"
    test = "northstar-integration/hcm/emps/salary?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/salary?personnumber={0}"
    prod = "northstar-integration/hcm/emps/salary?personnumber={0}"
  }
  
}

variable "oraclehcmgetaddressapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/address?personnumber={0}"
    test = "northstar-integration/hcm/workers/address?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/address?personnumber={0}"
    prod = "northstar-integration/hcm/workers/address?personnumber={0}"
  }
  
}

variable "oraclehcmgetphoneapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/phone?personnumber={0}"
    test = "northstar-integration/hcm/workers/phone?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/phone?personnumber={0}"
    prod = "northstar-integration/hcm/workers/phone?personnumber={0}"
  }
  
}

variable "oraclehcmgetexternalidentifiersapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/badgetNumber?personnumber={0}"
    test = "northstar-integration/hcm/workers/badgetNumber?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/badgetNumber?personnumber={0}"
    prod = "northstar-integration/hcm/workers/badgetNumber?personnumber={0}"
  }
  
}

variable "oraclehcmgetnationalidentifiersapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/nationalIdentifierNumber?personnumber={0}"
    test = "northstar-integration/hcm/workers/nationalIdentifierNumber?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/nationalIdentifierNumber?personnumber={0}"
    prod = "northstar-integration/hcm/workers/nationalIdentifierNumber?personnumber={0}"
  }
  
}

variable "oraclehcmgetcultureapihcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/culture?personnumber={0}"
    test = "northstar-integration/hcm/workers/culture?personnumber={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/culture?personnumber={0}"
    prod = "northstar-integration/hcm/workers/culture?personnumber={0}"
  }
  
}

variable "updatefinnishnumberhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/finnishreferencenumber/{0}"
    test = "northstar-integration/finnishreferencenumber/{0}"
    uat  = "northstar-integration-hcare-common-uat/finnishreferencenumber/{0}"
    prod = "northstar-integration/finnishreferencenumber/{0}"
  }
  
}

variable "updatepurchasehcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/finnishreferencenumber/update"
    test = "northstar-integration/finnishreferencenumber/update"
    uat  = "northstar-integration-hcare-common-uat/finnishreferencenumber/update"
    prod = "northstar-integration/finnishreferencenumber/update"
  }
  
}

variable "invoicingfeebireportendpointhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/invoicingfee"
    test = "northstar-integration/invoicingfee"
    uat  = "northstar-integration-hcare-common-uat/invoicingfee"
    prod = "northstar-integration/invoicingfee"
  }
  
}

variable "invoicingfeecreateadjustmenthcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/invoicingfee/adjustmentservice"
    test = "northstar-integration/invoicingfee/adjustmentservice"
    uat  = "northstar-integration-hcare-common-uat/invoicingfee/adjustmentservice"
    prod = "northstar-integration/invoicingfee/adjustmentservice"
  }
  
}

variable "salesordercreateattachmenthcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/createattachment/{0}/child/lines/{1}/child/attachments"
    test = "northstar-integration/createattachment/{0}/child/lines/{1}/child/attachments"
    uat  = "northstar-integration-hcare-common-uat/createattachment/{0}/child/lines/{1}/child/attachments"
    prod = "northstar-integration/createattachment/{0}/child/lines/{1}/child/attachments"
  }
  
}

variable "sftpcheckhosthcare"{
  type = map(string)
  default = {
    dev  = "test.bt.basware.com"
    test = "test.bt.basware.com"
    uat  = "test.bt.basware.com"
    prod = "test.bt.basware.com"
  }
}

variable "sftpcheckuserhcare"{
  type = map(string)
  default = {
    dev  = "BWEINO-0024555"
    test = "BWEINO-0025003"
    uat  = "BWEINO-0025003"
    prod = "BWEINO-0025003"
  }
}

variable "sftpchecksshsecrethcare"{
  type = map(string)
  default = {
    dev  = "basware-sftpuser-privatekey-base64"
    test = "basware-sftpuser-privatekey2-base64"
    uat  = "basware-sftpuser-privatekey2-base64"
    prod = "basware-sftpuser-privatekey2-base64"
  }
}

variable "pricelistchargeupdateenddateendpointhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
    test = "northstar-integration/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
    uat  = "northstar-integration-hcare-common-uat/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
    prod = "northstar-integration/pricerevisions/priceLists/{0}/child/items/{1}/child/charges/{2}"
  }
  
}

variable "pricelistchargecreateendpointhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/pricerevisions/{0}/child/items/{1}/child/charges"
    test = "northstar-integration/pricerevisions/{0}/child/items/{1}/child/charges"
    uat  = "northstar-integration-hcare-common-uat/pricerevisions/{0}/child/items/{1}/child/charges"
    prod = "northstar-integration/pricerevisions/{0}/child/items/{1}/child/charges"
  }
  
}

variable "subscriptionproductupdateendateendpointhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/subscriptionProducts/{0}"
    test = "northstar-integration/subscriptionProducts/{0}"
    uat  = "northstar-integration-hcare-common-uat/subscriptionProducts/{0}"
    prod = "northstar-integration/subscriptionProducts/{0}"
  }
  
}

variable "subscriptionproductcreateendpointhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/subscriptionProducts"
    test = "northstar-integration/subscriptionProducts"
    uat  = "northstar-integration-hcare-common-uat/subscriptionProducts"
    prod = "northstar-integration/subscriptionProducts"
  }
  
}

variable "oraclegetemployeeassignmendffdetailshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/emps?PersonNumber={0}&expand={1}"
    test = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/emps?PersonNumber={0}&expand={1}"
    prod = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
  }
  
}

variable "oracleupdateonboardingcordinatorhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/{0}/child/workRelationships/{1}/child/assignments/{2}/child/assignmentsDFF/{3}"
    test = "northstar-integration/hcm/emps/{0}/child/assignments/{1}/child/assignmentDFF/{2}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/{0}/child/workRelationships/{1}/child/assignments/{2}/child/assignmentsDFF/{3}"
    prod = "northstar-integration/hcm/emps/{0}/child/assignments/{1}/child/assignmentDFF/{2}"
  }
  
}

variable "oraclegetjobdetailshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/jobs?jobcode={0}"
    test = "northstar-integration/hcm/jobs?jobcode={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/jobs?jobcode={0}"
    prod = "northstar-integration/hcm/jobs?jobcode={0}"
  }
  
}

variable "oraclegetpositiondetailshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/positions?positionname={0}"
    test = "northstar-integration/hcm/positions?positionname={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/positions?positionname={0}"
    prod = "northstar-integration/hcm/positions?positionname={0}"
  }
  
}

variable "creatependingworkerhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers"
    test = "northstar-integration/hcm/workers"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers"
    prod = "northstar-integration/hcm/workers"
  }
  
}

variable "oraclegetpersonnumberusingnationalidhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers?NationalId={0}"
    test = "northstar-integration/hcm/emps?NationalId={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers?NationalId={0}"
    prod = "northstar-integration/hcm/emps?NationalId={0}"
  }
  
}

variable "oraclegetallurlshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers?PersonNumber={0}&expand={1}"
    test = "northstar-integration/hcm/workers?PersonNumber={0}&expand={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers?PersonNumber={0}&expand={1}"
    prod = "northstar-integration/hcm/workers?PersonNumber={0}&expand={1}"
  }
  
}

variable "oraclecreateworkrelationshipshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/{0}/child/workRelationships"
    test = "northstar-integration/hcm/workers/{0}/child/workRelationships"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/{0}/child/workRelationships"
    prod = "northstar-integration/hcm/workers/{0}/child/workRelationships"
  }
  
}

variable "oracleupdateemployeenamehcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/{0}/child/names/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/names/{1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/{0}/child/names/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/names/{1}"
  }
  
}

variable "oracleupdateemployeephonehcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/{0}/child/phones/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/phones/{1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/{0}/child/phones/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/phones/{1}"
  }
  
}

variable "oracleupdateemployeeemailhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/{0}/child/emails/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/emails/{1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/{0}/child/emails/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/emails/{1}"
  }
  
}

variable "oracleupdateemployeeaddresshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/workers/{0}/child/addresses/{1}"
    test = "northstar-integration/hcm/workers/{0}/child/addresses/{1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/workers/{0}/child/addresses/{1}"
    prod = "northstar-integration/hcm/workers/{0}/child/addresses/{1}"
  }
  
}

variable "updateorderinbireporthcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
    test = "northstar-integration/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
    uat  = "northstar-integration-hcare-common-uat/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
    prod = "northstar-integration/ERPOutboundOKPerinta/ERPToOkPerinta/UpdateOrderNr"
  }
}

variable "getproposeduserpersontypeidhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/persontypeslov?userpersontype={0}"
    test = "northstar-integration/hcm/persontypeslov?userpersontype={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/persontypeslov?userpersontype={0}"
    prod = "northstar-integration/hcm/persontypeslov?userpersontype={0}"
  }
}

variable "oraclegetemployeeassignmentdffdetailshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/emps?PersonNumber={0}&expand={1}"
    test = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/emps?PersonNumber={0}&expand={1}"
    prod = "northstar-integration/hcm/emps?PersonNumber={0}&expand={1}"
  }
}

variable "legislationcodehcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/legislationcode/workers?personnumber={0}&expand={1}"
    test = "northstar-integration/hcm/legislationcode/workers?personnumber={0}&expand={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/legislationcode/workers?personnumber={0}&expand={1}"
    prod = "northstar-integration/hcm/legislationcode/workers?personnumber={0}&expand={1}"
  }
}

variable "salesordersfororderhubhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/salesOrdersForOrderHub/{0}"
    test = "northstar-integration/salesOrdersForOrderHub/{0}"
    uat  = "northstar-integration-hcare-common-uat/salesOrdersForOrderHub/{0}"
    prod = "northstar-integration/salesOrdersForOrderHub/{0}"
  }
}

variable "getneworexistingproductwithbilllinedetailshcare" {
  type = map(string)
    default = {
      dev  = "/northstar-integration-hcare-common-defix/pricerevisions/erp/erpbinewsubwithbilldetails"
      test = "/northstar-integration/pricerevisions/erp/erpbinewsubwithbilldetails"
      uat  = "/northstar-integration-hcare-common-uat/pricerevisions/erp/erpbinewsubwithbilldetails"
      prod = "/northstar-integration/pricerevisions/erp/erpbinewsubwithbilldetails"
  }
}

variable "getbilltodetailshcare" {
  type = map(string)
    default = {
      dev  = "/northstar-integration-hcare-common-defix/erp/billtodetails"
      test = "/northstar-integration/erp/billtodetails"
      uat  = "/northstar-integration-hcare-common-uat/erp/billtodetails"
      prod = "/northstar-integration/erp/billtodetails"
  }
}

variable "getpricelistdetailshcare" {
  type = map(string)
    default = {
      dev  = "/northstar-integration-hcare-common-defix/erp/pricelistdetails"
      test = "/northstar-integration/erp/pricelistdetails"
      uat  = "/northstar-integration-hcare-common-uat/erp/pricelistdetails"
      prod = "/northstar-integration/erp/pricelistdetails"
  }
}

variable "uploadsubcsvfilesinucmhcare" {
  type = map(string)
    default = {
      dev  = "northstar-integration-hcare-common-defix/pricerevisions/uploadsubcsvfilesinucm"
      test = "northstar-integration/pricerevisions/uploadsubcsvfilesinucm"
      uat  = "northstar-integration-hcare-common-uat/pricerevisions/uploadsubcsvfilesinucm"
      prod = "northstar-integration/pricerevisions/uploadsubcsvfilesinucm"
  }
}

variable "getsubscriptionjobstatushcare" {
  type = map(string)
    default = {
      dev  = "northstar-integration-hcare-common-defix/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
      test = "northstar-integration/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
      uat  = "northstar-integration-hcare-common-uat/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
      prod = "northstar-integration/pricerevisions/importActivities/{0}/child/DataFiles/{1}"
  }
}

variable "runsubscriptionuploadcsvjobhcare" {
  type = map(string)
    default = {
      dev  = "northstar-integration-hcare-common-defix/pricerevisions"
      test = "northstar-integration/pricerevisions"
      uat  = "northstar-integration-hcare-common-uat/pricerevisions"
      prod = "northstar-integration/pricerevisions"
  }
}

variable "activatesubscriptionhcare" {
  type = map(string)
    default = {
      dev  = "northstar-integration-hcare-common-defix/pricelists/subscriptions/{0}"
      test = "northstar-integration/pricelists/subscriptions/{0}"
      uat  = "northstar-integration-hcare-common-uat/pricelists/subscriptions/{0}"
      prod = "northstar-integration/pricelists/subscriptions/{0}"
  }
}

variable "pricerevisionssubscriptionrepricehcare" {
  type = map(string)
    default = {
      dev  = "/northstar-integration-hcare-common-defix/pricerevisions/{0}/child/products/{1}"
      test = "/northstar-integration/pricerevisions/{0}/child/products/{1}"
      uat  = "/northstar-integration-hcare-common-uat/pricerevisions/{0}/child/products/{1}"
      prod = "/northstar-integration/pricerevisions/{0}/child/products/{1}"
  }
}

variable "newsubscriptionproductdetailshcare" {
  type = map(string)
    default = {
      dev  = "/northstar-integration-hcare-common-defix/pricerevisions/erp/erpbinewsubsproddetails"
      test = "/northstar-integration/pricerevisions/erp/erpbinewsubsproddetails"
      uat  = "/northstar-integration-hcare-common-uat/pricerevisions/erp/erpbinewsubsproddetails"
      prod = "/northstar-integration/pricerevisions/erp/erpbinewsubsproddetails"
  }
}

variable "subscriptionproductcloseendpointhcare" {
  type = map(string)
    default = {
      dev  = "northstar-integration-hcare-common-defix/subscriptionProducts/{0}/action/close"
      test = "northstar-integration/subscriptionProducts/{0}/action/close"
      uat  = "northstar-integration-hcare-common-uat/subscriptionProducts/{0}/action/close"
      prod = "northstar-integration/subscriptionProducts/{0}/action/close"
  }
}

# Hypercare feature flags

variable "erp1003supplierinvoiceschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1011technicianactualhoursschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1026schedulerenabledhcare" {
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true" 
    prod = "false"
  }
}

variable "erp10341071contractoutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1071schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1119exchangeratesschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1133productschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1135inventoryschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1142deliverydateschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1144projectactualschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1149pricelistschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erptookperintaschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1156finnishreferenceschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1157paymentfileinboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1159supplieroutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1160purchaseorderschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1163projectoutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1164accountschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164contratsiteschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164departmentschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164genericaccountschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164genericdepartmentschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164typeofcostschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164typeofserviceschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1187paymentstatusoutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1188invoicingschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1003schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1026schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1035schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1085schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1086schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1088schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1103schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1105schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "hcm1107schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp103410711125ficontractoutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp103410711125plcontractoutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp103410711125nocontractoutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp103410711125trcontractoutboundschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1159supplieroutboundschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1159supplieroutboundschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1187paymentstatusoutboundschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1187paymentstatusoutboundschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164accountschedulerfienabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164contratsiteschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164departmentschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164genericaccountschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164genericdepartmentschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164typeofcostschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164typeofserviceschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}


variable "erp1164accountschedulernoenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164contratsiteschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164departmentschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164genericaccountschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164genericdepartmentschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164typeofcostschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1164typeofserviceschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1160purchaseorderschedulerfienabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1160purchaseorderschedulernoenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1193schedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1132schedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1168schedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmasterplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmasterprimaryledgerplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmasterdepartmentplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmasteraccountplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmastercontractsiteplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmastertypeofcostplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmastertypeofserviceplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmasterintercompanyplschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmasterfutureuse1plschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1170segmentmasterfutureuse2plschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1149itembasepricenoschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1149itembasepricetrschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1149itembasepricefischedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1155shipmentnotificationschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1136polandbankstatementschedulerenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1163projectoutboundschedulerfienabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1163projectoutboundschedulernoenabledhcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1111trackingnumberschedulerenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1066customsbrokerschedulerenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1124licenseserverschedulerenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1226invoicedffschedulerenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "reademailschedulerenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}


variable "emailmoniteringfinlandenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringpolandenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnorwayenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringturkeyenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnetherlandsenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringgermanyenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringprodenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringhypercareuatenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringtestenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringdevenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringtrwave2uatenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringtrwave2devenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringhypercaredevenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnowave2uatenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringnowave2devenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "emailmoniteringfailurereasonenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1216custombrokerinvoiceschedulerenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1026cleanupschedulerenabledhcare"{ 
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1042versioningschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "erp1149itembasepricey3ktrschedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "envhcare" {
type = map(string)
  default = {
    dev  = "DEV"
    test = "SIT"
    uat  = "UAT"
    prod = "PROD"
  }
}

variable "envplhcare"{
  type = map(string)
  default = {
    dev  = "PL_WAVE2_DEV"
    test = "PL_WAVE2_SIT"
    uat  = "PL_WAVE2_UAT"
    prod = "PROD"
  }
}

variable "envnohcare"{
  type = map(string)
  default = {
    dev  = "NO_WAVE2_DEV"
    test = "NO_WAVE2_SIT"
    uat  = "NO_WAVE2_UAT"
    prod = "PROD"
  }
}

variable "envfihcare"{
  type = map(string)
  default = {
    dev  = "DEV"
    test = "SIT"
    uat  = "UAT"
    prod = "PROD"
  }
}

variable "envtrhcare"{
  type = map(string)
  default = {
    dev  = "TR_WAVE2_DEV"
    test = "TR_WAVE2_SIT"
    uat  = "TR_WAVE2_UAT"
    prod = "PROD"
  }
}

variable "payloadloggingenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "keyvaluthcarename"{
   type = map(string)
   default = {
    dev  = "KV-cip-k8s-hcaredev"
    test = "kv-cip-k8s-test"
    uat  = "KV-cip-k8s-hcareuat"
    prod = "KV-cip-k8s-prod"
  }
}

variable "keyvaulthcareurl" {
  type = map(string)
  default = {
    dev  = "https://kv-cip-k8s-hcaredev.vault.azure.net/"
    test = "https://kv-cip-k8s-test.vault.azure.net/"
    uat  = "https://kv-cip-k8s-hcareuat.vault.azure.net/"
    prod = "https://KV-cip-k8s-prod.vault.azure.net/"
  }
}

variable "erp1193supplieroutboundvdeskscheduler"{
   type = map(string)
   default = {
    dev  = "0 0/5 * ? * *"
    test = "0 0/5 * ? * *"
    uat  = "0 2/5 * ? * *"
    prod = "0 0/5 * ? * *"
  }
}

variable "erp1193bireportdurationmin"{
   type = map(string)
   default = {
    dev  = "5"
    test = "5"
    uat  = "5"
    prod = "5"
  }
}

variable "erp1193schedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "gipupdateabsencedataapihcare"{
  type = map(string)
  default = {
    dev  = "integration-platform-devbau/publish/v1/AbsenceDataUpdated"
    test = "integration-platform/publish/v1/AbsenceDataUpdated"
    uat  = "integration-platform-uatbau/publish/v1/AbsenceDataUpdated"
    prod = "integration-platform/publish/v1/AbsenceDataUpdated"
  }
}

variable "gipupdatemasterqualificationsapihcare"{
  type = map(string)
  default = {
    dev  = "integration-platform-devbau/publish/v1/MasterQualificationListUpdated"
    test = "integration-platform/publish/v1/MasterQualificationListUpdated"
    uat  = "integration-platform-uatbau/publish/v1/MasterQualificationListUpdated"
    prod = "integration-platform/publish/v1/MasterQualificationListUpdated"
  }
}

variable "gipupdateemployeequalificationsapihcare"{
  type = map(string)
  default = {
    dev  = "integration-platform-devbau/publish/v1/EmployeeQualificationsUpdated"
    test = "integration-platform/publish/v1/EmployeeQualificationsUpdated"
    uat  = "integration-platform-uatbau/publish/v1/EmployeeQualificationsUpdated"
    prod = "integration-platform/publish/v1/EmployeeQualificationsUpdated"
  }
}

variable "webapigettempendpointhcare" {
  type = map(string)
  default = {
    dev  = "northstar-hcare-common-defix/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}&techplatformRole={5}"
    test = "northstar/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}"
    uat  = "northstar-hcare-uat/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}&techplatformRole={5}"
    prod = "northstar/api/hcm/employee/getemployee?personid={0}&employeestatus={1}&assignmentid={2}&integrationtype={3}&countryCode={4}&techplatformRole={5}"
  }
}

variable "webapierppricerevisions1177hcare" {
  type = map(string)
    default = {
      dev  = "northstar-hcare-common-defix/api/erp/PriceRevisionsSubscriptionImport"
      test = "northstar/api/erp/PriceRevisionsSubscriptionImport"
      uat  = "northstar-hcare-uat/api/erp/PriceRevisionsSubscriptionImport"
      prod = "northstar/api/erp/PriceRevisionsSubscriptionImport"
  }
}

variable "erp1132schedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1132paymentfilevacationacrualscheduler"{
   type = map(string)
   default = {
    dev  = "0 0 * ? * * *"
    test = "0 0 * ? * * *"
    uat  = "0 0 * ? * * *"
    prod = "0 10/30 * ? * *"
  }
}

variable "erp1168supplierinvoicevdeskscheduler"{
   type = map(string)
   default = {
    dev  = "0 0/5 * ? * *"
    test = "0 0/5 * ? * *"
    uat  = "0 0/5 * ? * *"
    prod = "0 0/5 * ? * *"
  }
}

variable "erp1168schedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmasterplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmastercompanyplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmasterprimaryledgerplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmasterdepartmentplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmasteraccountplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmastercontractsiteplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0/10 * ? * *"
  }
}

variable "erp1170segmentmastertypeofcostplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmastertypeofserviceplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmasterintercompanyplscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmasterfutureuse1plscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}

variable "erp1170segmentmasterfutureuse2plscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0 */8 ? * *"
  }
}



variable "erp1170segmentmasterprimaryledgerplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmasterdepartmentplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmasteraccountplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmastercontractsiteplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmastertypeofcostplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmastertypeofserviceplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmasterintercompanyplschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmasterfutureuse1plschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1170segmentmasterfutureuse2plschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1149itembasepricenoscheduler"{
  type = map(string)
  default = {
    dev  = "0 3/30 * ? * * *"
    test = "0 3/15 * ? * * *"
    uat  = "0 3/30 * ? * * *"
    prod = "0 3/30 * ? * * *"
  }
}

variable "erp1149itembasepricetrscheduler"{
  type = map(string)
  default = {
    dev  = "0 9/30 * ? * * *"
    test = "0 9/15 * ? * * *"
    uat  = "0 9/30 * ? * * *"
    prod = "0 9/30 * ? * * *"
  }
}

variable "erp1149itembasepricefischeduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * * *"
    test = "0 0/15 * ? * * *"
    uat  = "0 0/30 * ? * * *"
    prod = "0 0/30 * ? * * *"
  }
}

variable "erp1155shipmentnotificationscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/60 * ? * *"
    test = "0 0/60 * ? * *"
    uat  = "0 0/60 * ? * *"
    prod = "0 0/60 * ? * *"
  }
}

variable "erp1155bireportdurationmin" {
  type = map(string)
  default = {
    dev  = "60"
    test = "60"
    uat  = "60" 
    prod = "60"
  }
}

variable "erp1227bireportdurationmin" {
  type = map(string)
  default = {
    dev  = "30"
    test = "30"
    uat  = "30" 
    prod = "30"
  }
}

variable "erp1066durationmin" {
  type = map(string)
  default = {
    dev  = "30"
    test = "30"
    uat  = "30" 
    prod = "30"
  }
}

variable "erp1216durationmin" {
  type = map(string)
  default = {
    dev  = "240"
    test = "240"
    uat  = "240" 
    prod = "240"
  }
}

variable "erp1149itembasepricenoschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1149itembasepricetrschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1149itembasepricefischedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1155shipmentnotificationschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1136polandbankstatementschedulerenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "nationalidentifiergermany" {
  type = map(string)
  default = {
    dev  = "f91fc830-4be9-4ccc-959c-4ac0ea5655b7"
    test = "f91fc830-4be9-4ccc-959c-4ac0ea5655b7"
    uat  = "f91fc830-4be9-4ccc-959c-4ac0ea5655b7"
    prod = "eb52af31-b66c-4947-9a9a-d4487a1617cb"
  }
}

variable "nationalidentifierfinland" {
  type = map(string)
  default = {
    dev  = "52c27a05-e8d6-44be-8c7d-48652a8036a2"
    test = "52c27a05-e8d6-44be-8c7d-48652a8036a2"
    uat  = "52c27a05-e8d6-44be-8c7d-48652a8036a2"
    prod = "6908647d-41a5-481f-8c22-32a702558551"
  }
}

variable "nationalidentifiergermany_bau" {
  type = map(string)
  default = {
    dev  = "fb7b3943-10e7-4a45-a33d-c6905704105e"
    test = "XX"
    uat  = "fb7b3943-10e7-4a45-a33d-c6905704105e"
    prod = "XX"
  }
}

variable "nationalidentifierfinland_bau" {
  type = map(string)
  default = {
    dev  = "551f92e8-3468-4656-8407-8d70c9aedb0e"
    test = "XX"
    uat  = "551f92e8-3468-4656-8407-8d70c9aedb0e"
    prod = "XX"
  }
}

variable "postpricelistitemtocpq" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq/pricelistitem"
    test = "northstar-integration-cpq/pricelistitem"
    uat  = "northstar-integration-cpq/pricelistitem"
    prod = "northstar-integration-cpq/pricelistitem"
  }
}

variable "postpricelistitemtocpqhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-hcare-dev/pricelistitem"
    test = "northstar-integration-cpq/pricelistitem"
    uat  = "northstar-integration-cpq-hcare-uat/pricelistitem"
    prod = "northstar-integration-cpq/pricelistitem"
  }
}
variable "functionappconfigsrvalues" {
  type = map(string)
  default = {
    dev  = "smartrecruiters-hcare-common-defix"
    test = "xxxx"
    uat  = "smartrecruiters-hcare-bau-uat"
    prod = "xxxx"
  }
}

variable "postcustomcosttocpq" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq/product/productcustomcost"
    test = "northstar-integration-cpq/product/productcustomcost"
    uat  = "northstar-integration-cpq/product/productcustomcost"
    prod = "northstar-integration-cpq/product/productcustomcost"
  }
}

variable "postlandedcosttocpq" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq/product/productlandedcost"
    test = "northstar-integration-cpq/product/productlandedcost"
    uat  = "northstar-integration-cpq/product/productlandedcost"
    prod = "northstar-integration-cpq/product/productlandedcost"
  }
}

variable "postfobcosttocpq" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq/product/productfobcost"
    test = "northstar-integration-cpq/product/productfobcost"
    uat  = "northstar-integration-cpq/product/productfobcost"
    prod = "northstar-integration-cpq/product/productfobcost"
  }
}

variable "poststrategicpricemarkuptocpq" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq/product/productstrategiccost"
    test = "northstar-integration-cpq/product/productstrategiccost"
    uat  = "northstar-integration-cpq/product/productstrategiccost"
    prod = "northstar-integration-cpq/product/productstrategiccost"
  }
}

variable "countryisousingbuname" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/lookupcodes?meaning={0}"
    test = "northstar-integration/hcm/lookupcodes?meaning={0}"
    uat  = "northstar-integration/hcm/lookupcodes?meaning={0}"
    prod = "northstar-integration/hcm/lookupcodes?meaning={0}"
  }
}

variable "legislationcodewithbuname" {
  type = map(string)
  default = {
    dev  = "northstar-integration/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
    test = "northstar-integration/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
    uat  = "northstar-integration/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
    prod = "northstar-integration/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
  }
}

variable "cpqproductversioning" {
  type = map(string)
  default = {
    dev  = "northstar/api/erp/CPQProductVersioning"
    test = "northstar/api/erp/CPQProductVersioning"
    uat  = "northstar/api/erp/CPQProductVersioning"
    prod = "northstar/api/erp/CPQProductVersioning"
  }
}

variable "northstareventgridtopic" {
  type = map(string)
  default = {
    dev  = "https://northstar-eventgrid-topic-dev.westeurope-1.eventgrid.azure.net/api/events"
    test = "https://northstar-eventgrid-topic-test.westeurope-1.eventgrid.azure.net/api/events"
    uat  = "https://northstar-eventgrid-topic-uat.westeurope-1.eventgrid.azure.net/api/events"
    prod = "https://northstar-eventgrid-topic-prod.westeurope-1.eventgrid.azure.net/api/events"
  }
}

variable "geteximprogres" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/CheckImportStatus"
    test = "northstar-integration-cpq-product/product/CheckImportStatus"
    uat  = "northstar-integration-cpq-product/product/CheckImportStatus"
    prod = "northstar-integration-cpq-product/product/CheckImportStatus"
  }
}

variable "checkeximpstatus" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/checkAPIStatus"
    test = "northstar-integration-cpq-product/product/checkAPIStatus"
    uat  = "northstar-integration-cpq-product/product/checkAPIStatus"
    prod = "northstar-integration-cpq-product/product/checkAPIStatus"
  }
}

variable "createimportslot" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/createImportSlot"
    test = "northstar-integration-cpq-product/product/createImportSlot"
    uat  = "northstar-integration-cpq-product/product/createImportSlot"
    prod = "northstar-integration-cpq-product/product/createImportSlot"
  }
}

variable "uploadxmlonslot" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/uploadXML/{0}/file"
    test = "northstar-integration-cpq-product/product/uploadXML/{0}/file"
    uat  = "northstar-integration-cpq-product/product/uploadXML/{0}/file"
    prod = "northstar-integration-cpq-product/product/uploadXML/{0}/file"
  }
}

variable "launchimport" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/launchImport/{0}"
    test = "northstar-integration-cpq-product/product/launchImport/{0}"
    uat  = "northstar-integration-cpq-product/product/launchImport/{0}"
    prod = "northstar-integration-cpq-product/product/launchImport/{0}"
  }
}

variable "postcustomcosttocpqhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-hcare-dev/product/productcustomcost"
    test = "northstar-integration-cpq/product/productcustomcost"
    uat  = "northstar-integration-cpq-hcare-uat/product/productcustomcost"
    prod = "northstar-integration-cpq/product/productcustomcost"
  }
}

variable "postlandedcosttocpqhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-hcare-dev/product/productlandedcost"
    test = "northstar-integration-cpq/product/productlandedcost"
    uat  = "northstar-integration-cpq-hcare-uat/product/productlandedcost"
    prod = "northstar-integration-cpq/product/productlandedcost"
  }
}

variable "postfobcosttocpqhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-hcare-dev/product/productfobcost"
    test = "northstar-integration-cpq/product/productfobcost"
    uat  = "northstar-integration-cpq-hcare-uat/product/productfobcost"
    prod = "northstar-integration-cpq/product/productfobcost"
  }
}

variable "geteximprogreshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/CheckImportStatus"
    test = "northstar-integration-cpq-product/product/CheckImportStatus"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/CheckImportStatus"
    prod = "northstar-integration-cpq-product/product/CheckImportStatus"
  }
}

variable "checkeximpstatushcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/checkAPIStatus"
    test = "northstar-integration-cpq-product/product/checkAPIStatus"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/checkAPIStatus"
    prod = "northstar-integration-cpq-product/product/checkAPIStatus"
  }
}

variable "createimportslothcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/createImportSlot"
    test = "northstar-integration-cpq-product/product/createImportSlot"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/createImportSlot"
    prod = "northstar-integration-cpq-product/product/createImportSlot"
  }
}

variable "uploadxmlonslothcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/uploadXML/{0}/file"
    test = "northstar-integration-cpq-product/product/uploadXML/{0}/file"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/uploadXML/{0}/file"
    prod = "northstar-integration-cpq-product/product/uploadXML/{0}/file"
  }
}

variable "launchimporthcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/launchImport/{0}"
    test = "northstar-integration-cpq-product/product/launchImport/{0}"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/launchImport/{0}"
    prod = "northstar-integration-cpq-product/product/launchImport/{0}"
  }
}

variable "cpqproductcostimport" {
  type = map(string)
  default = {
    dev  = "northstar/api/erp/CPQProductCostImport"
    test = "northstar/api/erp/CPQProductCostImport"
    uat  = "northstar/api/erp/CPQProductCostImport"
    prod = "northstar/api/erp/CPQProductCostImport"
  }
}

variable "cpqproductcostimporthcare" {
  type = map(string)
  default = {
    dev  = "northstar-hcare-common-defix/api/erp/CPQProductCostImport"
    test = "northstar/api/erp/CPQProductCostImport"
    uat  = "northstar-hcare-uat/api/erp/CPQProductCostImport"
    prod = "northstar/api/erp/CPQProductCostImport"
  }
}

variable "postprodtocpq" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq/product/producttocpq"
    test = "northstar-integration-cpq/product/producttocpq"
    uat  = "northstar-integration-cpq/product/producttocpq"
    prod = "northstar-integration-cpq/product/producttocpq"
  }
}

variable "updateokperintapaymentstatus" {
  type = map(string)
  default = {
    dev  = "northstar-integration/standardReceipts/{0}/child/standardReceiptDFF"
    test = "northstar-integration/standardReceipts/{0}/child/standardReceiptDFF"
    uat  = "northstar-integration/standardReceipts/{0}/child/standardReceiptDFF"
    prod = "northstar-integration/standardReceipts/{0}/child/standardReceiptDFF"
  }
}

variable "getversionprogresscheck" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/checkVersionProgress"
    test = "northstar-integration-cpq-product/product/checkVersionProgress"
    uat  = "northstar-integration-cpq-product/product/checkVersionProgress"
    prod = "northstar-integration-cpq-product/product/checkVersionProgress"
  }
}

variable "launchfulltextindex" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/fulltextindex"
    test = "northstar-integration-cpq-product/product/fulltextindex"
    uat  = "northstar-integration-cpq-product/product/fulltextindex"
    prod = "northstar-integration-cpq-product/product/fulltextindex"
  }
}

variable "launchcacheclear" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/clearversioningcache/{0}"
    test = "northstar-integration-cpq-product/product/clearversioningcache/{0}"
    uat  = "northstar-integration-cpq-product/product/clearversioningcache/{0}"
    prod = "northstar-integration-cpq-product/product/clearversioningcache/{0}"
  }
}

variable "unforcedobjects" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/unforceForcedObjects"
    test = "northstar-integration-cpq-product/product/unforceForcedObjects"
    uat  = "northstar-integration-cpq-product/product/unforceForcedObjects"
    prod = "northstar-integration-cpq-product/product/unforceForcedObjects"
  }
}

variable "graphapibaseaddress" {
  type = map(string)
  default = {
    dev  = "https://sts.windows.net"
    test = "https://sts.windows.net"
    uat  = "https://sts.windows.net"
    prod = "https://sts.windows.net"
  }
}

variable "clientinvoicebasware" {
  type = map(string)
  default = {
    dev  = "northstar/api/erp/ClientInvoicesBasware"
    test = "northstar/api/erp/ClientInvoicesBasware"
    uat  = "northstar/api/erp/ClientInvoicesBasware"
    prod = "northstar/api/erp/ClientInvoicesBasware"
  }
}

variable "postprodtocpqhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-hcare-dev/product/producttocpq"
    test = "northstar-integration-cpq/product/producttocpq"
    uat  = "northstar-integration-cpq-hcare-uat/product/producttocpq"
    prod = "northstar-integration-cpq/product/producttocpq"
  }
}

variable "cpqcreatenewversion" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product/product/versioning/{0}"
    test = "northstar-integration-cpq-product/product/versioning/{0}"
    uat  = "northstar-integration-cpq-product/product/versioning/{0}"
    prod = "northstar-integration-cpq-product/product/versioning/{0}"
  }
}

variable "cpqcreatenewversionhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/versioning/{0}"
    test = "northstar-integration-cpq-product/product/versioning/{0}"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/versioning/{0}"
    prod = "northstar-integration-cpq-product/product/versioning/{0}"
  }
}

variable "poststrategicpricemarkuptocpqhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-hcare-dev/product/productstrategiccost"
    test = "northstar-integration-cpq/product/productstrategiccost"
    uat  = "northstar-integration-cpq-hcare-uat/product/productstrategiccost"
    prod = "northstar-integration-cpq/product/productstrategiccost"
  }
}

variable "countryisousingbunamehcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/lookupcodes?meaning={0}"
    test = "northstar-integration/hcm/lookupcodes?meaning={0}"
    uat  = "northstar-integration-hcare-common-uat/hcm/lookupcodes?meaning={0}"
    prod = "northstar-integration/hcm/lookupcodes?meaning={0}"
  }
}

variable "legislationcodewithbunamehcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
    test = "northstar-integration/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
    uat  = "northstar-integration-hcare-common-uat/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
    prod = "northstar-integration/hcm/legislationcodebuname/workers?personnumber={0}&onlydata={1}"
  }
}

variable "cpqproductversioninghcare" {
  type = map(string)
  default = {
    dev  = "northstar-hcare-common-defix/api/erp/CPQProductVersioning"
    test = "northstar/api/erp/CPQProductVersioning"
    uat  = "northstar-hcare-common-uat/api/erp/CPQProductVersioning"
    prod = "northstar/api/erp/CPQProductVersioning"
  }
}

variable "getversionprogresscheckhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/checkVersionProgress"
    test = "northstar-integration-cpq-product/product/checkVersionProgress"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/checkVersionProgress"
    prod = "northstar-integration-cpq-product/product/checkVersionProgress"
  }
}

variable "launchfulltextindexhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/fulltextindex"
    test = "northstar-integration-cpq-product/product/fulltextindex"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/fulltextindex"
    prod = "northstar-integration-cpq-product/product/fulltextindex"
  }
}

variable "launchcacheclearhcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/clearversioningcache/{0}"
    test = "northstar-integration-cpq-product/product/clearversioningcache/{0}"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/clearversioningcache/{0}"
    prod = "northstar-integration-cpq-product/product/clearversioningcache/{0}"
  }
}

variable "unforcedobjectshcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-cpq-product-hcare-common-defix/product/unforceForcedObjects"
    test = "northstar-integration-cpq-product/product/unforceForcedObjects"
    uat  = "northstar-integration-cpq-product-hcare-uat/product/unforceForcedObjects"
    prod = "northstar-integration-cpq-product/product/unforceForcedObjects"
  }
}

variable "updateokperintapaymentstatushcare" {
  type = map(string)
  default = {
    dev  = "northstar-integration-hcare-common-defix/standardReceipts/{0}/child/standardReceiptDFF"
    test = "northstar-integration/standardReceipts/{0}/child/standardReceiptDFF"
    uat  = "northstar-integration-hcare-common-uat/standardReceipts/{0}/child/standardReceiptDFF"
    prod = "northstar-integration/standardReceipts/{0}/child/standardReceiptDFF"
  }
}

variable "graphapibaseaddresshcare" {
  type = map(string)
  default = {
    dev  = "https://sts.windows.net"
    test = "https://sts.windows.net"
    uat  = "https://sts.windows.net"
    prod = "https://sts.windows.net"
  }
}

variable "clientinvoicebaswarehcare" {
  type = map(string)
  default = {
    dev  = "northstar-hcare-common-defix/api/erp/ClientInvoicesBasware"
    test = "northstar/api/erp/ClientInvoicesBasware"
    uat  = "northstar-hcare-uat/api/erp/ClientInvoicesBasware"
    prod = "northstar/api/erp/ClientInvoicesBasware"
  }
}

variable "northstareventgridtopichcare" {
  type = map(string)
  default = {
    dev  = "https://northstar-eventgrid-topic-dev-hcare.westeurope-1.eventgrid.azure.net/api/events"
    test = "https://northstar-eventgrid-topic-test.westeurope-1.eventgrid.azure.net/api/events"
    uat  = "https://northstar-eventgrid-topic-uat-hcare.westeurope-1.eventgrid.azure.net/api/events"
    prod = "https://northstar-eventgrid-topic-prod.westeurope-1.eventgrid.azure.net/api/events"
  }
}

variable "erp1163projectoutboundschedulerfienabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1163projectoutboundschedulernoenabled"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "true"
  }
}

variable "erp1163projectboundschedulerfi"{
  type = map(string)
  default = {
    dev  = "0 0 2 ? * * *"
    test = "0 0 2 ? * * *"
    uat  = "0 0 2 ? * * *"
    prod = "0 0 2 ? * * *"
  }
}

variable "erp1163projectoutboundschedulerno"{
  type = map(string)
  default = {
    dev  = "0 0 2 ? * * *"
    test = "0 0 2 ? * * *"
    uat  = "0 2/0 2 ? * * *"
    prod = "0 0 2 ? * * *"
  }
}

variable "erp1111trackingnumberscheduler"{
  type = map(string)
  default = {
    dev  = "0 0 */1 ? * * *"
    test = "0 0 */1 ? * * *"
    uat  = "0 0 */1 ? * * *"
    prod = "0 0 */1 ? * * *"
  }
}

variable "erp1066customsbrokerscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0/30 * ? * *"
  }
}

variable "erp1124licenseserverscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/20 * ? * *"
    test = "0 0/20 * ? * *"
    uat  = "0 0/20 * ? * *"
    prod = "0 0/20 * ? * *"
  }
}

variable "reademailscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/10 * ? * *"
    test = "0 0/10 * ? * *"
    uat  = "0 0/10 * ? * *"
    prod = "0 0/10 * ? * *"
  }
}

variable "graphclientid"{
  type = map(string)
  default = {
    dev  = "625367a8-963b-4b9e-bffc-775bc64225e7"
    test = "625367a8-963b-4b9e-bffc-775bc64225e7"
    uat  = "625367a8-963b-4b9e-bffc-775bc64225e7"
    prod = "625367a8-963b-4b9e-bffc-775bc64225e7"
  }
}

# variable "erp1226invoicedffscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 0/30 * ? * *"
#     test = "0 0/30 * ? * *"
#     uat  = "0 0/30 * ? * *"
#     prod = "0 0/30 * ? * *"
#   }
# }

variable "erp1216custombrokerinvoicescheduler"{
  type = map(string)
  default = {
    dev  = "0 4/0 * ? * *"
    test = "0 4/0 * ? * *"
    uat  = "0 0/15 * ? * *"
    prod = "0 4/0 * ? * *"
  }
}

variable "erp1227ewaybillscheduler"{
  type = map(string)
  default = {
    dev  = "0 0/30 * ? * *"
    test = "0 0/30 * ? * *"
    uat  = "0 0/30 * ? * *"
    prod = "0 0/30 * ? * *"
  }
}

variable "erp1209kredinorpayupdatescheduler"{
  type = map(string)
  default = {
    dev  = "0 0 3 ? * * *"
    test = "0 0 3 ? * * *"
    uat  = "0 0 3 ? * * *"
    prod = "0 0 3 ? * * *"
  }
}

variable "smstemplate7"{
  type = map(string)
  default = {
    dev  = "Data do uzupełnienia 1 - zaprzestanie"
    test = "Data do uzupełnienia 1 - zaprzestanie"
    uat  = "Data do uzupełnienia 1 - zaprzestanie"
    prod = "Data do uzupełnienia 1 - zaprzestanie"
  }
}

variable "smstemplate9"{
  type = map(string)
  default = {
    dev  = "Data do uzupełnienia 3 - w. zewnętrzna"
    test = "Data do uzupełnienia 3 - w. zewnętrzna"
    uat  = "Data do uzupełnienia 3 - w. zewnętrzna"
    prod = "Data do uzupełnienia 3 - w. zewnętrzna"
  }
}

# variable "erp1149pricelistschedulerenabled"{
#   type = map(string)
#   default = {
#     dev  = "false"
#     test = "false"
#     uat  = "true"
#     prod = "true"
#   }
# }

# variable "erp1149pricelistscheduler"{
#   type = map(string)
#   default = {
#     dev  = "0 15/30 * ? * * *"
#     test = "0 13/15 * ? * * *"
#     uat  = "0 15/30 * ? * * *"
#     prod = "0 15/30 * ? * * *"
#   }
# }

variable "envpl"{
  type = map(string)
  default = {
    dev  = "PL_WAVE2_DEV"
    test = "PL_WAVE2_SIT"
    uat  = "PL_WAVE2_UAT"
    prod = "PROD"
  }
}

variable "envno"{
  type = map(string)
  default = {
    dev  = "NO_WAVE2_DEV"
    test = "NO_WAVE2_SIT"
    uat  = "NO_WAVE2_UAT"
    prod = "PROD"
  }
}

variable "envfi"{
  type = map(string)
  default = {
    dev  = "DEV"
    test = "SIT"
    uat  = "UAT"
    prod = "PROD"
  }
}

variable "envtr"{
  type = map(string)
  default = {
    dev  = "TR_WAVE2_DEV"
    test = "TR_WAVE2_SIT"
    uat  = "TR_WAVE2_UAT"
    prod = "PROD"
  }
}

variable "smallerpdateformat"{
  type = map(string)
  default = {
    dev  = "yyyyMMddHHmmss"
    test = "yyyyMMddHHmmss"
    uat  = "yyyyMMddHHmmss"
    prod = "yyyyMMddHHmmss"
  }
}

variable "cpqbatchsize"{
  type = map(string)
  default = {
    dev  = "100"
    test = "100"
    uat  = "100"
    prod = "100"
  }
}


variable "erp1042schedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1042schedulerenabledhcare"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "false"
  }
}

variable "cpqproductcleanupbatchsize"{
  type = map(string)
  default = {
    dev  = "50"
    test = "50"
    uat  = "50"
    prod = "50"
  }
}

variable "erp1042cpqproductimporttablecleanupscheduler"{
  type = map(string)
  default = {
    dev  = "0 0 0 * * *"
    test = "0 0 0 * * *"
    uat  = "0 0 0 * * *"
    prod = "0 0 0 * * *"
  }
}

variable "erp1042versioningschedulerenabled"{
  type = map(string)
  default = {
    dev  = "false"
    test = "false"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1042versioningscheduler"{
  type = map(string)
  default = {
    dev  = "0 0 */2 * * *"
    test = "0 0 */2 * * *"
    uat  = "0 0 */2 * * *"
    prod = "0 0 */2 * * *"
  }
}

variable "erp1151faillerscheduler"{
  type = map(string)
  default = {
    dev  = "*/60 * * * * *"
    test = "*/60 * * * * *"
    uat  = "*/60 * * * * *"
    prod = "*/60 * * * * *"
  }
}

variable "versionprefix"{
  type = map(string)
  default = {
    dev  = "IntegrationV"
    test = "IntegrationV"
    uat  = "IntegrationV"
    prod = "IntegrationV"
  }
}

variable "versionprefixhcare"{
  type = map(string)
  default = {
    dev  = "HCareIntegrationV"
    test = "HCareIntegrationV"
    uat  = "HCareIntegrationV"
    prod = "HCareIntegrationV"
  }
}

variable "cleanupdaterange"{
  type = map(string)
  default = {
    dev  = "-30"
    test = "-30"
    uat  = "-30"
    prod = "-30"
  }
}

variable "hcm1107peakonschedulerhcare"{
   type = map(string)
   default = {
    dev  = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
    test = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
    uat  = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
    prod = "0 0 10 ? * MON,TUE,WED,THU,FRI *"
  }
}

variable "extractattachmenthcare"{
   type = map(string)
   default = {
    dev  = "northstar-integration-hcare-common-defix/erp/erpextractattachment"
    test = "northstar-integration/erp/erpextractattachment"
    uat  = "northstar-integration-hcare-common-uat/erp/erpextractattachment"
    prod = "northstar-integration/erp/erpextractattachment"
  }
}

variable "arincupdateprintflaghcare"{
   type = map(string)
   default = {
    dev  = "northstar-integration-hcare-common-defix/erp/arinvoice/{0}"
    test = "northstar-integration/erp/arinvoice/{0}"
    uat  = "northstar-integration-hcare-common-uat/erp/arinvoice/{0}"
    prod = "northstar-integration/erp/arinvoice/{0}"
  }
}

variable "arcreditmemoupdateprinthcare"{
   type = map(string)
   default = {
    dev  = "northstar-integration-hcare-common-defix/erp/updatecreditmemo"
    test = "northstar-integration/erp/updatecreditmemo"
    uat  = "northstar-integration-hcare-common-uat/erp/updatecreditmemo"
    prod = "northstar-integration/erp/updatecreditmemo"
  }
}

variable "artxmlgen"{
   type = map(string)
   default = {
    dev  = "northstar/api/erp/ARTransactionsXML"
    test = "northstar/api/erp/ARTransactionsXML"
    uat  = "northstar/api/erp/ARTransactionsXML"
    prod = "northstar/api/erp/ARTransactionsXML"
  }
}

variable "artxmlgenhcare"{
   type = map(string)
   default = {
    dev  = "northstar-hcare-common-defix/api/erp/ARTransactionsXML"
    test = "northstar/api/erp/ARTransactionsXML"
    uat  = "northstar-hcare-uat/api/erp/ARTransactionsXML"
    prod = "northstar/api/erp/ARTransactionsXML"
  }
}

variable "schedulebaswareinvoice"{
   type = map(string)
   default = {
    dev  = "0 */10 * * * *"
    test = "0 */10 * * * *"
    uat  = "0 */10 * * * *"
    prod = "0 */10 * * * *"
  }
}

variable "schedulebaswareinvoicehcare"{
   type = map(string)
   default = {
    dev  = "0 */10 * * * *"
    test = "0 */10 * * * *"
    uat  = "0 */10 * * * *"
    prod = "0 */10 * * * *"
  }
}

variable "erp1204clientinvoiceenabled"{
   type = map(string)
   default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1204clientinvoicefileuploadenable"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}

variable "erp1204clientinvoiceenabledhcare"{
   type = map(string)
   default = {
    dev  = "true"
    test = "true"
    uat  = "true"
    prod = "true"
  }
}

variable "erp1204clientinvoicefileuploadenablehcare"{
   type = map(string)
   default = {
    dev  = "false"
    test = "false"
    uat  = "false"
    prod = "false"
  }
}
