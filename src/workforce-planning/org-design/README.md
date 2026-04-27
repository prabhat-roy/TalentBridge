# org-design

Service in the workforce-planning domain of TalentBridge.

Language: Go Â· Port: 50203

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/org-design/](../../../helm/charts/org-design/) â€” Helm chart
- [manifests/workforce-planning/org-design/](../../../manifests/workforce-planning/org-design/) â€” Raw K8s manifests
