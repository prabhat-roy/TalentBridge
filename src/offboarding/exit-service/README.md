# exit-service

Service in the offboarding domain of TalentBridge.

Language: Go Â· Port: 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/exit-service/](../../../helm/charts/exit-service/) â€” Helm chart
- [manifests/offboarding/exit-service/](../../../manifests/offboarding/exit-service/) â€” Raw K8s manifests
