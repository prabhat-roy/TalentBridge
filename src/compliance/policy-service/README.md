# policy-service

Service in the compliance domain of TalentBridge.

Language: Go Â· Port: 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/policy-service/](../../../helm/charts/policy-service/) â€” Helm chart
- [manifests/compliance/policy-service/](../../../manifests/compliance/policy-service/) â€” Raw K8s manifests
