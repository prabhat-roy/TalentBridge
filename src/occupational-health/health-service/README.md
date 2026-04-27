# health-service

Service in the occupational-health domain of TalentBridge.

Language: Go Â· Port: 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/health-service/](../../../helm/charts/health-service/) â€” Helm chart
- [manifests/occupational-health/health-service/](../../../manifests/occupational-health/health-service/) â€” Raw K8s manifests
