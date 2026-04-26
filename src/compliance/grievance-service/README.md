# grievance-service

Service in the **compliance** domain of TalentBridge.

**Language:** Go · **Port:** 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/grievance-service/](../../../helm/charts/grievance-service/) — Helm chart
- [manifests/compliance/grievance-service/](../../../manifests/compliance/grievance-service/) — Raw K8s manifests
