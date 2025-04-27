data "azurerm_resource_group" "k8rg" {
  name = var.rgk8s[local.environment]
  
}
data "azurerm_virtual_network" "k8vnet" {
  name = var.vnetk8s[local.environment]
  resource_group_name = data.azurerm_resource_group.k8rg.name
  
}
data "azurerm_subnet" "k8snet" {
  name = "kubernetes"
  resource_group_name = data.azurerm_resource_group.k8rg.name
  virtual_network_name = data.azurerm_virtual_network.k8vnet.name
  
}
# resource "azurerm_storage_account" "sa" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                     = var.adf_storage_account_name[local.environment]
#   resource_group_name      = data.azurerm_resource_group.rg.name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = var.adf_storage_account_type[local.environment]
#   min_tls_version          = "TLS1_2"
#   account_kind             = "StorageV2"
#   is_hns_enabled           = true
#   allow_blob_public_access = true
#   share_properties{

#     smb {
#       versions = ["SMB3.1.1","SMB3.0"]
#       authentication_types = ["Kerberos"]
#       kerberos_ticket_encryption_type = ["AES-256"]
#       channel_encryption_type = ["AES-256-GCM"]
#     }

#   }

#   //	network_rules {
#   //    default_action = "Deny"
#   //    virtual_network_subnet_ids = [azurerm_subnet.sftpsubnet.id]
#   //  }
# }

resource "azurerm_storage_account" "sftp-blobsa" {
  # depends_on = [
  #   azurerm_storage_share.sftp-newfileshare, azurerm_storage_account.sftp-blobsa
  # ]
  name                     = var.adf_blob_storage_account_name[local.environment]
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.adf_storage_account_type[local.environment]
  min_tls_version          = var.tls_version[local.environment]
  account_kind             = "StorageV2"
  allow_blob_public_access = true
  network_rules {
    default_action = "Deny"
    virtual_network_subnet_ids = [azurerm_subnet.localIRsubnet.id,azurerm_subnet.localvmsssubnet.id,data.azurerm_subnet.k8snet.id]
    private_link_access {
      endpoint_resource_id = var.endpointresourceid[local.environment]
      endpoint_tenant_id = var.endpointtenantid[local.environment]
    }
  }
  # lifecycle {
  #   ignore_changes = [network_rules]
  # }

}

# resource "azurerm_storage_account_network_rules" "sftp-blobsa-rules" {
#   depends_on = [
#     azurerm_storage_account.sftp-blobsa
#   ]
#   storage_account_id = azurerm_storage_account.sftp-blobsa.id
#   default_action             = "Deny"
#   #ip_rules                   = ["127.0.0.1"]
#   virtual_network_subnet_ids = [azurerm_subnet.localIRsubnet.id,azurerm_subnet.localvmsssubnet.id,data.azurerm_subnet.k8snet.id]
#   #bypass                     = ["AzureServices"]
# }

resource "azurerm_role_assignment" "adf-blob-new-role-assignment" {
  count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
  scope                = azurerm_storage_account.sftp-blobsa.id 
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_data_factory.northstaradf.identity[0].principal_id
}

# resource "azurerm_storage_table" "1177_1189_DynamicBinding-table" {
#   name                 = "1177_1189_DynamicBinding-table"
#   storage_account_name = azurerm_storage_account.sftp-blobsa.name
# }

# resource "azurerm_role_assignment" "adf-blob-role-assignment" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   scope                = azurerm_storage_account.sa[count.index].id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = azurerm_data_factory.northstaradf.identity[0].principal_id
# }

# #Storageaccount-FileShare & directories
# resource "azurerm_storage_share" "sftp-fileshare" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "sftpfileshare"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   quota                = 50
# }

# locals {
#   hcm_folder_sructure = [
#     "HCM_Directory",
#     "HCM_Directory/HCM",
#     "HCM_Directory/HCM/Absence",
#     "HCM_Directory/HCM/ActiveDirectory",
#     "HCM_Directory/HCM/APCBWFM",
#     "HCM_Directory/HCM/CEP",
#     "HCM_Directory/HCM/D3",
#     "HCM_Directory/HCM/Datev",
#     "HCM_Directory/HCM/Disponic",
#     "HCM_Directory/HCM/DPP",
#     "HCM_Directory/HCM/ESOffice",
#     "HCM_Directory/HCM/GMS",
#     "HCM_Directory/HCM/GovernmentPlatformforsubsidies",
#     "HCM_Directory/HCM/GroundStar",
#     "HCM_Directory/HCM/LMS",
#     "HCM_Directory/HCM/Mepco",
#     "HCM_Directory/HCM/PartnerPortal",
#     "HCM_Directory/HCM/Pernet",
#     "HCM_Directory/HCM/Platnik",
#     "HCM_Directory/HCM/SAP",
#     "HCM_Directory/HCM/Semco",
#     "HCM_Directory/HCM/SmartRecruiters",
#     "HCM_Directory/HCM/TechPlatform",
#     "HCM_Directory/HCM/VisionEU",
#     "HCM_Directory/HCM/SPExpert",
#     "HCM_Directory/HCM/WFM",
#     "HCM_Directory/HCM/FS",
#     "HCM_Directory/HCM/MSD365",
#     "HCM_Directory/HCM/PKK",
#     "HCM_Directory/HCM/ePUE",
#     "HCM_Directory/HCM/Absence/Archive_Failure",
#     "HCM_Directory/HCM/Absence/Archive_Success",
#     "HCM_Directory/HCM/Absence/Inbound",
#     "HCM_Directory/HCM/ActiveDirectory/Archive_Failure",
#     "HCM_Directory/HCM/ActiveDirectory/Archive_Success",
#     "HCM_Directory/HCM/ActiveDirectory/Inbound",
#     "HCM_Directory/HCM/ActiveDirectory/Outbound",
#     "HCM_Directory/HCM/APCBWFM/Archive_Failure",
#     "HCM_Directory/HCM/APCBWFM/Archive_Success",
#     "HCM_Directory/HCM/APCBWFM/Outbound",
#     "HCM_Directory/HCM/CEP/Inbound",
#     "HCM_Directory/HCM/CEP/Outbound",
#     "HCM_Directory/HCM/D3/Outbound",
#     "HCM_Directory/HCM/Datev/Archive_Failure",
#     "HCM_Directory/HCM/Datev/Archive_Success",
#     "HCM_Directory/HCM/Datev/Inbound",
#     "HCM_Directory/HCM/Datev/Outbound",
#     "HCM_Directory/HCM/Disponic/Archive_Failure",
#     "HCM_Directory/HCM/Disponic/Archive_Success",
#     "HCM_Directory/HCM/Disponic/Inbound",
#     "HCM_Directory/HCM/Disponic/Outbound",
#     "HCM_Directory/HCM/DPP/Archive_Failure",
#     "HCM_Directory/HCM/DPP/Archive_Success",
#     "HCM_Directory/HCM/DPP/Inbound",
#     "HCM_Directory/HCM/DPP/Outbound",
#     "HCM_Directory/HCM/ePUE/Inbound",
#     "HCM_Directory/HCM/ESOffice/Outbound",
#     "HCM_Directory/HCM/FS/Outbound",
#     "HCM_Directory/HCM/GMS/Archive_Failure",
#     "HCM_Directory/HCM/GMS/Archive_Success",
#     "HCM_Directory/HCM/GMS/Outbound",
#     "HCM_Directory/HCM/GovernmentPlatformforsubsidies/Outbound",
#     "HCM_Directory/HCM/GroundStar/Archive_Failure",
#     "HCM_Directory/HCM/GroundStar/Archive_Success",
#     "HCM_Directory/HCM/GroundStar/Inbound",
#     "HCM_Directory/HCM/GroundStar/Outbound",
#     "HCM_Directory/HCM/LMS/Archive_Failure",
#     "HCM_Directory/HCM/LMS/Archive_Success",
#     "HCM_Directory/HCM/LMS/Inbound",
#     "HCM_Directory/HCM/LMS/Outbound",
#     "HCM_Directory/HCM/Mepco/Inbound",
#     "HCM_Directory/HCM/Mepco/Outbound",
#     "HCM_Directory/HCM/MSD365/Outbound",
#     "HCM_Directory/HCM/PartnerPortal/Inbound",
#     "HCM_Directory/HCM/Pernet/Outbound",
#     "HCM_Directory/HCM/PKK/Outbound",
#     "HCM_Directory/HCM/Platnik/Outbound",
#     "HCM_Directory/HCM/SAP/Outbound",
#     "HCM_Directory/HCM/Semco/Inbound",
#     "HCM_Directory/HCM/SmartRecruiters/Inbound",
#     "HCM_Directory/HCM/SmartRecruiters/Outbound",
#     "HCM_Directory/HCM/SPExpert/Outbound",
#     "HCM_Directory/HCM/TechPlatform/Archive_Failure",
#     "HCM_Directory/HCM/TechPlatform/Archive_Success",
#     "HCM_Directory/HCM/TechPlatform/Inbound",
#     "HCM_Directory/HCM/TechPlatform/Outbound",
#     "HCM_Directory/HCM/VisionEU/Archive_Failure",
#     "HCM_Directory/HCM/VisionEU/Archive_Success",
#     "HCM_Directory/HCM/VisionEU/Inbound",
#     "HCM_Directory/HCM/VisionEU/Outbound",
#     "HCM_Directory/HCM/WFM/Archive_Failure",
#     "HCM_Directory/HCM/WFM/Archive_Success",
#     "HCM_Directory/HCM/WFM/Inbound",
#     "HCM_Directory/HCM/WFM/Outbound",
#     "HCM_Directory/HCM/CEP/Outbound/OrgTree",
#     "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData",
#     "HCM_Directory/HCM/Datev/Outbound/PayrollInterface",
#     "HCM_Directory/HCM/Disponic/Outbound/EmpData",
#     "HCM_Directory/HCM/DPP/Outbound/EmpQualifications",
#     "HCM_Directory/HCM/LMS/Outbound/EmpData",
#     "HCM_Directory/HCM/Mepco/Outbound/Allowance",
#     "HCM_Directory/HCM/Mepco/Outbound/AllowanceNewHire",
#     "HCM_Directory/HCM/Mepco/Outbound/Employment",
#     "HCM_Directory/HCM/Mepco/Outbound/EmploymentNewHire",
#     "HCM_Directory/HCM/TechPlatform/Outbound/Absence",
#     "HCM_Directory/HCM/TechPlatform/Outbound/EmpQualifications",
#     "HCM_Directory/HCM/TechPlatform/Outbound/MasterListQualifications",
#     "HCM_Directory/HCM/VisionEU/Outbound/Address",
#     "HCM_Directory/HCM/VisionEU/Outbound/Company",
#     "HCM_Directory/HCM/VisionEU/Outbound/EmpCert",
#     "HCM_Directory/HCM/VisionEU/Outbound/Employee",
#     "HCM_Directory/HCM/VisionEU/Outbound/MasterCert",
#     "HCM_Directory/HCM/VisionEU/Outbound/OrgTree",
#     "HCM_Directory/HCM/VisionEU/Outbound/PersonEmployment",
#     "HCM_Directory/HCM/VisionEU/Outbound/Salary",
#     "HCM_Directory/HCM/VisionEU/Outbound/SubBranches",
#     "HCM_Directory/HCM/VisionEU/Outbound/Teams",
#     "HCM_Directory/HCM/WFM/Outbound/Address",
#     "HCM_Directory/HCM/WFM/Outbound/EmpCert",
#     "HCM_Directory/HCM/WFM/Outbound/Employment",
#     "HCM_Directory/HCM/WFM/Outbound/MasterCert",
#     "HCM_Directory/HCM/WFM/Outbound/Person",
#     "HCM_Directory/HCM/WFM/Outbound/Salary",
#     "HCM_Directory/HCM/WFM/Outbound/Teams",
#     "HCM_Directory/HCM/SNOW",
#     "HCM_Directory/HCM/SNOW/Archive_Failure",
#     "HCM_Directory/HCM/SNOW/Archive_Success",
#     "HCM_Directory/HCM/SNOW/Outbound",
#     "HCM_Directory/HCM/SNOW/Outbound/Job",
#     "HCM_Directory/HCM/SNOW/Outbound/OrgHierarchy",
#     "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData",
#     "HCM_Directory/HCM/SNOW/Outbound/EmpQualifications",
#     "HCM_Directory/HCM/SNOW/Outbound/MasterListQualifications",
#     "HCM_Directory/HCM/SNOW/Outbound/EmpData",
#     "HCM_Directory/HCM/SNOW/Outbound/Location",
#     "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
#     "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
#     "HCM_Directory/HCM/Mepco/Archive_Failure",
#     "HCM_Directory/HCM/Mepco/Archive_Success",
#     "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults",
#     "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults/WorkerFileCollection"

#   ]

#   erp_folder_sructure = [
#     "ERP_Directory",
#     "ERP_Directory/ERP",
#     "ERP_Directory/ERP/AkBank",
#     "ERP_Directory/ERP/CGI",
#     "ERP_Directory/ERP/ExchangeRates",
#     "ERP_Directory/ERP/Interview",
#     "ERP_Directory/ERP/MFiles",
#     "ERP_Directory/ERP/Nomentia",
#     "ERP_Directory/ERP/Oracle",
#     "ERP_Directory/ERP/QnBBank",
#     "ERP_Directory/ERP/SEBBank",
#     "ERP_Directory/ERP/Technician",
#     "ERP_Directory/ERP/TechPlatform",
#     "ERP_Directory/ERP/TurkeyCentralBank",
#     "ERP_Directory/ERP/WFM",
#     "ERP_Directory/ERP/AkBank/Inbound",
#     "ERP_Directory/ERP/AkBank/Outbound",
#     "ERP_Directory/ERP/CGI/Inbound",
#     "ERP_Directory/ERP/CGI/Outbound",
#     "ERP_Directory/ERP/Interview/Inbound",
#     "ERP_Directory/ERP/Interview/Outbound",
#     "ERP_Directory/ERP/MFiles/Outbound",
#     "ERP_Directory/ERP/Nomentia/Inbound",
#     "ERP_Directory/ERP/Nomentia/Outbound",
#     "ERP_Directory/ERP/Oracle/InvoicePrint",
#     "ERP_Directory/ERP/QnBBank/Inbound",
#     "ERP_Directory/ERP/QnBBank/Outbound",
#     "ERP_Directory/ERP/SEBBank/Inbound",
#     "ERP_Directory/ERP/SEBBank/Outbound",
#     "ERP_Directory/ERP/Technician/Inbound",
#     "ERP_Directory/ERP/TechPlatform/FieldService",
#     "ERP_Directory/ERP/TurkeyCentralBank/Inbound",
#     "ERP_Directory/ERP/TurkeyCentralBank/Outbound",
#     "ERP_Directory/ERP/WFM/Inbound",
#     "ERP_Directory/ERP/WFM/Outbound",
#     "ERP_Directory/ERP/AkBank/Inbound/Archive",
#     "ERP_Directory/ERP/AkBank/Inbound/Error",
#     "ERP_Directory/ERP/AkBank/Outbound/Archive",
#     "ERP_Directory/ERP/AkBank/Outbound/Error",
#     "ERP_Directory/ERP/Interview/Inbound/Archive",
#     "ERP_Directory/ERP/Interview/Inbound/Error",
#     "ERP_Directory/ERP/Interview/Outbound/Archive",
#     "ERP_Directory/ERP/Interview/Outbound/Error",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcEveOut",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcFenOut",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcPalvOut",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcSecuOut",
#     "ERP_Directory/ERP/Nomentia/Inbound/Archive",
#     "ERP_Directory/ERP/Nomentia/Outbound/Archive",
#     "ERP_Directory/ERP/Nomentia/Inbound/Error",
#     "ERP_Directory/ERP/Nomentia/Outbound/Error",
#     "ERP_Directory/ERP/Oracle/InvoicePrint/Outbound",
#     "ERP_Directory/ERP/QnBBank/Inbound/Archive",
#     "ERP_Directory/ERP/QnBBank/Inbound/Error",
#     "ERP_Directory/ERP/SEBBank/Inbound/Archive",
#     "ERP_Directory/ERP/SEBBank/Inbound/Error",
#     "ERP_Directory/ERP/Technician/Inbound/Archive",
#     "ERP_Directory/ERP/Technician/Inbound/Error",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Inbound",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Outbound",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Archive",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Error",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Archive",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Error",
#     "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Archive",
#     "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Error",
#     "ERP_Directory/ERP/WFM/Inbound/Archive",
#     "ERP_Directory/ERP/WFM/Outbound/Archive",
#     "ERP_Directory/ERP/WFM/Inbound/Error",
#     "ERP_Directory/ERP/WFM/Outbound/Error",
#     "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Archive",
#     "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Error",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Inbound",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Outbound",
#     "ERP_Directory/ERP/BillingSolution",
#     "ERP_Directory/ERP/BillingSolution/Inbound",
#     "ERP_Directory/ERP/BillingSolution/Archive",
#     "ERP_Directory/ERP/WFM/Inbound/Archive_Failure",
#     "ERP_Directory/ERP/WFM/Inbound/Archive_Success"
#   ]

#   wfm_folder_structure = [
#     "WFM_Directory",
#     "WFM_Directory/WFM",
#     "WFM_Directory/WFM/Destination",
#     "WFM_Directory/WFM/GRS",
#     "WFM_Directory/WFM/Source",
#     "WFM_Directory/WFM/GRS/Outbound",
#     "WFM_Directory/WFM/SSE-WFM-INT-1025",
#     "WFM_Directory/WFM/SSE-WFM-INT-1025/Sentera",
#     "WFM_Directory/WFM/Mepco",
#     "WFM_Directory/WFM/Mepco/Archive_Success",
#     "WFM_Directory/WFM/Mepco/Archive_Failure",
#     "WFM_Directory/WFM/Mulesoft",
#     "WFM_Directory/WFM/Mulesoft/Archive_Success",
#     "WFM_Directory/WFM/Mulesoft/Archive_Failure",
#     "WFM_Directory/WFM/BillingEngine",
#     "WFM_Directory/WFM/BillingEngine/Archive",
#     "WFM_Directory/WFM/BillingEngine/Drop"
#   ]

#   tech_platform_folder_structure = [
#     "Tech_Platform_Directory",
#     "Tech_Platform_Directory/TechPlatform"
#   ]

#   smartrecruiters_folder_structure = [
#     "SmartRecruiters_Directory",
#     "SmartRecruiters_Directory/SmartRecruiters"
#   ]
# }
# resource "azurerm_storage_share_directory" "sftp-fileshare-hcm-directory" {
#   count                = length(local.hcm_folder_sructure)
#   name                 = element(local.hcm_folder_sructure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }
# resource "azurerm_storage_share_directory" "sftp-fileshare-wfm-directory" {
#   count                = length(local.wfm_folder_structure)
#   name                 = element(local.wfm_folder_structure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }
# resource "azurerm_storage_share_directory" "sftp-fileshare-erp-directory" {
#   count                = length(local.erp_folder_sructure)
#   name                 = element(local.erp_folder_sructure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }

# resource "azurerm_storage_share_directory" "sftp-fileshare-tech-platform-directory" {
#   count                = length(local.tech_platform_folder_structure)
#   name                 = element(local.tech_platform_folder_structure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }

# resource "azurerm_storage_share_directory" "sftp-fileshare-smartrecruiters-directory" {
#   count                = length(local.smartrecruiters_folder_structure)
#   name                 = element(local.smartrecruiters_folder_structure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }

# #Storageaccount-Container
# resource "azurerm_storage_container" "sftp-server-script-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "sftp-container"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for Finland
# resource "azurerm_storage_container" "finland-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "root-finland"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for ERP
# resource "azurerm_storage_container" "erp-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "erp-container"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "private"
# }

# #container for archive fail
# resource "azurerm_storage_container" "archive-failed-files-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "archive-failed-files"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }
# #container for archive success
# resource "azurerm_storage_container" "archive-successful-files-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "archive-successful-files"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }
# #container for oracle-vision
# resource "azurerm_storage_container" "oracle-vision-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "oracle-vision-common-emptyfiles"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for hcm temp
# resource "azurerm_storage_container" "hcm-transit-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "hcm-file-transit"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for wfm temp
# resource "azurerm_storage_container" "wfm-transit-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "wfm-file-transit"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for erp temp
# resource "azurerm_storage_container" "erp-transit-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "erp-file-transit"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #StorageAccount - diagnostic settings
# resource "azurerm_monitor_diagnostic_setting" "adf-storage-account-diagnostic-settings" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name               = "adf-storage-diagnostic-settings"
#   target_resource_id = resource.azurerm_storage_account.sa[count.index].id
#   log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

#   metric {
#     category = "Transaction"

#     retention_policy {
#       enabled = false
#     }
#   }
# }

# resource "azurerm_monitor_diagnostic_setting" "adf-storage-fileshare-diagnostic-settings" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name               = "adf-storage-fileshare-diagnostics"
#   target_resource_id = "${resource.azurerm_storage_account.sa[count.index].id}/fileServices/default"
#   log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

#   log {
#     category = "StorageRead"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageWrite"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageDelete"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }
#   metric {
#     category = "Transaction"

#     retention_policy {
#       enabled = false
#     }
#   }
# }

# resource "azurerm_monitor_diagnostic_setting" "adf-storage-container-diagnostic-settings" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name               = "adf-storage-container-diagnostics"
#   target_resource_id = "${resource.azurerm_storage_account.sa[count.index].id}/blobServices/default"
#   log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

#   log {
#     category = "StorageRead"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageWrite"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageDelete"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }
#   metric {
#     category = "Transaction"

#     retention_policy {
#       enabled = false
#     }
#   }

# }

#new storage
#Storageaccount-FileShare & directories
resource "azurerm_storage_share" "sftp-newfileshare" {
  name                 = "sftpfileshare"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  quota                = 50
}

locals {
  hcm_folder_sructure_new = [
    "HCM_Directory",
    "HCM_Directory/HCM",
    "HCM_Directory/HCM/Absence",
    "HCM_Directory/HCM/ActiveDirectory",
    "HCM_Directory/HCM/APCBWFM",
    "HCM_Directory/HCM/CEP",
    "HCM_Directory/HCM/D3",
    "HCM_Directory/HCM/Datev",
    "HCM_Directory/HCM/Disponic",
    "HCM_Directory/HCM/DPP",
    "HCM_Directory/HCM/ESOffice",
    "HCM_Directory/HCM/GMS",
    "HCM_Directory/HCM/GovernmentPlatformforsubsidies",
    "HCM_Directory/HCM/GroundStar",
    "HCM_Directory/HCM/LMS",
    "HCM_Directory/HCM/Mepco",
    "HCM_Directory/HCM/PartnerPortal",
    "HCM_Directory/HCM/Pernet",
    "HCM_Directory/HCM/Platnik",
    "HCM_Directory/HCM/SAP",
    "HCM_Directory/HCM/Semco",
    "HCM_Directory/HCM/SmartRecruiters",
    "HCM_Directory/HCM/TechPlatform",
    "HCM_Directory/HCM/VisionEU",
    "HCM_Directory/HCM/SPExpert",
    "HCM_Directory/HCM/WFM",
    "HCM_Directory/HCM/FS",
    "HCM_Directory/HCM/MSD365",
    "HCM_Directory/HCM/PKK",
    "HCM_Directory/HCM/ePUE",
    "HCM_Directory/HCM/Absence/Archive_Failure",
    "HCM_Directory/HCM/Absence/Archive_Success",
    "HCM_Directory/HCM/Absence/Inbound",
    "HCM_Directory/HCM/ActiveDirectory/Archive_Failure",
    "HCM_Directory/HCM/ActiveDirectory/Archive_Success",
    "HCM_Directory/HCM/ActiveDirectory/Inbound",
    "HCM_Directory/HCM/ActiveDirectory/Outbound",
    "HCM_Directory/HCM/APCBWFM/Archive_Failure",
    "HCM_Directory/HCM/APCBWFM/Archive_Success",
    "HCM_Directory/HCM/APCBWFM/Outbound",
    "HCM_Directory/HCM/CEP/Inbound",
    "HCM_Directory/HCM/CEP/Outbound",
    "HCM_Directory/HCM/D3/Outbound",
    "HCM_Directory/HCM/Datev/Archive_Failure",
    "HCM_Directory/HCM/Datev/Archive_Success",
    "HCM_Directory/HCM/Datev/Inbound",
    "HCM_Directory/HCM/Datev/Outbound",
    "HCM_Directory/HCM/Disponic/Archive_Failure",
    "HCM_Directory/HCM/Disponic/Archive_Success",
    "HCM_Directory/HCM/Disponic/Inbound",
    "HCM_Directory/HCM/Disponic/Outbound",
    "HCM_Directory/HCM/DPP/Archive_Failure",
    "HCM_Directory/HCM/DPP/Archive_Success",
    "HCM_Directory/HCM/DPP/Inbound",
    "HCM_Directory/HCM/DPP/Outbound",
    "HCM_Directory/HCM/ePUE/Inbound",
    "HCM_Directory/HCM/ESOffice/Outbound",
    "HCM_Directory/HCM/FS/Outbound",
    "HCM_Directory/HCM/GMS/Archive_Failure",
    "HCM_Directory/HCM/GMS/Archive_Success",
    "HCM_Directory/HCM/GMS/Outbound",
    "HCM_Directory/HCM/GovernmentPlatformforsubsidies/Outbound",
    "HCM_Directory/HCM/GroundStar/Archive_Failure",
    "HCM_Directory/HCM/GroundStar/Archive_Success",
    "HCM_Directory/HCM/GroundStar/Inbound",
    "HCM_Directory/HCM/GroundStar/Outbound",
    "HCM_Directory/HCM/LMS/Archive_Failure",
    "HCM_Directory/HCM/LMS/Archive_Success",
    "HCM_Directory/HCM/LMS/Inbound",
    "HCM_Directory/HCM/LMS/Outbound",
    "HCM_Directory/HCM/Mepco/Inbound",
    "HCM_Directory/HCM/Mepco/Outbound",
    "HCM_Directory/HCM/MSD365/Outbound",
    "HCM_Directory/HCM/PartnerPortal/Inbound",
    "HCM_Directory/HCM/Pernet/Outbound",
    "HCM_Directory/HCM/PKK/Outbound",
    "HCM_Directory/HCM/Platnik/Outbound",
    "HCM_Directory/HCM/SAP/Outbound",
    "HCM_Directory/HCM/Semco/Inbound",
    "HCM_Directory/HCM/SmartRecruiters/Inbound",
    "HCM_Directory/HCM/SmartRecruiters/Outbound",
    "HCM_Directory/HCM/SPExpert/Outbound",
    "HCM_Directory/HCM/TechPlatform/Archive_Failure",
    "HCM_Directory/HCM/TechPlatform/Archive_Success",
    "HCM_Directory/HCM/TechPlatform/Inbound",
    "HCM_Directory/HCM/TechPlatform/Outbound",
    "HCM_Directory/HCM/VisionEU/Archive_Failure",
    "HCM_Directory/HCM/VisionEU/Archive_Success",
    "HCM_Directory/HCM/VisionEU/Inbound",
    "HCM_Directory/HCM/VisionEU/Outbound",
    "HCM_Directory/HCM/WFM/Archive_Failure",
    "HCM_Directory/HCM/WFM/Archive_Success",
    "HCM_Directory/HCM/WFM/Inbound",
    "HCM_Directory/HCM/WFM/Outbound",
    "HCM_Directory/HCM/CEP/Outbound/OrgTree",
    "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface",
    "HCM_Directory/HCM/Disponic/Outbound/EmpData",
    "HCM_Directory/HCM/DPP/Outbound/EmpQualifications",
    "HCM_Directory/HCM/LMS/Outbound/EmpData",
    "HCM_Directory/HCM/Mepco/Outbound/Allowance",
    "HCM_Directory/HCM/Mepco/Outbound/AllowanceNewHire",
    "HCM_Directory/HCM/Mepco/Outbound/Employment",
    "HCM_Directory/HCM/Mepco/Outbound/EmploymentNewHire",
    "HCM_Directory/HCM/TechPlatform/Outbound/Absence",
    "HCM_Directory/HCM/TechPlatform/Outbound/EmpQualifications",
    "HCM_Directory/HCM/TechPlatform/Outbound/MasterListQualifications",
    "HCM_Directory/HCM/VisionEU/Outbound/Address",
    "HCM_Directory/HCM/VisionEU/Outbound/Company",
    "HCM_Directory/HCM/VisionEU/Outbound/EmpCert",
    "HCM_Directory/HCM/VisionEU/Outbound/Employee",
    "HCM_Directory/HCM/VisionEU/Outbound/MasterCert",
    "HCM_Directory/HCM/VisionEU/Outbound/OrgTree",
    "HCM_Directory/HCM/VisionEU/Outbound/PersonEmployment",
    "HCM_Directory/HCM/VisionEU/Outbound/Salary",
    "HCM_Directory/HCM/VisionEU/Outbound/SubBranches",
    "HCM_Directory/HCM/VisionEU/Outbound/Teams",
    "HCM_Directory/HCM/WFM/Outbound/Address",
    "HCM_Directory/HCM/WFM/Outbound/EmpCert",
    "HCM_Directory/HCM/WFM/Outbound/Employment",
    "HCM_Directory/HCM/WFM/Outbound/MasterCert",
    "HCM_Directory/HCM/WFM/Outbound/Person",
    "HCM_Directory/HCM/WFM/Outbound/Salary",
    "HCM_Directory/HCM/WFM/Outbound/Teams",
    "HCM_Directory/HCM/SNOW",
    "HCM_Directory/HCM/SNOW/Archive_Failure",
    "HCM_Directory/HCM/SNOW/Archive_Success",
    "HCM_Directory/HCM/SNOW/Outbound",
    "HCM_Directory/HCM/SNOW/Outbound/Job",
    "HCM_Directory/HCM/SNOW/Outbound/OrgHierarchy",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData",
    "HCM_Directory/HCM/SNOW/Outbound/EmpQualifications",
    "HCM_Directory/HCM/SNOW/Outbound/MasterListQualifications",
    "HCM_Directory/HCM/SNOW/Outbound/EmpData",
    "HCM_Directory/HCM/SNOW/Outbound/Location",
    "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/HCM/Mepco/Archive_Failure",
    "HCM_Directory/HCM/Mepco/Archive_Success",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults/WorkerFileCollection",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults/CalculatedSalaryCollection",
    "HCM_Directory/HCM/SmartRecruiters/Outbound/Configuration",
    "HCM_Directory/HCM/SmartRecruiters/Archive_Success",
    "HCM_Directory/HCM/SmartRecruiters/Archive_Failure",
    "HCM_Directory/HCM/SmartRecruiters/Outbound/Dependency",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults/ATPWorker",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults/KTAWorker",
    "HCM_Directory/HCM/CEP/Outbound/OrgHierarchy",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/MergeDat",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/DeleteDat",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/LODAS",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/Newhire",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/VacationSickness",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/Sickness",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/Absence",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/DPP",
    
    #Adding directories for HCM BAU
    "HCM_Directory/BAU/HCM",
    "HCM_Directory/BAU/HCM/Absence",
    "HCM_Directory/BAU/HCM/ActiveDirectory",
    "HCM_Directory/BAU/HCM/APCBWFM",
    "HCM_Directory/BAU/HCM/CEP",
    "HCM_Directory/BAU/HCM/D3",
    "HCM_Directory/BAU/HCM/Datev",
    "HCM_Directory/BAU/HCM/Disponic",
    "HCM_Directory/BAU/HCM/DPP",
    "HCM_Directory/BAU/HCM/ESOffice",
    "HCM_Directory/BAU/HCM/GMS",
    "HCM_Directory/BAU/HCM/GovernmentPlatformforsubsidies",
    "HCM_Directory/BAU/HCM/GroundStar",
    "HCM_Directory/BAU/HCM/LMS",
    "HCM_Directory/BAU/HCM/Mepco",
    "HCM_Directory/BAU/HCM/PartnerPortal",
    "HCM_Directory/BAU/HCM/Pernet",
    "HCM_Directory/BAU/HCM/Platnik",
    "HCM_Directory/BAU/HCM/SAP",
    "HCM_Directory/BAU/HCM/Semco",
    "HCM_Directory/BAU/HCM/SmartRecruiters",
    "HCM_Directory/BAU/HCM/TechPlatform",
    "HCM_Directory/BAU/HCM/VisionEU",
    "HCM_Directory/BAU/HCM/SPExpert",
    "HCM_Directory/BAU/HCM/WFM",
    "HCM_Directory/BAU/HCM/FS",
    "HCM_Directory/BAU/HCM/MSD365",
    "HCM_Directory/BAU/HCM/PKK",
    "HCM_Directory/BAU/HCM/ePUE",
    "HCM_Directory/BAU/HCM/Absence/Archive_Failure",
    "HCM_Directory/BAU/HCM/Absence/Archive_Success",
    "HCM_Directory/BAU/HCM/Absence/Inbound",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Archive_Failure",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Archive_Success",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Inbound",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Outbound",
    "HCM_Directory/BAU/HCM/APCBWFM/Archive_Failure",
    "HCM_Directory/BAU/HCM/APCBWFM/Archive_Success",
    "HCM_Directory/BAU/HCM/APCBWFM/Outbound",
    "HCM_Directory/BAU/HCM/CEP/Inbound",
    "HCM_Directory/BAU/HCM/CEP/Outbound",
    "HCM_Directory/BAU/HCM/D3/Outbound",
    "HCM_Directory/BAU/HCM/Datev/Archive_Failure",
    "HCM_Directory/BAU/HCM/Datev/Archive_Success",
    "HCM_Directory/BAU/HCM/Datev/Inbound",
    "HCM_Directory/BAU/HCM/Datev/Outbound",
    "HCM_Directory/BAU/HCM/Disponic/Archive_Failure",
    "HCM_Directory/BAU/HCM/Disponic/Archive_Success",
    "HCM_Directory/BAU/HCM/Disponic/Inbound",
    "HCM_Directory/BAU/HCM/Disponic/Outbound",
    "HCM_Directory/BAU/HCM/DPP/Archive_Failure",
    "HCM_Directory/BAU/HCM/DPP/Archive_Success",
    "HCM_Directory/BAU/HCM/DPP/Inbound",
    "HCM_Directory/BAU/HCM/DPP/Outbound",
    "HCM_Directory/BAU/HCM/ePUE/Inbound",
    "HCM_Directory/BAU/HCM/ESOffice/Outbound",
    "HCM_Directory/BAU/HCM/FS/Outbound",
    "HCM_Directory/BAU/HCM/GMS/Archive_Failure",
    "HCM_Directory/BAU/HCM/GMS/Archive_Success",
    "HCM_Directory/BAU/HCM/GMS/Outbound",
    "HCM_Directory/BAU/HCM/GovernmentPlatformforsubsidies/Outbound",
    "HCM_Directory/BAU/HCM/GroundStar/Archive_Failure",
    "HCM_Directory/BAU/HCM/GroundStar/Archive_Success",
    "HCM_Directory/BAU/HCM/GroundStar/Inbound",
    "HCM_Directory/BAU/HCM/GroundStar/Outbound",
    "HCM_Directory/BAU/HCM/LMS/Archive_Failure",
    "HCM_Directory/BAU/HCM/LMS/Archive_Success",
    "HCM_Directory/BAU/HCM/LMS/Inbound",
    "HCM_Directory/BAU/HCM/LMS/Outbound",
    "HCM_Directory/BAU/HCM/Mepco/Inbound",
    "HCM_Directory/BAU/HCM/Mepco/Outbound",
    "HCM_Directory/BAU/HCM/MSD365/Outbound",
    "HCM_Directory/BAU/HCM/PartnerPortal/Inbound",
    "HCM_Directory/BAU/HCM/Pernet/Outbound",
    "HCM_Directory/BAU/HCM/PKK/Outbound",
    "HCM_Directory/BAU/HCM/Platnik/Outbound",
    "HCM_Directory/BAU/HCM/SAP/Outbound",
    "HCM_Directory/BAU/HCM/Semco/Inbound",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Inbound",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Outbound",
    "HCM_Directory/BAU/HCM/SPExpert/Outbound",
    "HCM_Directory/BAU/HCM/TechPlatform/Archive_Failure",
    "HCM_Directory/BAU/HCM/TechPlatform/Archive_Success",
    "HCM_Directory/BAU/HCM/TechPlatform/Inbound",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound",
    "HCM_Directory/BAU/HCM/VisionEU/Archive_Failure",
    "HCM_Directory/BAU/HCM/VisionEU/Archive_Success",
    "HCM_Directory/BAU/HCM/VisionEU/Inbound",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound",
    "HCM_Directory/BAU/HCM/WFM/Archive_Failure",
    "HCM_Directory/BAU/HCM/WFM/Archive_Success",
    "HCM_Directory/BAU/HCM/WFM/Inbound",
    "HCM_Directory/BAU/HCM/WFM/Outbound",
    "HCM_Directory/BAU/HCM/CEP/Outbound/OrgTree",
    "HCM_Directory/BAU/HCM/Datev/Inbound/EmpAbsenceData",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface",
    "HCM_Directory/BAU/HCM/Disponic/Outbound/EmpData",
    "HCM_Directory/BAU/HCM/DPP/Outbound/EmpQualifications",
    "HCM_Directory/BAU/HCM/LMS/Outbound/EmpData",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/Allowance",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/AllowanceNewHire",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/Employment",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/EmploymentNewHire",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound/Absence",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound/EmpQualifications",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound/MasterListQualifications",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Address",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Company",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/EmpCert",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Employee",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/MasterCert",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/OrgTree",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/PersonEmployment",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Salary",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/SubBranches",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Teams",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Address",
    "HCM_Directory/BAU/HCM/WFM/Outbound/EmpCert",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Employment",
    "HCM_Directory/BAU/HCM/WFM/Outbound/MasterCert",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Person",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Salary",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Teams",
    "HCM_Directory/BAU/HCM/SNOW",
    "HCM_Directory/BAU/HCM/SNOW/Archive_Failure",
    "HCM_Directory/BAU/HCM/SNOW/Archive_Success",
    "HCM_Directory/BAU/HCM/SNOW/Outbound",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/Job",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/OrgHierarchy",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/EmpQualifications",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/MasterListQualifications",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/EmpData",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/Location",
    "HCM_Directory/BAU/HCM/Datev/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/BAU/HCM/Mepco/Archive_Failure",
    "HCM_Directory/BAU/HCM/Mepco/Archive_Success",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedAbsenceResults",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedAbsenceResults/WorkerFileCollection",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults/CalculatedSalaryCollection",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Outbound/Configuration",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Archive_Success",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Archive_Failure",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Outbound/Dependency",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults/ATPWorker",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults/KTAWorker",
    "HCM_Directory/BAU/HCM/CEP/Outbound/OrgHierarchy",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData/MergeDat",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData/DeleteDat",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/LODAS",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/Newhire",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/VacationSickness",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/Sickness",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/Absence",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/DPP"

  ]

  erp_folder_sructure_new = [
    "ERP_Directory",
    "ERP_Directory/ERP",
    "ERP_Directory/ERP/AkBank",
    "ERP_Directory/ERP/CGI",
    "ERP_Directory/ERP/ExchangeRates",
    "ERP_Directory/ERP/Interview",
    "ERP_Directory/ERP/MFiles",
    "ERP_Directory/ERP/Nomentia",
    "ERP_Directory/ERP/Oracle",
    "ERP_Directory/ERP/QnBBank",
    "ERP_Directory/ERP/SEBBank",
    "ERP_Directory/ERP/Technician",
    "ERP_Directory/ERP/TechPlatform",
    "ERP_Directory/ERP/TurkeyCentralBank",
    "ERP_Directory/ERP/WFM",
    "ERP_Directory/ERP/AkBank/Inbound",
    "ERP_Directory/ERP/AkBank/Outbound",
    "ERP_Directory/ERP/CGI/Inbound",
    "ERP_Directory/ERP/CGI/Outbound",
    "ERP_Directory/ERP/Interview/Inbound",
    "ERP_Directory/ERP/Interview/Outbound",
    "ERP_Directory/ERP/MFiles/Outbound",
    "ERP_Directory/ERP/Nomentia/Inbound",
    "ERP_Directory/ERP/Nomentia/Outbound",
    "ERP_Directory/ERP/Oracle/InvoicePrint",
    "ERP_Directory/ERP/QnBBank/Inbound",
    "ERP_Directory/ERP/QnBBank/Outbound",
    "ERP_Directory/ERP/SEBBank/Inbound",
    "ERP_Directory/ERP/SEBBank/Outbound",
    "ERP_Directory/ERP/Technician/Inbound",
    "ERP_Directory/ERP/TechPlatform/FieldService",
    "ERP_Directory/ERP/TurkeyCentralBank/Inbound",
    "ERP_Directory/ERP/TurkeyCentralBank/Outbound",
    "ERP_Directory/ERP/WFM/Inbound",
    "ERP_Directory/ERP/WFM/Outbound",
    "ERP_Directory/ERP/AkBank/Inbound/Archive",
    "ERP_Directory/ERP/AkBank/Inbound/Error",
    "ERP_Directory/ERP/AkBank/Outbound/Archive",
    "ERP_Directory/ERP/AkBank/Outbound/Error",
    "ERP_Directory/ERP/Interview/Inbound/Archive",
    "ERP_Directory/ERP/Interview/Inbound/Error",
    "ERP_Directory/ERP/Interview/Outbound/Archive",
    "ERP_Directory/ERP/Interview/Outbound/Error",
    "ERP_Directory/ERP/MFiles/Outbound/ArcEveOut",
    "ERP_Directory/ERP/MFiles/Outbound/ArcFenOut",
    "ERP_Directory/ERP/MFiles/Outbound/ArcPalvOut",
    "ERP_Directory/ERP/MFiles/Outbound/ArcSecuOut",
    "ERP_Directory/ERP/Nomentia/Inbound/Archive",
    "ERP_Directory/ERP/Nomentia/Outbound/Archive",
    "ERP_Directory/ERP/Nomentia/Inbound/Error",
    "ERP_Directory/ERP/Nomentia/Outbound/Error",
    "ERP_Directory/ERP/Oracle/InvoicePrint/Outbound",
    "ERP_Directory/ERP/QnBBank/Inbound/Archive",
    "ERP_Directory/ERP/QnBBank/Inbound/Error",
    "ERP_Directory/ERP/SEBBank/Inbound/Archive",
    "ERP_Directory/ERP/SEBBank/Inbound/Error",
    "ERP_Directory/ERP/Technician/Inbound/Archive",
    "ERP_Directory/ERP/Technician/Inbound/Error",
    "ERP_Directory/ERP/TechPlatform/FieldService/Inbound",
    "ERP_Directory/ERP/TechPlatform/FieldService/Outbound",
    "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Archive",
    "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Error",
    "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Archive",
    "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Error",
    "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Archive",
    "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Error",
    "ERP_Directory/ERP/WFM/Inbound/Archive",
    "ERP_Directory/ERP/WFM/Outbound/Archive",
    "ERP_Directory/ERP/WFM/Inbound/Error",
    "ERP_Directory/ERP/WFM/Outbound/Error",
    "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Archive",
    "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Error",
    "ERP_Directory/ERP/FinlandNomentiaLockbox",
    "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia",
    "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Inbound",
    "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Outbound",
    "ERP_Directory/ERP/BillingSolution",
    "ERP_Directory/ERP/BillingSolution/Inbound",
    "ERP_Directory/ERP/BillingSolution/Archive",
    "ERP_Directory/ERP/Nomentia/Inbound/Archive_Success",
    "ERP_Directory/ERP/Nomentia/Inbound/Archive_Failure",
    "ERP_Directory/ERP/WFM/Attachment",
    "ERP_Directory/ERP/OkPerinta",
    "ERP_Directory/ERP/OkPerinta/Inbound",
    "ERP_Directory/ERP/WFM/Inbound/Archive_Failure",
    "ERP_Directory/ERP/WFM/Inbound/Archive_Success",
    "ERP_Directory/ERP/Nomentia/Outbound/Archive_Success",
    "ERP_Directory/ERP/Nomentia/Outbound/Archive_Failure",
    "ERP_Directory/ERP/OkPerinta/Outbound",
    "ERP_Directory/ERP/OkPerinta/Inbound/Archive_Success",
    "ERP_Directory/ERP/OkPerinta/Inbound/Archive_Failure",
    "ERP_Directory/ERP/OkPerinta/Outbound/Archive_Success",
    "ERP_Directory/ERP/OkPerinta/Outbound/Archive_Failure",
    "ERP_Directory/ERP/Interview/Attachment",
    "ERP_Directory/ERP/Interview/Inbound/Archive_Success",
    "ERP_Directory/ERP/Interview/Inbound/Archive_Failure",
    "ERP_Directory/ERP/Basware",
    "ERP_Directory/ERP/Basware/Supplier",
    "ERP_Directory/ERP/Basware/Supplier/Outbound",
    "ERP_Directory/ERP/ContractsOutbound",
    "ERP_Directory/ERP/ContractsOutbound/Outbound",
    "ERP_Directory/ERP/ContractsOutbound/InboundCRM",
    "ERP_Directory/ERP/ContractsOutbound/Outbound/Archive-Success",
    "ERP_Directory/ERP/ContractsOutbound/Outbound/Archive-Failure",
    "ERP_Directory/ERP/ARTransactions",
    "ERP_Directory/ERP/ARTransactions/Archive_Success",
    "ERP_Directory/ERP/ARTransactions/Archive_Failure",
    "ERP_Directory/ERP/OIC",
    "ERP_Directory/ERP/OIC/Inbound",
    "ERP_Directory/ERP/OIC/Inbound/PriceRevision",
    "ERP_Directory/ERP/OIC/Inbound/Archive_Success",
    "ERP_Directory/ERP/OIC/Inbound/Archive_Failure",
    "ERP_Directory/ERP/OIC/Inbound/Archive",
    # "ERP_Directory/ERP/Invoice",
    # "ERP_Directory/ERP/Invoice/Archive",
    # "ERP_Directory/ERP/Invoice/Error",
    # "ERP_Directory/ERP/Invoice/Inbound",
    # "ERP_Directory/ERP/Invoice/Outbound",
    # "ERP_Directory/ERP/Invoice/Archive/Securitas",
    # "ERP_Directory/ERP/Invoice/Archive/Events",
    # "ERP_Directory/ERP/Invoice/Archive/Palvelut",
    # "ERP_Directory/ERP/Invoice/Archive/Fenovi",
    # "ERP_Directory/ERP/Invoice/Archive/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Archive/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Archive/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Archive/ArcFenovi",
    # "ERP_Directory/ERP/Invoice/Inbound/Securitas",
    # "ERP_Directory/ERP/Invoice/Inbound/Events",
    # "ERP_Directory/ERP/Invoice/Inbound/Palvelut",
    # "ERP_Directory/ERP/Invoice/Inbound/Fenovi",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcFenovi",
    # "ERP_Directory/ERP/Invoice/Error/Securitas",
    # "ERP_Directory/ERP/Invoice/Error/Events",
    # "ERP_Directory/ERP/Invoice/Error/Palvelut",
    # "ERP_Directory/ERP/Invoice/Error/Fenovi",
    # "ERP_Directory/ERP/Invoice/Error/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Error/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Error/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Error/ArcFenovi",
    # "ERP_Directory/ERP/Invoice/Outbound/Securitas",
    # "ERP_Directory/ERP/Invoice/Outbound/Events",
    # "ERP_Directory/ERP/Invoice/Outbound/Palvelut",
    # "ERP_Directory/ERP/Invoice/Outbound/Fenovi",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcFenovi",
    # "ERP_Directory/ERP/OIC/Outbound",
    # "ERP_Directory/ERP/OIC/Outbound/PriceRevisionStatus"

    #Adding directories for ERP BAU
    "ERP_Directory/BAU/ERP",
    "ERP_Directory/BAU/ERP/AkBank",
    "ERP_Directory/BAU/ERP/CGI",
    "ERP_Directory/BAU/ERP/ExchangeRates",
    "ERP_Directory/BAU/ERP/Interview",
    "ERP_Directory/BAU/ERP/MFiles",
    "ERP_Directory/BAU/ERP/Nomentia",
    "ERP_Directory/BAU/ERP/Oracle",
    "ERP_Directory/BAU/ERP/QnBBank",
    "ERP_Directory/BAU/ERP/SEBBank",
    "ERP_Directory/BAU/ERP/Technician",
    "ERP_Directory/BAU/ERP/TechPlatform",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank",
    "ERP_Directory/BAU/ERP/WFM",
    "ERP_Directory/BAU/ERP/AkBank/Inbound",
    "ERP_Directory/BAU/ERP/AkBank/Outbound",
    "ERP_Directory/BAU/ERP/CGI/Inbound",
    "ERP_Directory/BAU/ERP/CGI/Outbound",
    "ERP_Directory/BAU/ERP/Interview/Inbound",
    "ERP_Directory/BAU/ERP/Interview/Outbound",
    "ERP_Directory/BAU/ERP/MFiles/Outbound",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound",
    "ERP_Directory/BAU/ERP/Oracle/InvoicePrint",
    "ERP_Directory/BAU/ERP/QnBBank/Inbound",
    "ERP_Directory/BAU/ERP/QnBBank/Outbound",
    "ERP_Directory/BAU/ERP/SEBBank/Inbound",
    "ERP_Directory/BAU/ERP/SEBBank/Outbound",
    "ERP_Directory/BAU/ERP/Technician/Inbound",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Inbound",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Outbound",
    "ERP_Directory/BAU/ERP/WFM/Inbound",
    "ERP_Directory/BAU/ERP/WFM/Outbound",
    "ERP_Directory/BAU/ERP/AkBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/AkBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/AkBank/Outbound/Archive",
    "ERP_Directory/BAU/ERP/AkBank/Outbound/Error",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Archive",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Error",
    "ERP_Directory/BAU/ERP/Interview/Outbound/Archive",
    "ERP_Directory/BAU/ERP/Interview/Outbound/Error",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcEveOut",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcFenOut",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcPalvOut",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcSecuOut",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Archive",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Archive",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Error",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Error",
    "ERP_Directory/BAU/ERP/Oracle/InvoicePrint/Outbound",
    "ERP_Directory/BAU/ERP/QnBBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/QnBBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/SEBBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/SEBBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/Technician/Inbound/Archive",
    "ERP_Directory/BAU/ERP/Technician/Inbound/Error",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Inbound",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Outbound",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Inbound/Archive",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Inbound/Error",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Outbound/Archive",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Outbound/Error",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Archive",
    "ERP_Directory/BAU/ERP/WFM/Outbound/Archive",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Error",
    "ERP_Directory/BAU/ERP/WFM/Outbound/Error",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Outbound/Archive",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Outbound/Error",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox/Nomentia",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox/Nomentia/Inbound",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox/Nomentia/Outbound",
    "ERP_Directory/BAU/ERP/BillingSolution",
    "ERP_Directory/BAU/ERP/BillingSolution/Inbound",
    "ERP_Directory/BAU/ERP/BillingSolution/Archive",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/WFM/Attachment",
    "ERP_Directory/BAU/ERP/OkPerinta",
    "ERP_Directory/BAU/ERP/OkPerinta/Inbound",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/OkPerinta/Outbound",
    "ERP_Directory/BAU/ERP/OkPerinta/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/OkPerinta/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/OkPerinta/Outbound/Archive_Success",
    "ERP_Directory/BAU/ERP/OkPerinta/Outbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/Interview/Attachment",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/Basware",
    "ERP_Directory/BAU/ERP/Basware/Supplier",
    "ERP_Directory/BAU/ERP/Basware/Supplier/Outbound",
    "ERP_Directory/BAU/ERP/ContractsOutbound",
    "ERP_Directory/BAU/ERP/ContractsOutbound/Outbound",
    "ERP_Directory/BAU/ERP/ContractsOutbound/InboundCRM",
    "ERP_Directory/BAU/ERP/ContractsOutbound/Outbound/Archive-Success",
    "ERP_Directory/BAU/ERP/ContractsOutbound/Outbound/Archive-Failure",
    "ERP_Directory/BAU/ERP/ARTransactions",
    "ERP_Directory/BAU/ERP/ARTransactions/Archive_Success",
    "ERP_Directory/BAU/ERP/ARTransactions/Archive_Failure",
    "ERP_Directory/BAU/ERP/OIC",
    "ERP_Directory/BAU/ERP/OIC/Inbound",
    "ERP_Directory/BAU/ERP/OIC/Inbound/PriceRevision",
    "ERP_Directory/BAU/ERP/OIC/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/OIC/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/OIC/Inbound/Archive"
  ]

  wfm_folder_structure_new = [
    "WFM_Directory",
    "WFM_Directory/WFM",
    "WFM_Directory/WFM/Destination",
    "WFM_Directory/WFM/GRS",
    "WFM_Directory/WFM/Source",
    "WFM_Directory/WFM/GRS/Outbound",
    "WFM_Directory/WFM/SSE-WFM-INT-1025",
    "WFM_Directory/WFM/SSE-WFM-INT-1025/Sentera",
    "WFM_Directory/WFM/Mepco",
    "WFM_Directory/WFM/Mepco/Archive_Success",
    "WFM_Directory/WFM/Mepco/Archive_Failure",
    "WFM_Directory/WFM/Mulesoft",
    "WFM_Directory/WFM/Mulesoft/Archive_Success",
    "WFM_Directory/WFM/Mulesoft/Archive_Failure",
    "WFM_Directory/WFM/BillingEngine",
    "WFM_Directory/WFM/BillingEngine/Archive",
    "WFM_Directory/WFM/BillingEngine/Drop",
    "WFM_Directory/WFM/OrtechWFM",
    "WFM_Directory/WFM/OrtechWFM/Archive_Success",
    "WFM_Directory/WFM/OrtechWFM/Archive_Failure",
    "WFM_Directory/WFM/Triopsys",
    "WFM_Directory/WFM/Triopsys/Archive_Success",
    "WFM_Directory/WFM/Triopsys/Archive_Failure",
    "WFM_Directory/WFM/GRS/Outbound/Archive_Success",
    "WFM_Directory/WFM/GRS/Outbound/Archive_Failure",

    #Adding directories for WFM BAU
    "WFM_Directory/BAU/WFM",
    "WFM_Directory/BAU/WFM/Destination",
    "WFM_Directory/BAU/WFM/GRS",
    "WFM_Directory/BAU/WFM/Source",
    "WFM_Directory/BAU/WFM/GRS/Outbound",
    "WFM_Directory/BAU/WFM/SSE-WFM-INT-1025",
    "WFM_Directory/BAU/WFM/SSE-WFM-INT-1025/Sentera",
    "WFM_Directory/BAU/WFM/Mepco",
    "WFM_Directory/BAU/WFM/Mepco/Archive_Success",
    "WFM_Directory/BAU/WFM/Mepco/Archive_Failure",
    "WFM_Directory/BAU/WFM/Mulesoft",
    "WFM_Directory/BAU/WFM/Mulesoft/Archive_Success",
    "WFM_Directory/BAU/WFM/Mulesoft/Archive_Failure",
    "WFM_Directory/BAU/WFM/BillingEngine",
    "WFM_Directory/BAU/WFM/BillingEngine/Archive",
    "WFM_Directory/BAU/WFM/BillingEngine/Drop",
    "WFM_Directory/BAU/WFM/OrtechWFM",
    "WFM_Directory/BAU/WFM/OrtechWFM/Archive_Success",
    "WFM_Directory/BAU/WFM/OrtechWFM/Archive_Failure",
    "WFM_Directory/BAU/WFM/Triopsys",
    "WFM_Directory/BAU/WFM/Triopsys/Archive_Success",
    "WFM_Directory/BAU/WFM/Triopsys/Archive_Failure",
    "WFM_Directory/BAU/WFM/GRS/Outbound/Archive_Success",
    "WFM_Directory/BAU/WFM/GRS/Outbound/Archive_Failure"
  ]

  tech_platform_folder_structure_new = [
    "Tech_Platform_Directory",
    "Tech_Platform_Directory/TechPlatform"
  ]

  smartrecruiters_folder_structure_new = [
    "SmartRecruiters_Directory",
    "SmartRecruiters_Directory/SmartRecruiters"
  ]
}
resource "azurerm_storage_share_directory" "sftp-new-fileshare-hcm-directory" {
  count                = length(local.hcm_folder_sructure_new)
  name                 = element(local.hcm_folder_sructure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}
resource "azurerm_storage_share_directory" "sftp-new-fileshare-wfm-directory" {
  count                = length(local.wfm_folder_structure_new)
  name                 = element(local.wfm_folder_structure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}
resource "azurerm_storage_share_directory" "sftp-new-fileshare-erp-directory" {
  count                = length(local.erp_folder_sructure_new)
  name                 = element(local.erp_folder_sructure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}

resource "azurerm_storage_share_directory" "sftp-new-fileshare-tech-platform-directory" {
  count                = length(local.tech_platform_folder_structure_new)
  name                 = element(local.tech_platform_folder_structure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}

resource "azurerm_storage_share_directory" "sftp-new-fileshare-smartrecruiters-directory" {
  count                = length(local.smartrecruiters_folder_structure_new)
  name                 = element(local.smartrecruiters_folder_structure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}

#Storageaccount-Container
resource "azurerm_storage_container" "sftp-server-script-new-container" {
  name                 = "sftp-container"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for Finland
resource "azurerm_storage_container" "finland-new-container" {
  name                 = "root-finland"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for ERP
resource "azurerm_storage_container" "erp-new-container" {
  name                 = "erp-container"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "private"
}

#container for archive fail
resource "azurerm_storage_container" "archive-failed-files-new-container" {
  name                 = "archive-failed-files"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for archive success
resource "azurerm_storage_container" "archive-successful-files-new-container" {
  name                 = "archive-successful-files"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for oracle-vision
resource "azurerm_storage_container" "oracle-vision-new-container" {
  name                 = "oracle-vision-common-emptyfiles"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for hcm temp
resource "azurerm_storage_container" "hcm-transit-new-container" {
  name                 = "hcm-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for wfm temp
resource "azurerm_storage_container" "wfm-transit-new-container" {
  name                 = "wfm-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for erp temp
resource "azurerm_storage_container" "erp-transit-new-container" {
  name                 = "erp-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco
resource "azurerm_storage_container" "mepco-payroll-archive-container" {
  name                 = "mepco-payroll-archive"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco
resource "azurerm_storage_container" "payroll-mepco-file-transit-container" {
  name                 = "payroll-mepco-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco
resource "azurerm_storage_container" "payroll-mepco-final-file-transit-container" {
  name                 = "payroll-mepco-final-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#Storageaccount-Containers for BAU
resource "azurerm_storage_container" "sftp-server-script-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "sftp-container-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for Finland BAU
resource "azurerm_storage_container" "finland-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "root-finland-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for ERP BAU
resource "azurerm_storage_container" "erp-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "erp-container-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "private"
}

#container for archive fail BAU
resource "azurerm_storage_container" "archive-failed-files-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "archive-failed-files-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for archive success BAU
resource "azurerm_storage_container" "archive-successful-files-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "archive-successful-files-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for oracle-vision BAU
resource "azurerm_storage_container" "oracle-vision-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "oracle-vision-common-emptyfiles-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for hcm temp BAU
resource "azurerm_storage_container" "hcm-transit-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "hcm-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for wfm temp BAU
resource "azurerm_storage_container" "wfm-transit-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "wfm-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for erp temp BAU
resource "azurerm_storage_container" "erp-transit-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "erp-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco BAU
resource "azurerm_storage_container" "mepco-payroll-archive-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "mepco-payroll-archive-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco BAU
resource "azurerm_storage_container" "payroll-mepco-file-transit-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "payroll-mepco-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco BAU
resource "azurerm_storage_container" "payroll-mepco-final-file-transit-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "payroll-mepco-final-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#StorageAccount - diagnostic settings
resource "azurerm_monitor_diagnostic_setting" "adf-blob-storage-account-diagnostic-settings" {
  name               = "adf-storage-diagnostic-settings"
  target_resource_id = resource.azurerm_storage_account.sftp-blobsa.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "adf-blob-storage-fileshare-diagnostic-settings" {
  name               = "adf-storage-fileshare-diagnostics"
  target_resource_id = "${resource.azurerm_storage_account.sftp-blobsa.id}/fileServices/default"
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

  log {
    category = "StorageRead"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageWrite"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageDelete"
    enabled = true
    retention_policy {
      enabled = false
    }
  }
  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "adf-blob-storage-container-diagnostic-settings" {
  name               = "adf-storage-container-diagnostics"
  target_resource_id = "${resource.azurerm_storage_account.sftp-blobsa.id}/blobServices/default"
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

  log {
    category = "StorageRead"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageWrite"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageDelete"
    enabled = true
    retention_policy {
      enabled = false
    }
  }
  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }

}data "azurerm_resource_group" "k8rg" {
  name = var.rgk8s[local.environment]
  
}
data "azurerm_virtual_network" "k8vnet" {
  name = var.vnetk8s[local.environment]
  resource_group_name = data.azurerm_resource_group.k8rg.name
  
}
data "azurerm_subnet" "k8snet" {
  name = "kubernetes"
  resource_group_name = data.azurerm_resource_group.k8rg.name
  virtual_network_name = data.azurerm_virtual_network.k8vnet.name
  
}
# resource "azurerm_storage_account" "sa" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                     = var.adf_storage_account_name[local.environment]
#   resource_group_name      = data.azurerm_resource_group.rg.name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = var.adf_storage_account_type[local.environment]
#   min_tls_version          = "TLS1_2"
#   account_kind             = "StorageV2"
#   is_hns_enabled           = true
#   allow_blob_public_access = true
#   share_properties{

#     smb {
#       versions = ["SMB3.1.1","SMB3.0"]
#       authentication_types = ["Kerberos"]
#       kerberos_ticket_encryption_type = ["AES-256"]
#       channel_encryption_type = ["AES-256-GCM"]
#     }

#   }

#   //	network_rules {
#   //    default_action = "Deny"
#   //    virtual_network_subnet_ids = [azurerm_subnet.sftpsubnet.id]
#   //  }
# }

resource "azurerm_storage_account" "sftp-blobsa" {
  # depends_on = [
  #   azurerm_storage_share.sftp-newfileshare, azurerm_storage_account.sftp-blobsa
  # ]
  name                     = var.adf_blob_storage_account_name[local.environment]
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.adf_storage_account_type[local.environment]
  min_tls_version          = var.tls_version[local.environment]
  account_kind             = "StorageV2"
  allow_blob_public_access = true
  network_rules {
    default_action = "Deny"
    virtual_network_subnet_ids = [azurerm_subnet.localIRsubnet.id,azurerm_subnet.localvmsssubnet.id,data.azurerm_subnet.k8snet.id]
    private_link_access {
      endpoint_resource_id = var.endpointresourceid[local.environment]
      endpoint_tenant_id = var.endpointtenantid[local.environment]
    }
  }
  # lifecycle {
  #   ignore_changes = [network_rules]
  # }

}

# resource "azurerm_storage_account_network_rules" "sftp-blobsa-rules" {
#   depends_on = [
#     azurerm_storage_account.sftp-blobsa
#   ]
#   storage_account_id = azurerm_storage_account.sftp-blobsa.id
#   default_action             = "Deny"
#   #ip_rules                   = ["127.0.0.1"]
#   virtual_network_subnet_ids = [azurerm_subnet.localIRsubnet.id,azurerm_subnet.localvmsssubnet.id,data.azurerm_subnet.k8snet.id]
#   #bypass                     = ["AzureServices"]
# }

resource "azurerm_role_assignment" "adf-blob-new-role-assignment" {
  count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
  scope                = azurerm_storage_account.sftp-blobsa.id 
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_data_factory.northstaradf.identity[0].principal_id
}

# resource "azurerm_storage_table" "1177_1189_DynamicBinding-table" {
#   name                 = "1177_1189_DynamicBinding-table"
#   storage_account_name = azurerm_storage_account.sftp-blobsa.name
# }

# resource "azurerm_role_assignment" "adf-blob-role-assignment" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   scope                = azurerm_storage_account.sa[count.index].id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = azurerm_data_factory.northstaradf.identity[0].principal_id
# }

# #Storageaccount-FileShare & directories
# resource "azurerm_storage_share" "sftp-fileshare" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "sftpfileshare"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   quota                = 50
# }

# locals {
#   hcm_folder_sructure = [
#     "HCM_Directory",
#     "HCM_Directory/HCM",
#     "HCM_Directory/HCM/Absence",
#     "HCM_Directory/HCM/ActiveDirectory",
#     "HCM_Directory/HCM/APCBWFM",
#     "HCM_Directory/HCM/CEP",
#     "HCM_Directory/HCM/D3",
#     "HCM_Directory/HCM/Datev",
#     "HCM_Directory/HCM/Disponic",
#     "HCM_Directory/HCM/DPP",
#     "HCM_Directory/HCM/ESOffice",
#     "HCM_Directory/HCM/GMS",
#     "HCM_Directory/HCM/GovernmentPlatformforsubsidies",
#     "HCM_Directory/HCM/GroundStar",
#     "HCM_Directory/HCM/LMS",
#     "HCM_Directory/HCM/Mepco",
#     "HCM_Directory/HCM/PartnerPortal",
#     "HCM_Directory/HCM/Pernet",
#     "HCM_Directory/HCM/Platnik",
#     "HCM_Directory/HCM/SAP",
#     "HCM_Directory/HCM/Semco",
#     "HCM_Directory/HCM/SmartRecruiters",
#     "HCM_Directory/HCM/TechPlatform",
#     "HCM_Directory/HCM/VisionEU",
#     "HCM_Directory/HCM/SPExpert",
#     "HCM_Directory/HCM/WFM",
#     "HCM_Directory/HCM/FS",
#     "HCM_Directory/HCM/MSD365",
#     "HCM_Directory/HCM/PKK",
#     "HCM_Directory/HCM/ePUE",
#     "HCM_Directory/HCM/Absence/Archive_Failure",
#     "HCM_Directory/HCM/Absence/Archive_Success",
#     "HCM_Directory/HCM/Absence/Inbound",
#     "HCM_Directory/HCM/ActiveDirectory/Archive_Failure",
#     "HCM_Directory/HCM/ActiveDirectory/Archive_Success",
#     "HCM_Directory/HCM/ActiveDirectory/Inbound",
#     "HCM_Directory/HCM/ActiveDirectory/Outbound",
#     "HCM_Directory/HCM/APCBWFM/Archive_Failure",
#     "HCM_Directory/HCM/APCBWFM/Archive_Success",
#     "HCM_Directory/HCM/APCBWFM/Outbound",
#     "HCM_Directory/HCM/CEP/Inbound",
#     "HCM_Directory/HCM/CEP/Outbound",
#     "HCM_Directory/HCM/D3/Outbound",
#     "HCM_Directory/HCM/Datev/Archive_Failure",
#     "HCM_Directory/HCM/Datev/Archive_Success",
#     "HCM_Directory/HCM/Datev/Inbound",
#     "HCM_Directory/HCM/Datev/Outbound",
#     "HCM_Directory/HCM/Disponic/Archive_Failure",
#     "HCM_Directory/HCM/Disponic/Archive_Success",
#     "HCM_Directory/HCM/Disponic/Inbound",
#     "HCM_Directory/HCM/Disponic/Outbound",
#     "HCM_Directory/HCM/DPP/Archive_Failure",
#     "HCM_Directory/HCM/DPP/Archive_Success",
#     "HCM_Directory/HCM/DPP/Inbound",
#     "HCM_Directory/HCM/DPP/Outbound",
#     "HCM_Directory/HCM/ePUE/Inbound",
#     "HCM_Directory/HCM/ESOffice/Outbound",
#     "HCM_Directory/HCM/FS/Outbound",
#     "HCM_Directory/HCM/GMS/Archive_Failure",
#     "HCM_Directory/HCM/GMS/Archive_Success",
#     "HCM_Directory/HCM/GMS/Outbound",
#     "HCM_Directory/HCM/GovernmentPlatformforsubsidies/Outbound",
#     "HCM_Directory/HCM/GroundStar/Archive_Failure",
#     "HCM_Directory/HCM/GroundStar/Archive_Success",
#     "HCM_Directory/HCM/GroundStar/Inbound",
#     "HCM_Directory/HCM/GroundStar/Outbound",
#     "HCM_Directory/HCM/LMS/Archive_Failure",
#     "HCM_Directory/HCM/LMS/Archive_Success",
#     "HCM_Directory/HCM/LMS/Inbound",
#     "HCM_Directory/HCM/LMS/Outbound",
#     "HCM_Directory/HCM/Mepco/Inbound",
#     "HCM_Directory/HCM/Mepco/Outbound",
#     "HCM_Directory/HCM/MSD365/Outbound",
#     "HCM_Directory/HCM/PartnerPortal/Inbound",
#     "HCM_Directory/HCM/Pernet/Outbound",
#     "HCM_Directory/HCM/PKK/Outbound",
#     "HCM_Directory/HCM/Platnik/Outbound",
#     "HCM_Directory/HCM/SAP/Outbound",
#     "HCM_Directory/HCM/Semco/Inbound",
#     "HCM_Directory/HCM/SmartRecruiters/Inbound",
#     "HCM_Directory/HCM/SmartRecruiters/Outbound",
#     "HCM_Directory/HCM/SPExpert/Outbound",
#     "HCM_Directory/HCM/TechPlatform/Archive_Failure",
#     "HCM_Directory/HCM/TechPlatform/Archive_Success",
#     "HCM_Directory/HCM/TechPlatform/Inbound",
#     "HCM_Directory/HCM/TechPlatform/Outbound",
#     "HCM_Directory/HCM/VisionEU/Archive_Failure",
#     "HCM_Directory/HCM/VisionEU/Archive_Success",
#     "HCM_Directory/HCM/VisionEU/Inbound",
#     "HCM_Directory/HCM/VisionEU/Outbound",
#     "HCM_Directory/HCM/WFM/Archive_Failure",
#     "HCM_Directory/HCM/WFM/Archive_Success",
#     "HCM_Directory/HCM/WFM/Inbound",
#     "HCM_Directory/HCM/WFM/Outbound",
#     "HCM_Directory/HCM/CEP/Outbound/OrgTree",
#     "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData",
#     "HCM_Directory/HCM/Datev/Outbound/PayrollInterface",
#     "HCM_Directory/HCM/Disponic/Outbound/EmpData",
#     "HCM_Directory/HCM/DPP/Outbound/EmpQualifications",
#     "HCM_Directory/HCM/LMS/Outbound/EmpData",
#     "HCM_Directory/HCM/Mepco/Outbound/Allowance",
#     "HCM_Directory/HCM/Mepco/Outbound/AllowanceNewHire",
#     "HCM_Directory/HCM/Mepco/Outbound/Employment",
#     "HCM_Directory/HCM/Mepco/Outbound/EmploymentNewHire",
#     "HCM_Directory/HCM/TechPlatform/Outbound/Absence",
#     "HCM_Directory/HCM/TechPlatform/Outbound/EmpQualifications",
#     "HCM_Directory/HCM/TechPlatform/Outbound/MasterListQualifications",
#     "HCM_Directory/HCM/VisionEU/Outbound/Address",
#     "HCM_Directory/HCM/VisionEU/Outbound/Company",
#     "HCM_Directory/HCM/VisionEU/Outbound/EmpCert",
#     "HCM_Directory/HCM/VisionEU/Outbound/Employee",
#     "HCM_Directory/HCM/VisionEU/Outbound/MasterCert",
#     "HCM_Directory/HCM/VisionEU/Outbound/OrgTree",
#     "HCM_Directory/HCM/VisionEU/Outbound/PersonEmployment",
#     "HCM_Directory/HCM/VisionEU/Outbound/Salary",
#     "HCM_Directory/HCM/VisionEU/Outbound/SubBranches",
#     "HCM_Directory/HCM/VisionEU/Outbound/Teams",
#     "HCM_Directory/HCM/WFM/Outbound/Address",
#     "HCM_Directory/HCM/WFM/Outbound/EmpCert",
#     "HCM_Directory/HCM/WFM/Outbound/Employment",
#     "HCM_Directory/HCM/WFM/Outbound/MasterCert",
#     "HCM_Directory/HCM/WFM/Outbound/Person",
#     "HCM_Directory/HCM/WFM/Outbound/Salary",
#     "HCM_Directory/HCM/WFM/Outbound/Teams",
#     "HCM_Directory/HCM/SNOW",
#     "HCM_Directory/HCM/SNOW/Archive_Failure",
#     "HCM_Directory/HCM/SNOW/Archive_Success",
#     "HCM_Directory/HCM/SNOW/Outbound",
#     "HCM_Directory/HCM/SNOW/Outbound/Job",
#     "HCM_Directory/HCM/SNOW/Outbound/OrgHierarchy",
#     "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData",
#     "HCM_Directory/HCM/SNOW/Outbound/EmpQualifications",
#     "HCM_Directory/HCM/SNOW/Outbound/MasterListQualifications",
#     "HCM_Directory/HCM/SNOW/Outbound/EmpData",
#     "HCM_Directory/HCM/SNOW/Outbound/Location",
#     "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
#     "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
#     "HCM_Directory/HCM/Mepco/Archive_Failure",
#     "HCM_Directory/HCM/Mepco/Archive_Success",
#     "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults",
#     "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults/WorkerFileCollection"

#   ]

#   erp_folder_sructure = [
#     "ERP_Directory",
#     "ERP_Directory/ERP",
#     "ERP_Directory/ERP/AkBank",
#     "ERP_Directory/ERP/CGI",
#     "ERP_Directory/ERP/ExchangeRates",
#     "ERP_Directory/ERP/Interview",
#     "ERP_Directory/ERP/MFiles",
#     "ERP_Directory/ERP/Nomentia",
#     "ERP_Directory/ERP/Oracle",
#     "ERP_Directory/ERP/QnBBank",
#     "ERP_Directory/ERP/SEBBank",
#     "ERP_Directory/ERP/Technician",
#     "ERP_Directory/ERP/TechPlatform",
#     "ERP_Directory/ERP/TurkeyCentralBank",
#     "ERP_Directory/ERP/WFM",
#     "ERP_Directory/ERP/AkBank/Inbound",
#     "ERP_Directory/ERP/AkBank/Outbound",
#     "ERP_Directory/ERP/CGI/Inbound",
#     "ERP_Directory/ERP/CGI/Outbound",
#     "ERP_Directory/ERP/Interview/Inbound",
#     "ERP_Directory/ERP/Interview/Outbound",
#     "ERP_Directory/ERP/MFiles/Outbound",
#     "ERP_Directory/ERP/Nomentia/Inbound",
#     "ERP_Directory/ERP/Nomentia/Outbound",
#     "ERP_Directory/ERP/Oracle/InvoicePrint",
#     "ERP_Directory/ERP/QnBBank/Inbound",
#     "ERP_Directory/ERP/QnBBank/Outbound",
#     "ERP_Directory/ERP/SEBBank/Inbound",
#     "ERP_Directory/ERP/SEBBank/Outbound",
#     "ERP_Directory/ERP/Technician/Inbound",
#     "ERP_Directory/ERP/TechPlatform/FieldService",
#     "ERP_Directory/ERP/TurkeyCentralBank/Inbound",
#     "ERP_Directory/ERP/TurkeyCentralBank/Outbound",
#     "ERP_Directory/ERP/WFM/Inbound",
#     "ERP_Directory/ERP/WFM/Outbound",
#     "ERP_Directory/ERP/AkBank/Inbound/Archive",
#     "ERP_Directory/ERP/AkBank/Inbound/Error",
#     "ERP_Directory/ERP/AkBank/Outbound/Archive",
#     "ERP_Directory/ERP/AkBank/Outbound/Error",
#     "ERP_Directory/ERP/Interview/Inbound/Archive",
#     "ERP_Directory/ERP/Interview/Inbound/Error",
#     "ERP_Directory/ERP/Interview/Outbound/Archive",
#     "ERP_Directory/ERP/Interview/Outbound/Error",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcEveOut",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcFenOut",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcPalvOut",
#     "ERP_Directory/ERP/MFiles/Outbound/ArcSecuOut",
#     "ERP_Directory/ERP/Nomentia/Inbound/Archive",
#     "ERP_Directory/ERP/Nomentia/Outbound/Archive",
#     "ERP_Directory/ERP/Nomentia/Inbound/Error",
#     "ERP_Directory/ERP/Nomentia/Outbound/Error",
#     "ERP_Directory/ERP/Oracle/InvoicePrint/Outbound",
#     "ERP_Directory/ERP/QnBBank/Inbound/Archive",
#     "ERP_Directory/ERP/QnBBank/Inbound/Error",
#     "ERP_Directory/ERP/SEBBank/Inbound/Archive",
#     "ERP_Directory/ERP/SEBBank/Inbound/Error",
#     "ERP_Directory/ERP/Technician/Inbound/Archive",
#     "ERP_Directory/ERP/Technician/Inbound/Error",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Inbound",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Outbound",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Archive",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Error",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Archive",
#     "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Error",
#     "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Archive",
#     "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Error",
#     "ERP_Directory/ERP/WFM/Inbound/Archive",
#     "ERP_Directory/ERP/WFM/Outbound/Archive",
#     "ERP_Directory/ERP/WFM/Inbound/Error",
#     "ERP_Directory/ERP/WFM/Outbound/Error",
#     "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Archive",
#     "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Error",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Inbound",
#     "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Outbound",
#     "ERP_Directory/ERP/BillingSolution",
#     "ERP_Directory/ERP/BillingSolution/Inbound",
#     "ERP_Directory/ERP/BillingSolution/Archive",
#     "ERP_Directory/ERP/WFM/Inbound/Archive_Failure",
#     "ERP_Directory/ERP/WFM/Inbound/Archive_Success"
#   ]

#   wfm_folder_structure = [
#     "WFM_Directory",
#     "WFM_Directory/WFM",
#     "WFM_Directory/WFM/Destination",
#     "WFM_Directory/WFM/GRS",
#     "WFM_Directory/WFM/Source",
#     "WFM_Directory/WFM/GRS/Outbound",
#     "WFM_Directory/WFM/SSE-WFM-INT-1025",
#     "WFM_Directory/WFM/SSE-WFM-INT-1025/Sentera",
#     "WFM_Directory/WFM/Mepco",
#     "WFM_Directory/WFM/Mepco/Archive_Success",
#     "WFM_Directory/WFM/Mepco/Archive_Failure",
#     "WFM_Directory/WFM/Mulesoft",
#     "WFM_Directory/WFM/Mulesoft/Archive_Success",
#     "WFM_Directory/WFM/Mulesoft/Archive_Failure",
#     "WFM_Directory/WFM/BillingEngine",
#     "WFM_Directory/WFM/BillingEngine/Archive",
#     "WFM_Directory/WFM/BillingEngine/Drop"
#   ]

#   tech_platform_folder_structure = [
#     "Tech_Platform_Directory",
#     "Tech_Platform_Directory/TechPlatform"
#   ]

#   smartrecruiters_folder_structure = [
#     "SmartRecruiters_Directory",
#     "SmartRecruiters_Directory/SmartRecruiters"
#   ]
# }
# resource "azurerm_storage_share_directory" "sftp-fileshare-hcm-directory" {
#   count                = length(local.hcm_folder_sructure)
#   name                 = element(local.hcm_folder_sructure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }
# resource "azurerm_storage_share_directory" "sftp-fileshare-wfm-directory" {
#   count                = length(local.wfm_folder_structure)
#   name                 = element(local.wfm_folder_structure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }
# resource "azurerm_storage_share_directory" "sftp-fileshare-erp-directory" {
#   count                = length(local.erp_folder_sructure)
#   name                 = element(local.erp_folder_sructure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }

# resource "azurerm_storage_share_directory" "sftp-fileshare-tech-platform-directory" {
#   count                = length(local.tech_platform_folder_structure)
#   name                 = element(local.tech_platform_folder_structure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }

# resource "azurerm_storage_share_directory" "sftp-fileshare-smartrecruiters-directory" {
#   count                = length(local.smartrecruiters_folder_structure)
#   name                 = element(local.smartrecruiters_folder_structure, count.index)
#   share_name           = azurerm_storage_share.sftp-fileshare[count.index].name
#   storage_account_name = azurerm_storage_account.sa[count.index].name
# }

# #Storageaccount-Container
# resource "azurerm_storage_container" "sftp-server-script-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "sftp-container"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for Finland
# resource "azurerm_storage_container" "finland-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "root-finland"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for ERP
# resource "azurerm_storage_container" "erp-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "erp-container"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "private"
# }

# #container for archive fail
# resource "azurerm_storage_container" "archive-failed-files-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "archive-failed-files"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }
# #container for archive success
# resource "azurerm_storage_container" "archive-successful-files-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "archive-successful-files"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }
# #container for oracle-vision
# resource "azurerm_storage_container" "oracle-vision-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "oracle-vision-common-emptyfiles"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for hcm temp
# resource "azurerm_storage_container" "hcm-transit-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "hcm-file-transit"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for wfm temp
# resource "azurerm_storage_container" "wfm-transit-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "wfm-file-transit"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #container for erp temp
# resource "azurerm_storage_container" "erp-transit-container" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name                 = "erp-file-transit"
#   storage_account_name = azurerm_storage_account.sa[count.index].name
#   container_access_type = "blob"
# }

# #StorageAccount - diagnostic settings
# resource "azurerm_monitor_diagnostic_setting" "adf-storage-account-diagnostic-settings" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name               = "adf-storage-diagnostic-settings"
#   target_resource_id = resource.azurerm_storage_account.sa[count.index].id
#   log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

#   metric {
#     category = "Transaction"

#     retention_policy {
#       enabled = false
#     }
#   }
# }

# resource "azurerm_monitor_diagnostic_setting" "adf-storage-fileshare-diagnostic-settings" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name               = "adf-storage-fileshare-diagnostics"
#   target_resource_id = "${resource.azurerm_storage_account.sa[count.index].id}/fileServices/default"
#   log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

#   log {
#     category = "StorageRead"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageWrite"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageDelete"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }
#   metric {
#     category = "Transaction"

#     retention_policy {
#       enabled = false
#     }
#   }
# }

# resource "azurerm_monitor_diagnostic_setting" "adf-storage-container-diagnostic-settings" {
#   count = local.environment == "dev" || local.environment =="test" || local.environment =="uat" ? 1 : 0
#   name               = "adf-storage-container-diagnostics"
#   target_resource_id = "${resource.azurerm_storage_account.sa[count.index].id}/blobServices/default"
#   log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

#   log {
#     category = "StorageRead"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageWrite"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "StorageDelete"
#     enabled = true
#     retention_policy {
#       enabled = false
#     }
#   }
#   metric {
#     category = "Transaction"

#     retention_policy {
#       enabled = false
#     }
#   }

# }

#new storage
#Storageaccount-FileShare & directories
resource "azurerm_storage_share" "sftp-newfileshare" {
  name                 = "sftpfileshare"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  quota                = 50
}

locals {
  hcm_folder_sructure_new = [
    "HCM_Directory",
    "HCM_Directory/HCM",
    "HCM_Directory/HCM/Absence",
    "HCM_Directory/HCM/ActiveDirectory",
    "HCM_Directory/HCM/APCBWFM",
    "HCM_Directory/HCM/CEP",
    "HCM_Directory/HCM/D3",
    "HCM_Directory/HCM/Datev",
    "HCM_Directory/HCM/Disponic",
    "HCM_Directory/HCM/DPP",
    "HCM_Directory/HCM/ESOffice",
    "HCM_Directory/HCM/GMS",
    "HCM_Directory/HCM/GovernmentPlatformforsubsidies",
    "HCM_Directory/HCM/GroundStar",
    "HCM_Directory/HCM/LMS",
    "HCM_Directory/HCM/Mepco",
    "HCM_Directory/HCM/PartnerPortal",
    "HCM_Directory/HCM/Pernet",
    "HCM_Directory/HCM/Platnik",
    "HCM_Directory/HCM/SAP",
    "HCM_Directory/HCM/Semco",
    "HCM_Directory/HCM/SmartRecruiters",
    "HCM_Directory/HCM/TechPlatform",
    "HCM_Directory/HCM/VisionEU",
    "HCM_Directory/HCM/SPExpert",
    "HCM_Directory/HCM/WFM",
    "HCM_Directory/HCM/FS",
    "HCM_Directory/HCM/MSD365",
    "HCM_Directory/HCM/PKK",
    "HCM_Directory/HCM/ePUE",
    "HCM_Directory/HCM/Absence/Archive_Failure",
    "HCM_Directory/HCM/Absence/Archive_Success",
    "HCM_Directory/HCM/Absence/Inbound",
    "HCM_Directory/HCM/ActiveDirectory/Archive_Failure",
    "HCM_Directory/HCM/ActiveDirectory/Archive_Success",
    "HCM_Directory/HCM/ActiveDirectory/Inbound",
    "HCM_Directory/HCM/ActiveDirectory/Outbound",
    "HCM_Directory/HCM/APCBWFM/Archive_Failure",
    "HCM_Directory/HCM/APCBWFM/Archive_Success",
    "HCM_Directory/HCM/APCBWFM/Outbound",
    "HCM_Directory/HCM/CEP/Inbound",
    "HCM_Directory/HCM/CEP/Outbound",
    "HCM_Directory/HCM/D3/Outbound",
    "HCM_Directory/HCM/Datev/Archive_Failure",
    "HCM_Directory/HCM/Datev/Archive_Success",
    "HCM_Directory/HCM/Datev/Inbound",
    "HCM_Directory/HCM/Datev/Outbound",
    "HCM_Directory/HCM/Disponic/Archive_Failure",
    "HCM_Directory/HCM/Disponic/Archive_Success",
    "HCM_Directory/HCM/Disponic/Inbound",
    "HCM_Directory/HCM/Disponic/Outbound",
    "HCM_Directory/HCM/DPP/Archive_Failure",
    "HCM_Directory/HCM/DPP/Archive_Success",
    "HCM_Directory/HCM/DPP/Inbound",
    "HCM_Directory/HCM/DPP/Outbound",
    "HCM_Directory/HCM/ePUE/Inbound",
    "HCM_Directory/HCM/ESOffice/Outbound",
    "HCM_Directory/HCM/FS/Outbound",
    "HCM_Directory/HCM/GMS/Archive_Failure",
    "HCM_Directory/HCM/GMS/Archive_Success",
    "HCM_Directory/HCM/GMS/Outbound",
    "HCM_Directory/HCM/GovernmentPlatformforsubsidies/Outbound",
    "HCM_Directory/HCM/GroundStar/Archive_Failure",
    "HCM_Directory/HCM/GroundStar/Archive_Success",
    "HCM_Directory/HCM/GroundStar/Inbound",
    "HCM_Directory/HCM/GroundStar/Outbound",
    "HCM_Directory/HCM/LMS/Archive_Failure",
    "HCM_Directory/HCM/LMS/Archive_Success",
    "HCM_Directory/HCM/LMS/Inbound",
    "HCM_Directory/HCM/LMS/Outbound",
    "HCM_Directory/HCM/Mepco/Inbound",
    "HCM_Directory/HCM/Mepco/Outbound",
    "HCM_Directory/HCM/MSD365/Outbound",
    "HCM_Directory/HCM/PartnerPortal/Inbound",
    "HCM_Directory/HCM/Pernet/Outbound",
    "HCM_Directory/HCM/PKK/Outbound",
    "HCM_Directory/HCM/Platnik/Outbound",
    "HCM_Directory/HCM/SAP/Outbound",
    "HCM_Directory/HCM/Semco/Inbound",
    "HCM_Directory/HCM/SmartRecruiters/Inbound",
    "HCM_Directory/HCM/SmartRecruiters/Outbound",
    "HCM_Directory/HCM/SPExpert/Outbound",
    "HCM_Directory/HCM/TechPlatform/Archive_Failure",
    "HCM_Directory/HCM/TechPlatform/Archive_Success",
    "HCM_Directory/HCM/TechPlatform/Inbound",
    "HCM_Directory/HCM/TechPlatform/Outbound",
    "HCM_Directory/HCM/VisionEU/Archive_Failure",
    "HCM_Directory/HCM/VisionEU/Archive_Success",
    "HCM_Directory/HCM/VisionEU/Inbound",
    "HCM_Directory/HCM/VisionEU/Outbound",
    "HCM_Directory/HCM/WFM/Archive_Failure",
    "HCM_Directory/HCM/WFM/Archive_Success",
    "HCM_Directory/HCM/WFM/Inbound",
    "HCM_Directory/HCM/WFM/Outbound",
    "HCM_Directory/HCM/CEP/Outbound/OrgTree",
    "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface",
    "HCM_Directory/HCM/Disponic/Outbound/EmpData",
    "HCM_Directory/HCM/DPP/Outbound/EmpQualifications",
    "HCM_Directory/HCM/LMS/Outbound/EmpData",
    "HCM_Directory/HCM/Mepco/Outbound/Allowance",
    "HCM_Directory/HCM/Mepco/Outbound/AllowanceNewHire",
    "HCM_Directory/HCM/Mepco/Outbound/Employment",
    "HCM_Directory/HCM/Mepco/Outbound/EmploymentNewHire",
    "HCM_Directory/HCM/TechPlatform/Outbound/Absence",
    "HCM_Directory/HCM/TechPlatform/Outbound/EmpQualifications",
    "HCM_Directory/HCM/TechPlatform/Outbound/MasterListQualifications",
    "HCM_Directory/HCM/VisionEU/Outbound/Address",
    "HCM_Directory/HCM/VisionEU/Outbound/Company",
    "HCM_Directory/HCM/VisionEU/Outbound/EmpCert",
    "HCM_Directory/HCM/VisionEU/Outbound/Employee",
    "HCM_Directory/HCM/VisionEU/Outbound/MasterCert",
    "HCM_Directory/HCM/VisionEU/Outbound/OrgTree",
    "HCM_Directory/HCM/VisionEU/Outbound/PersonEmployment",
    "HCM_Directory/HCM/VisionEU/Outbound/Salary",
    "HCM_Directory/HCM/VisionEU/Outbound/SubBranches",
    "HCM_Directory/HCM/VisionEU/Outbound/Teams",
    "HCM_Directory/HCM/WFM/Outbound/Address",
    "HCM_Directory/HCM/WFM/Outbound/EmpCert",
    "HCM_Directory/HCM/WFM/Outbound/Employment",
    "HCM_Directory/HCM/WFM/Outbound/MasterCert",
    "HCM_Directory/HCM/WFM/Outbound/Person",
    "HCM_Directory/HCM/WFM/Outbound/Salary",
    "HCM_Directory/HCM/WFM/Outbound/Teams",
    "HCM_Directory/HCM/SNOW",
    "HCM_Directory/HCM/SNOW/Archive_Failure",
    "HCM_Directory/HCM/SNOW/Archive_Success",
    "HCM_Directory/HCM/SNOW/Outbound",
    "HCM_Directory/HCM/SNOW/Outbound/Job",
    "HCM_Directory/HCM/SNOW/Outbound/OrgHierarchy",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData",
    "HCM_Directory/HCM/SNOW/Outbound/EmpQualifications",
    "HCM_Directory/HCM/SNOW/Outbound/MasterListQualifications",
    "HCM_Directory/HCM/SNOW/Outbound/EmpData",
    "HCM_Directory/HCM/SNOW/Outbound/Location",
    "HCM_Directory/HCM/Datev/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/HCM/Mepco/Archive_Failure",
    "HCM_Directory/HCM/Mepco/Archive_Success",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedAbsenceResults/WorkerFileCollection",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults/CalculatedSalaryCollection",
    "HCM_Directory/HCM/SmartRecruiters/Outbound/Configuration",
    "HCM_Directory/HCM/SmartRecruiters/Archive_Success",
    "HCM_Directory/HCM/SmartRecruiters/Archive_Failure",
    "HCM_Directory/HCM/SmartRecruiters/Outbound/Dependency",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults/ATPWorker",
    "HCM_Directory/HCM/Mepco/Inbound/CalculatedSalaryResults/KTAWorker",
    "HCM_Directory/HCM/CEP/Outbound/OrgHierarchy",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/MergeDat",
    "HCM_Directory/HCM/Mepco/Inbound/EmpAbsenceData/DeleteDat",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/LODAS",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/Newhire",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/VacationSickness",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/Sickness",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/Absence",
    "HCM_Directory/HCM/Datev/Outbound/PayrollInterface/DPP",
    
    #Adding directories for HCM BAU
    "HCM_Directory/BAU/HCM",
    "HCM_Directory/BAU/HCM/Absence",
    "HCM_Directory/BAU/HCM/ActiveDirectory",
    "HCM_Directory/BAU/HCM/APCBWFM",
    "HCM_Directory/BAU/HCM/CEP",
    "HCM_Directory/BAU/HCM/D3",
    "HCM_Directory/BAU/HCM/Datev",
    "HCM_Directory/BAU/HCM/Disponic",
    "HCM_Directory/BAU/HCM/DPP",
    "HCM_Directory/BAU/HCM/ESOffice",
    "HCM_Directory/BAU/HCM/GMS",
    "HCM_Directory/BAU/HCM/GovernmentPlatformforsubsidies",
    "HCM_Directory/BAU/HCM/GroundStar",
    "HCM_Directory/BAU/HCM/LMS",
    "HCM_Directory/BAU/HCM/Mepco",
    "HCM_Directory/BAU/HCM/PartnerPortal",
    "HCM_Directory/BAU/HCM/Pernet",
    "HCM_Directory/BAU/HCM/Platnik",
    "HCM_Directory/BAU/HCM/SAP",
    "HCM_Directory/BAU/HCM/Semco",
    "HCM_Directory/BAU/HCM/SmartRecruiters",
    "HCM_Directory/BAU/HCM/TechPlatform",
    "HCM_Directory/BAU/HCM/VisionEU",
    "HCM_Directory/BAU/HCM/SPExpert",
    "HCM_Directory/BAU/HCM/WFM",
    "HCM_Directory/BAU/HCM/FS",
    "HCM_Directory/BAU/HCM/MSD365",
    "HCM_Directory/BAU/HCM/PKK",
    "HCM_Directory/BAU/HCM/ePUE",
    "HCM_Directory/BAU/HCM/Absence/Archive_Failure",
    "HCM_Directory/BAU/HCM/Absence/Archive_Success",
    "HCM_Directory/BAU/HCM/Absence/Inbound",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Archive_Failure",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Archive_Success",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Inbound",
    "HCM_Directory/BAU/HCM/ActiveDirectory/Outbound",
    "HCM_Directory/BAU/HCM/APCBWFM/Archive_Failure",
    "HCM_Directory/BAU/HCM/APCBWFM/Archive_Success",
    "HCM_Directory/BAU/HCM/APCBWFM/Outbound",
    "HCM_Directory/BAU/HCM/CEP/Inbound",
    "HCM_Directory/BAU/HCM/CEP/Outbound",
    "HCM_Directory/BAU/HCM/D3/Outbound",
    "HCM_Directory/BAU/HCM/Datev/Archive_Failure",
    "HCM_Directory/BAU/HCM/Datev/Archive_Success",
    "HCM_Directory/BAU/HCM/Datev/Inbound",
    "HCM_Directory/BAU/HCM/Datev/Outbound",
    "HCM_Directory/BAU/HCM/Disponic/Archive_Failure",
    "HCM_Directory/BAU/HCM/Disponic/Archive_Success",
    "HCM_Directory/BAU/HCM/Disponic/Inbound",
    "HCM_Directory/BAU/HCM/Disponic/Outbound",
    "HCM_Directory/BAU/HCM/DPP/Archive_Failure",
    "HCM_Directory/BAU/HCM/DPP/Archive_Success",
    "HCM_Directory/BAU/HCM/DPP/Inbound",
    "HCM_Directory/BAU/HCM/DPP/Outbound",
    "HCM_Directory/BAU/HCM/ePUE/Inbound",
    "HCM_Directory/BAU/HCM/ESOffice/Outbound",
    "HCM_Directory/BAU/HCM/FS/Outbound",
    "HCM_Directory/BAU/HCM/GMS/Archive_Failure",
    "HCM_Directory/BAU/HCM/GMS/Archive_Success",
    "HCM_Directory/BAU/HCM/GMS/Outbound",
    "HCM_Directory/BAU/HCM/GovernmentPlatformforsubsidies/Outbound",
    "HCM_Directory/BAU/HCM/GroundStar/Archive_Failure",
    "HCM_Directory/BAU/HCM/GroundStar/Archive_Success",
    "HCM_Directory/BAU/HCM/GroundStar/Inbound",
    "HCM_Directory/BAU/HCM/GroundStar/Outbound",
    "HCM_Directory/BAU/HCM/LMS/Archive_Failure",
    "HCM_Directory/BAU/HCM/LMS/Archive_Success",
    "HCM_Directory/BAU/HCM/LMS/Inbound",
    "HCM_Directory/BAU/HCM/LMS/Outbound",
    "HCM_Directory/BAU/HCM/Mepco/Inbound",
    "HCM_Directory/BAU/HCM/Mepco/Outbound",
    "HCM_Directory/BAU/HCM/MSD365/Outbound",
    "HCM_Directory/BAU/HCM/PartnerPortal/Inbound",
    "HCM_Directory/BAU/HCM/Pernet/Outbound",
    "HCM_Directory/BAU/HCM/PKK/Outbound",
    "HCM_Directory/BAU/HCM/Platnik/Outbound",
    "HCM_Directory/BAU/HCM/SAP/Outbound",
    "HCM_Directory/BAU/HCM/Semco/Inbound",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Inbound",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Outbound",
    "HCM_Directory/BAU/HCM/SPExpert/Outbound",
    "HCM_Directory/BAU/HCM/TechPlatform/Archive_Failure",
    "HCM_Directory/BAU/HCM/TechPlatform/Archive_Success",
    "HCM_Directory/BAU/HCM/TechPlatform/Inbound",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound",
    "HCM_Directory/BAU/HCM/VisionEU/Archive_Failure",
    "HCM_Directory/BAU/HCM/VisionEU/Archive_Success",
    "HCM_Directory/BAU/HCM/VisionEU/Inbound",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound",
    "HCM_Directory/BAU/HCM/WFM/Archive_Failure",
    "HCM_Directory/BAU/HCM/WFM/Archive_Success",
    "HCM_Directory/BAU/HCM/WFM/Inbound",
    "HCM_Directory/BAU/HCM/WFM/Outbound",
    "HCM_Directory/BAU/HCM/CEP/Outbound/OrgTree",
    "HCM_Directory/BAU/HCM/Datev/Inbound/EmpAbsenceData",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface",
    "HCM_Directory/BAU/HCM/Disponic/Outbound/EmpData",
    "HCM_Directory/BAU/HCM/DPP/Outbound/EmpQualifications",
    "HCM_Directory/BAU/HCM/LMS/Outbound/EmpData",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/Allowance",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/AllowanceNewHire",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/Employment",
    "HCM_Directory/BAU/HCM/Mepco/Outbound/EmploymentNewHire",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound/Absence",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound/EmpQualifications",
    "HCM_Directory/BAU/HCM/TechPlatform/Outbound/MasterListQualifications",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Address",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Company",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/EmpCert",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Employee",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/MasterCert",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/OrgTree",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/PersonEmployment",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Salary",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/SubBranches",
    "HCM_Directory/BAU/HCM/VisionEU/Outbound/Teams",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Address",
    "HCM_Directory/BAU/HCM/WFM/Outbound/EmpCert",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Employment",
    "HCM_Directory/BAU/HCM/WFM/Outbound/MasterCert",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Person",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Salary",
    "HCM_Directory/BAU/HCM/WFM/Outbound/Teams",
    "HCM_Directory/BAU/HCM/SNOW",
    "HCM_Directory/BAU/HCM/SNOW/Archive_Failure",
    "HCM_Directory/BAU/HCM/SNOW/Archive_Success",
    "HCM_Directory/BAU/HCM/SNOW/Outbound",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/Job",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/OrgHierarchy",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/EmpQualifications",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/MasterListQualifications",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/EmpData",
    "HCM_Directory/BAU/HCM/SNOW/Outbound/Location",
    "HCM_Directory/BAU/HCM/Datev/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData/PersonAbsencesFileCollection",
    "HCM_Directory/BAU/HCM/Mepco/Archive_Failure",
    "HCM_Directory/BAU/HCM/Mepco/Archive_Success",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedAbsenceResults",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedAbsenceResults/WorkerFileCollection",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults/CalculatedSalaryCollection",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Outbound/Configuration",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Archive_Success",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Archive_Failure",
    "HCM_Directory/BAU/HCM/SmartRecruiters/Outbound/Dependency",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults/ATPWorker",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/CalculatedSalaryResults/KTAWorker",
    "HCM_Directory/BAU/HCM/CEP/Outbound/OrgHierarchy",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData/MergeDat",
    "HCM_Directory/BAU/HCM/Mepco/Inbound/EmpAbsenceData/DeleteDat",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/LODAS",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/Newhire",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/VacationSickness",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/Sickness",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/Absence",
    "HCM_Directory/BAU/HCM/Datev/Outbound/PayrollInterface/DPP"

  ]

  erp_folder_sructure_new = [
    "ERP_Directory",
    "ERP_Directory/ERP",
    "ERP_Directory/ERP/AkBank",
    "ERP_Directory/ERP/CGI",
    "ERP_Directory/ERP/ExchangeRates",
    "ERP_Directory/ERP/Interview",
    "ERP_Directory/ERP/MFiles",
    "ERP_Directory/ERP/Nomentia",
    "ERP_Directory/ERP/Oracle",
    "ERP_Directory/ERP/QnBBank",
    "ERP_Directory/ERP/SEBBank",
    "ERP_Directory/ERP/Technician",
    "ERP_Directory/ERP/TechPlatform",
    "ERP_Directory/ERP/TurkeyCentralBank",
    "ERP_Directory/ERP/WFM",
    "ERP_Directory/ERP/AkBank/Inbound",
    "ERP_Directory/ERP/AkBank/Outbound",
    "ERP_Directory/ERP/CGI/Inbound",
    "ERP_Directory/ERP/CGI/Outbound",
    "ERP_Directory/ERP/Interview/Inbound",
    "ERP_Directory/ERP/Interview/Outbound",
    "ERP_Directory/ERP/MFiles/Outbound",
    "ERP_Directory/ERP/Nomentia/Inbound",
    "ERP_Directory/ERP/Nomentia/Outbound",
    "ERP_Directory/ERP/Oracle/InvoicePrint",
    "ERP_Directory/ERP/QnBBank/Inbound",
    "ERP_Directory/ERP/QnBBank/Outbound",
    "ERP_Directory/ERP/SEBBank/Inbound",
    "ERP_Directory/ERP/SEBBank/Outbound",
    "ERP_Directory/ERP/Technician/Inbound",
    "ERP_Directory/ERP/TechPlatform/FieldService",
    "ERP_Directory/ERP/TurkeyCentralBank/Inbound",
    "ERP_Directory/ERP/TurkeyCentralBank/Outbound",
    "ERP_Directory/ERP/WFM/Inbound",
    "ERP_Directory/ERP/WFM/Outbound",
    "ERP_Directory/ERP/AkBank/Inbound/Archive",
    "ERP_Directory/ERP/AkBank/Inbound/Error",
    "ERP_Directory/ERP/AkBank/Outbound/Archive",
    "ERP_Directory/ERP/AkBank/Outbound/Error",
    "ERP_Directory/ERP/Interview/Inbound/Archive",
    "ERP_Directory/ERP/Interview/Inbound/Error",
    "ERP_Directory/ERP/Interview/Outbound/Archive",
    "ERP_Directory/ERP/Interview/Outbound/Error",
    "ERP_Directory/ERP/MFiles/Outbound/ArcEveOut",
    "ERP_Directory/ERP/MFiles/Outbound/ArcFenOut",
    "ERP_Directory/ERP/MFiles/Outbound/ArcPalvOut",
    "ERP_Directory/ERP/MFiles/Outbound/ArcSecuOut",
    "ERP_Directory/ERP/Nomentia/Inbound/Archive",
    "ERP_Directory/ERP/Nomentia/Outbound/Archive",
    "ERP_Directory/ERP/Nomentia/Inbound/Error",
    "ERP_Directory/ERP/Nomentia/Outbound/Error",
    "ERP_Directory/ERP/Oracle/InvoicePrint/Outbound",
    "ERP_Directory/ERP/QnBBank/Inbound/Archive",
    "ERP_Directory/ERP/QnBBank/Inbound/Error",
    "ERP_Directory/ERP/SEBBank/Inbound/Archive",
    "ERP_Directory/ERP/SEBBank/Inbound/Error",
    "ERP_Directory/ERP/Technician/Inbound/Archive",
    "ERP_Directory/ERP/Technician/Inbound/Error",
    "ERP_Directory/ERP/TechPlatform/FieldService/Inbound",
    "ERP_Directory/ERP/TechPlatform/FieldService/Outbound",
    "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Archive",
    "ERP_Directory/ERP/TechPlatform/FieldService/Inbound/Error",
    "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Archive",
    "ERP_Directory/ERP/TechPlatform/FieldService/Outbound/Error",
    "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Archive",
    "ERP_Directory/ERP/TurkeyCentralBank/Inbound/Error",
    "ERP_Directory/ERP/WFM/Inbound/Archive",
    "ERP_Directory/ERP/WFM/Outbound/Archive",
    "ERP_Directory/ERP/WFM/Inbound/Error",
    "ERP_Directory/ERP/WFM/Outbound/Error",
    "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Archive",
    "ERP_Directory/ERP/TurkeyCentralBank/Outbound/Error",
    "ERP_Directory/ERP/FinlandNomentiaLockbox",
    "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia",
    "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Inbound",
    "ERP_Directory/ERP/FinlandNomentiaLockbox/Nomentia/Outbound",
    "ERP_Directory/ERP/BillingSolution",
    "ERP_Directory/ERP/BillingSolution/Inbound",
    "ERP_Directory/ERP/BillingSolution/Archive",
    "ERP_Directory/ERP/Nomentia/Inbound/Archive_Success",
    "ERP_Directory/ERP/Nomentia/Inbound/Archive_Failure",
    "ERP_Directory/ERP/WFM/Attachment",
    "ERP_Directory/ERP/OkPerinta",
    "ERP_Directory/ERP/OkPerinta/Inbound",
    "ERP_Directory/ERP/WFM/Inbound/Archive_Failure",
    "ERP_Directory/ERP/WFM/Inbound/Archive_Success",
    "ERP_Directory/ERP/Nomentia/Outbound/Archive_Success",
    "ERP_Directory/ERP/Nomentia/Outbound/Archive_Failure",
    "ERP_Directory/ERP/OkPerinta/Outbound",
    "ERP_Directory/ERP/OkPerinta/Inbound/Archive_Success",
    "ERP_Directory/ERP/OkPerinta/Inbound/Archive_Failure",
    "ERP_Directory/ERP/OkPerinta/Outbound/Archive_Success",
    "ERP_Directory/ERP/OkPerinta/Outbound/Archive_Failure",
    "ERP_Directory/ERP/Interview/Attachment",
    "ERP_Directory/ERP/Interview/Inbound/Archive_Success",
    "ERP_Directory/ERP/Interview/Inbound/Archive_Failure",
    "ERP_Directory/ERP/Basware",
    "ERP_Directory/ERP/Basware/Supplier",
    "ERP_Directory/ERP/Basware/Supplier/Outbound",
    "ERP_Directory/ERP/ContractsOutbound",
    "ERP_Directory/ERP/ContractsOutbound/Outbound",
    "ERP_Directory/ERP/ContractsOutbound/InboundCRM",
    "ERP_Directory/ERP/ContractsOutbound/Outbound/Archive-Success",
    "ERP_Directory/ERP/ContractsOutbound/Outbound/Archive-Failure",
    "ERP_Directory/ERP/ARTransactions",
    "ERP_Directory/ERP/ARTransactions/Archive_Success",
    "ERP_Directory/ERP/ARTransactions/Archive_Failure",
    "ERP_Directory/ERP/OIC",
    "ERP_Directory/ERP/OIC/Inbound",
    "ERP_Directory/ERP/OIC/Inbound/PriceRevision",
    "ERP_Directory/ERP/OIC/Inbound/Archive_Success",
    "ERP_Directory/ERP/OIC/Inbound/Archive_Failure",
    "ERP_Directory/ERP/OIC/Inbound/Archive",
    # "ERP_Directory/ERP/Invoice",
    # "ERP_Directory/ERP/Invoice/Archive",
    # "ERP_Directory/ERP/Invoice/Error",
    # "ERP_Directory/ERP/Invoice/Inbound",
    # "ERP_Directory/ERP/Invoice/Outbound",
    # "ERP_Directory/ERP/Invoice/Archive/Securitas",
    # "ERP_Directory/ERP/Invoice/Archive/Events",
    # "ERP_Directory/ERP/Invoice/Archive/Palvelut",
    # "ERP_Directory/ERP/Invoice/Archive/Fenovi",
    # "ERP_Directory/ERP/Invoice/Archive/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Archive/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Archive/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Archive/ArcFenovi",
    # "ERP_Directory/ERP/Invoice/Inbound/Securitas",
    # "ERP_Directory/ERP/Invoice/Inbound/Events",
    # "ERP_Directory/ERP/Invoice/Inbound/Palvelut",
    # "ERP_Directory/ERP/Invoice/Inbound/Fenovi",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Inbound/ArcFenovi",
    # "ERP_Directory/ERP/Invoice/Error/Securitas",
    # "ERP_Directory/ERP/Invoice/Error/Events",
    # "ERP_Directory/ERP/Invoice/Error/Palvelut",
    # "ERP_Directory/ERP/Invoice/Error/Fenovi",
    # "ERP_Directory/ERP/Invoice/Error/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Error/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Error/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Error/ArcFenovi",
    # "ERP_Directory/ERP/Invoice/Outbound/Securitas",
    # "ERP_Directory/ERP/Invoice/Outbound/Events",
    # "ERP_Directory/ERP/Invoice/Outbound/Palvelut",
    # "ERP_Directory/ERP/Invoice/Outbound/Fenovi",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcSecuritas",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcEvents",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcPalvelut",
    # "ERP_Directory/ERP/Invoice/Outbound/ArcFenovi",
    # "ERP_Directory/ERP/OIC/Outbound",
    # "ERP_Directory/ERP/OIC/Outbound/PriceRevisionStatus"

    #Adding directories for ERP BAU
    "ERP_Directory/BAU/ERP",
    "ERP_Directory/BAU/ERP/AkBank",
    "ERP_Directory/BAU/ERP/CGI",
    "ERP_Directory/BAU/ERP/ExchangeRates",
    "ERP_Directory/BAU/ERP/Interview",
    "ERP_Directory/BAU/ERP/MFiles",
    "ERP_Directory/BAU/ERP/Nomentia",
    "ERP_Directory/BAU/ERP/Oracle",
    "ERP_Directory/BAU/ERP/QnBBank",
    "ERP_Directory/BAU/ERP/SEBBank",
    "ERP_Directory/BAU/ERP/Technician",
    "ERP_Directory/BAU/ERP/TechPlatform",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank",
    "ERP_Directory/BAU/ERP/WFM",
    "ERP_Directory/BAU/ERP/AkBank/Inbound",
    "ERP_Directory/BAU/ERP/AkBank/Outbound",
    "ERP_Directory/BAU/ERP/CGI/Inbound",
    "ERP_Directory/BAU/ERP/CGI/Outbound",
    "ERP_Directory/BAU/ERP/Interview/Inbound",
    "ERP_Directory/BAU/ERP/Interview/Outbound",
    "ERP_Directory/BAU/ERP/MFiles/Outbound",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound",
    "ERP_Directory/BAU/ERP/Oracle/InvoicePrint",
    "ERP_Directory/BAU/ERP/QnBBank/Inbound",
    "ERP_Directory/BAU/ERP/QnBBank/Outbound",
    "ERP_Directory/BAU/ERP/SEBBank/Inbound",
    "ERP_Directory/BAU/ERP/SEBBank/Outbound",
    "ERP_Directory/BAU/ERP/Technician/Inbound",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Inbound",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Outbound",
    "ERP_Directory/BAU/ERP/WFM/Inbound",
    "ERP_Directory/BAU/ERP/WFM/Outbound",
    "ERP_Directory/BAU/ERP/AkBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/AkBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/AkBank/Outbound/Archive",
    "ERP_Directory/BAU/ERP/AkBank/Outbound/Error",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Archive",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Error",
    "ERP_Directory/BAU/ERP/Interview/Outbound/Archive",
    "ERP_Directory/BAU/ERP/Interview/Outbound/Error",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcEveOut",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcFenOut",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcPalvOut",
    "ERP_Directory/BAU/ERP/MFiles/Outbound/ArcSecuOut",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Archive",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Archive",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Error",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Error",
    "ERP_Directory/BAU/ERP/Oracle/InvoicePrint/Outbound",
    "ERP_Directory/BAU/ERP/QnBBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/QnBBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/SEBBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/SEBBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/Technician/Inbound/Archive",
    "ERP_Directory/BAU/ERP/Technician/Inbound/Error",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Inbound",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Outbound",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Inbound/Archive",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Inbound/Error",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Outbound/Archive",
    "ERP_Directory/BAU/ERP/TechPlatform/FieldService/Outbound/Error",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Inbound/Archive",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Inbound/Error",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Archive",
    "ERP_Directory/BAU/ERP/WFM/Outbound/Archive",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Error",
    "ERP_Directory/BAU/ERP/WFM/Outbound/Error",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Outbound/Archive",
    "ERP_Directory/BAU/ERP/TurkeyCentralBank/Outbound/Error",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox/Nomentia",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox/Nomentia/Inbound",
    "ERP_Directory/BAU/ERP/FinlandNomentiaLockbox/Nomentia/Outbound",
    "ERP_Directory/BAU/ERP/BillingSolution",
    "ERP_Directory/BAU/ERP/BillingSolution/Inbound",
    "ERP_Directory/BAU/ERP/BillingSolution/Archive",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Nomentia/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/WFM/Attachment",
    "ERP_Directory/BAU/ERP/OkPerinta",
    "ERP_Directory/BAU/ERP/OkPerinta/Inbound",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/WFM/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Nomentia/Outbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/OkPerinta/Outbound",
    "ERP_Directory/BAU/ERP/OkPerinta/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/OkPerinta/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/OkPerinta/Outbound/Archive_Success",
    "ERP_Directory/BAU/ERP/OkPerinta/Outbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/Interview/Attachment",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/Interview/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/Basware",
    "ERP_Directory/BAU/ERP/Basware/Supplier",
    "ERP_Directory/BAU/ERP/Basware/Supplier/Outbound",
    "ERP_Directory/BAU/ERP/ContractsOutbound",
    "ERP_Directory/BAU/ERP/ContractsOutbound/Outbound",
    "ERP_Directory/BAU/ERP/ContractsOutbound/InboundCRM",
    "ERP_Directory/BAU/ERP/ContractsOutbound/Outbound/Archive-Success",
    "ERP_Directory/BAU/ERP/ContractsOutbound/Outbound/Archive-Failure",
    "ERP_Directory/BAU/ERP/ARTransactions",
    "ERP_Directory/BAU/ERP/ARTransactions/Archive_Success",
    "ERP_Directory/BAU/ERP/ARTransactions/Archive_Failure",
    "ERP_Directory/BAU/ERP/OIC",
    "ERP_Directory/BAU/ERP/OIC/Inbound",
    "ERP_Directory/BAU/ERP/OIC/Inbound/PriceRevision",
    "ERP_Directory/BAU/ERP/OIC/Inbound/Archive_Success",
    "ERP_Directory/BAU/ERP/OIC/Inbound/Archive_Failure",
    "ERP_Directory/BAU/ERP/OIC/Inbound/Archive"
  ]

  wfm_folder_structure_new = [
    "WFM_Directory",
    "WFM_Directory/WFM",
    "WFM_Directory/WFM/Destination",
    "WFM_Directory/WFM/GRS",
    "WFM_Directory/WFM/Source",
    "WFM_Directory/WFM/GRS/Outbound",
    "WFM_Directory/WFM/SSE-WFM-INT-1025",
    "WFM_Directory/WFM/SSE-WFM-INT-1025/Sentera",
    "WFM_Directory/WFM/Mepco",
    "WFM_Directory/WFM/Mepco/Archive_Success",
    "WFM_Directory/WFM/Mepco/Archive_Failure",
    "WFM_Directory/WFM/Mulesoft",
    "WFM_Directory/WFM/Mulesoft/Archive_Success",
    "WFM_Directory/WFM/Mulesoft/Archive_Failure",
    "WFM_Directory/WFM/BillingEngine",
    "WFM_Directory/WFM/BillingEngine/Archive",
    "WFM_Directory/WFM/BillingEngine/Drop",
    "WFM_Directory/WFM/OrtechWFM",
    "WFM_Directory/WFM/OrtechWFM/Archive_Success",
    "WFM_Directory/WFM/OrtechWFM/Archive_Failure",
    "WFM_Directory/WFM/Triopsys",
    "WFM_Directory/WFM/Triopsys/Archive_Success",
    "WFM_Directory/WFM/Triopsys/Archive_Failure",
    "WFM_Directory/WFM/GRS/Outbound/Archive_Success",
    "WFM_Directory/WFM/GRS/Outbound/Archive_Failure",

    #Adding directories for WFM BAU
    "WFM_Directory/BAU/WFM",
    "WFM_Directory/BAU/WFM/Destination",
    "WFM_Directory/BAU/WFM/GRS",
    "WFM_Directory/BAU/WFM/Source",
    "WFM_Directory/BAU/WFM/GRS/Outbound",
    "WFM_Directory/BAU/WFM/SSE-WFM-INT-1025",
    "WFM_Directory/BAU/WFM/SSE-WFM-INT-1025/Sentera",
    "WFM_Directory/BAU/WFM/Mepco",
    "WFM_Directory/BAU/WFM/Mepco/Archive_Success",
    "WFM_Directory/BAU/WFM/Mepco/Archive_Failure",
    "WFM_Directory/BAU/WFM/Mulesoft",
    "WFM_Directory/BAU/WFM/Mulesoft/Archive_Success",
    "WFM_Directory/BAU/WFM/Mulesoft/Archive_Failure",
    "WFM_Directory/BAU/WFM/BillingEngine",
    "WFM_Directory/BAU/WFM/BillingEngine/Archive",
    "WFM_Directory/BAU/WFM/BillingEngine/Drop",
    "WFM_Directory/BAU/WFM/OrtechWFM",
    "WFM_Directory/BAU/WFM/OrtechWFM/Archive_Success",
    "WFM_Directory/BAU/WFM/OrtechWFM/Archive_Failure",
    "WFM_Directory/BAU/WFM/Triopsys",
    "WFM_Directory/BAU/WFM/Triopsys/Archive_Success",
    "WFM_Directory/BAU/WFM/Triopsys/Archive_Failure",
    "WFM_Directory/BAU/WFM/GRS/Outbound/Archive_Success",
    "WFM_Directory/BAU/WFM/GRS/Outbound/Archive_Failure"
  ]

  tech_platform_folder_structure_new = [
    "Tech_Platform_Directory",
    "Tech_Platform_Directory/TechPlatform"
  ]

  smartrecruiters_folder_structure_new = [
    "SmartRecruiters_Directory",
    "SmartRecruiters_Directory/SmartRecruiters"
  ]
}
resource "azurerm_storage_share_directory" "sftp-new-fileshare-hcm-directory" {
  count                = length(local.hcm_folder_sructure_new)
  name                 = element(local.hcm_folder_sructure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}
resource "azurerm_storage_share_directory" "sftp-new-fileshare-wfm-directory" {
  count                = length(local.wfm_folder_structure_new)
  name                 = element(local.wfm_folder_structure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}
resource "azurerm_storage_share_directory" "sftp-new-fileshare-erp-directory" {
  count                = length(local.erp_folder_sructure_new)
  name                 = element(local.erp_folder_sructure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}

resource "azurerm_storage_share_directory" "sftp-new-fileshare-tech-platform-directory" {
  count                = length(local.tech_platform_folder_structure_new)
  name                 = element(local.tech_platform_folder_structure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}

resource "azurerm_storage_share_directory" "sftp-new-fileshare-smartrecruiters-directory" {
  count                = length(local.smartrecruiters_folder_structure_new)
  name                 = element(local.smartrecruiters_folder_structure_new, count.index)
  share_name           = azurerm_storage_share.sftp-newfileshare.name
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
}

#Storageaccount-Container
resource "azurerm_storage_container" "sftp-server-script-new-container" {
  name                 = "sftp-container"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for Finland
resource "azurerm_storage_container" "finland-new-container" {
  name                 = "root-finland"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for ERP
resource "azurerm_storage_container" "erp-new-container" {
  name                 = "erp-container"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "private"
}

#container for archive fail
resource "azurerm_storage_container" "archive-failed-files-new-container" {
  name                 = "archive-failed-files"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for archive success
resource "azurerm_storage_container" "archive-successful-files-new-container" {
  name                 = "archive-successful-files"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for oracle-vision
resource "azurerm_storage_container" "oracle-vision-new-container" {
  name                 = "oracle-vision-common-emptyfiles"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for hcm temp
resource "azurerm_storage_container" "hcm-transit-new-container" {
  name                 = "hcm-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for wfm temp
resource "azurerm_storage_container" "wfm-transit-new-container" {
  name                 = "wfm-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for erp temp
resource "azurerm_storage_container" "erp-transit-new-container" {
  name                 = "erp-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco
resource "azurerm_storage_container" "mepco-payroll-archive-container" {
  name                 = "mepco-payroll-archive"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco
resource "azurerm_storage_container" "payroll-mepco-file-transit-container" {
  name                 = "payroll-mepco-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco
resource "azurerm_storage_container" "payroll-mepco-final-file-transit-container" {
  name                 = "payroll-mepco-final-file-transit"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#Storageaccount-Containers for BAU
resource "azurerm_storage_container" "sftp-server-script-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "sftp-container-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for Finland BAU
resource "azurerm_storage_container" "finland-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "root-finland-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for ERP BAU
resource "azurerm_storage_container" "erp-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "erp-container-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "private"
}

#container for archive fail BAU
resource "azurerm_storage_container" "archive-failed-files-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "archive-failed-files-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for archive success BAU
resource "azurerm_storage_container" "archive-successful-files-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "archive-successful-files-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}
#container for oracle-vision BAU
resource "azurerm_storage_container" "oracle-vision-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "oracle-vision-common-emptyfiles-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for hcm temp BAU
resource "azurerm_storage_container" "hcm-transit-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "hcm-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for wfm temp BAU
resource "azurerm_storage_container" "wfm-transit-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "wfm-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for erp temp BAU
resource "azurerm_storage_container" "erp-transit-new-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "erp-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco BAU
resource "azurerm_storage_container" "mepco-payroll-archive-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "mepco-payroll-archive-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco BAU
resource "azurerm_storage_container" "payroll-mepco-file-transit-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "payroll-mepco-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#container for mepco BAU
resource "azurerm_storage_container" "payroll-mepco-final-file-transit-container-bau" {
  count = local.environment == "dev" || local.environment == "uat" ? 1 : 0
  name                 = "payroll-mepco-final-file-transit-bau"
  storage_account_name = azurerm_storage_account.sftp-blobsa.name
  container_access_type = "blob"
}

#StorageAccount - diagnostic settings
resource "azurerm_monitor_diagnostic_setting" "adf-blob-storage-account-diagnostic-settings" {
  name               = "adf-storage-diagnostic-settings"
  target_resource_id = resource.azurerm_storage_account.sftp-blobsa.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "adf-blob-storage-fileshare-diagnostic-settings" {
  name               = "adf-storage-fileshare-diagnostics"
  target_resource_id = "${resource.azurerm_storage_account.sftp-blobsa.id}/fileServices/default"
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

  log {
    category = "StorageRead"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageWrite"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageDelete"
    enabled = true
    retention_policy {
      enabled = false
    }
  }
  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "adf-blob-storage-container-diagnostic-settings" {
  name               = "adf-storage-container-diagnostics"
  target_resource_id = "${resource.azurerm_storage_account.sftp-blobsa.id}/blobServices/default"
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.adf-common-log-analytics-workspace.id

  log {
    category = "StorageRead"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageWrite"
    enabled = true
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "StorageDelete"
    enabled = true
    retention_policy {
      enabled = false
    }
  }
  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }

}
