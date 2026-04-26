# review-service

Service in the **performance** domain of TalentBridge.

**Language:** Go · **Port:** 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/review-service/](../../../helm/charts/review-service/) — Helm chart
- [manifests/performance/review-service/](../../../manifests/performance/review-service/) — Raw K8s manifests
