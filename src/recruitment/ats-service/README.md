# ats-service

Service in the **recruitment** domain of TalentBridge.

**Language:** Go · **Port:** 50061

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ats-service/](../../../helm/charts/ats-service/) — Helm chart
- [manifests/recruitment/ats-service/](../../../manifests/recruitment/ats-service/) — Raw K8s manifests
