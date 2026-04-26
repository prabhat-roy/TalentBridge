# calibration-service

Service in the **performance** domain of TalentBridge.

**Language:** Go · **Port:** 50143

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/calibration-service/](../../../helm/charts/calibration-service/) — Helm chart
- [manifests/performance/calibration-service/](../../../manifests/performance/calibration-service/) — Raw K8s manifests
