data "azurerm_client_config" "current" {}

locals {
  current_year    = formatdate("YYYY", timestamp())
  expiration_year = tonumber(local.current_year) + 2
  expiration_date = replace(timestamp(), local.current_year, local.expiration_year)
}

resource "azurerm_key_vault" "key_vault" {
  name                = var.keyvaultname[local.environment]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "get",
    ]
    secret_permissions = [
      "get", "backup", "delete", "list", "purge", "recover", "restore", "set",
    ]
    storage_permissions = [
      "get",
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_data_factory.northstaradf.identity[0].principal_id

    secret_permissions = [
        "get", "list"
      ]
    }

  lifecycle {
    ignore_changes = [access_policy]
  }
}

resource "azurerm_key_vault_access_policy" "access-policy-adf-nr-tk" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_data_factory.northstaradfwave2.identity[0].principal_id
  secret_permissions = [
        "get", "list"
  ]
}

resource "azurerm_key_vault_access_policy" "access-policy-Hcaredevadf-nr-tk" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_data_factory.northstarhcareadf[count.index].identity[0].principal_id
  secret_permissions = [
        "get", "list"
  ]
}

resource "tls_private_key" "sftp-user-vmss-ssh" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "sftpuser-pvkey" {
  name         = "sftpuser-privatekey"
  value        = trimspace(tls_private_key.sftp-user-vmss-ssh.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "sftpuser-pvkey-openssh" {
  name         = "sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.sftpuser-pvkey.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "sftpuser-pubkey" {
  name         = "sftpuser-publickey"
  value        = tls_private_key.sftp-user-vmss-ssh.public_key_openssh
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

# IR 
resource "random_string" "vm_password" {
  length  = 16
  special = true
}
resource "azurerm_key_vault_secret" "adf-integration-runtime-vm-password" {
  name         = "adf-integration-runtime-vm-password"
  value        = random_string.vm_password.result
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
}

# Norway-Turkey-IR 
resource "random_string" "norway-turkey-vm_password" {
  length  = 16
  special = true
}
resource "azurerm_key_vault_secret" "adf-integration-runtime-norway-turkey-vm-password" {
  name         = "adf-integration-runtime-norway-turkey-vm-password"
  value        = random_string.norway-turkey-vm_password.result
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
}

#HCM sftp user
resource "tls_private_key" "hcm-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "hcm-sftp-user-private-key" {
  name         = "hcm-sftpuser-privatekey"
  value        = trimspace(tls_private_key.hcm-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "hcm-sftp-user-private-key-openssh" {
  name         = "hcm-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.hcm-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "hcm-sftpuser-pubkey" {
  name         = "hcm-sftpuser-publickey"
  value        = trimspace(tls_private_key.hcm-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#ERP sftp user
resource "tls_private_key" "erp-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "erp-sftp-user-private-key" {
  name         = "erp-sftpuser-privatekey"
  value        = trimspace(tls_private_key.erp-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "erp-sftp-user-private-key-openssh" {
  name         = "erp-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.erp-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "erp-sftpuser-pubkey" {
  name         = "erp-sftpuser-publickey"
  value        = trimspace(tls_private_key.erp-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#WFM sftp user
resource "tls_private_key" "wfm-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "wfm-sftp-user-private-key" {
  name         = "wfm-sftpuser-privatekey"
  value        = trimspace(tls_private_key.wfm-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "wfm-sftp-user-private-key-openssh" {
  name         = "wfm-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.wfm-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "wfm-sftpuser-pubkey" {
  name         = "wfm-sftpuser-publickey"
  value        = trimspace(tls_private_key.wfm-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "tls_private_key" "wfm-bau-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "wfm-bau-sftp-user-private-key" {
  name         = "wfm-bau-sftpuser-privatekey"
  value        = trimspace(tls_private_key.wfm-bau-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "wfm-bau-sftp-user-private-key-openssh" {
  name         = "wfm-bau-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.wfm-bau-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "wfm-bau-sftpuser-pubkey" {
  name         = "wfm-bau-sftpuser-publickey"
  value        = trimspace(tls_private_key.wfm-bau-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#SEB_BANK sftp user
resource "tls_private_key" "seb-bank-sftp-user-vmss-ssh-key" {
  count = local.environment == "dev" ? 1 : 0 
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "seb-bank-sftp-user-private-key" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "seb-bank-sftpuser-privatekey"
  value        = trimspace(tls_private_key.seb-bank-sftp-user-vmss-ssh-key[count.index].private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "seb-bank-sftp-user-private-key-openssh" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "seb-bank-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.seb-bank-sftp-user-private-key[count.index].value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "seb-bank-sftpuser-pubkey" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "seb-bank-sftpuser-publickey"
  value        = trimspace(tls_private_key.seb-bank-sftp-user-vmss-ssh-key[count.index].public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#DNB
resource "tls_private_key" "dnb-bank-sftp-user-vmss-ssh-key" {
  count = local.environment == "dev" ? 1 : 0 
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "dnb-bank-sftp-user-private-key" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "dnb-bank-sftpuser-privatekey"
  value        = trimspace(tls_private_key.dnb-bank-sftp-user-vmss-ssh-key[count.index].private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "dnb-bank-sftp-user-private-key-openssh" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "dnb-bank-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.dnb-bank-sftp-user-private-key[count.index].value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "dnb-bank-sftpuser-pubkey" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "dnb-bank-sftpuser-publickey"
  value        = trimspace(tls_private_key.dnb-bank-sftp-user-vmss-ssh-key[count.index].public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#POLAND boundary key
resource "tls_private_key" "poland-boundary-sftp-user-vmss-ssh-key" {
  count = local.environment == "dev" ? 1 : 0 
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "poland-boundary-sftp-user-private-key" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "poland-boundary-sftpuser-privatekey"
  value        = trimspace(tls_private_key.poland-boundary-sftp-user-vmss-ssh-key[count.index].private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "poland-boundary-sftp-user-private-key-openssh" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "poland-boundary-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.poland-boundary-sftp-user-private-key[count.index].value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "poland-boundary-sftpuser-pubkey" {
  count = local.environment == "dev" ? 1 : 0 
  name         = "poland-boundary-sftpuser-publickey"
  value        = trimspace(tls_private_key.poland-boundary-sftp-user-vmss-ssh-key[count.index].public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#erp-bau sftp user
resource "tls_private_key" "erp-bau-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "erp-bau-sftp-user-private-key" {
  name         = "erp-bau-sftpuser-privatekey"
  value        = trimspace(tls_private_key.erp-bau-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "erp-bau-sftp-user-private-key-openssh" {
  name         = "erp-bau-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.erp-bau-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "erp-bau-sftpuser-pubkey" {
  name         = "erp-bau-sftpuser-publickey"
  value        = trimspace(tls_private_key.erp-bau-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#hcm-bau sftp user
resource "tls_private_key" "hcm-bau-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "hcm-bau-sftp-user-private-key" {
  name         = "hcm-bau-sftpuser-privatekey"
  value        = trimspace(tls_private_key.hcm-bau-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "hcm-bau-sftp-user-private-key-openssh" {
  name         = "hcm-bau-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.hcm-bau-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "hcm-bau-sftpuser-pubkey" {
  name         = "hcm-bau-sftpuser-publickey"
  value        = trimspace(tls_private_key.hcm-bau-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#basware sftp user
resource "tls_private_key" "basware-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "basware-sftp-user-private-key" {
  name         = "basware-sftpuser-privatekey"
  value        = trimspace(tls_private_key.basware-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "basware-sftpuser-private-key-openssh" {
  name         = "basware-sftpuser-privatekey-base64"
  value        = textencodebase64(azurerm_key_vault_secret.basware-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "basware-sftpuser-pubkey" {
  name         = "basware-sftpuser-publickey"
  value        = trimspace(tls_private_key.basware-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

#basware new sftp user
resource "tls_private_key" "basware-new-sftp-user-vmss-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_key_vault_secret" "basware-new-sftp-user-private-key" {
  name         = "basware-sftpuser-privatekey2"
  value        = trimspace(tls_private_key.basware-new-sftp-user-vmss-ssh-key.private_key_pem)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
resource "azurerm_key_vault_secret" "basware-new-sftpuser-private-key-openssh" {
  name         = "basware-sftpuser-privatekey2-base64"
  value        = textencodebase64(azurerm_key_vault_secret.basware-new-sftp-user-private-key.value, "UTF-8")
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}

resource "azurerm_key_vault_secret" "basware-new-sftpuser-pubkey" {
  name         = "basware-sftpuser-publickey2"
  value        = trimspace(tls_private_key.basware-new-sftp-user-vmss-ssh-key.public_key_openssh)
  key_vault_id = azurerm_key_vault.key_vault.id
  expiration_date = local.expiration_date
  lifecycle {
    ignore_changes = [value]
  }
}
