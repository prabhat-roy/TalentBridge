# employee-sso

Service in the **identity** domain of TalentBridge.

**Language:** Go · **Port:** 50021

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/employee-sso/](../../../helm/charts/employee-sso/) — Helm chart
- [manifests/identity/employee-sso/](../../../manifests/identity/employee-sso/) — Raw K8s manifests
