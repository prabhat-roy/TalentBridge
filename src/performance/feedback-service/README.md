# feedback-service

Service in the **performance** domain of TalentBridge.

**Language:** Go · **Port:** 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/feedback-service/](../../../helm/charts/feedback-service/) — Helm chart
- [manifests/performance/feedback-service/](../../../manifests/performance/feedback-service/) — Raw K8s manifests
