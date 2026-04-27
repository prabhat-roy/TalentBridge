# clearance-service

Service in the offboarding domain of TalentBridge.

Language: Go Â· Port: 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clearance-service/](../../../helm/charts/clearance-service/) â€” Helm chart
- [manifests/offboarding/clearance-service/](../../../manifests/offboarding/clearance-service/) â€” Raw K8s manifests
