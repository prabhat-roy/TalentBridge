# lms-service

Service in the **learning** domain of TalentBridge.

**Language:** Go · **Port:** 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/lms-service/](../../../helm/charts/lms-service/) — Helm chart
- [manifests/learning/lms-service/](../../../manifests/learning/lms-service/) — Raw K8s manifests
