# lms-service

Service in the learning domain of TalentBridge.

Language: Go Â· Port: 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/lms-service/](../../../helm/charts/lms-service/) â€” Helm chart
- [manifests/learning/lms-service/](../../../manifests/learning/lms-service/) â€” Raw K8s manifests
