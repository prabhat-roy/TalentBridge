# goal-service

Service in the performance domain of TalentBridge.

Language: Go Â· Port: 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/goal-service/](../../../helm/charts/goal-service/) â€” Helm chart
- [manifests/performance/goal-service/](../../../manifests/performance/goal-service/) â€” Raw K8s manifests
