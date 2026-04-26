# succession-service

Service in the **workforce-planning** domain of TalentBridge.

**Language:** Go · **Port:** 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/succession-service/](../../../helm/charts/succession-service/) — Helm chart
- [manifests/workforce-planning/succession-service/](../../../manifests/workforce-planning/succession-service/) — Raw K8s manifests
