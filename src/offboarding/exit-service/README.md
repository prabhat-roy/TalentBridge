# exit-service

Service in the **offboarding** domain of TalentBridge.

**Language:** Go · **Port:** 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/exit-service/](../../../helm/charts/exit-service/) — Helm chart
- [manifests/offboarding/exit-service/](../../../manifests/offboarding/exit-service/) — Raw K8s manifests
