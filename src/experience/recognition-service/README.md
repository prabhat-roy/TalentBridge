# recognition-service

Service in the experience domain of TalentBridge.

Language: Go Â· Port: 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/recognition-service/](../../../helm/charts/recognition-service/) â€” Helm chart
- [manifests/experience/recognition-service/](../../../manifests/experience/recognition-service/) â€” Raw K8s manifests
