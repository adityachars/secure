resource "azurerm_network_interface" "norway-turkey-vm-nic" {
  
  name                = var.norway-turkey-vm-nic[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = var.norway-turkeynicIpConfigName[local.environment]
    subnet_id                     = azurerm_subnet.localIRsubnet.id 
    private_ip_address_allocation = "Static"
    private_ip_address = var.norway-turkey-vm-private_ip[local.environment]
  }
}
