resource "azurerm_network_interface" "az-sftpvm-nic" {
  
  name                = "sftpvm-nic"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "sftpvm-ipconfig"
    subnet_id                     = azurerm_subnet.localvmsssubnet.id
    private_ip_address_allocation = "Dynamic"
    #load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.local-sftp-vmss-bpool.id]
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "sftpnicassociation" {
  network_interface_id    = azurerm_network_interface.az-sftpvm-nic.id
  ip_configuration_name   = "sftpvm-ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.local-sftp-vmss-bpool.id
}
