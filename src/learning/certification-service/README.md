# certification-service

Service in the learning domain of TalentBridge.

Language: Go Â· Port: 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/certification-service/](../../../helm/charts/certification-service/) â€” Helm chart
- [manifests/learning/certification-service/](../../../manifests/learning/certification-service/) â€” Raw K8s manifests
