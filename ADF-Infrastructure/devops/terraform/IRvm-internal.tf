resource "azurerm_windows_virtual_machine" "internal-irvm-win" {
  name                = var.internalIRvmName[local.environment]
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  size                = var.irvmsize[local.environment]
  computer_name       = var.computername[local.environment]
  admin_username      = "adminuser"
  admin_password      = azurerm_key_vault_secret.adf-integration-runtime-vm-password.value
  network_interface_ids = [
    azurerm_network_interface.az-vm-internal-nic.id,
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

resource "azurerm_management_lock" "internal-irvm-win" {
  name       = var.internalIRvmName[local.environment]
  scope      = azurerm_windows_virtual_machine.internal-irvm-win.id
  lock_level = "CanNotDelete"
  notes      = "Locked because you are not authorized to delete"
}

# resource "azurerm_virtual_machine_extension" "internal-irvm-ext" {
#   name                 = "internal-adf-IR"
#   virtual_machine_id   = azurerm_windows_virtual_machine.internal-irvm-win.id 
#   publisher            = "Microsoft.Compute"
#   type                 = "CustomScriptExtension"
#   type_handler_version = "1.10"


#   settings = jsonencode({
#     "fileUris"         = ["https://raw.githubusercontent.com/Azure/azure-quickstart-templates/00b79d2102c88b56502a63041936ef4dd62cf725/101-vms-with-selfhost-integration-runtime/gatewayInstall.ps1"],
#     "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File gatewayInstall.ps1 ${azurerm_data_factory_integration_runtime_self_hosted.northstaradfinternal.auth_key_1} && timeout /t 120"
#   })

# }
