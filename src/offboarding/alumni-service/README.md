# alumni-service

Service in the **offboarding** domain of TalentBridge.

**Language:** Go · **Port:** 50243

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/alumni-service/](../../../helm/charts/alumni-service/) — Helm chart
- [manifests/offboarding/alumni-service/](../../../manifests/offboarding/alumni-service/) — Raw K8s manifests
