# goal-service

Service in the **performance** domain of TalentBridge.

**Language:** Go · **Port:** 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/goal-service/](../../../helm/charts/goal-service/) — Helm chart
- [manifests/performance/goal-service/](../../../manifests/performance/goal-service/) — Raw K8s manifests
