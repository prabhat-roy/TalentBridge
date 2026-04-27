# ats-service

Service in the recruitment domain of TalentBridge.

Language: Go Â· Port: 50061

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ats-service/](../../../helm/charts/ats-service/) â€” Helm chart
- [manifests/recruitment/ats-service/](../../../manifests/recruitment/ats-service/) â€” Raw K8s manifests
