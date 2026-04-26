# job-posting

Service in the **recruitment** domain of TalentBridge.

**Language:** Go · **Port:** 50060

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/job-posting/](../../../helm/charts/job-posting/) — Helm chart
- [manifests/recruitment/job-posting/](../../../manifests/recruitment/job-posting/) — Raw K8s manifests
