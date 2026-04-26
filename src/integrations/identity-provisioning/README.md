# identity-provisioning

Service in the **integrations** domain of TalentBridge.

**Language:** Go · **Port:** 50322

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/identity-provisioning/](../../../helm/charts/identity-provisioning/) — Helm chart
- [manifests/integrations/identity-provisioning/](../../../manifests/integrations/identity-provisioning/) — Raw K8s manifests
