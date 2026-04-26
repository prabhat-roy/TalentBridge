variable "environment" { type = string  default = "prod" }

variable "location_eu" { type = string default = "westeurope" }
variable "location_in" { type = string default = "centralindia" }
variable "location_us" { type = string default = "eastus" }

variable "vnet_cidr_eu" { type = string default = "10.70.0.0/16" }
variable "vnet_cidr_in" { type = string default = "10.71.0.0/16" }
variable "vnet_cidr_us" { type = string default = "10.72.0.0/16" }

variable "aks_version"  { type = string default = "1.31" }
variable "node_min"     { type = number default = 3 }
variable "node_max"     { type = number default = 30 }
variable "node_vm_size" { type = string default = "Standard_D4s_v5" }

variable "pg_sku"        { type = string default = "GP_Standard_D4s_v3" }
variable "pg_storage_mb" { type = number default = 524288 }
variable "pg_version"    { type = string default = "16" }

variable "redis_sku_name" { type = string default = "Premium" }
variable "redis_capacity" { type = number default = 1 }
