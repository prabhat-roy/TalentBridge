# okr-service

Service in the performance domain of TalentBridge.

Language: Go Â· Port: 50144

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/okr-service/](../../../helm/charts/okr-service/) â€” Helm chart
- [manifests/performance/okr-service/](../../../manifests/performance/okr-service/) â€” Raw K8s manifests
