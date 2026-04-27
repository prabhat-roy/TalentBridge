# forecast-service

Service in the workforce-planning domain of TalentBridge.

Language: Go Â· Port: 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/forecast-service/](../../../helm/charts/forecast-service/) â€” Helm chart
- [manifests/workforce-planning/forecast-service/](../../../manifests/workforce-planning/forecast-service/) â€” Raw K8s manifests
