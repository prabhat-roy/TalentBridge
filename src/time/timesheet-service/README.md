# timesheet-service

Service in the time domain of TalentBridge.

Language: Go Â· Port: 50124

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/timesheet-service/](../../../helm/charts/timesheet-service/) â€” Helm chart
- [manifests/time/timesheet-service/](../../../manifests/time/timesheet-service/) â€” Raw K8s manifests
