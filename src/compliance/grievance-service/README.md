# grievance-service

Service in the compliance domain of TalentBridge.

Language: Go Â· Port: 50263

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/grievance-service/](../../../helm/charts/grievance-service/) â€” Helm chart
- [manifests/compliance/grievance-service/](../../../manifests/compliance/grievance-service/) â€” Raw K8s manifests
