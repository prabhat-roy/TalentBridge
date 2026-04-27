# leave-service

Service in the time domain of TalentBridge.

Language: Go Â· Port: 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/leave-service/](../../../helm/charts/leave-service/) â€” Helm chart
- [manifests/time/leave-service/](../../../manifests/time/leave-service/) â€” Raw K8s manifests
