# idp-service

Service in the **learning** domain of TalentBridge.

**Language:** Go · **Port:** 50164

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/idp-service/](../../../helm/charts/idp-service/) — Helm chart
- [manifests/learning/idp-service/](../../../manifests/learning/idp-service/) — Raw K8s manifests
