resource "azurerm_monitor_action_group" "email_alert" {
  name                = var.adf_IR_email_alert_name[local.environment]
  resource_group_name = data.azurerm_resource_group.rg.name
  short_name          = "email-alert"

   email_receiver {
    name                    = "sendtoAdmin"
    email_address           = "rohan.reddy@securitas.com"
    use_common_alert_schema = true
  }

}

// Here we are defining the metric
# resource "azurerm_monitor_metric_alert" "Network_Threshold_alert" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                = "Network-Threshold-alert"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   scopes              = [azurerm_windows_virtual_machine.irvm[count.index].id]
#   description         = "The alert will be sent if the Network Out bytes exceeds 70 bytes"

#   criteria {
#     metric_namespace = "Microsoft.Compute/virtualMachines"
#     metric_name      = "Network Out Total"
#     aggregation      = "Total"
#     operator         = "GreaterThan"
#     threshold        = 70    
#   }

#   action {
#     action_group_id = azurerm_monitor_action_group.email_alert.id
#   }

# }
