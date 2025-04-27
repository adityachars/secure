resource "azurerm_network_interface" "az-vm-internal-nic" {
  
  name                = var.localnicName[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = var.internalnicIpConfigName[local.environment]
    subnet_id                     = azurerm_subnet.localIRsubnet.id 
    private_ip_address_allocation = "Static"
    private_ip_address = var.internalprivate_ip[local.environment]
  
  }
}
