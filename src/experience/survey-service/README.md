# survey-service

Service in the experience domain of TalentBridge.

Language: Go Â· Port: 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/survey-service/](../../../helm/charts/survey-service/) â€” Helm chart
- [manifests/experience/survey-service/](../../../manifests/experience/survey-service/) â€” Raw K8s manifests
