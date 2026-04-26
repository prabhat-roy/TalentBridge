package talentbridge.payroll.tax

import future.keywords.if
import future.keywords.in

# Every country supported by the platform MUST have a registered tax engine.
# When a Helm release adds a new payroll country, the tax-service ConfigMap
# `tax-engines.yaml` must list a per-country plugin entry.

required_countries := {"IN","US","UK","DE","FR","UAE","SG"}

default allow := true

deny[msg] if {
    input.kind == "ConfigMap"
    input.metadata.name == "tax-engines"
    declared := {c | c := input.data.countries[_]}
    missing := required_countries - declared
    count(missing) > 0
    msg := sprintf("tax-engines ConfigMap missing engines for countries: %v", [missing])
}

# A payroll-service Deployment must list the supported tax engines via env.
deny[msg] if {
    input.kind == "Deployment"
    input.metadata.labels["app.kubernetes.io/name"] == "tax-service"
    container := input.spec.template.spec.containers[_]
    not tax_engines_env_present(container)
    msg := sprintf("tax-service container %q missing TAX_ENGINES_ENABLED env", [container.name])
}

tax_engines_env_present(container) if {
    env := container.env[_]
    env.name == "TAX_ENGINES_ENABLED"
    count(split(env.value, ",")) >= count(required_countries)
}
