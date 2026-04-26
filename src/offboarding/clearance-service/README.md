# clearance-service

Service in the **offboarding** domain of TalentBridge.

**Language:** Go · **Port:** 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clearance-service/](../../../helm/charts/clearance-service/) — Helm chart
- [manifests/offboarding/clearance-service/](../../../manifests/offboarding/clearance-service/) — Raw K8s manifests
