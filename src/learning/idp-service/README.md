# idp-service

Service in the learning domain of TalentBridge.

Language: Go Â· Port: 50164

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/idp-service/](../../../helm/charts/idp-service/) â€” Helm chart
- [manifests/learning/idp-service/](../../../manifests/learning/idp-service/) â€” Raw K8s manifests
