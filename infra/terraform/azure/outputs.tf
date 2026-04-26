output "aks_eu" { value = azurerm_kubernetes_cluster.eu.name }
output "aks_in" { value = azurerm_kubernetes_cluster.in.name }
output "aks_us" { value = azurerm_kubernetes_cluster.us.name }
output "postgres_fqdns" { value = { eu = azurerm_postgresql_flexible_server.eu.fqdn, in = azurerm_postgresql_flexible_server.in.fqdn, us = azurerm_postgresql_flexible_server.us.fqdn } sensitive = true }
output "key_vaults" { value = { eu = azurerm_key_vault.eu.vault_uri, in = azurerm_key_vault.in.vault_uri, us = azurerm_key_vault.us.vault_uri } }
