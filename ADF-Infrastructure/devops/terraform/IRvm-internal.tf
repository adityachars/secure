
resource "azurerm_lb" "internal-vmss-load-balancer" {
  name                = var.internalvmsslbname[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku = "Standard"

  frontend_ip_configuration {
    name                 = var.privatevmssipconfig[local.environment]
    subnet_id =  azurerm_subnet.localvmsssubnet.id 
    private_ip_address = var.private_ip[local.environment]
    private_ip_address_allocation = var.lbaltype
  }
}

resource "azurerm_lb_backend_address_pool" "local-sftp-vmss-bpool" {
  resource_group_name = data.azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.internal-vmss-load-balancer.id  
  name                = "local-vmssBackEndAddressPool"

}

resource "azurerm_lb_rule" "local-sftp-vmss-load-balancer-rule" {
  resource_group_name            = data.azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.internal-vmss-load-balancer.id 
  name                           = "local-vmsslbalrule"
  protocol                       = "Tcp"
  frontend_port                  = var.internalvmsslbport[local.environment]
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_lb.internal-vmss-load-balancer.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.local-sftp-vmss-bpool.id]
  probe_id = azurerm_lb_probe.local-sftp-vmss-health-probe.id
}


resource "azurerm_lb_probe" "local-sftp-vmss-health-probe" {
  resource_group_name = data.azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.internal-vmss-load-balancer.id
  name                = "local-vmssprobe"
  port                = 22
  interval_in_seconds = 60
  number_of_probes    = 3
  protocol            = "tcp"
}
