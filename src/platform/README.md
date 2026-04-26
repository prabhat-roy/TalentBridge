# platform domain

Edge / BFF layer for TalentBridge — gateway, BFFs per audience, GraphQL federation.

| Service | Language | Port | Description |
|---|---|---|---|
| api-gateway | Go | 50000 | HTTP+gRPC ingress, OAuth2/SAML, mTLS, rate limit, WAF |
| employee-bff | Go | 50001 | Employee self-service BFF |
| manager-bff | Go | 50002 | Manager dashboard BFF |
| hr-admin-bff | Go | 50003 | HR admin portal BFF |
| graphql-gateway | Go | 50004 | Federated GraphQL gateway |
