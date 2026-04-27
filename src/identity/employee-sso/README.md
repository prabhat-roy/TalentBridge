# employee-sso

Service in the identity domain of TalentBridge.

Language: Go Â· Port: 50021

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/employee-sso/](../../../helm/charts/employee-sso/) â€” Helm chart
- [manifests/identity/employee-sso/](../../../manifests/identity/employee-sso/) â€” Raw K8s manifests
