# headcount-service

Service in the **workforce-planning** domain of TalentBridge.

**Language:** Go · **Port:** 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/headcount-service/](../../../helm/charts/headcount-service/) — Helm chart
- [manifests/workforce-planning/headcount-service/](../../../manifests/workforce-planning/headcount-service/) — Raw K8s manifests
