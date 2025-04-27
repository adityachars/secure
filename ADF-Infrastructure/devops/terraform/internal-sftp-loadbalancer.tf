
# resource "azurerm_lb" "internal-sftp-vm-load-balancer" {
#   name                = var.internalsftplbname[local.environment]
#   location            = var.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   sku = "Standard"

#   frontend_ip_configuration {
#     name                 = var.privatesftpipconfig[local.environment]
#     subnet_id =  azurerm_subnet.localvmsssubnet.id 
#     private_ip_address = var.privatesftpip[local.environment]
#     private_ip_address_allocation = var.lbaltype
#   }
# }

# resource "azurerm_lb_backend_address_pool" "local-sftp-vm-bpool" {
#   resource_group_name = data.azurerm_resource_group.rg.name
#   loadbalancer_id     = azurerm_lb.internal-sftp-vm-load-balancer.id  
#   name                = "local-sftpBackEndAddressPool"

# }

# resource "azurerm_lb_rule" "local-sftp-vm-load-balancer-rule" {
#   resource_group_name            = data.azurerm_resource_group.rg.name
#   loadbalancer_id                = azurerm_lb.internal-sftp-vm-load-balancer.id 
#   name                           = "local-vmlbalrule"
#   protocol                       = "Tcp"
#   frontend_port                  = 5000
#   backend_port                   = 22
#   frontend_ip_configuration_name = azurerm_lb.internal-sftp-vm-load-balancer.frontend_ip_configuration[0].name
#   backend_address_pool_ids = [azurerm_lb_backend_address_pool.local-sftp-vm-bpool.id]
#   probe_id = azurerm_lb_probe.local-sftp-vm-health-probe.id
# }


# resource "azurerm_lb_probe" "local-sftp-vm-health-probe" {
#   resource_group_name = data.azurerm_resource_group.rg.name
#   loadbalancer_id     = azurerm_lb.internal-sftp-vm-load-balancer.id
#   name                = "local-vmprobe"
#   port                = 22
#   interval_in_seconds = 10
#   number_of_probes    = 3
#   protocol            = "tcp"
# }
