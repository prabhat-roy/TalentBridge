# visa-service

Service in the compliance domain of TalentBridge.

Language: Go Â· Port: 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/visa-service/](../../../helm/charts/visa-service/) â€” Helm chart
- [manifests/compliance/visa-service/](../../../manifests/compliance/visa-service/) â€” Raw K8s manifests
