# attrition-predictor

Service in the **analytics** domain of TalentBridge.

**Language:** Go · **Port:** 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/attrition-predictor/](../../../helm/charts/attrition-predictor/) — Helm chart
- [manifests/analytics/attrition-predictor/](../../../manifests/analytics/attrition-predictor/) — Raw K8s manifests
