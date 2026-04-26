# benefit-service

Service in the **compensation** domain of TalentBridge.

**Language:** Go · **Port:** 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/benefit-service/](../../../helm/charts/benefit-service/) — Helm chart
- [manifests/compensation/benefit-service/](../../../manifests/compensation/benefit-service/) — Raw K8s manifests
