# ethics-service

Service in the **compliance** domain of TalentBridge.

**Language:** Go · **Port:** 50264

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ethics-service/](../../../helm/charts/ethics-service/) — Helm chart
- [manifests/compliance/ethics-service/](../../../manifests/compliance/ethics-service/) — Raw K8s manifests
