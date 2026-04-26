# survey-service

Service in the **experience** domain of TalentBridge.

**Language:** Go · **Port:** 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/survey-service/](../../../helm/charts/survey-service/) — Helm chart
- [manifests/experience/survey-service/](../../../manifests/experience/survey-service/) — Raw K8s manifests
