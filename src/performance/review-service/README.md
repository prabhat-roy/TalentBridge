# review-service

Service in the performance domain of TalentBridge.

Language: Go Â· Port: 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/review-service/](../../../helm/charts/review-service/) â€” Helm chart
- [manifests/performance/review-service/](../../../manifests/performance/review-service/) â€” Raw K8s manifests
