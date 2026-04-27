# alumni-service

Service in the offboarding domain of TalentBridge.

Language: Go Â· Port: 50243

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/alumni-service/](../../../helm/charts/alumni-service/) â€” Helm chart
- [manifests/offboarding/alumni-service/](../../../manifests/offboarding/alumni-service/) â€” Raw K8s manifests
