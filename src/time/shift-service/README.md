# shift-service

Service in the time domain of TalentBridge.

Language: Go Â· Port: 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/shift-service/](../../../helm/charts/shift-service/) â€” Helm chart
- [manifests/time/shift-service/](../../../manifests/time/shift-service/) â€” Raw K8s manifests
