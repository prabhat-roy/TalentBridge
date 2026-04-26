# org-design

Service in the **workforce-planning** domain of TalentBridge.

**Language:** Go · **Port:** 50203

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/org-design/](../../../helm/charts/org-design/) — Helm chart
- [manifests/workforce-planning/org-design/](../../../manifests/workforce-planning/org-design/) — Raw K8s manifests
