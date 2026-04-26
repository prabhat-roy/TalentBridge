# attendance-service

Service in the **time** domain of TalentBridge.

**Language:** Go · **Port:** 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/attendance-service/](../../../helm/charts/attendance-service/) — Helm chart
- [manifests/time/attendance-service/](../../../manifests/time/attendance-service/) — Raw K8s manifests
