# recognition-service

Service in the **experience** domain of TalentBridge.

**Language:** Go · **Port:** 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/recognition-service/](../../../helm/charts/recognition-service/) — Helm chart
- [manifests/experience/recognition-service/](../../../manifests/experience/recognition-service/) — Raw K8s manifests
