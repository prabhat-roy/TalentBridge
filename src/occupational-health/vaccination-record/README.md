# vaccination-record

Service in the occupational-health domain of TalentBridge.

Language: Go Â· Port: 50283

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/vaccination-record/](../../../helm/charts/vaccination-record/) â€” Helm chart
- [manifests/occupational-health/vaccination-record/](../../../manifests/occupational-health/vaccination-record/) â€” Raw K8s manifests
