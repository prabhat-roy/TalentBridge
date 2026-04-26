# leave-service

Service in the **time** domain of TalentBridge.

**Language:** Go · **Port:** 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/leave-service/](../../../helm/charts/leave-service/) — Helm chart
- [manifests/time/leave-service/](../../../manifests/time/leave-service/) — Raw K8s manifests
