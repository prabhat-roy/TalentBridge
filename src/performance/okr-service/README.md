# okr-service

Service in the **performance** domain of TalentBridge.

**Language:** Go · **Port:** 50144

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/okr-service/](../../../helm/charts/okr-service/) — Helm chart
- [manifests/performance/okr-service/](../../../manifests/performance/okr-service/) — Raw K8s manifests
