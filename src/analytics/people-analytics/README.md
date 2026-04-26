# people-analytics

Service in the **analytics** domain of TalentBridge.

**Language:** Go · **Port:** 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/people-analytics/](../../../helm/charts/people-analytics/) — Helm chart
- [manifests/analytics/people-analytics/](../../../manifests/analytics/people-analytics/) — Raw K8s manifests
