# knowledge-transfer

Service in the **offboarding** domain of TalentBridge.

**Language:** Go · **Port:** 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/knowledge-transfer/](../../../helm/charts/knowledge-transfer/) — Helm chart
- [manifests/offboarding/knowledge-transfer/](../../../manifests/offboarding/knowledge-transfer/) — Raw K8s manifests
