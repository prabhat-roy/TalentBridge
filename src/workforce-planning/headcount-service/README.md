# headcount-service

Service in the workforce-planning domain of TalentBridge.

Language: Go Â· Port: 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/headcount-service/](../../../helm/charts/headcount-service/) â€” Helm chart
- [manifests/workforce-planning/headcount-service/](../../../manifests/workforce-planning/headcount-service/) â€” Raw K8s manifests
