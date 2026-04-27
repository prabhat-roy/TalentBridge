# equity-service

Service in the compensation domain of TalentBridge.

Language: Go Â· Port: 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/equity-service/](../../../helm/charts/equity-service/) â€” Helm chart
- [manifests/compensation/equity-service/](../../../manifests/compensation/equity-service/) â€” Raw K8s manifests
