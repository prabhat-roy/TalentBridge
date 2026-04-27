# employee-service

Employee master data + lifecycle. PII pinned by region of employment.

Domain: `core-hr` Â· Language: java Â· Port: 50010

## Endpoints

- `GET /healthz` â€” health check
- `GET /actuator/prometheus` â€” metrics

## Notes

- All employee PII row-level secured by `country_of_employment` â€” see `databases/postgres/core-hr/V1__init.sql`
- Cilium netpol blocks cross-region writes â€” see `security/cilium/`
