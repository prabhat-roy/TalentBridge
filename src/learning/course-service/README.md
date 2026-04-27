# course-service

Service in the learning domain of TalentBridge.

Language: Go Â· Port: 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/course-service/](../../../helm/charts/course-service/) â€” Helm chart
- [manifests/learning/course-service/](../../../manifests/learning/course-service/) â€” Raw K8s manifests
