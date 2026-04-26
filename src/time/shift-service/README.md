# shift-service

Service in the **time** domain of TalentBridge.

**Language:** Go · **Port:** 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/shift-service/](../../../helm/charts/shift-service/) — Helm chart
- [manifests/time/shift-service/](../../../manifests/time/shift-service/) — Raw K8s manifests
