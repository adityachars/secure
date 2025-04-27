resource "azurerm_app_configuration" "api_app_configurations" {
    name = var.api_app_configurations_name[local.environment]
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    sku = "standard"
}

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "appconf_dataowner" {
  count = local.environment == "dev" || local.environment == "test" || local.environment == "uat" ? 1 : 0
  scope                = azurerm_app_configuration.api_app_configurations.id
  role_definition_name = "App Configuration Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}


resource "azurerm_app_configuration_feature" "hcm-1003-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1003_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1003schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1103-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1103_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1103schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1035-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1035_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1035schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1105-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "DependencySync (HCM to SR)"
  name                   = "HCM_1105_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1105schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1026-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "ConfigurationSync (HCM to SR)"
  name                   = "HCM_1026_CONFIGSYNC_SCHEDULER"
  label                  = ""
  enabled                = var.hcm1026schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1142-delivery-date-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1142_DELIVERY_DATE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1142deliverydateschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1135-inventory-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1135_INVENTORY_SCHEDULER"
  label                  = ""
  enabled                = var.erp1135inventoryschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembasepricey3ktr-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_Y3K_TR"
  label                  = ""
  enabled                = var.erp1149itembasepricey3ktrschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1133-product-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1133_PRODUCT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1133productschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1011-technicianactualhours-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1011_TECHNICIANACTUALHOURS_SCHEDULER"
  label                  = ""
  enabled                = var.erp1011technicianactualhoursschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1119-exchangerates-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1119_EXCHANGERATES_SCHEDULER"
  label                  = ""
  enabled                = var.erp1119exchangeratesschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1144-projectactual-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1144_PROJECTACTUAL_SCHEDULER"
  label                  = ""
  enabled                = var.erp1144projectactualschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1156-finnishreference-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1156_FINNISHREFERENCE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1156finnishreferenceschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1188-invoicing-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1188_INVOICING_SCHEDULER"
  label                  = ""
  enabled                = var.erp1188invoicingschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1157-paymentfile-inbound-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1157_PAYMENTFILE_INBOUND_SCHEDULER"
  label                  = ""
  enabled                = var.erp1157paymentfileinboundschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_feature" "erp-1034-1071-contract-outbound-scheduler-enabled" {
#   //count = local.environment == "test" || local.environment =="uat" || local.environment =="prod" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1034_1071_CONTRACT_OUTBOUND_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp10341071contractoutboundschedulerenabled[local.environment]
# }

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-FI-enabled" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp103410711125ficontractoutboundschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-PL-enabled" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp103410711125plcontractoutboundschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-NO-enabled" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp103410711125nocontractoutboundschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1034-1071-1125-contract-outbound-scheduler-TR-enabled" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_TR"
  label                  = ""
  enabled                = var.erp103410711125trcontractoutboundschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_feature" "erp-1159-supplier-outbound-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1159supplieroutboundschedulerenabled[local.environment]
# }

resource "azurerm_app_configuration_feature" "erp-1159-supplier-outbound-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1159supplieroutboundschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1159-supplier-outbound-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1159supplieroutboundschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_feature" "erp-1187-paymentstatus-outbound-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1187paymentstatusoutboundschedulerenabled[local.environment]
# }

resource "azurerm_app_configuration_feature" "erp-1187-paymentstatus-outbound-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1187paymentstatusoutboundschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1187-paymentstatus-outbound-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1187paymentstatusoutboundschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_feature" "erp-1163-projectoutbound-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1163_PROJECTOUTBOUND_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1163projectoutboundschedulerenabled[local.environment]
# }

# resource "azurerm_app_configuration_feature" "erp-1164-account-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1164_ACCOUNT_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1164accountschedulerenabled[local.environment]
# }

# resource "azurerm_app_configuration_feature" "erp-1164-contratsite-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1164_CONTRATSITE_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1164contratsiteschedulerenabled[local.environment]
# }

# resource "azurerm_app_configuration_feature" "erp-1164-department-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1164_DEPARTMENT_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1164departmentschedulerenabled[local.environment]
# }

# resource "azurerm_app_configuration_feature" "erp-1164-genericaccount-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1164_GENERICACCOUNT_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1164genericaccountschedulerenabled[local.environment]
# }

# resource "azurerm_app_configuration_feature" "erp-1164-genericdepartment-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1164_GENERICDEPARTMENT_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1164genericdepartmentschedulerenabled[local.environment]
# }

# resource "azurerm_app_configuration_feature" "erp-1164-typeofcost-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1164_TYPEOFCOST_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1164typeofcostschedulerenabled[local.environment]
# }

# resource "azurerm_app_configuration_feature" "erp-1164-typeofservice-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1164_TYPEOFSERVICE_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1164typeofserviceschedulerenabled[local.environment]
# }

resource "azurerm_app_configuration_feature" "erp-1164-account-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_ACCOUNT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164accountschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-contratsite-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_CONTRATSITE_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164contratsiteschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-department-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_DEPARTMENT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164departmentschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericaccount-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICACCOUNT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164genericaccountschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericdepartment-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICDEPARTMENT_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164genericdepartmentschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofcost-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFCOST_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164typeofcostschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofservice-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFSERVICE_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1164typeofserviceschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-account-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_ACCOUNT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164accountschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-contratsite-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_CONTRATSITE_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164contratsiteschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-department-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_DEPARTMENT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164departmentschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericaccount-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICACCOUNT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164genericaccountschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-genericdepartment-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_GENERICDEPARTMENT_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164genericdepartmentschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofcost-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFCOST_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164typeofcostschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1164-typeofservice-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1164_TYPEOFSERVICE_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1164typeofserviceschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_feature" "erp-1160-purchaseorder-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1160_PURCHASEORDER_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1160purchaseorderschedulerenabled[local.environment]
# }

resource "azurerm_app_configuration_feature" "erp-1160-purchaseorder-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1160_PURCHASEORDER_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1160purchaseorderschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1160-purchaseorder-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1160_PURCHASEORDER_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1160purchaseorderschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}
resource "azurerm_app_configuration_feature" "erp-1003-supplierinvoice-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1003_SUPPLIERINVOICE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1003supplierinvoiceschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "payload-logging-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "PAYLOAD_LOGGING_ENABLED"
  label                  = ""
  enabled                = var.payloadloggingenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1151-to-okperinta-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1151_OKPERINTA_SCHEDULER"
  label                  = ""
  enabled                = var.erptookperintaschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1086-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1086_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1086schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1085-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1085_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1085schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1088-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1088_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.hcm1088schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1071-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1071_CRMSFTP_SCHEDULER"
  label                  = ""
  enabled                = var.erp1071schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1026-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1026_ARTRANSACTIONS_SCHEDULER"
  label                  = ""
  enabled                = var.erp1026schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1193-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1193_SUPPLIEROUTBOUNDVDESK_SCHEDULER"
  label                  = ""
  enabled                = var.erp1193schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1132-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1132_PAYMENTFILESVACATIONACRUAL_SCHEDULER"
  label                  = ""
  enabled                = var.erp1132schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1168-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1168_SUPPLIERINVOICEVDESK_SCHEDULER"
  label                  = ""
  enabled                = var.erp1168schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERCOMPANY_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-primaryledger-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERPRIMARYLEDGER_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterprimaryledgerplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-department-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERDEPARTMENT_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterdepartmentplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-account-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERACCOUNT_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasteraccountplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-contractsite-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERCONTRACTSITE_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmastercontractsiteplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-typeofcost-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERTYPE_OF_COST_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmastertypeofcostplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-typeofservice-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERTYPE_OF_SERVICE_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmastertypeofserviceplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-intercompany-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERINTERCOMPANY_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterintercompanyplschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-futureuse1-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERFUTURE_USE1_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterfutureuse1plschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1170-segmentmaster-futureuse2-pl-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1170_SEGMENTMASTERFUTURE_USE2_SCHEDULER_PL"
  label                  = ""
  enabled                = var.erp1170segmentmasterfutureuse2plschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembaseprice-no-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1149itembasepricenoschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembaseprice-tr-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_STT_TR"
  label                  = ""
  enabled                = var.erp1149itembasepricetrschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1149-itembaseprice-fi-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1149_ITEMBASEPRICE_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1149itembasepricefischedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_feature" "erp-1149-pricelist-scheduler-enabled" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   description            = "True:Scheduler is on; False: Scheduler is off"
#   name                   = "ERP_1149_PRICELIST_SCHEDULER"
#   label                  = ""
#   enabled                = var.erp1149pricelistschedulerenabled[local.environment]
# }

resource "azurerm_app_configuration_feature" "erp-1155-shipmentnotification-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1155_SHIPMENTNOTIFICATION_SCHEDULER"
  label                  = ""
  enabled                = var.erp1155shipmentnotificationschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1136-polandbankstatement-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1136_POLANDBANKSTATEMENT_SCHEDULER"
  label                  = ""
  enabled                = var.erp1136polandbankstatementschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1163-projectoutbound-scheduler-fi-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1163_PROJECTOUTBOUND_SCHEDULER_FI"
  label                  = ""
  enabled                = var.erp1163projectoutboundschedulerfienabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1163-projectoutbound-scheduler-no-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1163_PROJECTOUTBOUND_SCHEDULER_NO"
  label                  = ""
  enabled                = var.erp1163projectoutboundschedulernoenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1111-trackingnumber-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1111_TRACKINGNUMBER_SCHEDULER"
  label                  = ""
  enabled                = var.erp1111trackingnumberschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1066-customs-broker-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1066_CUSTOMS_BROKER_SCHEDULER"
  label                  = ""
  enabled                = var.erp1066customsbrokerschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1209-kredinorpayupdate-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1209_KREDINORPAYMENTSUPDATES_SCHEDULER"
  label                  = ""
  enabled                = var.erp1209kredinorpayupdateenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1124-licenseserver-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1124_LICENSESERVER_SCHEDULER"
  label                  = ""
  enabled                = var.erp1124licenseserverschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1042-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1042_CLEANUP_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.erp1042schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1226-invoicedff-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1226_InvoiceDFF_SCHEDULER"
  label                  = ""
  enabled                = var.erp1226invoicedffschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1042-versioning-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1042_VERSIONING_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.erp1042versioningschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "read-email-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "READ_EMAIL_SCHEDULER"
  label                  = ""
  enabled                = var.reademailschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-finland-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Finland"
  label                  = ""
  enabled                = var.emailmoniteringfinlandenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-poland-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Poland"
  label                  = ""
  enabled                = var.emailmoniteringpolandenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-norway-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Norway"
  label                  = ""
  enabled                = var.emailmoniteringnorwayenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-turkey-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Turkey"
  label                  = ""
  enabled                = var.emailmoniteringturkeyenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-netherlands-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Netherlands"
  label                  = ""
  enabled                = var.emailmoniteringnetherlandsenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-germany-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_Germany"
  label                  = ""
  enabled                = var.emailmoniteringgermanyenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-prod-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_PROD"
  label                  = ""
  enabled                = var.emailmoniteringprodenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-hypercareuat-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_HypercareUAT"
  label                  = ""
  enabled                = var.emailmoniteringhypercareuatenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-test-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_TEST"
  label                  = ""
  enabled                = var.emailmoniteringtestenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-dev-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_DEV"
  label                  = ""
  enabled                = var.emailmoniteringdevenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-tr-wave2-uat-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_TR_WAVE2_UAT"
  label                  = ""
  enabled                = var.emailmoniteringtrwave2uatenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-tr-wave2-dev-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_TR_WAVE2_DEV"
  label                  = ""
  enabled                = var.emailmoniteringtrwave2devenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-hypercare-dev-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_HYPERCARE_DEV"
  label                  = ""
  enabled                = var.emailmoniteringhypercaredevenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-no-wave2-uat-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_NO_WAVE2_UAT"
  label                  = ""
  enabled                = var.emailmoniteringnowave2uatenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-no-wave2-dev-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_NO_WAVE2_DEV"
  label                  = ""
  enabled                = var.emailmoniteringnowave2devenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "emailmonitering-failure-reason-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "EmailMonitering_FailureReason"
  label                  = ""
  enabled                = var.emailmoniteringfailurereasonenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1216-custom-broker-invoice-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1216_CUSTOM_BROKER_INVOICE_SCHEDULER"
  label                  = ""
  enabled                = var.erp1216custombrokerinvoiceschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1026-cleanup-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1026_CLEANUP_SCHEDULER_ENABLED"
  label                  = ""
  enabled                = var.erp1026cleanupschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1227-eway-bill-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1227_EWAY_BILL_SCHEDULER"
  label                  = ""
  enabled                = var.erp1227ewaybillschedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "hcm-1107-scheduler-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "HCM_1107_PEAKON_SCHEDULER"
  label                  = ""
  enabled                = var.hcm1107schedulerenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1204-basware-clientinvoice-enabled" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1204_Basware_ClientInvoice_IsEnabled"
  label                  = ""
  enabled                = var.erp1204clientinvoiceenabled[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_feature" "erp-1204-basware-file-upload-enable" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  description            = "True:Scheduler is on; False: Scheduler is off"
  name                   = "ERP_1204_Basware_ClientInvoice_IsFileUpload"
  label                  = ""
  enabled                = var.erp1204clientinvoicefileuploadenable[local.environment]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

#keys
resource "azurerm_app_configuration_key" "apimhosturl" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:APIMHOST"
  value                  = var.apimhosturl[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "baswareapihosturl" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:BASWARE_APIHOST"
  value                  = var.baswareapihosturl[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "baswaretokenapi" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:BASWARE_TOKEN_API"
  value                  = var.baswaretokenapi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "okperintaapihost" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:OkPerinta_APIHOST"
  value                  = var.okperintaapihost[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "exceptionhandlinguri" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:ExceptionHandlingURI"
  value                  = var.exceptionhandlinguri[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "notificationtrigger" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:NotificationTrigger"
  value                  = var.endpointsnotificationtrigger[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "successnotificationtrigger" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:SuccessNotificationTrigger"
  value                  = var.successnotificationtrigger[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1026archivetrigger" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:ERP1026ArchiveTrigger"
  value                  = var.erp1026archivetrigger[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "enableemailnotification" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:EnableEmailNotification"
  value                  = var.enablenotification[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "nationalidentifiergermany" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:OnboardingNationalIdentifier_Germany"
  value                  = var.nationalidentifiergermany[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "nationalidentifierfinland" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:OnboardingNationalIdentifier_Finland"
  value                  = var.nationalidentifierfinland[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "tenantid" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:TENANT_ID"
  value                  = var.tenantid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "clientid" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:CLIENT_ID"
  value                  = var.clientid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "audience" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:AUDIENCE"
  value                  = var.audience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "standardprefix" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:STANDARDPREFIX"
  value                  = var.standardprefix[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1163bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1163_BIREPORT_DURATION_MIN"
  value                  = var.erp1163bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1144bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1144_BIREPORT_DURATION_MIN"
  value                  = var.erp1144bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1188bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1188_BIREPORT_DURATION_MIN"
  value                  = var.erp1188bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1142bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1142_BIREPORT_DURATION_MIN"
  value                  = var.erp1142bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1135bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1135_BIREPORT_DURATION_MIN"
  value                  = var.erp1135bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1149_BIREPORT_DURATION_MIN"
  value                  = var.erp1149bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1133bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1133_BIREPORT_DURATION_MIN"
  value                  = var.erp1133bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp10341071bireportduration" {
  //count = local.environment == "test" || local.environment =="uat" || local.environment =="prod" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1034_1071_BIREPORT_DURATION_MIN"
  value                  = var.erp10341071bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125bireportduration" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1034_1071_1125_BIREPORT_DURATION_MIN"
  value                  = var.erp103410711125bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1159bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1159_BIREPORT_DURATION_MIN"
  value                  = var.erp1159bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1187bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1187_BIREPORT_DURATION_MIN"
  value                  = var.erp1187bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1156bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1156_BIREPORT_DURATION_MIN"
  value                  = var.erp1156bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1160bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1160_BIREPORT_DURATION_MIN"
  value                  = var.erp1160bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164accountbireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_ACCOUNT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164accountbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164contrasitebireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_CONTRATSITE_BIREPORT_DURATION_MIN"
  value                  = var.erp1164contrasitebireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164departmentbireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_DEPARTMENT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164departmentbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericaccountbireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_GENERICACCOUNT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164genericaccountbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericdepartmentbireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_BIREPORT_DURATION_MIN"
  value                  = var.erp1164genericdepartmentbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofcostbireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_TYPEOFCOST_BIREPORT_DURATION_MIN"
  value                  = var.erp1164typeofcostbireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofservicebireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_BIREPORT_DURATION_MIN"
  value                  = var.erp1164typeofservicebireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1119exchangeratedatacount" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1119_EXCHANGERATE_DATA_COUNT"
  value                  = var.erp1119exchangeratedatacount[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1163projectoutboundscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1163_PROJECTOUTBOUND_SCHEDULER"
#   value                  = var.erp1163projectoutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1144projectactualscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1144_PROJECTACTUAL_SCHEDULER"
  value                  = var.erp1144projectactualscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1188invoicingscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1188_INVOICING_SCHEDULER"
#   value                  = var.erp1188invoicingscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1142deliverydatescheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1142_DELIVERY_DATE_SCHEDULER"
  value                  = var.erp1142deliverydatescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1157paymentfileinboundscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1157_PAYMENTFILE_INBOUND_SCHEDULER"
  value                  = var.erp1157paymentfileinboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1135inventoryscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1135_INVENTORY_SCHEDULER"
  value                  = var.erp1135inventoryscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149itembasepricey3ktrscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_Y3K_TR"
  value                  = var.erp1149itembasepricey3ktrscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1133productscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1133_PRODUCT_SCHEDULER"
  value                  = var.erp1133productscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "salesorderurlmappingfield" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:SalesOrderURLMappingField"
  value                  = var.salesorderurlmappingfield[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "sftpcheckhost" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:SftpCheckHost"
  value                  = var.sftpcheckhost[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "sftpcheckuser" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:SftpCheckUser"
  value                  = var.sftpcheckuser[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "sftpchecksshsecret" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:SftpCheckSSHSecret"
  value                  = var.sftpchecksshsecret[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp10341071contractoutboundscheduler" {
#   //count = local.environment == "test" || local.environment =="uat" || local.environment =="prod" ? 1 : 0
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1034_1071_CONTRACT_OUTBOUND_SCHEDULER"
#   value                  = var.erp10341071contractoutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp103410711125ficontractoutboundscheduler" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_FI"
  value                  = var.erp103410711125ficontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125plcontractoutboundscheduler" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_PL"
  value                  = var.erp103410711125plcontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125nocontractoutboundscheduler" {
  //count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_NO"
  value                  = var.erp103410711125nocontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp103410711125trcontractoutboundscheduler" {
 // count = local.environment == "dev" ? 1 : 0
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1034_1071_1125_CONTRACT_OUTBOUND_SCHEDULER_TR"
  value                  = var.erp103410711125trcontractoutboundscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1119exchangeratesscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1119_EXCHANGERATES_SCHEDULER"
  value                  = var.erp1119exchangeratesscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1159supplieroutboundscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER"
#   value                  = var.erp1159supplieroutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1159supplieroutboundnoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_NO"
  value                  = var.erp1159supplieroutboundschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1159supplieroutboundfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1159_SUPPLIER_OUTBOUND_SCHEDULER_FI"
  value                  = var.erp1159supplieroutboundschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1187paymentstatusoutboundscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER"
#   value                  = var.erp1187paymentstatusoutboundscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1187paymentstatusoutboundfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_FI"
  value                  = var.erp1187paymentstatusoutboundschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1187paymentstatusoutboundnoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1187_PAYMENTSTATUS_OUTBOUND_SCHEDULER_NO"
  value                  = var.erp1187paymentstatusoutboundschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1011technicianactualhoursscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1011_TECHNICIANACTUALHOURS_SCHEDULER"
  value                  = var.erp1011technicianactualhoursscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1156finnishreferencescheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1156_FINNISHREFERENCE_SCHEDULER"
#   value                  = var.erp1156finnishreferencescheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1160purchaseorderscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1160_PURCHASEORDER_SCHEDULER"
#   value                  = var.erp1160purchaseorderscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1160purchaseorderfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1160_PURCHASEORDER_SCHEDULER_FI"
  value                  = var.erp1160purchaseorderschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1160purchaseordernoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1160_PURCHASEORDER_SCHEDULER_NO"
  value                  = var.erp1160purchaseorderschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1164accountscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1164_ACCOUNT_SCHEDULER"
#   value                  = var.erp1164accountscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164contratsitescheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1164_CONTRATSITE_SCHEDULER"
#   value                  = var.erp1164contratsitescheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164departmentscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1164_DEPARTMENT_SCHEDULER"
#   value                  = var.erp1164departmentscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164genericaccountscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1164_GENERICACCOUNT_SCHEDULER"
#   value                  = var.erp1164genericaccountscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164genericdepartmentscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_SCHEDULER"
#   value                  = var.erp1164genericdepartmentscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164typeofcostscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1164_TYPEOFCOST_SCHEDULER"
#   value                  = var.erp1164typeofcostscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

# resource "azurerm_app_configuration_key" "erp1164typeofservicescheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_SCHEDULER"
#   value                  = var.erp1164typeofservicescheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1164accountfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_ACCOUNT_SCHEDULER_FI"
  value                  = var.erp1164accountschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164contratsitefischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_CONTRATSITE_SCHEDULER_FI"
  value                  = var.erp1164contratsiteschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164departmentfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_DEPARTMENT_SCHEDULER_FI"
  value                  = var.erp1164departmentschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericaccountfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_GENERICACCOUNT_SCHEDULER_FI"
  value                  = var.erp1164genericaccountschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericdepartmentfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_SCHEDULER_FI"
  value                  = var.erp1164genericdepartmentschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofcostfischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_TYPEOFCOST_SCHEDULER_FI"
  value                  = var.erp1164typeofcostschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofservicefischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_SCHEDULER_FI"
  value                  = var.erp1164typeofserviceschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164accountnoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_ACCOUNT_SCHEDULER_NO"
  value                  = var.erp1164accountschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164contratsitenoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_CONTRATSITE_SCHEDULER_NO"
  value                  = var.erp1164contratsiteschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164departmentnoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_DEPARTMENT_SCHEDULER_NO"
  value                  = var.erp1164departmentschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericaccountnoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_GENERICACCOUNT_SCHEDULER_NO"
  value                  = var.erp1164genericaccountschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164genericdepartmentnoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_GENERICDEPARTMENT_SCHEDULER_NO"
  value                  = var.erp1164genericdepartmentschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofcostnoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_TYPEOFCOST_SCHEDULER_NO"
  value                  = var.erp1164typeofcostschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1164typeofservicenoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1164_TYPEOFSERVICE_SCHEDULER_NO"
  value                  = var.erp1164typeofserviceschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "integrationlisttodisable" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "DisableNotification:IntegrationListToDisable"
  value                  = var.appdisableintegrationlist[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "azurestorageaccountname" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AzureStorage:StorageAccountName"
  value                  = var.azurestorageaccountname[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1003supplierinvoicescheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1003_SUPPLIERINVOICE_SCHEDULER"
  value                  = var.erp1003supplierinvoicescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1151tookperintascheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1151_OKPerinta_SCHEDULER"
  value                  = var.erp1151tookperintascheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1151tookperintaupdatescheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1151_OKPerinta_Update_SCHEDULER"
  value                  = var.erp1151tookperintaupdatescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erppcustomerprofile" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:p_Customer_profile"
  value                  = var.erppcustomerprofile[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erpcreditornr" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:CreditorNr"
  value                  = var.erpcreditornr[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1086employeequalificationscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:HCM_1086_EMPLOYEEQUALIFICATIONTRIGGER_SCHEDULER"
  value                  = var.hcm1086employeequalificationscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1088masterqualificationscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:HCM_1088_MASTERLISTQUALIFICATIONSTRIGGER_SCHEDULER"
  value                  = var.hcm1088masterqualificationscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1085absencedatascheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:HCM_1085_ABSENCEDATATRIGGER_SCHEDULER"
  value                  = var.hcm1085absencedatascheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1071crmsftpscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1071_CRMSFTP_SCHEDULER"
  value                  = var.erp1071crmsftpscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1026bireportduration" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1026_BIREPORT_DURATION_MIN"
  value                  = var.erp1026bireportduration[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1026artransactionsscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1026_ARTRANSACTIONS_SCHEDULER"
  value                  = var.erp1026artransactionsscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "listofholidaysforwfmgrs" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "EndPoints:ListOfHolidaysForWfmGrs1014"
  value                  = var.listofholidaysforwfmgrs[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "grsclientid" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:GRS_CLIENT_ID"
  value                  = var.grsclientid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "grsaudience" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:GRSAUDIENCE"
  value                  = var.grsaudience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "northstaraudience" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:NORTHSTARAUDIENCE"
  value                  = var.northstaraudience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1136polandbankstatementscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1136_POLANDBANKSTATEMENT_SCHEDULER"
  value                  = var.erp1136polandbankstatementscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "cepkeyvaultconstrid" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "KeyVault:CepKeyVaultConStrId"
  value                  = var.cepkeyvaultconstrid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "gipaudience" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:GIP_AUDIENCE_ID"
  value                  = var.gipaudience[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1193supplieroutboundvdeskscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1193_SUPPLIEROUTBOUNDVDESK_SCHEDULER"
  value                  = var.erp1193supplieroutboundvdeskscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1193bireportdurationmin" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1193_BIREPORT_DURATION_MIN"
  value                  = var.erp1193bireportdurationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1155bireportdurationmin" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1155_BIREPORT_DURATION_MIN"
  value                  = var.erp1155bireportdurationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1227bireportdurationmin" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1227_BIREPORT_DURATION_MIN"
  value                  = var.erp1227bireportdurationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1066durationmin" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1066_DURATION_MIN"
  value                  = var.erp1066durationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1216durationmin" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1216_DURATION_MIN"
  value                  = var.erp1216durationmin[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1132paymentfilevacationacrualscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1132_PAYMENTFILESVACATIONACRUAL_SCHEDULER"
  value                  = var.erp1132paymentfilevacationacrualscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1168supplierinvoicevdeskscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1168_SUPPLIERINVOICEVDESK_SCHEDULER"
  value                  = var.erp1168supplierinvoicevdeskscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastercompanyplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERCOMPANY_SCHEDULER_PL"
  value                  = var.erp1170segmentmastercompanyplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterprimaryledgerplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERPRIMARYLEDGER_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterprimaryledgerplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterdepartmentplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERDEPARTMENT_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterdepartmentplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasteraccountplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERACCOUNT_SCHEDULER_PL"
  value                  = var.erp1170segmentmasteraccountplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastercontractsiteplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERCONTRACTSITE_SCHEDULER_PL"
  value                  = var.erp1170segmentmastercontractsiteplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastertypeofcostplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERTYPE_OF_COST_SCHEDULER_PL"
  value                  = var.erp1170segmentmastertypeofcostplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmastertypeofserviceplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERTYPE_OF_SERVICE_SCHEDULER_PL"
  value                  = var.erp1170segmentmastertypeofserviceplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterintercompanyplscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERINTERCOMPANY_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterintercompanyplscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterfutureuse1plscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERFUTURE_USE1_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterfutureuse1plscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1170segmentmasterfutureuse2plscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1170_SEGMENTMASTERFUTURE_USE2_SCHEDULER_PL"
  value                  = var.erp1170segmentmasterfutureuse2plscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1149pricelistscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1149_PRICELIST_SCHEDULER"
#   value                  = var.erp1149pricelistscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1149itembasepricenoscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_NO"
  value                  = var.erp1149itembasepricenoscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149itembasepricetrscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_STT_TR"
  value                  = var.erp1149itembasepricetrscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1149itembasepricefischeduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1149_ITEMBASEPRICE_SCHEDULER_FI"
  value                  = var.erp1149itembasepricefischeduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1155shipmentnotificationscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1155_SHIPMENTNOTIFICATION_SCHEDULER"
  value                  = var.erp1155shipmentnotificationscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1163projectboundschedulerfi" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1163_PROJECTOUTBOUND_SCHEDULER_FI"
  value                  = var.erp1163projectboundschedulerfi[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1163projectoutboundschedulerno" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1163_PROJECTOUTBOUND_SCHEDULER_NO"
  value                  = var.erp1163projectoutboundschedulerno[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1111trackingnumberscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1111_TRACKINGNUMBER_SCHEDULER"
  value                  = var.erp1111trackingnumberscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1066customsbrokerscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1066_CUSTOMS_BROKER_SCHEDULER"
  value                  = var.erp1066customsbrokerscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1209kredinorpayupdatescheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1209_KREDINORPAYMENTSUPDATES_SCHEDULER"
  value                  = var.erp1209kredinorpayupdatescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

# resource "azurerm_app_configuration_key" "erp1226invoicedffscheduler" {
#   configuration_store_id = azurerm_app_configuration.api_app_configurations.id
#   key                    = "AppConfig:ERP_1226_InvoiceDFF_SCHEDULER"
#   value                  = var.erp1226invoicedffscheduler[local.environment]
#   depends_on             = [azurerm_role_assignment.appconf_dataowner]
# }

resource "azurerm_app_configuration_key" "erp1216custombrokerinvoicescheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1216_CUSTOM_BROKER_INVOICE_SCHEDULER"
  value                  = var.erp1216custombrokerinvoicescheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1227ewaybillscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1227_EWAY_BILL_SCHEDULER"
  value                  = var.erp1227ewaybillscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "erp1124licenseserverscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:ERP_1124_LICENSESERVER_SCHEDULER"
  value                  = var.erp1124licenseserverscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "reademailscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:READ_EMAIL_SCHEDULER"
  value                  = var.reademailscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "graphclientid" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AuthenticationConfig:Graph_CLIENT_ID"
  value                  = var.graphclientid[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "smstemplate7" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:SMS_TEMPLATE7"
  value                  = var.smstemplate7[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "smstemplate9" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:SMS_TEMPLATE9"
  value                  = var.smstemplate9[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "smallerpdateformat" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:SMALLERP_DATE_FORMAT"
  value                  = var.smallerpdateformat[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "cpqbatchsize" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:CPQBatchSize"
  value                  = var.cpqbatchsize[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "cpqproductcleanupbatchsize" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:CPQProductCleanupBatchSize"
  value                  = var.cpqproductcleanupbatchsize[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}

resource "azurerm_app_configuration_key" "hcm1107peakonscheduler" {
  configuration_store_id = azurerm_app_configuration.api_app_configurations.id
  key                    = "AppConfig:HCM_1107_PEAKON_SCHEDULER"
  value                  = var.hcm1107peakonscheduler[local.environment]
  depends_on             = [azurerm_role_assignment.appconf_dataowner]
  lifecycle {
    ignore_changes = [ configuration_store_id ]
  }
}
