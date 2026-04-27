# incident-service

Service in the occupational-health domain of TalentBridge.

Language: Go Â· Port: 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/incident-service/](../../../helm/charts/incident-service/) â€” Helm chart
- [manifests/occupational-health/incident-service/](../../../manifests/occupational-health/incident-service/) â€” Raw K8s manifests
