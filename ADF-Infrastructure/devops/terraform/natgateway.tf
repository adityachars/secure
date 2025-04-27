# # Public IP for nat gateway
# resource "azurerm_public_ip" "public-ip-nat" {
#   name                = var.publicip-nat[local.environment]
#   location            = var.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# # NAT gateway
# resource "azurerm_nat_gateway" "northstar-nat-gateway" {
#   name                    = var.northstar-nat-gateway[local.environment]
#   location                = var.location
#   resource_group_name     = data.azurerm_resource_group.rg.name
#   sku_name                = "Standard"
#   idle_timeout_in_minutes = 4
# }

# # Public ip association for nat gateway
# resource "azurerm_nat_gateway_public_ip_association" "nat-association" {
#   nat_gateway_id       = azurerm_nat_gateway.northstar-nat-gateway.id
#   public_ip_address_id = azurerm_public_ip.public-ip-nat.id
# }

# # subnet association for nat gateway
# resource "azurerm_subnet_nat_gateway_association" "snet-association" {
#   subnet_id      = azurerm_subnet.localIRsubnet.id
#   nat_gateway_id = azurerm_nat_gateway.northstar-nat-gateway.id
# }
