resource "azurerm_network_security_group" "localvmssnsg" {
  
  name                = var.localvmssnsg[local.environment]
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  

  security_rule {
    name                       = "ssh_oracle"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.oracleip[local.environment]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ssh_erp"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.erpip[local.environment]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ssh_adf_integration_runtime"
    priority                   = 140
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.internalprivate_ip[local.environment]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ssh_finland_ir"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.adf-finland-IR-ip[local.environment]
    destination_address_prefix = "*"
  }
  lifecycle {
    ignore_changes = [security_rule]
  }
 }

#Below two are Oracle team's IPs to be whitelisted only in lower environments
resource "azurerm_network_security_rule" "dev-env-local-nsg-rule-oracle-team-user1" {
  
  count = local.environment == "dev" || local.environment =="test" ? 1 : 0

    name                       = "local_ssh_oracle_team_1"
    priority                   = 180
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.oracleTeamUser1
    destination_address_prefix = "*"
    resource_group_name         = data.azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.localvmssnsg.name
}
resource "azurerm_network_security_rule" "dev-env-local-nsg-rule-oracle-team-user2" {
  
  count = local.environment == "dev" || local.environment =="test" ? 1 : 0 

    name                       = "local_ssh_oracle_team_2"
    priority                   = 250
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.oracleTeamUser2
    destination_address_prefix = "*"
    resource_group_name         = data.azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.localvmssnsg.name
}

 resource "azurerm_subnet_network_security_group_association" "localvmssnsg-assoc" {
  
  subnet_id                 = azurerm_subnet.localvmsssubnet.id  
  network_security_group_id = azurerm_network_security_group.localvmssnsg.id 
}

resource "azurerm_monitor_diagnostic_setting" "localnsg_diagnostic_setting" {

  name = "nsg-diagnostics-localvmss"
  target_resource_id = resource.azurerm_network_security_group.localvmssnsg.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.vmss-common-log-analytics-workspace.id

  dynamic "log" {
    for_each = var.nsg_log_category
    content {
      category = log.value
      enabled  = true
      retention_policy {
        enabled = false
        

      }
    }
 } 
}
