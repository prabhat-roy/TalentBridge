# payroll domain

Multi-country payroll engine. **All money handled as `BigDecimal` — never `float`/`double`.**

| Service | Language | Port | Description |
|---|---|---|---|
| payroll-service | Java/Spring | 50040 | Payroll engine; multi-country |
| salary-service | Java/Spring | 50041 | Salary structure, hikes, prorating |
| tax-service | Java/Spring | 50042 | Per-country tax engine (IN/US/UK/EU/UAE/SG) |
| deduction-service | Java/Spring | 50043 | Statutory + voluntary deductions |
| disbursement-service | Java/Spring | 50044 | Bank file generation, WPS, PEPPOL |

## Saga

`PayrollRunSaga` (in `workflow/temporal/`) orchestrates: calc → review → approve → disburse → reconcile, with compensating actions on each step.

## Compliance

- `security/opa/policies/payroll-bigdecimal-only.rego` — blocks float/double in payroll modules
- `security/opa/policies/tax-engine-per-country-required.rego` — country code mandatory on every tax call
