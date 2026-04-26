resource "azurerm_kubernetes_cluster" "eu" {
  name = "talentbridge-eu-${var.environment}"  resource_group_name = azurerm_resource_group.eu.name  location = azurerm_resource_group.eu.location  dns_prefix = "talentbridge-eu-${var.environment}"  kubernetes_version = var.aks_version
  oidc_issuer_enabled = true  workload_identity_enabled = true
  default_node_pool { name = "default"  vm_size = var.node_vm_size  auto_scaling_enabled = true  min_count = var.node_min  max_count = var.node_max  vnet_subnet_id = azurerm_subnet.aks_eu.id  os_disk_size_gb = 100 }
  identity { type = "SystemAssigned" }
  network_profile { network_plugin = "azure"  network_policy = "cilium"  load_balancer_sku = "standard"  service_cidr = "10.79.0.0/16"  dns_service_ip = "10.79.0.10" }
}
resource "azurerm_kubernetes_cluster" "in" {
  name = "talentbridge-in-${var.environment}"  resource_group_name = azurerm_resource_group.in.name  location = azurerm_resource_group.in.location  dns_prefix = "talentbridge-in-${var.environment}"  kubernetes_version = var.aks_version
  oidc_issuer_enabled = true  workload_identity_enabled = true
  default_node_pool { name = "default"  vm_size = var.node_vm_size  auto_scaling_enabled = true  min_count = var.node_min  max_count = var.node_max  vnet_subnet_id = azurerm_subnet.aks_in.id  os_disk_size_gb = 100 }
  identity { type = "SystemAssigned" }
  network_profile { network_plugin = "azure"  network_policy = "cilium"  load_balancer_sku = "standard"  service_cidr = "10.79.1.0/24"  dns_service_ip = "10.79.1.10" }
}
resource "azurerm_kubernetes_cluster" "us" {
  name = "talentbridge-us-${var.environment}"  resource_group_name = azurerm_resource_group.us.name  location = azurerm_resource_group.us.location  dns_prefix = "talentbridge-us-${var.environment}"  kubernetes_version = var.aks_version
  oidc_issuer_enabled = true  workload_identity_enabled = true
  default_node_pool { name = "default"  vm_size = var.node_vm_size  auto_scaling_enabled = true  min_count = var.node_min  max_count = var.node_max  vnet_subnet_id = azurerm_subnet.aks_us.id  os_disk_size_gb = 100 }
  identity { type = "SystemAssigned" }
  network_profile { network_plugin = "azure"  network_policy = "cilium"  load_balancer_sku = "standard"  service_cidr = "10.79.2.0/24"  dns_service_ip = "10.79.2.10" }
}
