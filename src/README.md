# src/

Backend services for TalentBridge — 17 business domains, 88 microservices.

| Domain | Sub-folder | Languages |
|---|---|---|
| Platform | `platform/` | Go |
| Core HR | `core-hr/` | Java/Spring |
| Recruitment | `recruitment/` | Java/Spring |
| Onboarding | `onboarding/` | Java + Rust + Go + Node |
| Payroll | `payroll/` | Java/Spring (BigDecimal money) |
| Time & Attendance | `time/` | Kotlin/Spring |
| Performance | `performance/` | Kotlin/Spring |
| Learning | `learning/` | Kotlin/Spring |
| Compensation | `compensation/` | Java/Spring |
| Workforce Planning | `workforce-planning/` | Python |
| Experience | `experience/` | Node.js |
| Offboarding | `offboarding/` | Java + Node |
| Compliance | `compliance/` | Java/Spring |
| Occupational Health | `occupational-health/` | Java/Spring (HL7) |
| Analytics | `analytics/` | Python |
| Integrations | `integrations/` | Go + Rust |
| Identity | `identity/` | Rust + Go + Kotlin |
| Notifications | `notifications/` | Go + Node |
| Audit | `audit/` | Go |

Every service ships:
- `Dockerfile` — distroless / slim base, non-root user
- `Makefile` — build, test, run, docker-build
- `.env.example` — local config template
- `README.md` — service overview + endpoints
- `/healthz` — liveness/readiness
- `/metrics` — Prometheus

See [../CLAUDE.md](../CLAUDE.md) for language rules and behaviour guidelines.
