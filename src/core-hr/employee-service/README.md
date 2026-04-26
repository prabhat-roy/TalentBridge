# employee-service

Employee master data + lifecycle. PII pinned by region of employment.

**Domain:** `core-hr` · **Language:** java · **Port:** 50010

## Endpoints

- `GET /healthz` — health check
- `GET /actuator/prometheus` — metrics

## Notes

- All employee PII row-level secured by `country_of_employment` — see `databases/postgres/core-hr/V1__init.sql`
- Cilium netpol blocks cross-region writes — see `security/cilium/`
