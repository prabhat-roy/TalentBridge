# succession-service

Service in the workforce-planning domain of TalentBridge.

Language: Go Â· Port: 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/succession-service/](../../../helm/charts/succession-service/) â€” Helm chart
- [manifests/workforce-planning/succession-service/](../../../manifests/workforce-planning/succession-service/) â€” Raw K8s manifests
