# ergonomic-service

Service in the **occupational-health** domain of TalentBridge.

**Language:** Go · **Port:** 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ergonomic-service/](../../../helm/charts/ergonomic-service/) — Helm chart
- [manifests/occupational-health/ergonomic-service/](../../../manifests/occupational-health/ergonomic-service/) — Raw K8s manifests
