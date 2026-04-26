# policy-service

Service in the **compliance** domain of TalentBridge.

**Language:** Go · **Port:** 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/policy-service/](../../../helm/charts/policy-service/) — Helm chart
- [manifests/compliance/policy-service/](../../../manifests/compliance/policy-service/) — Raw K8s manifests
