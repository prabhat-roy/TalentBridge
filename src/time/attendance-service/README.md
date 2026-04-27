# attendance-service

Service in the time domain of TalentBridge.

Language: Go Â· Port: 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/attendance-service/](../../../helm/charts/attendance-service/) â€” Helm chart
- [manifests/time/attendance-service/](../../../manifests/time/attendance-service/) â€” Raw K8s manifests
