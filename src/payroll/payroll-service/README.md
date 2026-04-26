# payroll-service

Multi-country payroll engine. **`BigDecimal` only — no `float`/`double`.**

**Domain:** `payroll` · **Language:** java · **Port:** 50040 · **Deployment:** blue-green

## Notes

- Country plug-ins under `tax-service` are pluggable — adding a new country requires a rules config, not code change
- Saga: `PayrollRunSaga` in `workflow/temporal/`
- Bank disbursement files: see `disbursement-service` (PEPPOL, WPS UAE)
