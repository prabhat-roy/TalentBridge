# nps-service

Service in the experience domain of TalentBridge.

Language: Go Â· Port: 50224

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/nps-service/](../../../helm/charts/nps-service/) â€” Helm chart
- [manifests/experience/nps-service/](../../../manifests/experience/nps-service/) â€” Raw K8s manifests
