# payroll-service

Multi-country payroll engine. `BigDecimal` only â€” no `float`/`double`.

Domain: `payroll` Â· Language: java Â· Port: 50040 Â· Deployment: blue-green

## Notes

- Country plug-ins under `tax-service` are pluggable â€” adding a new country requires a rules config, not code change
- Saga: `PayrollRunSaga` in `workflow/temporal/`
- Bank disbursement files: see `disbursement-service` (PEPPOL, WPS UAE)
