resource "random_password" "pg_eu" { length = 32 special = false }
resource "random_password" "pg_in" { length = 32 special = false }
resource "random_password" "pg_us" { length = 32 special = false }

resource "azurerm_postgresql_flexible_server" "eu" {
  name = "talentbridge-eu-${var.environment}"  resource_group_name = azurerm_resource_group.eu.name  location = azurerm_resource_group.eu.location
  version = var.pg_version  administrator_login = "talentbridge"  administrator_password = random_password.pg_eu.result
  delegated_subnet_id = azurerm_subnet.data_eu.id  sku_name = var.pg_sku  storage_mb = var.pg_storage_mb  zone = "1"
  high_availability { mode = "ZoneRedundant"  standby_availability_zone = "2" }  backup_retention_days = 14  geo_redundant_backup_enabled = false
}
resource "azurerm_postgresql_flexible_server" "in" {
  name = "talentbridge-in-${var.environment}"  resource_group_name = azurerm_resource_group.in.name  location = azurerm_resource_group.in.location
  version = var.pg_version  administrator_login = "talentbridge"  administrator_password = random_password.pg_in.result
  delegated_subnet_id = azurerm_subnet.data_in.id  sku_name = var.pg_sku  storage_mb = var.pg_storage_mb  zone = "1"
  high_availability { mode = "ZoneRedundant"  standby_availability_zone = "2" }  backup_retention_days = 14  geo_redundant_backup_enabled = false
}
resource "azurerm_postgresql_flexible_server" "us" {
  name = "talentbridge-us-${var.environment}"  resource_group_name = azurerm_resource_group.us.name  location = azurerm_resource_group.us.location
  version = var.pg_version  administrator_login = "talentbridge"  administrator_password = random_password.pg_us.result
  delegated_subnet_id = azurerm_subnet.data_us.id  sku_name = var.pg_sku  storage_mb = var.pg_storage_mb  zone = "1"
  high_availability { mode = "ZoneRedundant"  standby_availability_zone = "2" }  backup_retention_days = 14  geo_redundant_backup_enabled = false
}

resource "azurerm_redis_cache" "eu" { name = "talentbridge-eu-${var.environment}"  resource_group_name = azurerm_resource_group.eu.name  location = azurerm_resource_group.eu.location  capacity = var.redis_capacity  family = "P"  sku_name = var.redis_sku_name  non_ssl_port_enabled = false  minimum_tls_version = "1.2" }
resource "azurerm_redis_cache" "in" { name = "talentbridge-in-${var.environment}"  resource_group_name = azurerm_resource_group.in.name  location = azurerm_resource_group.in.location  capacity = var.redis_capacity  family = "P"  sku_name = var.redis_sku_name  non_ssl_port_enabled = false  minimum_tls_version = "1.2" }
resource "azurerm_redis_cache" "us" { name = "talentbridge-us-${var.environment}"  resource_group_name = azurerm_resource_group.us.name  location = azurerm_resource_group.us.location  capacity = var.redis_capacity  family = "P"  sku_name = var.redis_sku_name  non_ssl_port_enabled = false  minimum_tls_version = "1.2" }

resource "azurerm_eventhub_namespace" "kafka_eu" { name = "talentbridge-eu-${var.environment}"  resource_group_name = azurerm_resource_group.eu.name  location = azurerm_resource_group.eu.location  sku = "Standard"  capacity = 2  kafka_enabled = true }
resource "azurerm_eventhub_namespace" "kafka_in" { name = "talentbridge-in-${var.environment}"  resource_group_name = azurerm_resource_group.in.name  location = azurerm_resource_group.in.location  sku = "Standard"  capacity = 2  kafka_enabled = true }
resource "azurerm_eventhub_namespace" "kafka_us" { name = "talentbridge-us-${var.environment}"  resource_group_name = azurerm_resource_group.us.name  location = azurerm_resource_group.us.location  sku = "Standard"  capacity = 2  kafka_enabled = true }
