# ethics-service

Service in the compliance domain of TalentBridge.

Language: Go Â· Port: 50264

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ethics-service/](../../../helm/charts/ethics-service/) â€” Helm chart
- [manifests/compliance/ethics-service/](../../../manifests/compliance/ethics-service/) â€” Raw K8s manifests
