# compensation-service

Service in the **compensation** domain of TalentBridge.

**Language:** Go · **Port:** 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/compensation-service/](../../../helm/charts/compensation-service/) — Helm chart
- [manifests/compensation/compensation-service/](../../../manifests/compensation/compensation-service/) — Raw K8s manifests
