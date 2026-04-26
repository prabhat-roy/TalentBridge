# overtime-service

Service in the **time** domain of TalentBridge.

**Language:** Go · **Port:** 50123

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/overtime-service/](../../../helm/charts/overtime-service/) — Helm chart
- [manifests/time/overtime-service/](../../../manifests/time/overtime-service/) — Raw K8s manifests
