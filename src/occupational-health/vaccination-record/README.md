# vaccination-record

Service in the **occupational-health** domain of TalentBridge.

**Language:** Go · **Port:** 50283

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/vaccination-record/](../../../helm/charts/vaccination-record/) — Helm chart
- [manifests/occupational-health/vaccination-record/](../../../manifests/occupational-health/vaccination-record/) — Raw K8s manifests
