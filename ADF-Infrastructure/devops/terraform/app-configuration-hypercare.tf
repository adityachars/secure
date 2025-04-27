resource "azurerm_app_configuration" "api_app_configurations_hcare_dfix" {
    count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
    name = var.api_app_config_name_hcare_dfix[local.environment]
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    sku = "standard"
}

data "azurerm_client_config" "current_hcare_dfix" {}

resource "azurerm_role_assignment" "appconf_dataowner_hcare_dfix" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  scope                = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  role_definition_name = "App Configuration Data Owner"
  principal_id         = data.azurerm_client_config.current_hcare_dfix.object_id
}


resource "azurerm_app_configuration_feature" "hcm-1003-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1003_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1003schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1103-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1103_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1103schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1035-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1035_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1035schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1105-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "DependencySync (HCM to SR)"
  name                   = "HCM_1105_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1105schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1026-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "ConfigurationSync (HCM to SR)"
  name                   = "HCM_1026_CONFIGSYNC_SCHEDULER"
  label                  = ""
  enabled                = var.hcm1026schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1107-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1107_PEAKON_SCHEDULER"
  label                  = ""
  enabled                = var.hcm1107schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1142-delivery-date-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1142_DELIVERY_DATE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1142deliverydateschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1135-inventory-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1135_INVENTORY_SCHEDULER"
  label                  = ""
  enabled                = var.erp1135inventoryschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembasepricey3ktr-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_Y3K_TR"
  label                  = ""
  enabled                = var.erp1149itembasepricey3ktrschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1133-product-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1133_PRODUCT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1133productschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1011-technicianactualhours-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1011_TECHNICIANACTUALHOURS_SCHEDULER"
  label                  = ""
  enabled                = var.erp1011technicianactualhoursschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1119-exchangerates-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1119_EXCHANGERATES_SCHEDULER"
  label                  = ""
  enabled                = var.erp1119exchangeratesschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1144-projectactual-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1144_PROJECTACTUAL_SCHEDULER"
  label                  = ""
  enabled                = var.erp1144projectactualschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1156-finnishreference-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1156_FINNISHREFERENCE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1156finnishreferenceschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1188-invoicing-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1188_INVOICING_SCHEDULER"
  label                  = ""
  enabled                = var.erp1188invoicingschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1157-paymentfile-inbound-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1157_PAYMENTFILE_INBOUND_SCHEDULER"
  label                  = ""
  enabled                = var.erp1157paymentfileinboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-contract-outbound-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_CONTRACT_OUTBOUND_SCHEDULER"
  label                  = ""
  enabled                = var.erp10341071contractoutboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-FI-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp103410711125ficontractoutboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-PL-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp103410711125plcontractoutboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-NO-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp103410711125nocontractoutboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-TR-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_TR"
  label                  = ""
  enabled                = var.erp103410711125trcontractoutboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1159-supplier-outbound-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER"
  label                  = ""
  enabled                = var.erp1159supplieroutboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1159-supplier-outbound-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1159supplieroutboundschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1159-supplier-outbound-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1159supplieroutboundschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1187-paymentstatus-outbound-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER"
  label                  = ""
  enabled                = var.erp1187paymentstatusoutboundschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1187-paymentstatus-outbound-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1187paymentstatusoutboundschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1187-paymentstatus-outbound-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1187paymentstatusoutboundschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_feature" "erp-1163-projectoutbound-scheduler-enabled-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1163_PROJECTOUTBOUND_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1163projectoutboundschedulerenabledhcare[local.environment]
# }

resource "azurerm_app_configuration_feature" "erp-1164-account-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_ACCOUNT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1164accountschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-contratsite-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_CONTRATSITE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1164contratsiteschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-department-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_DEPARTMENT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1164departmentschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericaccount-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICACCOUNT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1164genericaccountschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericdepartment-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICDEPARTMENT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1164genericdepartmentschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofcost-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFCOST_SCHEDULER"
  label                  = ""
  enabled                = var.erp1164typeofcostschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofservice-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFSERVICE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1164typeofserviceschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-account-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_ACCOUNT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164accountschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-contratsite-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_CONTRATSITE_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164contratsiteschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-department-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_DEPARTMENT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164departmentschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericaccount-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICACCOUNT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164genericaccountschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericdepartment-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICDEPARTMENT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164genericdepartmentschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofcost-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFCOST_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164typeofcostschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofservice-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFSERVICE_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164typeofserviceschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-account-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_ACCOUNT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164accountschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-contratsite-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_CONTRATSITE_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164contratsiteschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-department-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_DEPARTMENT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164departmentschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericaccount-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICACCOUNT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164genericaccountschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericdepartment-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICDEPARTMENT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164genericdepartmentschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofcost-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFCOST_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164typeofcostschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofservice-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFSERVICE_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164typeofserviceschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1160-purchaseorder-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1160_PURCHASEORDER_SCHEDULER"
  label                  = ""
  enabled                = var.erp1160purchaseorderschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1160-purchaseorder-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1160_PURCHASEORDER_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1160purchaseorderschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1160-purchaseorder-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1160_PURCHASEORDER_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1160purchaseorderschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1003-supplierinvoice-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1003_SUPPLIERINVOICE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1003supplierinvoiceschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "payload-logging-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "PAYLOAD_LOGGING_ENABLED"
  label                  = ""
  enabled                = var.payloadloggingenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1151-to-okperinta-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1151_OKPERINTA_SCHEDULER"
  label                  = ""
  enabled                = var.erptookperintaschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1086-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1086_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1086schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1085-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1085_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1085schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1088-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1088_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1088schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1071-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1071_CRMSFTP_SCHEDULER"
  label                  = ""
  enabled                = var.erp1071schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1026-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1026_ARTRANSACTIONS_SCHEDULER"
  label                  = ""
  enabled                = var.erp1026schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1193-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1193_SUPPLIEROUTBOUNDVDESK_SCHEDULER"
  label                  = ""
  enabled                = var.erp1193schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1132-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1132_PAYMENTFILESVACATIONACRUAL_SCHEDULER"
  label                  = ""
  enabled                = var.erp1132schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}


resource "azurerm_app_configuration_feature" "erp-1168-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1168_SUPPLIERINVOICEVDESK_SCHEDULER"
  label                  = ""
  enabled                = var.erp1168schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERCOMPANY_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}


resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-primaryledger-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERPRIMARYLEDGER_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterprimaryledgerplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-department-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERDEPARTMENT_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterdepartmentplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-account-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERACCOUNT_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasteraccountplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-contractsite-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERCONTRACTSITE_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmastercontractsiteplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-typeofcost-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERTYPE_OF_COST_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmastertypeofcostplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-typeofservice-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERTYPE_OF_SERVICE_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmastertypeofserviceplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-intercompany-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERINTERCOMPANY_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterintercompanyplschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-futureuse1-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERFUTURE_USE1_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterfutureuse1plschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-futureuse2-pl-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERFUTURE_USE2_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterfutureuse2plschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembaseprice-no-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1149itembasepricenoschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembaseprice-tr-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_STT_TR"
  label                  = ""
  enabled                = var.erp1149itembasepricetrschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembaseprice-fi-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1149itembasepricefischedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-pricelist-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_PRICELIST_SCHEDULER"
  label                  = ""
  enabled                = var.erp1149pricelistschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1155-shipmentnotification-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1155_SHIPMENTNOTIFICATION_SCHEDULER"
  label                  = ""
  enabled                = var.erp1155shipmentnotificationschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1136-polandbankstatement-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1136_POLANDBANKSTATEMENT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1136polandbankstatementschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1163-projectoutbound-scheduler-fi-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1163_PROJECTOUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1163projectoutboundschedulerfienabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1163-projectoutbound-scheduler-no-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1163_PROJECTOUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1163projectoutboundschedulernoenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1111-trackingnumber-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1111_TRACKINGNUMBER_SCHEDULER"
  label                  = ""
  enabled                = var.erp1111trackingnumberschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1066-customs-broker-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1066_CUSTOMS_BROKER_SCHEDULER"
  label                  = ""
  enabled                = var.erp1066customsbrokerschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1124-licenseserver-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1124_LICENSESERVER_SCHEDULER"
  label                  = ""
  enabled                = var.erp1124licenseserverschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1042-scheduler-enabled-hcare" {
   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1042_CLEANUP_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.erp1042schedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1226-invoicedff-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1226_InvoiceDFF_SCHEDULER"
  label                  = ""
  enabled                = var.erp1226invoicedffschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "read-email-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "READ_EMAIL_SCHEDULER"
  label                  = ""
  enabled                = var.reademailschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}


resource "azurerm_app_configuration_feature" "emailmonitering-finland-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Finland"
  label                  = ""
  enabled                = var.emailmoniteringfinlandenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-poland-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Poland"
  label                  = ""
  enabled                = var.emailmoniteringpolandenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-norway-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Norway"
  label                  = ""
  enabled                = var.emailmoniteringnorwayenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-turkey-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Turkey"
  label                  = ""
  enabled                = var.emailmoniteringturkeyenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-netherlands-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Netherlands"
  label                  = ""
  enabled                = var.emailmoniteringnetherlandsenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-germany-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Germany"
  label                  = ""
  enabled                = var.emailmoniteringgermanyenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-prod-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_PROD"
  label                  = ""
  enabled                = var.emailmoniteringprodenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-hypercareuat-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_HypercareUAT"
  label                  = ""
  enabled                = var.emailmoniteringhypercareuatenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-test-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_TEST"
  label                  = ""
  enabled                = var.emailmoniteringtestenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-dev-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_DEV"
  label                  = ""
  enabled                = var.emailmoniteringdevenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-tr-wave2-uat-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_TR_WAVE2_UAT"
  label                  = ""
  enabled                = var.emailmoniteringtrwave2uatenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-tr-wave2-dev-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_TR_WAVE2_DEV"
  label                  = ""
  enabled                = var.emailmoniteringtrwave2devenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-hypercare-dev-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_HYPERCARE_DEV"
  label                  = ""
  enabled                = var.emailmoniteringhypercaredevenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-no-wave2-uat-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_NO_WAVE2_UAT"
  label                  = ""
  enabled                = var.emailmoniteringnowave2uatenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-no-wave2-dev-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_NO_WAVE2_DEV"
  label                  = ""
  enabled                = var.emailmoniteringnowave2devenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-failure-reason-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_FailureReason"
  label                  = ""
  enabled                = var.emailmoniteringfailurereasonenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1042-versioning-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1042_VERSIONING_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.erp1042versioningschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1216-custom-broker-invoice-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1216_CUSTOM_BROKER_INVOICE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1216custombrokerinvoiceschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1026-cleanup-scheduler-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1026_CLEANUP_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.erp1026cleanupschedulerenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1204-basware-clientinvoice-enabled-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1204_Basware_ClientInvoice_IsEnabled"
  label                  = ""
  enabled                = var.erp1204clientinvoiceenabledhcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1204-basware-file-upload-enable-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1204_Basware_ClientInvoice_IsFileUpload"
  label                  = ""
  enabled                = var.erp1204clientinvoicefileuploadenablehcare[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

#keys
resource "azurerm_app_configuration_key" "apimhosturl-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:APIMHOST"
  value                  = var.apimhosturl[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "baswareapihosturl-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:BASWARE_APIHOST"
  value                  = var.baswareapihosturl[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "baswaretokenapi-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:BASWARE_TOKEN_API"
  value                  = var.baswaretokenapi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "okperintaapihost-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:OkPerinta_APIHOST"
  value                  = var.okperintaapihost[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "exceptionhandlinguri-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:ExceptionHandlingURI"
  value                  = var.hcareexceptionhandlinguri[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "notificationtrigger-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:NotificationTrigger"
  value                  = var.endpointsnotificationtrigger[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "successnotificationtrigger-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:SuccessNotificationTrigger"
  value                  = var.successnotificationtrigger[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1026archivetrigger-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:ERP1026ArchiveTrigger"
  value                  = var.erp1026archivetrigger[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "enableemailnotification-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:EnableEmailNotification"
  value                  = var.enablenotification[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "nationalidentifiergermany-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:OnboardingNationalIdentifier_Germany"
  value                  = var.nationalidentifiergermany_bau[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "nationalidentifierfinland-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:OnboardingNationalIdentifier_Finland"
  value                  = var.nationalidentifierfinland_bau[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "tenantid-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:TENANT_ID"
  value                  = var.tenantid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "clientid-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:CLIENT_ID"
  value                  = var.clientid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "audience-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:AUDIENCE"
  value                  = var.audience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "standardprefix-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:STANDARDPREFIX"
  value                  = var.standardprefix[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1163bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1163_BIREPORT_DURATION_MIN"
  value                  = var.erp1163bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1144bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1144_BIREPORT_DURATION_MIN"
  value                  = var.erp1144bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1188bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1188_BIREPORT_DURATION_MIN"
  value                  = var.erp1188bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1142bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1142_BIREPORT_DURATION_MIN"
  value                  = var.erp1142bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1135bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1135_BIREPORT_DURATION_MIN"
  value                  = var.erp1135bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1149_BIREPORT_DURATION_MIN"
  value                  = var.erp1149bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1133bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1133_BIREPORT_DURATION_MIN"
  value                  = var.erp1133bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp10341071bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1034_1071_BIREPORT_DURATION_MIN"
  value                  = var.erp10341071bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1034_1071_1125_BIREPORT_DURATION_MIN"
  value                  = var.erp103410711125bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1159bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1159_BIREPORT_DURATION_MIN"
  value                  = var.erp1159bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1187bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1187_BIREPORT_DURATION_MIN"
  value                  = var.erp1187bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1156bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1156_BIREPORT_DURATION_MIN"
  value                  = var.erp1156bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1160bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1160_BIREPORT_DURATION_MIN"
  value                  = var.erp1160bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164accountbireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_ACCOUNT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164accountbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164contrasitebireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_CONTRATSITE_BIREPORT_DURATION_MIN"
  value                  = var.erp1164contrasitebireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164departmentbireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_DEPARTMENT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164departmentbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericaccountbireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_GENERICACCOUNT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164genericaccountbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericdepartmentbireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164genericdepartmentbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofcostbireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_TYPEOFCOST_BIREPORT_DURATION_MIN"
  value                  = var.erp1164typeofcostbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofservicebireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_BIREPORT_DURATION_MIN"
  value                  = var.erp1164typeofservicebireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1119exchangeratedatacount-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1119_EXCHANGERATE_DATA_COUNT"
  value                  = var.erp1119exchangeratedatacount[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1163projectoutboundscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1163_PROJECTOUTBOUND_SCHEDULER"
#   value                  = var.erp1163projectoutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1144projectactualscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1144_PROJECTACTUAL_SCHEDULER"
  value                  = var.erp1144projectactualscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1188invoicingscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1188_INVOICING_SCHEDULER"
#   value                  = var.erp1188invoicingscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1142deliverydatescheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1142_DELIVERY_DATE_SCHEDULER"
  value                  = var.erp1142deliverydatescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1157paymentfileinboundscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1157_PAYMENTFILE_INBOUND_SCHEDULER"
  value                  = var.erp1157paymentfileinboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1135inventoryscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1135_INVENTORY_SCHEDULER"
  value                  = var.erp1135inventoryscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149itembasepricey3ktrscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_Y3K_TR"
  value                  = var.erp1149itembasepricey3ktrscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1133productscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1133_PRODUCT_SCHEDULER"
  value                  = var.erp1133productscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "salesorderurlmappingfield-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:SalesOrderURLMappingField"
  value                  = var.salesorderurlmappingfieldhcare[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "sftpcheckhost-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:SftpCheckHost"
  value                  = var.sftpcheckhosthcare[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "sftpcheckuser-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:SftpCheckUser"
  value                  = var.sftpcheckuserhcare[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "sftpchecksshsecret-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:SftpCheckSSHSecret"
  value                  = var.sftpchecksshsecrethcare[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp10341071contractoutboundscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1034_1071_CONTRACT_OUTBOUND_SCHEDULER"
#   value                  = var.erp10341071contractoutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp103410711125ficontractoutboundscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_FI"
  value                  = var.erp103410711125ficontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125plcontractoutboundscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_PL"
  value                  = var.erp103410711125plcontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125nocontractoutboundscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_NO"
  value                  = var.erp103410711125nocontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125trcontractoutboundscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_TR"
  value                  = var.erp103410711125trcontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1119exchangeratesscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1119_EXCHANGERATES_SCHEDULER"
  value                  = var.erp1119exchangeratesscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1159supplieroutboundscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER"
#   value                  = var.erp1159supplieroutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1159supplieroutboundnoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_NO"
  value                  = var.erp1159supplieroutboundschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1159supplieroutboundfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_FI"
  value                  = var.erp1159supplieroutboundschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1187paymentstatusoutboundscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER"
#   value                  = var.erp1187paymentstatusoutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1187paymentstatusoutboundfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_FI"
  value                  = var.erp1187paymentstatusoutboundschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1187paymentstatusoutboundnoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_NO"
  value                  = var.erp1187paymentstatusoutboundschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1011technicianactualhoursscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1011_TECHNICIANACTUALHOURS_SCHEDULER"
  value                  = var.erp1011technicianactualhoursscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1156finnishreferencescheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1156_FINNISHREFERENCE_SCHEDULER"
#   value                  = var.erp1156finnishreferencescheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1160purchaseorderscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1160_PURCHASEORDER_SCHEDULER"
#   value                  = var.erp1160purchaseorderscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1160purchaseorderfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1160_PURCHASEORDER_SCHEDULER_FI"
  value                  = var.erp1160purchaseorderschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1160purchaseordernoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1160_PURCHASEORDER_SCHEDULER_NO"
  value                  = var.erp1160purchaseorderschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1164accountscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1164_ACCOUNT_SCHEDULER"
#   value                  = var.erp1164accountscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164contratsitescheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1164_CONTRATSITE_SCHEDULER"
#   value                  = var.erp1164contratsitescheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164departmentscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1164_DEPARTMENT_SCHEDULER"
#   value                  = var.erp1164departmentscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164genericaccountscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1164_GENERICACCOUNT_SCHEDULER"
#   value                  = var.erp1164genericaccountscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164genericdepartmentscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_SCHEDULER"
#   value                  = var.erp1164genericdepartmentscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164typeofcostscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1164_TYPEOFCOST_SCHEDULER"
#   value                  = var.erp1164typeofcostscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164typeofservicescheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_SCHEDULER"
#   value                  = var.erp1164typeofservicescheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1164accountfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_ACCOUNT_SCHEDULER_FI"
  value                  = var.erp1164accountschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164contratsitefischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_CONTRATSITE_SCHEDULER_FI"
  value                  = var.erp1164contratsiteschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164departmentfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_DEPARTMENT_SCHEDULER_FI"
  value                  = var.erp1164departmentschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericaccountfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_GENERICACCOUNT_SCHEDULER_FI"
  value                  = var.erp1164genericaccountschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericdepartmentfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_SCHEDULER_FI"
  value                  = var.erp1164genericdepartmentschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofcostfischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_TYPEOFCOST_SCHEDULER_FI"
  value                  = var.erp1164typeofcostschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofservicefischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_SCHEDULER_FI"
  value                  = var.erp1164typeofserviceschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164accountnoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_ACCOUNT_SCHEDULER_NO"
  value                  = var.erp1164accountschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164contratsitenoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_CONTRATSITE_SCHEDULER_NO"
  value                  = var.erp1164contratsiteschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164departmentnoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_DEPARTMENT_SCHEDULER_NO"
  value                  = var.erp1164departmentschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericaccountnoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_GENERICACCOUNT_SCHEDULER_NO"
  value                  = var.erp1164genericaccountschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericdepartmentnoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_SCHEDULER_NO"
  value                  = var.erp1164genericdepartmentschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofcostnoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_TYPEOFCOST_SCHEDULER_NO"
  value                  = var.erp1164typeofcostschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofservicenoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_SCHEDULER_NO"
  value                  = var.erp1164typeofserviceschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "integrationlisttodisable-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "DisableNotification:IntegrationListToDisable"
  value                  = var.appdisableintegrationlist[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "azurestorageaccountname-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AzureStorage:StorageAccountName"
  value                  = var.azurestorageaccountname[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1003supplierinvoicescheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1003_SUPPLIERINVOICE_SCHEDULER"
  value                  = var.erp1003supplierinvoicescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1151tookperintascheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1151_OKPerinta_SCHEDULER"
  value                  = var.erp1151tookperintascheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1151tookperintaupdatescheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1151_OKPerinta_Update_SCHEDULER"
  value                  = var.erp1151tookperintaupdateschedulerhcare[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erppcustomerprofile-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:p_Customer_profile"
  value                  = var.erppcustomerprofile[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erpcreditornr-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:CreditorNr"
  value                  = var.erpcreditornr[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1086employeequalificationscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:HCM_1086_EMPLOYEEQUALIFICATIONTRIGGER_SCHEDULER"
  value                  = var.hcm1086employeequalificationscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1088masterqualificationscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:HCM_1088_MASTERLISTQUALIFICATIONSTRIGGER_SCHEDULER"
  value                  = var.hcm1088masterqualificationscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1085absencedatascheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:HCM_1085_ABSENCEDATATRIGGER_SCHEDULER"
  value                  = var.hcm1085absencedatascheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1071crmsftpscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1071_CRMSFTP_SCHEDULER"
  value                  = var.erp1071crmsftpscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1026bireportduration-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1026_BIREPORT_DURATION_MIN"
  value                  = var.erp1026bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1026artransactionsscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1026_ARTRANSACTIONS_SCHEDULER"
  value                  = var.erp1026artransactionsscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "listofholidaysforwfmgrs-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "EndPoints:ListOfHolidaysForWfmGrs1014"
  value                  = var.listofholidaysforwfmgrs[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "grsclientid-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:GRS_CLIENT_ID"
  value                  = var.grsclientid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "grsaudience-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:GRSAUDIENCE"
  value                  = var.grsaudience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "northstaraudience-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:NORTHSTARAUDIENCE"
  value                  = var.northstaraudience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1136polandbankstatementscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1136_POLANDBANKSTATEMENT_SCHEDULER"
  value                  = var.erp1136polandbankstatementscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "cepkeyvaultconstrid-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "KeyVault:CepKeyVaultConStrId"
  value                  = var.cepkeyvaultconstridhcare[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "gipaudience-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:GIP_AUDIENCE_ID"
  value                  = var.gipaudience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1193supplieroutboundvdeskscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1193_SUPPLIEROUTBOUNDVDESK_SCHEDULER"
  value                  = var.erp1193supplieroutboundvdeskscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1193bireportdurationmin-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1193_BIREPORT_DURATION_MIN"
  value                  = var.erp1193bireportdurationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1155bireportdurationmin-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1155_BIREPORT_DURATION_MIN"
  value                  = var.erp1155bireportdurationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1066durationmin-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1066_DURATION_MIN"
  value                  = var.erp1066durationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1216durationmin-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1216_DURATION_MIN"
  value                  = var.erp1216durationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1132paymentfilevacationacrualscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1132_PAYMENTFILESVACATIONACRUAL_SCHEDULER"
  value                  = var.erp1132paymentfilevacationacrualscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1168supplierinvoicevdeskscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1168_SUPPLIERINVOICEVDESK_SCHEDULER"
  value                  = var.erp1168supplierinvoicevdeskscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastercompanyplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERCOMPANY_SCHEDULER_PL"
  value                  = var.erp1170segmentmastercompanyplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterprimaryledgerplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERPRIMARYLEDGER_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterprimaryledgerplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterdepartmentplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERDEPARTMENT_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterdepartmentplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasteraccountplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERACCOUNT_SCHEDULER_PL"
  value                  = var.erp1170segmentmasteraccountplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastercontractsiteplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERCONTRACTSITE_SCHEDULER_PL"
  value                  = var.erp1170segmentmastercontractsiteplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastertypeofcostplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERTYPE_OF_COST_SCHEDULER_PL"
  value                  = var.erp1170segmentmastertypeofcostplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastertypeofserviceplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERTYPE_OF_SERVICE_SCHEDULER_PL"
  value                  = var.erp1170segmentmastertypeofserviceplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterintercompanyplscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERINTERCOMPANY_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterintercompanyplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterfutureuse1plscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERFUTURE_USE1_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterfutureuse1plscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterfutureuse2plscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERFUTURE_USE2_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterfutureuse2plscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1149pricelistscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1149_PRICELIST_SCHEDULER"
#   value                  = var.erp1149pricelistscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1149itembasepricenoscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_NO"
  value                  = var.erp1149itembasepricenoscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149itembasepricetrscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_STT_TR"
  value                  = var.erp1149itembasepricetrscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149itembasepricefischeduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_FI"
  value                  = var.erp1149itembasepricefischeduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1155shipmentnotificationscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1155_SHIPMENTNOTIFICATION_SCHEDULER"
  value                  = var.erp1155shipmentnotificationscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1163projectboundschedulerfi-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1163_PROJECTOUTBOUND_SCHEDULER_FI"
  value                  = var.erp1163projectboundschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1163projectoutboundschedulerno-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1163_PROJECTOUTBOUND_SCHEDULER_NO"
  value                  = var.erp1163projectoutboundschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1111trackingnumberscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1111_TRACKINGNUMBER_SCHEDULER"
  value                  = var.erp1111trackingnumberscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1066customsbrokerscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1066_CUSTOMS_BROKER_SCHEDULER"
  value                  = var.erp1066customsbrokerscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1124licenseserverscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1124_LICENSESERVER_SCHEDULER"
  value                  = var.erp1124licenseserverscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1226invoicedffscheduler-hcare" {
#   count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
#   key                    = "AppConfig:ERP_1226_InvoiceDFF_SCHEDULER"
#   value                  = var.erp1226invoicedffscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1216custombrokerinvoicescheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:ERP_1216_CUSTOM_BROKER_INVOICE_SCHEDULER"
  value                  = var.erp1216custombrokerinvoicescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "reademailscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:READ_EMAIL_SCHEDULER"
  value                  = var.reademailscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "graphclientid-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AuthenticationConfig:Graph_CLIENT_ID"
  value                  = var.graphclientid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "smstemplate7-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:SMS_TEMPLATE7"
  value                  = var.smstemplate7[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "smstemplate9-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:SMS_TEMPLATE9"
  value                  = var.smstemplate9[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "smallerpdateformat-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:SMALLERP_DATE_FORMAT"
  value                  = var.smallerpdateformat[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "cpqbatchsize-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:CPQBatchSize"
  value                  = var.cpqbatchsize[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "cpqproductcleanupbatchsize-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:CPQProductCleanupBatchSize"
  value                  = var.cpqproductcleanupbatchsize[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1107peakonscheduler-hcare" {
  count = local.environment == "dev" || local.environment =="uat" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations_hcare_dfix[count.index].id
  key                    = "AppConfig:HCM_1107_PEAKON_SCHEDULER"
  value                  = var.hcm1107peakonschedulerhcare[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}
