# health-service

Service in the **occupational-health** domain of TalentBridge.

**Language:** Go · **Port:** 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/health-service/](../../../helm/charts/health-service/) — Helm chart
- [manifests/occupational-health/health-service/](../../../manifests/occupational-health/health-service/) — Raw K8s manifests
