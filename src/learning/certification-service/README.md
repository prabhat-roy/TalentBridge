# certification-service

Service in the **learning** domain of TalentBridge.

**Language:** Go · **Port:** 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/certification-service/](../../../helm/charts/certification-service/) — Helm chart
- [manifests/learning/certification-service/](../../../manifests/learning/certification-service/) — Raw K8s manifests
