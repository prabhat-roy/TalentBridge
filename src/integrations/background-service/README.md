# background-service

Service in the **integrations** domain of TalentBridge.

**Language:** Go · **Port:** 50323

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/background-service/](../../../helm/charts/background-service/) — Helm chart
- [manifests/integrations/background-service/](../../../manifests/integrations/background-service/) — Raw K8s manifests
