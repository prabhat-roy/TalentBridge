# finance-integration

Service in the **integrations** domain of TalentBridge.

**Language:** Go · **Port:** 50321

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/finance-integration/](../../../helm/charts/finance-integration/) — Helm chart
- [manifests/integrations/finance-integration/](../../../manifests/integrations/finance-integration/) — Raw K8s manifests
