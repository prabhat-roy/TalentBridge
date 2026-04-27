# background-service

Service in the integrations domain of TalentBridge.

Language: Go Â· Port: 50323

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/background-service/](../../../helm/charts/background-service/) â€” Helm chart
- [manifests/integrations/background-service/](../../../manifests/integrations/background-service/) â€” Raw K8s manifests
