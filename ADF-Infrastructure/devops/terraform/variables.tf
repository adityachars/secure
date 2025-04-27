variable "location" {
  default = "west europe" 
}
locals {
  environment = terraform.workspace
}
variable "env" {
  type = map(string)
  default = {
    dev = "dev"
    test = "test"
    uat  = "uat"
    prod = "prod"
  }
}
variable "resourceGroupName"{
  type = map(string)
  default = {
    dev  = "RGAZ-SSEU-ETL-CIP-dev"
    test = "RGAZ-SSEU-ETL-CIP-test"
    uat = "RGAZ-SSEU-ETL-CIP-UAT"
    prod = "RGAZ-SSEU-ETL-CIP-prod"
  }
}


variable "IRvmName" {
  type = map(string)
  default = {
    dev = "IR-winvmdev"
    test = "IR-adf-test"
    uat = "IR-adf-uat"
    prod ="IR-adf-prod"
  } 
}
variable "internalIRvmName" {
  type = map(string)
  default = {
    dev = "internal-IR-winvmdev"
    test = "internal-IR-adf-test"
    uat = "internal-IR-adf-uat"
    prod = "internal-IR-adf-prod"
  } 
}

variable "norway-turkeyIRvmName" {
  type = map(string)
  default = {
    dev = "norway-turkey-IR-winvmdev"
    test = "norway-turkey-IR-winvmtest"
    uat = "norway-turkey-IR-winvmuat"
    prod = "norway-turkey-IR-winvmprod"
  } 
}

variable "vnetName"{
  type = map(string)
  default = {
    dev = "vnet-adfdev"
    test = "vnet-adf-test"
    uat = "vnet-adf-uat"
    prod = "vnet-adf-prod"
  }
}
variable "localvnetName"{
  type = map(string)
  default = {
    dev = "vnet-adf-dev"
    test = "vnet-common-test"
    uat = "vnet-common-uat"
    prod = "vnet-common-prod"
  }
}
variable "private_ip" {
  type = map(string)
  default = {
    dev = "10.7.71.197"
    test = "10.7.71.182"
    uat = "10.7.71.118"
    prod = "10.7.74.214"
  }
}
variable "internalprivate_ip" {
  type = map(string)
  default = {
    dev = "10.7.71.214"
    test = "10.7.71.166"
    uat = "10.7.71.100"
    prod = "10.7.74.200"
  }
}

variable "norway-turkey-vm-private_ip" {
  type = map(string)
  default = {
    dev = "10.7.71.215"
    test = "10.7.71.167"
    uat = "10.7.71.102"
    prod = "10.7.74.201"
  }
}

variable "lbaltype" {
  default="Static"
}

variable "subnetName2" {
  type = map(string)
  default = {
    dev = "irsubnetdev"
    test = "irsubnettest"
    uat = "irsubnetuat"
    prod = "irsubnetprod"
  }
}

variable "localsubnetName1" {
  type = map(string)
  default = {
    dev = "localirsubnetdev"
    test = "localirsubnettest"
    uat = "localirsubnetuat"
    prod = "localirsubnetprod"
  }
}

variable "sftp-vmss-size" {
  type = map(string)
    default = {
      dev = "Standard_DS1_v2"
      test = "Standard_DS1_v2"
      uat = "Standard_DS1_v2"
      prod = "Standard_DS1_v2"
    }
}

variable "irvmsize" {
  type = map(string)
    default = {
      dev = "Standard_F4s_v2"
      test = "Standard_F4s_v2"
      uat = "Standard_F4"
      prod = "Standard_F4"
    }
}

variable "diagsetting" {
  type = map(string)
    default = {
      dev = "diag_setting_adf"
      test = "diag_setting_adf-test"
      uat = "diag_setting_adf-uat"
      prod = "diag_setting_adf-prod"
    }
}
variable "nicIpConfigName"{
    type = map(string)
    default = {
      dev = "vmadfNic01Configdev"
      test = "vmadfNic01Configtest"
      uat = "vmadfNic01Configuat"
      prod = "vmadfNic01Configprod"
    }
}
variable "internalnicIpConfigName"{
    type = map(string)
    default = {
      dev = "internalvmadfNic01Configdev"
      test = "internalvmadfNic01Configtest"
      uat = "internalvmadfNic01Configuat"
      prod = "internalvmadfNic01Configprod"
    }
}

variable "norway-turkeynicIpConfigName"{
    type = map(string)
    default = {
      dev = "norway-turkeyvmadfNic01Configdev"
      test = "norway-turkeyvmadfNic01Configtest"
      uat = "norway-turkeyvmadfNic01Configuat"
      prod = "norway-turkeyvmadfNic01Configprod"
    }
}

variable "nicName3"{
    type = map(string)
    default = {
      dev = "winvmnicdev"
      test = "winvmnictest"
      uat = "winvmnicuat"
      prod = "winvmnicprod"
    }
}
variable "localnicName"{
    type = map(string)
    default = {
      dev = "internalwinvmnicdev"
      test = "internalwinvmnictest"
      uat = "internalwinvmnicuat"
      prod = "internalwinvmnicprod"
    }
}

variable "norway-turkey-vm-nic"{
    type = map(string)
    default = {
      dev = "norway-turkeywinvmnicdev"
      test = "norway-turkeywinvmnictest"
      uat = "norway-turkeywinvmnicuat"
      prod = "norway-turkeywinvmnicprod"
    }
}

variable "winnsgIR" {
  type = map(string)
    default = {
      dev = "winnsgdev"
      test = "winnsgtest"
      uat = "winnsguat"
      prod = "winnsgprod"
    }
  
}

variable "keyvaultname" {
    type = map(string)
      default = {
        dev = "WFMHCM-kv-dev"
        test = "KV-northstar-common-test"
        uat = "KV-northstar-common-uat"
        prod = "KV-northstar-common-prod"
      }
}


variable "nsg_log_category" {
type = list(string)
default = ["NetworkSecurityGroupEvent", "NetworkSecurityGroupRuleCounter"]
}

variable "enabled_for_deployment" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = "true"
}

variable "enabled_for_disk_encryption" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = "true"
}

variable "enabled_for_template_deployment" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = "true"
}

variable "adfname" {
  type = map(string)
    default = {
      dev = "Northstar-HCMWFM-ADF"
      test = "Northstar-common-adf-test"
      uat = "Northstar-common-adf-uat"
      prod = "Northstar-common-adf-prod"
    }
}

variable "hcareadfname" {
  type = map(string)
    default = {
      dev = "Northstar-common-adf-HCaredev"
      test = "Northstar-common-adf-test"
      uat = "Northstar-common-adf-hcareuat"
      prod = "Northstar-common-adf-prod"
    }
}

variable "adfnorwayturkeynamehcare" {
  type = map(string)
    default = {
      dev = "Northstar-Norway-Turkey-adf-hcaredev"
      test = "Northstar-common-adf-test"
      uat = "Northstar-Poland-Norway-Turkey-adf-hcareuat"
      prod = "Northstar-common-adf-prod"
    }
}

variable "adfnorwayturkeyname" {
  type = map(string)
    default = {
      dev = "Northstar-Norway-Turkey-adf-dev"
      test = "Northstar-Norway-Turkey-adf-test"
      uat = "Northstar-Norway-Turkey-adf-uat"
      prod = "Northstar-Poland-Norway-Turkey-adf-prod"
    }
}

variable "adf_storage_account_name" {
  type = map(string)
    default = {
      dev = "datafactorysadev"
      test = "datafactorysatest"
      uat = "wfmstorageuat"
      prod = ""
    }
}
variable "adf_blob_storage_account_name" {
  type = map(string)
    default = {
      dev = "northstarstoragedev"
      test = "northstarstoragetest"
      uat = "northstarstorageacctuat"
      prod = "northstarstorageacntprod"
    }
}

variable "sftp_storage_account_name" {
  type = map(string)
    default = {
      dev = "northstarstgsftpdev"
      test = "northstarstgsftptest"
      uat = "northstarstgsftpuat"
      prod = ""
    }
}


variable "adf_storage_account_type" {
  type = map(string)
    default = {
      dev = "GRS"
      test = "GRS"
      uat = "GRS"
      prod = "GRS"
    }
}
variable "tls_version" {
  type = map(string)
    default = {
      dev = "TLS1_2"
      test = "TLS1_2"
      uat = "TLS1_2"
      prod = "TLS1_2"
    }
}

variable "adf_log_analytics_workspace_name" {
  type = map(string)
    default = {
      dev = "Northstar-CommonADF-LogAnalytics"
      test = "northstar-common-adf-loganalytics-workspace-test"
      uat = "northstar-common-adf-loganalytics-workspace-uat"
      prod = "northstar-common-adf-loganalytics-workspace-prod"
    }
}
variable "vmss_log_analytics_workspace_name" {
  type = map(string)
    default = {
      dev = "Northstar-vmss-logaw"
      test = "northstar-vmss-loganalytics-workspace-test"
      uat = "northstar-vmss-loganalytics-workspace-uat"
      prod = "northstar-vmss-loganalytics-workspace-prod"
    }
}
variable "vmssprefix" {
  type = map(string)
    default = {
      dev = "northstarsftp"
      test = "northstarsftp-test"
      uat = "northstarsftp-uat"
      prod = "northstarsftp-prod"
    }
}
variable "vmssnic" {
  type = map(string)
    default = {
      dev = "northstarvmss"
      test = "northstarvmss-test"
      uat = "northstarvmss-uat"
      prod = "northstarvmss-prod"
    }
}
variable "local-vmssnic" {
  type = map(string)
    default = {
      dev = "local-northstarvmss-dev"
      test = "local-northstarvmss-test"
      uat = "local-northstarvmss-uat"
      prod = "local-northstarvmss-prod"
    }
}
variable "vmssip" {
  type = map(string)
    default = {
      dev = "vmssip"
      test = "vmssiptest"
      uat = "vmssipuat"
      prod = "vmssipprod"
    }
}
variable "vmssippubtopvt" {
  type = map(string)
    default = {
      dev = "vmssip-pubtopvt"
      test = "vmssiptest-pubtopvt"
      uat = "vmssipuat-pubtopvt"
    }
}
variable "Irwinip" {
  type = map(string)
    default = {
      dev = "winipdev"
      test = "winiptest"
      uat = "winipuat"
      prod = "winipprod"
    }
}

variable "vmssconfig" {
  type = map(string)
    default = {
      dev = "northstarvmss"
      test = "northstarvmss-test"
      uat = "northstarvmss-uat"
      prod = "northstarvmss-prod"
    }
}
variable "localvmssconfig" {
  type = map(string)
    default = {
      dev = "local-northstarvmss-dev"
      test = "local-northstarvmss-test"
      uat = "local-northstarvmss-uat"
      prod = "local-northstarvmss-prod"
    }
}
variable "subnetName3" {
  type = map(string)
    default = {
      dev = "vmsssubnetdev"
      test = "vmsssubnettest"
      uat = "vmsssubnetuat"
      prod = "vmsssubnetprod"
    }
}
variable "localsubnetName2" {
  type = map(string)
    default = {
      dev = "local-vmsssubnetdev"
      test = "local-vmsssubnettest"
      uat = "local-vmsssubnetuat"
      prod = "local-vmsssubnetprod"
    }
}

variable "vmss_rootuser_private_key" {
    default = "rootuser-pvtkey"
}
variable "local_vmss_rootuser_private_key" {
    default = "local-rootuser-pvtkey"
}
variable "vmssnsg" {
  type = map(string)
    default = {
      dev = "vmsssftp-nsg"
      test = "vmsssftp-nsg-test"
      uat = "vmsssftp-nsg-uat"
      prod = "vmsssftp-nsg-prod"
    } 
}
variable "localvmssnsg" {
  type = map(string)
    default = {
      dev = "localvmsssftp-nsg-dev"
      test = "localvmsssftp-nsg-test"
      uat = "localvmsssftp-nsg-uat"
      prod = "localvmsssftp-nsg-prod"
    } 
}

variable "vmsslbname" {
  type = map(string)
    default = {
      dev = "vmss-lb"
      test = "vmss-lb-test"
      uat = "vmss-lb-uat"
      prod = "vmss-lb-prod"
    } 
}

variable "vmsslbnamepubtopriv" {
  type = map(string)
    default = {
      dev = "vmss-lb-pubtopriv"
      test = "vmss-lb-test-pubtopriv"
      uat = "vmss-lb-uat-pubtopriv"
    } 
}

variable "internalvmsslbname" {
  type = map(string)
    default = {
      dev = "internal-vmss-lb-dev"
      test = "internal-vmss-lb-test"
      uat = "internal-vmss-lb-uat"
      prod = "internal-vmss-lb-prod"
    } 
}

variable "internalvmsslbport" {
  type = map(string)
    default = {
      dev = "5000"
      test = "5000"
      uat = "5000"
      prod = "5000"
    } 
}

variable "vmssipconfig" {
  type = map(string)
    default = {
      dev = "vmss"
      test = "vmssconfig-test"
      uat = "vmssconfig-uat"
      prod = "vmssconfig-prod"
    } 
}
variable "vmssipconfigpubtopvt" {
  type = map(string)
    default = {
      dev = "vmss-pubtopvt"
      test = "vmssconfig-pubtopvt-test"
      uat = "vmssconfig-pubtopvt-uat"
    } 
}
variable "privatevmssipconfig" {
  type = map(string)
    default = {
      dev = "vmss-dev"
      test = "pvt-vmssconfig-test"
      uat = "pvt-vmssconfig-uat"
      prod = "pvt-vmssconfig-prod"
    } 
}

variable "nicpubtopriv" {
  type = map(string)
    default = {
      dev = "nicpubtopriv-dev"
      test = "nicpubtopriv-test"
      uat = "nicpubtopriv-uat"
    } 
  
}

variable "pubtoprivconfig" {
  type = map(string)
    default = {
      dev = "pubtoprivconfig-dev"
      test = "pubtoprivconfig-test"
      uat = "pubtoprivconfig-uat"
    } 
  
}

variable "vmssmonitoragent" {
  type = map(string)
    default = {
      dev = "MMAExtension"
      test = "MMAExtension-test"
      uat = "MMAExtension-uat"
      prod = "MMAExtension-prod"
    } 
}

variable "adf_IR_email_alert_name" {
  type = map(string)
    default = {
      dev = "email-alert"
      test = "IR-emailalert-test"
      uat = "IR-emailalert-uat"
      prod = "IR-emailalert-prod"
    } 
}

variable "vmsssftpext" {
  type = map(string)
    default = {
      dev = "vmssext"
      test = "vmssext-test"
      uat = "vmssext-uat"
      prod = ""
    } 
}
variable "localvmsssftpext" {
  type = map(string)
    default = {
      dev = "local-vmssext-dev"
      test = "local-vmssext-test"
      uat = "local-vmssext-uat"
      prod = "local-vmssext-prod"
    } 
}

variable "erpip" {
  type = map(string)
    default = {
      dev = "147.154.140.16"
      test = "147.154.140.16"
      uat = "147.154.140.16"
      prod = "147.154.140.16"
    }
}
variable "oracleip" {
  type = map(string)
    default = {
      dev = "147.154.128.0/19"
      test = "147.154.128.0/19"
      uat = "147.154.128.0/19"
      prod = "147.154.128.0/19"
    }
}
variable "adfIRip" {
  type = map(string)
    default = {
      dev = "40.114.215.248"
      test = "13.88.207.16"
      uat= "20.107.127.129"
      prod = ""
    }
}

variable "adf-finland-IR-ip" {
  type = map(string)
    default = {
      dev = "193.210.89.254"
      test = "193.210.89.254"
      uat = "193.210.89.254"
      prod = "193.210.89.254"
    }
}

variable "oracleTeamUser1" {
  default = "49.37.47.233"
}

variable "oracleTeamUser2" {
  default = "183.83.140.80"
}

variable "pvtendpointname" {
  type = map(string)
    default = {
      dev = "pep-kv-connection-dev"
      test = "pep-kv-connection-test"
      uat = "pep-kv-connection-uat"
      prod = "pep-kv-connection-prod"
    }
}

variable "vnetlink" {
  type = map(string)
    default = {
      dev = "vnet-link-dev"
      test = "vnet-link-test"
      uat = "vnet-link-uat"
      prod = "vnet-link-prod"
    }
}

variable "dnszonegrp" {
  type = map(string)
    default = {
      dev = "private-dns-zonegrp-dev"
      test = "private-dns-zonegrp-test"
      uat = "private-dns-zonegrp-uat"
      prod = "private-dns-zonegrp-prod"
    }
  
}

variable "gpenvironment" {
   type = map(string)
    default = {
      dev  = "PL_WAVE2_DEV"
      test = "PL_WAVE2_SIT"
      uat  = "UAT"
      prod = "PROD"
  }
}

variable "gpenvironmenthcare" {
   type = map(string)
    default = {
      dev  = "HypercareDEV"
      uat  = "HypercareUAT"
      test = "PL_WAVE2_SIT"
      prod = "PROD"
  }
}

variable "gpenvironmentbau" {
   type = map(string)
    default = {
      dev  = "HYPERCARE DEV"
      uat  = "HYPERCARE UAT"
      test = "PL_WAVE2_SIT"
      prod = "PROD"
  }
}

variable "gpblobaseurl" {
   type = map(string)
    default = {
      dev  = "https://northstarstoragedev.blob.core.windows.net"
      test = "https://northstarstoragetest.blob.core.windows.net"
      uat  = "https://northstarstorageacctuat.blob.core.windows.net"
      prod = "https://northstarstorageacntprod.blob.core.windows.net"
  }
}

variable "gpapimbaseurl" {
   type = map(string)
    default = {
      dev  = "https://api.dev.ei.securitas.net"
      test = "https://api.test.ei.securitas.net"
      uat  = "https://api.uat.ei.securitas.net"
      prod = "https://api.ei.securitas.net"
  }
}

variable "gpkeyvaluturl" {
   type = map(string)
    default = {
      dev  = "https://wfmhcm-kv-dev.vault.azure.net"
      test = "https://kv-northstar-common-test.vault.azure.net"
      uat  = "https://kv-northstar-common-uat.vault.azure.net"
      prod = "https://kv-northstar-common-prod.vault.azure.net"
  }
}

variable "gptenantid" {
   type = map(string)
    default = {
      dev  = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
      test = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
      uat  = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
      prod = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
  }
}

variable "gpclientid" {
   type = map(string)
    default = {
      dev  = "3bb39707-c6b9-4214-b803-786c58fa49b5"
      test = "3bb39707-c6b9-4214-b803-786c58fa49b5"
      uat  = "3bb39707-c6b9-4214-b803-786c58fa49b5"
      prod = "578224ab-651d-4037-8ffc-41fcda735027"
  }
}

variable "gpgranttype" {
   type = map(string)
    default = {
      dev  = "client_credentials"
      test = "client_credentials"
      uat  = "client_credentials"
      prod = "client_credentials"
  }
}

variable "gpscope" {
   type = map(string)
    default = {
      dev  = "api://northstarAPIs/.default"
      test = "api://northstarAPIs/.default"
      uat  = "api://northstarAPIs/.default"
      prod = "api://northstarAPIs-prod/.default"
  }
}

variable "gporaclebaseurl" {
   type = map(string)
    default = {
      dev  = "https://sec-sit-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443"
      test = "https://sec-dev-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443"
      uat  = "https://sec-prog-uat-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443"
      prod = "https://sec-prod-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443"
  }
}

variable "gporaclebaseurlbau" {
   type = map(string)
    default = {
      dev  = "https://sec-test-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com"
      uat  = "https://sec-uat-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com"
      test = "https://sec-dev-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com:443"
      prod = "https://sec-prod-oic-frfukaotd0ci-fr.integration.ocp.oraclecloud.com"
  }
}

variable "gporaclefusionname" {
   type = map(string)
    default = {
      dev  = "sse_azure_integration_user"
      test = "sse_azure_integration_user"
      uat  = "SSE_AZURE_INTEGRATION_USER_PROG_UAT"
      prod = "sse_azure_integration_user_prod"
  }
}

variable "gporaclefusionnamebau" {
   type = map(string)
    default = {
      dev  = "sse_azure_integration_user"
      uat  = "sse_azure_integration_user_uat"
      test = "sse_azure_integration_user"
      prod = "sse_azure_integration_user_prod"
  }
}

variable "gpsnowsftppath" {
   type = map(string)
    default = {
      dev  = "Dev MID/agent/DEV Export/"
      test = "Test MID/agent/TEST Export/"
      uat  = "Test MID/agent/TEST UAT Export/"
      prod = "Prod MID/agent/PROD Export/"
  }
}

variable "gpmepcohcm1009path" {
   type = map(string)
    default = {
      dev  = "In/HCM/AzureDev"
      test = "In/HCM"
      uat  = "In/HCM"
      prod = "In/HCM"
  }
}

variable "gpmepcohcm1094path" {
   type = map(string)
    default = {
      dev  = "Out/HCM/AzureDev"
      test = "Out/HCM"
      uat  = "Out/HCM"
      prod = "Out/HCM"
  }
}

variable "gpmepcohcm1095path" {
   type = map(string)
    default = {
      dev  = "Out/HCM/AzureDev"
      test = "Out/HCM"
      uat  = "Out/HCM"
      prod = "Out/HCM"
  }
}

variable "gpmepcowfm1015path" {
   type = map(string)
    default = {
      dev  = "In/InforWFM"
      test = "In/InforWFM"
      uat  = "In/InforWFM"
      prod = "In/InforWFM"
  }
}

variable "gpmepcoefm1025path" {
   type = map(string)
    default = {
      dev  = "WFM_MulesoftIM_ERP/Inbound"
      test = "WFM_MulesoftIM_ERP/Inbound"
      uat  = "WFM_MulesoftIM_ERP/Inbound"
      prod = "WFM_MulesoftIM_ERP/Inbound"
  }
}

variable "gpmepcoefm1029path" {
   type = map(string)
    default = {
      dev  = "Out/InforWFM/AzureDev"
      test = "Out/InforWFM"
      uat  = "Out/InforWFM"
      prod = "Out/InforWFM"
  }
}

variable "gpmepco10303132path" {
   type = map(string)
    default = {
      dev  = "In/InforWFM/"
      test = "In/InforWFM"
      uat  = "In/InforWFM"
      prod = "In/InforWFM"
  }
}

variable "gpmepcoerp1019path" {
   type = map(string)
    default = {
      dev  = "WFM_MulesoftIM_ERP/Outbound/AzureDev"
      test = "WFM_MulesoftIM_ERP/Outbound"
      uat  = "WFM_MulesoftIM_ERP/Outbound"
      prod = "WFM_MulesoftIM_ERP/Outbound"
  }
}

variable "gpmepcohcm1049path" {
   type = map(string)
    default = {
      dev  = "Out/HCM/AzureDev"
      test = "Out/HCM"
      uat  = "Out/HCM"
      prod = "Out/HCM"
  } 
}

variable "gpmepcohcm1047path" {
   type = map(string)
    default = {
      dev  = "Interview/Outbound/AzureDev"
      test = "Interview/Outbound"
      uat  = "Interview/Outbound"
      prod = "Interview/Outbound"
  
  }
}

variable "gpwfm1001uba" {
   type = map(string)
    default = {
      dev  = "interfacefiles/Billing_Engine/Drop"
      test = "interfacefiles/Billing_Engine/Drop"
      uat  = "interfacefiles/Billing_Engine/Drop"
      prod = "interfacefiles/Billing_Engine/Drop"
  
  }
}

variable "gpwfm1001ubaarchive" {
   type = map(string)
    default = {
      dev  = "interfacefiles/Billing_Engine/Archive"
      test = "interfacefiles/Billing_Engine/Archive"
      uat  = "interfacefiles/Billing_Engine/Archive"
      prod = "interfacefiles/Billing_Engine/Archive"
  
  }
}

variable "publicip-nat" {
   type = map(string)
     default = {
       dev  = "public-ip-nat-dev"
       test = "public-ip-nat-test"
       uat  = "public-ip-nat-uat"
       prod = "public-ip-nat-prod"
  } 
}

variable "northstar-nat-gateway" {
   type = map(string)
     default = {
       dev  = "nat-gateway-dev"
       test = "nat-gateway-test"
       uat  = "nat-gateway-uat"
       prod = "nat-gateway-prod"
  }
}

variable "grsftpdatevoutbound" {
   type = map(string)
     default = {
       dev  = "/DEV/DATEV_Payroll_Interface"
       test = "/TEST/DATEV_Payroll_Interface"
       uat  = "/TEST/DATEV_Payroll_Interface"
       prod = "/PROD/DATEV_Payroll_Interface"
  }
}

variable "grsftpdpp" {
   type = map(string)
     default = {
       dev  = "/DEV/DPP_Employee_Qualifications"
       test = "/TEST/DPP_Employee_Qualifications"
       uat  = "/TEST/DPP_Employee_Qualifications"
       prod = "/PROD/DPP_Employee_Qualifications"
  }
}

variable "grsftpgroundstar" {
   type = map(string)
     default = {
       dev  = "/DEV/GROUND_STAR_Employee_And_Qualifications"
       test = "/TEST/GROUND_STAR_Employee_And_Qualifications"
       uat  = "/TEST/GROUND_STAR_Employee_And_Qualifications"
       prod = "/PROD/GROUND_STAR_Employee_And_Qualifications"
  }
}

variable "grsftpdisponic" {
   type = map(string)
     default = {
       dev  = "/DEV/DISPONIC_Emp_Data"
       test = "/TEST/DISPONIC_Emp_Data"
       uat  = "/TEST/DISPONIC_Emp_Data"
       prod = "/PROD/DISPONIC_Emp_Data"
  }
}

variable "grsftpdatevinbound" {
   type = map(string)
     default = {
       dev  = "/DEV/DATEV_EmployeeAbsenceData"
       test = "/TEST/DATEV_EmployeeAbsenceData"
       uat  = "/TEST/DATEV_EmployeeAbsenceData"
       prod = "/PROD/DATEV_EmployeeAbsenceData"
  }
}

variable "commonapienvironmentidentifier" {
   type = map(string)
     default = {
       dev  = "/northstar"
       test = "/northstar"
       uat  = "/northstar"
       prod = "/northstar"
  }
}

variable "commonapienvironmentidentifierbau" {
   type = map(string)
     default = {
       dev  = "/northstar-hcare-common-defix"
       uat  = "/northstar-hcare-uat"
       test = "/northstar"
       prod = "/northstar"
  }
}

variable "oicapienvironmentidentifier" {
   type = map(string)
     default = {
       dev  = "/northstar-oic"
       test = "/northstar-oic"
       uat  = "/northstar-oic"
       prod = "/northstar-oic"
  }
}

variable "oicapienvironmentidentifierbau" {
   type = map(string)
     default = {
       dev  = "/northstar-oic-hcare-dev"
       uat  = "/northstar-oic-hcare-uat"
       test = "/northstar-oic"
       prod = "/northstar-oic"
  }
}

variable "lmssftppathempdata" {
   type = map(string)
     default = {
       dev  = "/local"
       test = "/files/to_lp"
       uat  = "/files/to_lp"
       prod = "/files/to_lp"
  }
}

variable "vmsssku" {
  type = map(string)
     default = {
       dev  = "20_04-lts-gen2"
       test = "20_04-lts-gen2"
       uat  = "20_04-lts-gen2"
       prod = "20_04-lts-gen2"
  }
  
}

variable "imageoffer" {
  type = map(string)
     default = {
       dev  = "0001-com-ubuntu-server-focal"
       test = "0001-com-ubuntu-server-focal"
       uat  = "0001-com-ubuntu-server-focal"
       prod = "0001-com-ubuntu-server-focal"
  }
  
}

variable "irvmimageoffer" {
  type = map(string)
     default = {
       dev  = "WindowsServer"
       test = "WindowsServer"
       uat  = "WindowsServer"
       prod = "WindowsServer"
  }
  
}

variable "irvmsku" {
  type = map(string)
     default = {
       dev  = "2022-Datacenter"
       test = "2022-Datacenter"
       uat  = "2022-Datacenter"
       prod = "2022-Datacenter"
  }
  
}

variable "computername" {
  type = map(string)
  default = {
    dev = "intnIRhost-dev"
    test = "intnIRhost-tst"
    uat = "intnIRhost-uat"
    prod = "intnIRhost-prd"
  } 
}

variable "norway-turkey-computername" {
  type = map(string)
  default = {
    dev = "int-IRhost-dev2"
    test = "int-IRhost-tst2"
    uat = "int-IRhost-uat2"
    prod = "int-IRhost-prd2"
  } 
}

variable "rgk8s" {
  type = map(string)
  default = {
    dev = "RGAZ-SSEU-CIP-AKS-Dev"
    test = "RGAZ-SSEU-CIP-AKS-Test"
    uat = "RGAZ-SSEU-CIP-AKS-Test"
    prod = "RGAZ-SSEU-CIP-AKS-Prod"
  } 
  
}

variable "vnetk8s" {
  type = map(string)
  default = {
    dev = "vnet-k8s-integration-platform-dev"
    test = "vnet-k8s-integration-platform-test"
    uat = "vnet-k8s-integration-platform-test"
    prod = "vnet-k8s-integration-platform-prod"
  }
}

variable "ortechpathwfm1022" {
   type = map(string)
     default = {
       dev  = "OrtecWS/Actual Hours"
       test = "OrtecWS/Actual Hours"
       uat  = "OrtecWS/Actual Hours"
       prod = "OrtecWS/Actual Hours"
  }
}

variable "clientidfororacleapis" {
   type = map(string)
     default = {
       dev  = "625367a8-963b-4b9e-bffc-775bc64225e7"
       test = "625367a8-963b-4b9e-bffc-775bc64225e7"
       uat  = "625367a8-963b-4b9e-bffc-775bc64225e7"
       prod = "625367a8-963b-4b9e-bffc-775bc64225e7"
  }
}

variable "gipscope" {
   type = map(string)
     default = {
       dev  = "api://gip-events/.default"
       test = "api://gip-events/.default"
       uat  = "api://gip-events/.default"
       prod = "api://gip/.default"
  }
}

variable "endpointresourceid" {
   type = map(string)
     default = {
       dev  = "/subscriptions/f711348e-3ecb-4750-ae6c-33c940145fdc/resourceGroups/RGAZ-SSEU-ETL-CIP-dev/providers/Microsoft.DataFactory/factories/Northstar-HCMWFM-ADF"
       test = "/subscriptions/6afa2ecd-1c15-41cd-9e1d-cb2cff40b7ae/resourceGroups/RGAZ-SSEU-ETL-CIP-test/providers/Microsoft.DataFactory/factories/Northstar-common-adf-test"
       uat  = "/subscriptions/6afa2ecd-1c15-41cd-9e1d-cb2cff40b7ae/resourceGroups/RGAZ-SSEU-ETL-CIP-UAT/providers/Microsoft.DataFactory/factories/Northstar-common-adf-uat"
       prod = "/subscriptions/638c76e2-19c0-4d23-b4eb-7ccefe47e869/resourceGroups/RGAZ-SSEU-ETL-CIP-prod/providers/Microsoft.DataFactory/factories/Northstar-common-adf-prod"
  }
}

variable "endpointtenantid" {
   type = map(string)
     default = {
       dev  = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
       test = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
       uat  = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
       prod = "fb0af7d1-8a83-48bc-8d2d-cd92034c79d4"
  }
}

variable "sftpvmName" {
  type = map(string)
  default = {
    dev = "northstar-sftpvm-dev"
    test = "northstar-sftpvm-test"
    uat = "northstar-sftpvm-uat"
    prod = "northstar-sftpvm-prod"
  } 
}

variable "localsftpvmext" {
  type = map(string)
  default = {
    dev = "localsftpvmext-dev"
    test = "localsftpvmext-test"
    uat = "localsftpvmext-uat"
    prod = "localsftpvmext-prod"
  } 
}

variable "image_publisher" {
    type = string
    default = "Canonical"
}

variable "image_offer" {
    type = string
    default = "0001-com-ubuntu-server-focal"
}

variable "image_sku" {
    type = string
    default = "20_04-lts-gen2"
}

variable "image_version" {
    type = string
    default = "latest"
}

variable "wfmfilepathpayrollexport1018" {
   type = map(string)
     default = {
       dev  = "Afas/Payroll/UAT"
       test = "Afas/Payroll/UAT"
       uat  = "Afas/Payroll/UAT"
       prod = "Afas/Payroll/PROD"
  }
}

variable "afasfilepathbalanceexport1033" {
   type = map(string)
     default = {
       dev  = "Afas/Balance/UAT"
       test = "Afas/Balance/UAT"
       uat  = "Afas/Balance/UAT"
       prod = "Afas/Balance/PROD"
  }
}

variable "emailNotificationOn" {
   type = map(string)
     default = {
       dev  = "true"
       test = "true"
       uat  = "true"
       prod = "true"
  }
}


variable "wfmgrs1014src" {
   type = map(string)
     default = {
       dev  = "/interfacefiles/NL/Schedule Export"
       test = "/interfacefiles/NL/Schedule Export"
       uat  = "/interfacefiles/NL/Schedule Export"
       prod = "/interfacefiles/NL/Schedule Export"
  }
}

variable "northstarapiuri" {
   type = map(string)
     default = {
       dev  = "northstar/api/"
       test = "northstar/api/"
       uat  = "northstar/api/"
       prod = "northstar/api/"
  }
}

variable "northstarapiurihcare" {
   type = map(string)
     default = {
       dev  = "northstar-hcare-common-defix/api/"
       test = "northstar/api/"
       uat  = "northstar-hcare-uat/api/"
       prod = "northstar/api/"
  }
}

variable "wfm1014waittime" {
   type = map(string)
     default = {
       dev  = "120"
       test = "120"
       uat  = "120"
       prod = "120"
  }
}

variable "azuretowfmtriopsisfile" {
   type = map(string)
     default = {
       dev  = "/interfacefiles/NL/Mileage/Mileage Inbound"
       test = "/interfacefiles/NL/Mileage/Mileage Inbound"
       uat  = "/interfacefiles/NL/Mileage/Mileage Inbound"
       prod = "/interfacefiles/NL/Mileage/Mileage Inbound"
  }
}

variable "wfmtoazuretriopsisfile" {
   type = map(string)
     default = {
       dev  = "/interfacefiles/NL/Mileage/Mileage Outbound"
       test = "/interfacefiles/NL/Mileage/Mileage Outbound"
       uat  = "/interfacefiles/NL/Mileage/Mileage Outbound"
       prod = "/interfacefiles/NL/Mileage/Mileage Outbound"
  }
}

variable "wfm1014filesharepath" {
   type = map(string)
     default = {
       dev  = "/data/WFM/GRS/Outbound"
       test = "/data/WFM/GRS/Outbound"
       uat  = "/data/WFM/GRS/Outbound"
       prod = "/data/WFM/GRS/Outbound"
  }
}

variable "wfm1021filesharepath" {
   type = map(string)
     default = {
       dev  = "/data/WFM/Triopsys"
       test = "/data/WFM/Triopsys"
       uat  = "/data/WFM/Triopsys"
       prod = "/data/WFM/Triopsys"
  }
}

variable "vmsize" {
   type = map(string)
     default = {
       dev  = "Standard_D4s_v5"
       test = "Standard_D4s_v5"
       uat  = "Standard_D8s_v3"
       prod = "Standard_D8s_v3"
  }
}

variable "wfm1001ubaarchive" {
   type = map(string)
     default = {
       dev  = "/interfacefiles/Billing_Engine/Archive"
       test = "/interfacefiles/Billing_Engine/Archive"
       uat  = "/interfacefiles/Billing_Engine/Archive"
       prod = "/interfacefiles/Billing_Engine/Archive"
  }
}

variable "mepcouba1004" {
   type = map(string)
     default = {
       dev  = "UBA/Outbound/AzureDev"
       test = "UBA/Outbound/AzureDev"
       uat  = "UBA/Outbound/AzureDev"
       prod = "UBA/Outbound/AzureDev"
  }
}

variable "mepcouba1004archive" {
   type = map(string)
     default = {
       dev  = "UBA/Outbound/Archive"
       test = "UBA/Outbound/Archive"
       uat  = "UBA/Outbound/Archive"
       prod = "UBA/Outbound/Archive"
  }
}

variable "nomentia1053" {
   type = map(string)
     default = {
       dev  = "/TEST/IN/ap"
       test = "/TEST/IN/ap"
       uat  = "/TEST/IN/ap"
       prod = "/in/paymentshub/ap"
  }
}

variable "nomentia1020" {
   type = map(string)
     default = {
       dev  = "/TEST/OUT/statement"
       test = "/TEST/OUT/statement"
       uat  = "/TEST/OUT/statement"
       prod = "/out/accounting/Securitas"
  }
}

variable "nomentia1153source" {
   type = map(string)
     default = {
       dev  = "/TEST/OUT/reference"
       test = "/TEST/OUT/reference"
       uat  = "/TEST/OUT/reference"
       prod = "/out/reference/Securitas"
  }
}

variable "erp1094sourcepath" {
   type = map(string)
     default = {
       dev  = "/data/ERP/VDESK/Outbound/ClientInvoices"
       test = "/data/ERP/VDESK/Outbound/ClientInvoices"
       uat  = "/data/ERP/VDESK/Outbound/ClientInvoices"
       prod = "/data/ERP/VDESK/Outbound/ClientInvoices"
  }
}

variable "erp1094targetpath" {
   type = map(string)
     default = {
       dev  = "/dev/vdesk/outbound/int-1094_client_invoices"
       test = "/test/vdesk/outbound/int-1094_client_invoices"
       uat  = "/uat/vdesk/outbound/int-1094_client_invoices"
       prod = "/prod/vdesk/outbound/int-1094_client_invoices"
  }
}

variable "erp1097sourcepath" {
   type = map(string)
     default = {
       dev  = "/data/ERP/SEBBank/Outbound"
       test = "/data/ERP/SEBBank/Outbound"
       uat  = "/data/ERP/SEBBank/Outbound"
       prod = "/data/ERP/SEBBank/Outbound"
  }
}

variable "erp1097targetpath" {
   type = map(string)
     default = {
       dev  = "/toSEB"
       test = "/toSEB"
       uat  = "/toSEB"
       prod = "/toSEB"
       
  }
}

variable "gperp1207sourcepath" {
   type = map(string)
     default = {
       dev  = "/data/ERP/DNBBank/Outbound"
       test = "/data/ERP/DNBBank/Outbound"
       uat  = "/data/ERP/DNBBank/Outbound"
       prod = "/data/ERP/DNBBank/Outbound"
  }
}

variable "gperp1207targetpath" {
   type = map(string)
     default = {
       dev  = "/Send"
       test = "/Send"
       uat  = "/Send"
       prod = "/Send"
  }
}

variable "gpenvironmentnotr" {
   type = map(string)
     default = {
       dev  = "PL_NO_TR_DEV"
       test = "PL_NO_TR_TEST"
       uat  = "PL_NO_TR_UAT"
       prod = "PL_NO_TR_PROD"
  }
}

variable "gpenvironmentnotrhcare" {
   type = map(string)
     default = {
       dev  = "HypercareDEV"
       test = "PL_NO_TR_TEST"
       uat  = "HypercareUAT"
       prod = "PL_NO_TR_PROD"
  }
}

variable "erp1125targetpath" {
   type = map(string)
     default = {
       dev  = "/small_erp/outbound/int-1125_client_client_sites_contract_contract_id"
       test = "/small_erp/outbound/int-1125_client_client_sites_contract_contract_id"
       uat  = "/small_erp/outbound/int-1125_client_client_sites_contract_contract_id"
       prod = "/small_erp/outbound/int-1125_client_client_sites_contract_contract_id"
  }
}

variable "erp1146targetpath" {
   type = map(string)
     default = {
       dev  = "TESTfirmadan"
       test = "TESTfirmadan"
       uat  = "TESTfirmadan"
       prod = "TESTfirmadan"
  }
}

variable "azurebaseenvironment" {
   type = map(string)
     default = {
       dev  = "DEV"
       test = "TEST"
       uat  = "UAT"
       prod = "PROD"
  }
}

variable "azurebaseenvironmenthcare" {
   type = map(string)
     default = {
       dev  = "HypercareDEV"
       test = "TEST"
       uat  = "HypercareUAT"
       prod = "PROD"
  }
}

variable "azureenvironmentpl" {
   type = map(string)
     default = {
       dev  = "PL_WAVE2_DEV"
       test = "PL_WAVE2_TEST"
       uat  = "PL_WAVE2_UAT"
       prod = "PROD"
  }
}

variable "azureenvironmentplhcare" {
   type = map(string)
     default = {
       dev  = "HypercareDEV"
       test = "PL_WAVE2_TEST"
       uat  = "HypercareUAT"
       prod = "PROD"
  }
}

variable "azureenvironmentno" {
   type = map(string)
     default = {
       dev  = "NO_WAVE2_DEV"
       test = "NO_WAVE2_TEST"
       uat  = "NO_WAVE2_UAT"
       prod = "PROD"
  }
}

variable "azureenvironmentnohcare" {
   type = map(string)
     default = {
       dev  = "HypercareDEV"
       test = "NO_WAVE2_TEST"
       uat  = "HypercareUAT"
       prod = "PROD"
  }
}

variable "azureenvironmenttr" {
   type = map(string)
     default = {
       dev  = "TR_WAVE2_DEV"
       test = "TR_WAVE2_TEST"
       uat  = "TR_WAVE2_UAT"
       prod = "PROD"
  }
}

variable "azureenvironmenttrhcare" {
   type = map(string)
     default = {
       dev  = "HypercareDEV"
       test = "TR_WAVE2_TEST"
       uat  = "HypercareUAT"
       prod = "PROD"
  }
}

variable "erp1002erpsourcefolder" {
   type = map(string)
    default = {
      dev  = "data/ERP/Outbound"
      test = "data/ERP/Outbound"
      uat  = "data/ERP/Outbound"
      prod = "data/ERP/Outbound"
  }
}

variable "erp1002erpattachmentsourcefolder" {
   type = map(string)
    default = {
      dev  = "data/ERP/Attachment"
      test = "data/ERP/Attachment"
      uat  = "data/ERP/Attachment"
      prod = "data/ERP/Attachment"
  }
}

variable "erp1002erpdestinationfolder" {
   type = map(string)
    default = {
      dev  = "/data/ERP/UBAWFM/Inbound"
      test = "/data/ERP/UBAWFM/Inbound"
      uat  = "/data/ERP/UBAWFM/Inbound"
      prod = "/data/ERP/UBAWFM/Inbound"
  }
}

variable "erp1002erpattachmentdestinationfolder" {
   type = map(string)
    default = {
      dev  = "/data/ERP/UBAWFM/Attachment"
      test = "/data/ERP/UBAWFM/Attachment"
      uat  = "/data/ERP/UBAWFM/Attachment"
      prod = "/data/ERP/UBAWFM/Attachment"
  }
}

variable "erp1002erparchivefailed" {
   type = map(string)
    default = {
      dev  = "data/ERP/ArchiveFailed/Outbound"
      test = "data/ERP/ArchiveFailed/Outbound"
      uat  = "data/ERP/ArchiveFailed/Outbound"
      prod = "data/ERP/ArchiveFailed/Outbound"
  }
}

variable "erp1002erparchive" {
   type = map(string)
    default = {
      dev  = "data/ERP/Archive/Outbound"
      test = "data/ERP/Archive/Outbound"
      uat  = "data/ERP/Archive/Outbound"
      prod = "data/ERP/Archive/Outbound"
  }
}

variable "erp1002erparchiveattachment" {
   type = map(string)
    default = {
      dev  = "data/ERP/Archive/Attachment"
      test = "data/ERP/Archive/Attachment"
      uat  = "data/ERP/Archive/Attachment"
      prod = "data/ERP/Archive/Attachment"
  }
}

variable "erp1002erparchivefailedattachment" {
   type = map(string)
    default = {
      dev  = "data/ERP/ArchiveFailed/Attachment"
      test = "data/ERP/ArchiveFailed/Attachment"
      uat  = "data/ERP/ArchiveFailed/Attachment"
      prod = "data/ERP/ArchiveFailed/Attachment"
  }
}

variable "erp1002erpdestinationfoldercallout" {
   type = map(string)
    default = {
      dev  = "/data/ERP/UBACO/Inbound"
      test = "/data/ERP/UBACO/Inbound"
      uat  = "/data/ERP/UBACO/Inbound"
      prod = "/data/ERP/UBACO/Inbound"
  }
}

variable "erp1106ledgername" {
   type = map(string)
    default = {
      dev  = "SSE TR TRY IFRS PL"
      test = "SSE TR TRY IFRS PL"
      uat  = "SSE TS IFRS PL"
      prod = "SSE TS IFRS PL"
  }
}
