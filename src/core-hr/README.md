# core-hr domain

| Service | Language | Port | Description |
|---|---|---|---|
| employee-service | Java/Spring | 50010 | Employee master data, lifecycle |
| organisation-service | Java/Spring | 50011 | Legal entities, business units, cost centres |
| position-service | Java/Spring | 50012 | Positions, headcount slots, FTE |
| job-service | Java/Spring | 50013 | Job catalogue, families, levels |

PII for these services is region-pinned by `country_of_employment` — see `security/opa/policies/pii-region-residency.rego`.
