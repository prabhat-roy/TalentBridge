# AI_PLAN.md — TalentBridge (Human Capital Management Platform)

> Hierarchical AI/ML strategy. Reuses the Paperclip / OpenClaw / NemoClaw
> agent platform first defined in [ShopOS/AI.md](../ShopOS/AI.md). This file
> is the TalentBridge-specific specialisation.

---

## 1. Why AI in TalentBridge

HCM is the most fairness-sensitive AI domain we ship. EU AI Act lists HR
use cases as **high-risk**. Every AI surface here is human-in-the-loop,
bias-audited, and explainable.

- **CV / résumé NLP** — extract skills, education, experience; suggest
  matches without making the final hire decision.
- **Attrition + flight-risk prediction** — early intervention.
- **Pay-equity analytics** — k-anonymised, regulator-ready.
- **Performance review summarisation** — manager-assist, not auto-write.
- **Skills inference + learning recommendations** — internal mobility.
- **Multilingual employee chatbot** — leave, payroll, policy.

Country-specific labour laws + GDPR + CCPA + EU AI Act high-risk register
+ SOC 2 + ISO 27001 + cross-border data-residency are all binding.

---

## 2. Domain-Specific AI/ML Use Cases

| # | Use case | Domain | Model class | Latency budget |
|---|----------|--------|-------------|----------------|
| 1 | CV / résumé parsing + skill extraction | recruitment | Donut + LayoutLMv3 + Llama 3.1 70B + skill-KG | <3 s/CV |
| 2 | Job-CV match scoring (assist, not decide) | recruitment | Two-tower + LightGBM + LLM rationale + bias audit | <500 ms |
| 3 | Attrition / flight-risk prediction | analytics, retention | LightGBM + survival GBM + SHAP | nightly |
| 4 | Pay-equity / DEI analytics | analytics, comp | k-anonymised statistical models + LLM commentary | quarterly |
| 5 | Performance-review summarisation | performance | Llama 3.1 70B + grounding on 360 inputs | <5 s |
| 6 | Skills inference from career history | learning, mobility | Skill-KG + transformer skill extractor | <500 ms |
| 7 | Course / learning recommendations | learning | Two-tower retrieval + uplift | <100 ms |
| 8 | Employee chatbot (leave, payroll, policy) | experience | Llama 3.1 70B + RAG over policies + rule-engine | <1.5 s |
| 9 | Onboarding-document AI (passport, work permit) | onboarding | Donut + LayoutLMv3 + face match | <3 s |
| 10 | Engagement / NPS / sentiment analysis on surveys | experience | BERTopic + sentiment + LLM thematic summary | weekly |
| 11 | Anomaly detection on payroll runs | payroll | Isolation Forest + rule engine | per-run |
| 12 | Internal-mobility match | mobility | Two-tower + skill-graph rerank | <500 ms |

---

## 3. Hierarchical Agent Architecture

Reuses **OpenClaw** / **Paperclip** / **NemoClaw** from `ShopOS/AI.md`.

### Tier 0 — Master Architect Agent

`talent-architect` — researches AI tooling, proposes services, on-boards
Tier-1 leads, weekly written report. Read-only on prod.

### Tier 1 — Division Leads (5)

| Agent | Scope |
|-------|-------|
| `talent-dev-lead`        | Backend/frontend service code |
| `talent-devops-lead`     | Helm, GitOps, infra, CI |
| `talent-devsecops-lead`  | OPA, Vault, Cilium, Falco, EU AI Act high-risk register |
| `talent-dataml-lead`     | Feature store, training, drift, fairness, bias audit |
| `talent-platform-lead`   | Cross-cutting (idempotency, saga, outbox) |

### Tier 2 — Specialist Agents

**By language**: Go, Java, Kotlin, Python, Node, Rust, TypeScript.

**By tool**: PostgreSQL, MongoDB, Redis, Elasticsearch, Cassandra,
**Neo4j** (org graph), TimescaleDB, ClickHouse, Kafka, NATS, RabbitMQ,
Vault, Keycloak, OPA, Kyverno, Falco, Cilium, Istio, ArgoCD, Argo
Workflows, Prometheus, Grafana, Loki, Jaeger, OpenTelemetry, MinIO,
Trivy, Cosign, Pulsar, Druid, Camunda, OpenFGA, Wazuh, **Mautic**
(candidate engagement), **Open edX bridge** (learning).

**By service** — one agent per microservice (~185). Owns README,
OpenAPI, tests, CHANGELOG, deps, /healthz.

### Tier 3 — Ephemeral Workers

Spawned for retraining attrition model on monthly data, generating bias-
audit reports, building per-country payroll-anomaly playbooks.

### Lifecycle

Research → Document → Implement → Test → Review → Deploy → Monitor →
Respond → Upgrade → Report. Plus a **fairness-audit gate**: every
recruitment / promotion / pay model has quarterly disparate-impact
analysis (4/5ths rule + EU AI Act conformance).

---

## 4. Separate AI Infrastructure

```
ai-platform/
├── cluster: talent-ai-{aws,gcp,azure}    ← cloud GPU pool, regional sharding
├── namespace: talent-ai-control           ← Paperclip
├── namespace: talent-ai-agents            ← OpenClaw runtime
├── namespace: talent-ai-sandbox           ← NemoClaw — strict HR fairness guardrails
├── namespace: talent-ai-models            ← vLLM, Ollama, LiteLLM, Triton
├── namespace: talent-ai-data              ← Qdrant, Weaviate, MinIO, MLflow
├── namespace: talent-ai-obs               ← Langfuse, Phoenix
└── namespace: talent-ai-pipelines         ← Argo Workflows
```

### Hardware

- **Cloud**: A100 for fine-tunes; A10G/L4 for inference. Region-sharded
  per data-residency rule (EU / UK / US / IN / SG / AU).

### Software stack

Standard self-hosted set. Bias / fairness via **Fairlearn**, **Aequitas**,
**Whylogs** in addition to **Evidently**.

### Data isolation

- Region-strict — EU employee data never leaves EU; same for IN, US,
  AU, SG. Cilium netpol + OPA enforce.
- PII tokenised in any prompt; resume / passport scans encrypted at
  rest (Vault Transit).
- Vector DB sharded per region + per legal entity.

---

## 5. Compliance & Guardrails

| Control | Mechanism |
|---------|-----------|
| EU AI Act (high-risk HR) | Conformance dossier per model; logging, oversight, registry |
| GDPR / CCPA / DPDP | Tokenisation; right-to-erasure; lawful basis recorded |
| Country-specific labour law | Working hours, overtime, leave constraints hard-bounded in models |
| SOC 2 / ISO 27001 | Self-hosted, encrypted, audit-logged |
| 4/5ths rule (US EEOC) | Quarterly disparate-impact audits |
| Pay-equity (UK, EU directives) | k-anonymised; aggregated; no individual identifiable |
| AI never makes final hire / fire / promote | NemoClaw blocks AI from issuing decisions in those flows; only ranks/explains |
| Candidate / employee transparency | Every AI decision affecting an individual is logged + appealable |

---

## 6. Implementation Roadmap

| Month | Milestone |
|-------|-----------|
| 1 | `talent-ai-*` region-sharded cluster up; vLLM Llama 3.1 70B |
| 2 | Paperclip + NemoClaw fairness policies; Tier-0 architect live |
| 3 | Tier-1 leads; CV-parsing v0 shadow |
| 4 | Per-language / per-tool Tier-2 agents |
| 5 | Per-service Tier-2 agents (recruitment → core-hr → payroll first) |
| 6 | Employee chatbot v1 in 6 langs |
| 7 | Attrition v1; pay-equity dashboard v1 |
| 8 | Internal-mobility match v1; multi-region failover drill |

---

## 7. Cost Envelope (target)

- **Cloud infra**: $4,800 – $7,500 / month per primary cloud (region-sharded raises overall)
- **No** subscription LLM spend

---

## 8. Cross-References

- Master AI strategy: [ShopOS/AI.md](../ShopOS/AI.md)
- Same Paperclip/OpenClaw/NemoClaw platform across all 15 sibling projects.
