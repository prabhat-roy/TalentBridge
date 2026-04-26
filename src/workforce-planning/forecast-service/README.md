# forecast-service

Service in the **workforce-planning** domain of TalentBridge.

**Language:** Go · **Port:** 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/forecast-service/](../../../helm/charts/forecast-service/) — Helm chart
- [manifests/workforce-planning/forecast-service/](../../../manifests/workforce-planning/forecast-service/) — Raw K8s manifests
