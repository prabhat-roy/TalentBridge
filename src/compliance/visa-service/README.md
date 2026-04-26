# visa-service

Service in the **compliance** domain of TalentBridge.

**Language:** Go · **Port:** 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/visa-service/](../../../helm/charts/visa-service/) — Helm chart
- [manifests/compliance/visa-service/](../../../manifests/compliance/visa-service/) — Raw K8s manifests
