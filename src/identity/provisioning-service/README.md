# provisioning-service

Service in the **identity** domain of TalentBridge.

**Language:** Go · **Port:** 50024

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/provisioning-service/](../../../helm/charts/provisioning-service/) — Helm chart
- [manifests/identity/provisioning-service/](../../../manifests/identity/provisioning-service/) — Raw K8s manifests
