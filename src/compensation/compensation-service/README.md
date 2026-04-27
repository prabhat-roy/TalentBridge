# compensation-service

Service in the compensation domain of TalentBridge.

Language: Go Â· Port: 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/compensation-service/](../../../helm/charts/compensation-service/) â€” Helm chart
- [manifests/compensation/compensation-service/](../../../manifests/compensation/compensation-service/) â€” Raw K8s manifests
