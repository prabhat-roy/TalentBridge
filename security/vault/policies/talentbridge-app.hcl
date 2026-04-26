# Default policy for TalentBridge application services.
# Each service consumes its own KV path; per-region database credentials.
path "talentbridge/data/{{identity.entity.aliases.auth_kubernetes_*.metadata.service_account_name}}/*" {
  capabilities = ["read"]
}
path "database/creds/talentbridge-{{identity.entity.aliases.auth_kubernetes_*.metadata.service_account_name}}" {
  capabilities = ["read"]
}
# Payslip signing — the HSM key. ONLY the payroll-service SA can sign.
path "transit/sign/talentbridge-payslip" {
  capabilities = ["update"]
  allowed_parameters = { "*" = [] }
}
path "transit/encrypt/talentbridge" { capabilities = ["update"] }
path "transit/decrypt/talentbridge" { capabilities = ["update"] }
