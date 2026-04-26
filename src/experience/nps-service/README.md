# nps-service

Service in the **experience** domain of TalentBridge.

**Language:** Go · **Port:** 50224

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/nps-service/](../../../helm/charts/nps-service/) — Helm chart
- [manifests/experience/nps-service/](../../../manifests/experience/nps-service/) — Raw K8s manifests
