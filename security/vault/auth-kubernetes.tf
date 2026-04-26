resource "vault_auth_backend" "k8s" { type = "kubernetes" }

resource "vault_kubernetes_auth_backend_config" "k8s" {
  backend            = vault_auth_backend.k8s.path
  kubernetes_host    = var.kubernetes_host
  token_reviewer_jwt = var.reviewer_jwt
}

resource "vault_kubernetes_auth_backend_role" "talentbridge" {
  for_each = toset(var.talentbridge_services)
  backend                          = vault_auth_backend.k8s.path
  role_name                        = each.value
  bound_service_account_names      = [each.value]
  bound_service_account_namespaces = ["talentbridge", "talentbridge-payroll", "talentbridge-core-hr"]
  token_policies                   = ["talentbridge-app"]
  token_ttl                        = 3600
}
