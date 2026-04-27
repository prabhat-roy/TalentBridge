# ergonomic-service

Service in the occupational-health domain of TalentBridge.

Language: Go Â· Port: 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ergonomic-service/](../../../helm/charts/ergonomic-service/) â€” Helm chart
- [manifests/occupational-health/ergonomic-service/](../../../manifests/occupational-health/ergonomic-service/) â€” Raw K8s manifests
