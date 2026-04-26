# incident-service

Service in the **occupational-health** domain of TalentBridge.

**Language:** Go · **Port:** 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/incident-service/](../../../helm/charts/incident-service/) — Helm chart
- [manifests/occupational-health/incident-service/](../../../manifests/occupational-health/incident-service/) — Raw K8s manifests
