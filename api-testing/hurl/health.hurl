# Health check for all critical services
GET https://talentbridge.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"

GET https://api.talentbridge.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"
