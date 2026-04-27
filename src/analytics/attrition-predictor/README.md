# attrition-predictor

Service in the analytics domain of TalentBridge.

Language: Go Â· Port: 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/attrition-predictor/](../../../helm/charts/attrition-predictor/) â€” Helm chart
- [manifests/analytics/attrition-predictor/](../../../manifests/analytics/attrition-predictor/) â€” Raw K8s manifests
