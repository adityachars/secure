resource "tls_private_key" "sftpvm-rootuser-sshkey" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "azurerm_key_vault_secret" "rootuser-sftppvtkey" {
  name         = "sftp-pvtkey"
  value        = tls_private_key.sftpvm-rootuser-sshkey.private_key_pem
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
}

resource "azurerm_linux_virtual_machine" "sftpvm" {
  name                = var.sftpvmName[local.environment]
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  size                = var.vmsize[local.environment]
  admin_username      = "adminuser"
  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.sftpvm-rootuser-sshkey.public_key_openssh
  }
  identity {
    type = "SystemAssigned"
  }
  network_interface_ids = [
    azurerm_network_interface.az-sftpvm-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer = var.image_offer
    sku = var.image_sku
    version = var.image_version
  }

  disable_password_authentication = true

}

resource "azurerm_management_lock" "sftpvm" {
  name       = var.sftpvmName[local.environment]
  scope      = azurerm_linux_virtual_machine.sftpvm.id
  lock_level = "CanNotDelete"
  notes      = "Locked because you are not authorized to delete"
}

# resource "azurerm_virtual_machine_extension" "myterraformvm" {
#   name = "falcon-sensor-install-linux"
#   virtual_machine_id = azurerm_linux_virtual_machine.sftpvm.id
#   publisher = "Microsoft.Azure.Extensions"
#   type = "CustomScript"
#   type_handler_version = "2.0"
#   ## TODO: work the variables into KeyVault
#   protected_settings = <<PROTECTED
#   {
#     "fileUris"        :  ["https://northstarstoragelab.blob.core.windows.net/sftp-container/cstrike.sh"],
#     "commandToExecute": "export FALCON_CID=${var.falcon_cid} && export FALCON_CLIENT_ID=${var.falcon_client_id} && export FALCON_CLIENT_SECRET=${var.falcon_client_secret} && export FALCON_CLOUD=${var.falcon_cloud} && /bin/bash falcon-linux-install.sh"
#   }
#   PROTECTED

# }

resource "azurerm_virtual_machine_extension" "sftpvmuserext" {
  name                         = var.localsftpvmext[local.environment]
  virtual_machine_id           = azurerm_linux_virtual_machine.sftpvm.id
  publisher                    = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.1"
  auto_upgrade_minor_version   = true
  settings = file("${path.module}/sftpfiles/localsftp${local.environment}.json")
}
