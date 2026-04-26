# wellbeing-service

Service in the **experience** domain of TalentBridge.

**Language:** Go · **Port:** 50223

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/wellbeing-service/](../../../helm/charts/wellbeing-service/) — Helm chart
- [manifests/experience/wellbeing-service/](../../../manifests/experience/wellbeing-service/) — Raw K8s manifests
