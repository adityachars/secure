resource "azurerm_log_analytics_workspace" "adf-common-log-analytics-workspace" {
  name                = var.adf_log_analytics_workspace_name[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name 
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "adf-common-log-analytics-solution" {
  solution_name         = "AzureDataFactoryAnalytics"
  location              = var.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id
  workspace_name        = azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureDataFactoryAnalytics"
  }
}

resource "azurerm_monitor_diagnostic_setting" "adf-common-log-analytics-disgnostic-settings" {
  name               = var.diagsetting[local.environment]
  target_resource_id = azurerm_data_factory.northstaradf.id 
  //storage_account_id = azurerm_storage_account.sa.id 
  log_analytics_workspace_id = azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id 
  log_analytics_destination_type = "Dedicated"
  log {
    category = "ActivityRuns"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
  log {
    category = "PipelineRuns"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
  log {
    category = "TriggerRuns"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_log_analytics_workspace" "vmss-common-log-analytics-workspace" {
  name                = var.vmss_log_analytics_workspace_name[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name 
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "adf-ir-log-analytics-solution" {
  solution_name         = "VMInsights"
  location              = var.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id
  workspace_name        = azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/VMInsights"
  }
}

# resource "azurerm_virtual_machine_extension" "adf-ir-windows-vm-dependency-agent-extension" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                  = "adf-ir-vm-dependency-agent-ext"
#   virtual_machine_id    = azurerm_windows_virtual_machine.irvm[count.index].id
#   publisher             = "Microsoft.Azure.Monitoring.DependencyAgent"
#   type                  = "DependencyAgentWindows"
#   type_handler_version  = "9.5"
 
#   settings = <<SETTINGS
#   {
#     "workspaceId": "${azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.workspace_id}"
#   }
#   SETTINGS
 
#   protected_settings = <<PROTECTED_SETTINGS
#   {
#     "workspaceKey": "${azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.primary_shared_key}"
#   }
#   PROTECTED_SETTINGS
# }

# resource "azurerm_virtual_machine_extension" "adf-ir-windows-vm-monitor-agent" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                  = "adf-ir-vm-monitor-agent-ext"
#   virtual_machine_id    = azurerm_windows_virtual_machine.irvm[count.index].id
#   publisher             = "Microsoft.EnterpriseCloud.Monitoring"
#   type                  = "MicrosoftMonitoringAgent"
#   type_handler_version  = "1.0"
 
#   settings = <<SETTINGS
#   {
#     "workspaceId": "${azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.workspace_id}"
#   }
#   SETTINGS
 
#   protected_settings = <<PROTECTED_SETTINGS
#   {
#     "workspaceKey": "${azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.primary_shared_key}"
#   }
#   PROTECTED_SETTINGS
# }
