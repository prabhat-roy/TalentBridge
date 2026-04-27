# calibration-service

Service in the performance domain of TalentBridge.

Language: Go Â· Port: 50143

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/calibration-service/](../../../helm/charts/calibration-service/) â€” Helm chart
- [manifests/performance/calibration-service/](../../../manifests/performance/calibration-service/) â€” Raw K8s manifests
