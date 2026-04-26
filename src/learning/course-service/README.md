# course-service

Service in the **learning** domain of TalentBridge.

**Language:** Go · **Port:** 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/course-service/](../../../helm/charts/course-service/) — Helm chart
- [manifests/learning/course-service/](../../../manifests/learning/course-service/) — Raw K8s manifests
