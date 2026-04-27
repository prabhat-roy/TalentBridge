# engagement-service

Service in the experience domain of TalentBridge.

Language: Go Â· Port: 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/engagement-service/](../../../helm/charts/engagement-service/) â€” Helm chart
- [manifests/experience/engagement-service/](../../../manifests/experience/engagement-service/) â€” Raw K8s manifests
