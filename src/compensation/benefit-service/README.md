# benefit-service

Service in the compensation domain of TalentBridge.

Language: Go Â· Port: 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/benefit-service/](../../../helm/charts/benefit-service/) â€” Helm chart
- [manifests/compensation/benefit-service/](../../../manifests/compensation/benefit-service/) â€” Raw K8s manifests
