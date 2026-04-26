package talentbridge.payroll.bigdecimal

import future.keywords.if
import future.keywords.in

# Conftest-style policy. Source files in src/payroll/** and src/compensation/**
# are scanned by the CI; their AST/grep results are passed in as input.findings.
# Any monetary value MUST be BigDecimal/decimal.Decimal — never double/float.

default allow := true

deny[msg] if {
    f := input.findings[_]
    f.path_glob in ["src/payroll/", "src/compensation/"]
    f.kind == "field-decl"
    f.type in {"double", "float", "Double", "Float"}
    f.semantic == "money"
    msg := sprintf("%s:%d — money field %q uses %s; must be BigDecimal/decimal.Decimal", [f.file, f.line, f.name, f.type])
}

# Helm chart enforcement: payroll-* deployments MUST set MONEY_TYPE=BigDecimal env.
deny[msg] if {
    input.kind == "Deployment"
    contains(input.metadata.namespace, "payroll")
    container := input.spec.template.spec.containers[_]
    not money_type_set(container)
    msg := sprintf("Payroll deployment %q container %q missing env MONEY_TYPE=BigDecimal", [input.metadata.name, container.name])
}

money_type_set(container) if {
    env := container.env[_]
    env.name == "MONEY_TYPE"
    env.value == "BigDecimal"
}
