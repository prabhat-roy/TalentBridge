# erp-integration

Service in the **integrations** domain of TalentBridge.

**Language:** Go · **Port:** 50320

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/erp-integration/](../../../helm/charts/erp-integration/) — Helm chart
- [manifests/integrations/erp-integration/](../../../manifests/integrations/erp-integration/) — Raw K8s manifests
