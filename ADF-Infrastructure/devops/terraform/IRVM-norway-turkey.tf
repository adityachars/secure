resource "azurerm_windows_virtual_machine" "norway-turkey-irvm-win" {
  name                = var.norway-turkeyIRvmName[local.environment]
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  size                = var.irvmsize[local.environment]
  computer_name       = var.norway-turkey-computername[local.environment]
  admin_username      = "adminuser"
  admin_password      = azurerm_key_vault_secret.adf-integration-runtime-norway-turkey-vm-password.value
  network_interface_ids = [
    azurerm_network_interface.norway-turkey-vm-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = var.irvmimageoffer[local.environment]
    sku       = var.irvmsku[local.environment]
    version   = "latest"
  }
}

resource "azurerm_management_lock" "norway-turkey-irvm-win-management_lock" {
  name       = var.norway-turkeyIRvmName[local.environment]
  scope      = azurerm_windows_virtual_machine.norway-turkey-irvm-win.id
  lock_level = "CanNotDelete"
  notes      = "Locked because you are not authorized to delete"
}
