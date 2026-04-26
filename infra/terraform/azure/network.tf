# One resource group + one VNet per residency region.
resource "azurerm_resource_group" "eu" { name = "talentbridge-eu-${var.environment}"  location = var.location_eu  tags = { project = "talentbridge", environment = var.environment, residency = "eu" } }
resource "azurerm_resource_group" "in" { name = "talentbridge-in-${var.environment}"  location = var.location_in  tags = { project = "talentbridge", environment = var.environment, residency = "in" } }
resource "azurerm_resource_group" "us" { name = "talentbridge-us-${var.environment}"  location = var.location_us  tags = { project = "talentbridge", environment = var.environment, residency = "us" } }

resource "azurerm_virtual_network" "eu" { name = "talentbridge-eu-${var.environment}"  resource_group_name = azurerm_resource_group.eu.name  location = azurerm_resource_group.eu.location  address_space = [var.vnet_cidr_eu] }
resource "azurerm_subnet" "aks_eu"  { name = "aks"   resource_group_name = azurerm_resource_group.eu.name  virtual_network_name = azurerm_virtual_network.eu.name  address_prefixes = [cidrsubnet(var.vnet_cidr_eu, 4, 0)] }
resource "azurerm_subnet" "data_eu" { name = "data"  resource_group_name = azurerm_resource_group.eu.name  virtual_network_name = azurerm_virtual_network.eu.name  address_prefixes = [cidrsubnet(var.vnet_cidr_eu, 4, 1)]  service_endpoints = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault","Microsoft.EventHub"] }

resource "azurerm_virtual_network" "in" { name = "talentbridge-in-${var.environment}"  resource_group_name = azurerm_resource_group.in.name  location = azurerm_resource_group.in.location  address_space = [var.vnet_cidr_in] }
resource "azurerm_subnet" "aks_in"  { name = "aks"   resource_group_name = azurerm_resource_group.in.name  virtual_network_name = azurerm_virtual_network.in.name  address_prefixes = [cidrsubnet(var.vnet_cidr_in, 4, 0)] }
resource "azurerm_subnet" "data_in" { name = "data"  resource_group_name = azurerm_resource_group.in.name  virtual_network_name = azurerm_virtual_network.in.name  address_prefixes = [cidrsubnet(var.vnet_cidr_in, 4, 1)]  service_endpoints = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault","Microsoft.EventHub"] }

resource "azurerm_virtual_network" "us" { name = "talentbridge-us-${var.environment}"  resource_group_name = azurerm_resource_group.us.name  location = azurerm_resource_group.us.location  address_space = [var.vnet_cidr_us] }
resource "azurerm_subnet" "aks_us"  { name = "aks"   resource_group_name = azurerm_resource_group.us.name  virtual_network_name = azurerm_virtual_network.us.name  address_prefixes = [cidrsubnet(var.vnet_cidr_us, 4, 0)] }
resource "azurerm_subnet" "data_us" { name = "data"  resource_group_name = azurerm_resource_group.us.name  virtual_network_name = azurerm_virtual_network.us.name  address_prefixes = [cidrsubnet(var.vnet_cidr_us, 4, 1)]  service_endpoints = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault","Microsoft.EventHub"] }
