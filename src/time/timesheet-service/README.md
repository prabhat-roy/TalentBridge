# timesheet-service

Service in the **time** domain of TalentBridge.

**Language:** Go · **Port:** 50124

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/timesheet-service/](../../../helm/charts/timesheet-service/) — Helm chart
- [manifests/time/timesheet-service/](../../../manifests/time/timesheet-service/) — Raw K8s manifests
