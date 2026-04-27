# feedback-service

Service in the performance domain of TalentBridge.

Language: Go Â· Port: 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/feedback-service/](../../../helm/charts/feedback-service/) â€” Helm chart
- [manifests/performance/feedback-service/](../../../manifests/performance/feedback-service/) â€” Raw K8s manifests
