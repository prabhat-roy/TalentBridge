# skill-service

Service in the **learning** domain of TalentBridge.

**Language:** Go · **Port:** 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/skill-service/](../../../helm/charts/skill-service/) — Helm chart
- [manifests/learning/skill-service/](../../../manifests/learning/skill-service/) — Raw K8s manifests
