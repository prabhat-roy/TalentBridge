# TalentBridge — Enterprise Human Capital Management Platform

Enterprise-grade, cloud-native Human Capital Management (HCM) platform built on open source
technologies. Covers the full employee lifecycle — talent acquisition, onboarding, core HR,
payroll, time & attendance, performance management, learning & development, workforce planning,
and employee experience — designed for large enterprises, global corporations, and staffing firms
managing workforces across multiple countries and legal jurisdictions.

---

## Overview

| Attribute         | Value                                                              |
|-------------------|--------------------------------------------------------------------|
| Type              | HCM · Payroll · Talent Acquisition · Workforce Management · HRIS   |
| Domains           | 17 business domains                                                |
| Services          | 185+ microservices                                                 |
| Languages         | Go, Java, Kotlin, Python, Node.js, TypeScript, Rust                |
| Standards         | HR-XML, PEPPOL (payroll), HL7 (occupational health), OpenHR        |
| Compliance        | GDPR, CCPA, SOC 2 Type II, ISO 27001, country-specific labour laws |
| Databases         | PostgreSQL, MongoDB, Redis, Elasticsearch, Cassandra, Neo4j        |
| Message Broker    | Apache Kafka, RabbitMQ, NATS JetStream                             |
| Cloud             | AWS (primary), Azure (secondary)                                   |
| Orchestration     | Kubernetes (EKS / AKS) — multi-region for data residency           |
| Frontend          | React (employee self-service), Angular (HR admin portal), Next.js (manager dashboard), Flutter (mobile) |

---

## Business Domains

| # | Domain                    | Key Services                                                           |
|---|---------------------------|------------------------------------------------------------------------|
| 1 | Core HR                   | employee-service, organisation-service, position-service, job-service  |
| 2 | Talent Acquisition        | job-posting, applicant-tracking, interview-service, offer-service, referral |
| 3 | Onboarding                | onboarding-service, document-service, equipment-provisioning, buddy    |
| 4 | Payroll                   | payroll-service, salary-service, tax-service, deduction, disbursement  |
| 5 | Time & Attendance         | attendance-service, shift-service, leave-service, overtime, timesheet  |
| 6 | Performance Management    | goal-service, review-service, feedback-service, calibration, okr       |
| 7 | Learning & Development    | lms-service, course-service, certification, skill-service, iDP         |
| 8 | Compensation & Benefits   | compensation-service, benefit-service, equity-service, total-reward    |
| 9 | Workforce Planning        | headcount-service, forecast-service, succession, org-design            |
| 10 | Employee Experience       | engagement-service, survey-service, recognition, wellbeing, nps        |
| 11 | Offboarding               | exit-service, clearance, knowledge-transfer, alumni                    |
| 12 | Compliance & Legal        | labour-compliance, visa-service, policy-service, grievance, ethics     |
| 13 | Occupational Health       | health-service, incident-service, ergonomic, vaccination-record        |
| 14 | Analytics & AI            | people-analytics, attrition-predictor, diversity-analytics, pay-equity |
| 15 | Integrations              | erp-integration, finance-integration, identity-provisioning, background|
| 16 | Identity & Access         | auth-service, employee-sso, mfa, rbac-service, provisioning-service    |
| 17 | Platform                  | api-gateway, employee-bff, manager-bff, hr-admin-bff, graphql-gateway  |

---

## Architecture

```
    ┌──────────────────────────────────────────────────────────────────┐
    │                        API Gateway                               │
    │           (OAuth2 · SAML · mTLS · Rate Limit · WAF)             │
    └────┬──────────────┬──────────────┬────────────────┬──────────────┘
         │              │              │                │
  ┌──────▼──┐    ┌──────▼──┐   ┌──────▼──┐     ┌──────▼──┐
  │Employee │    │Manager  │   │  HR     │     │Recruiter│
  │Self-Svc │    │Dashboard│   │  Admin  │     │  Portal │
  │(React)  │    │(Next.js)│   │(Angular)│     │(React)  │
  └──────┬──┘    └──────┬──┘   └──────┬──┘     └──────┬──┘
         └──────────────┴──────────────┴────────────────┘
                                │ gRPC (Istio mTLS)
    ┌───────────────────────────▼────────────────────────────────────┐
    │                Internal gRPC Mesh (Istio mTLS)                 │
    │  ┌──────────┐  ┌────────────┐  ┌────────────┐  ┌────────────┐  │
    │  │  Core HR │  │  Payroll   │  │  Talent    │  │  People    │  │
    │  │ Services │  │  Services  │  │Acquisition │  │ Analytics  │  │
    │  └──────────┘  └────────────┘  └────────────┘  └────────────┘  │
    └──────────────────────┬─────────────────────────────────────────┘
                           │ Kafka (HR Events)
                  ┌────────▼────────────────────┐
                  │     Event Bus               │
                  │  employee.hired             │
                  │  employee.terminated        │
                  │  payroll.processed          │
                  │  leave.approved             │
                  └────────┬────────────────────┘
                           │
       ┌───────────────────▼────────────────────────┐
       │           People Analytics Platform        │
       │  ClickHouse · Airflow · Superset · Neo4j   │
       └─────────────────────────────────────────────┘
```

---

## Tech Stack

### HR Standards & Integrations
- **HR-XML**: Standard data exchange format for HR data (employee records, payroll, benefits) with ERP systems
- **PEPPOL**: e-invoicing and payroll compliance for EU jurisdictions (PEPPOL BIS Payroll)
- **OpenHR / OpenAPI**: RESTful API design for HRIS integrations (ADP, SAP SuccessFactors, Workday-compatible)
- **SAML 2.0 / OIDC**: Enterprise SSO federation (Active Directory, Azure AD, Okta, Google Workspace)
- **Background Verification APIs**: Integration with HireRight, Sterling, First Advantage for background checks

### Infrastructure
- **Kubernetes**: EKS (primary) + AKS (EU — data residency for GDPR)
- **Data Residency**: Employee PII stored in region of employment (EU data in eu-west-1, India data in ap-south-1) — enforced via PostgreSQL row-level security + OPA policies
- **Document Vault**: Encrypted MinIO (employment contracts, offer letters, payslips) — AES-256 at rest
- **Graph DB**: Neo4j — org chart traversal, succession planning, reporting line analytics
- **Search**: Elasticsearch (talent search across 100K+ candidate profiles, skill search)

### CI/CD & GitOps
- **CI**: Jenkins (primary), GitHub Actions, GitLab CI
- **CD**: ArgoCD (App-of-Apps), Argo Rollouts (canary — payroll services use blue-green only)
- **IaC**: Terraform (EKS/AKS + multi-region data residency setup), Crossplane, Ansible
- **Secrets**: HashiCorp Vault (payroll encryption keys, signing keys for payslips)

### Observability
- **Metrics**: Prometheus + Grafana (payroll run duration, ATS pipeline conversion rates, SLOs)
- **Logs**: Loki + Fluent Bit (employee PII masked — GDPR compliance)
- **Traces**: Jaeger + OpenTelemetry (trace payroll calculation end-to-end — audit requirement)
- **People Analytics**: Apache Superset dashboards — headcount, attrition, DEI metrics, pay equity
- **SLOs**: Payroll processing completion 100% on paydate, ATS response < 500ms (P95)

### Security (GDPR / SOC 2)
- **Identity**: Keycloak (employee SSO + SAML federation with enterprise IdP), MFA mandatory for HR admins
- **Data Classification**: Employee PII tagged at field level — access controlled by role, not just service
- **Payroll Security**: Payslips signed with HSM-backed key; only the employee can decrypt (E2E encryption)
- **Network**: Cilium eBPF, Istio mTLS, Coraza WAF
- **Scanning**: Trivy, Semgrep (PII handling rules), OWASP ZAP, SonarQube
- **Policy**: OPA/Gatekeeper (enforce data residency rules), Kyverno, Falco (detect bulk PII export)
- **Right to Erasure**: Automated GDPR erasure workflow — anonymises employee data 7 years post-termination (legal retention period)

### AI / ML (People Intelligence)
- **Attrition Prediction**: ML model (Gradient Boosting) — predicts 90-day attrition risk per employee; triggers manager alert
- **Resume Screening**: NLP (BERT fine-tuned on job descriptions) — ranked candidate shortlisting, bias detection
- **Pay Equity Analysis**: Statistical model — detects unexplained pay gaps by gender, ethnicity, age across job families
- **Skill Gap Analysis**: Graph-based skill matching (Neo4j) — maps current workforce skills to future job requirements
- **Workforce Planning**: Time-series forecasting (Prophet) — headcount demand by department, function, geography
- **Performance Calibration**: ML-assisted bell curve detection — flags potential bias in manager rating distributions
- **Engagement Sentiment**: NLP on pulse survey free-text — multi-language sentiment analysis and topic modelling

---

## Key Design Decisions

1. **Multi-jurisdiction payroll engine**: Payroll rules (tax, statutory deductions, compliance) are configuration-driven per country — adding a new country requires only a rules config, not code changes
2. **Blue-green only for payroll**: A failed payroll run cannot be partially rolled back — blue-green with manual promotion gate, full dry-run required before go-live
3. **Data residency by design**: Employee PII never crosses legal jurisdiction — enforced at database level (PostgreSQL row-level security) + API level (OPA policy)
4. **Org chart as a graph**: Reporting lines, dotted lines, matrix management, and cost centre relationships modelled in Neo4j — enables complex hierarchy queries that are impossible in relational DB
5. **Event-driven provisioning**: `employee.hired` Kafka event triggers automatic IT provisioning (Active Directory account, email, equipment request, badge) — HR action triggers all downstream automatically
6. **Payslip E2E encryption**: Payslips encrypted with employee's public key — HR admin can trigger generation but cannot read employee payslip — privacy by design
7. **Anonymous pulse surveys**: Survey responses stored without employee identifier — k-anonymity enforced (minimum group size 5) to prevent identification from responses

---

## Global Payroll Coverage

| Region          | Statutory Compliance                                             |
|-----------------|------------------------------------------------------------------|
| India           | PF, ESI, PT, TDS, Gratuity, Bonus Act, LWF                      |
| USA             | Federal + State income tax, FICA, FUTA, SUTA, ACA               |
| UK              | PAYE, NIC, Auto-enrolment pension, P60/P45 generation            |
| EU              | GDPR payroll data rules, country-specific social security        |
| UAE             | WPS (Wage Protection System), DEWS/DIFC end-of-service benefit   |
| Singapore       | CPF, SDL, NSman Make-Up Pay                                      |

---

## Status

- [ ] Architecture design & HR data model (org, position, employee)
- [ ] Service registry & proto definitions
- [ ] Multi-jurisdiction payroll engine (rules engine)
- [ ] ATS (Applicant Tracking System) core
- [ ] Service skeletons (healthz, metrics, graceful shutdown)
- [ ] Docker Compose (local dev stack)
- [ ] Helm charts (per-service)
- [ ] CI/CD pipelines
- [ ] GitOps (ArgoCD)
- [ ] GDPR compliance controls (data residency, erasure workflow)
- [ ] People analytics AI (attrition, pay equity, skill gap)
