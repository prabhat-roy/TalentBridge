# equity-service

Service in the **compensation** domain of TalentBridge.

**Language:** Go · **Port:** 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/equity-service/](../../../helm/charts/equity-service/) — Helm chart
- [manifests/compensation/equity-service/](../../../manifests/compensation/equity-service/) — Raw K8s manifests
