# engagement-service

Service in the **experience** domain of TalentBridge.

**Language:** Go · **Port:** 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/engagement-service/](../../../helm/charts/engagement-service/) — Helm chart
- [manifests/experience/engagement-service/](../../../manifests/experience/engagement-service/) — Raw K8s manifests
