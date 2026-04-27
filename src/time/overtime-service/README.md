# overtime-service

Service in the time domain of TalentBridge.

Language: Go Â· Port: 50123

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/overtime-service/](../../../helm/charts/overtime-service/) â€” Helm chart
- [manifests/time/overtime-service/](../../../manifests/time/overtime-service/) â€” Raw K8s manifests
