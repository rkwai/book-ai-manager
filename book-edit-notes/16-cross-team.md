---
title: "Cross‑Team Collaboration in the Agent Era (Federation & Contracts)"
subtitle: "APIs and operating contracts over meetings"
author: "Rick Wong"
date: "2025-10-06"
slug: "16-cross-team"
keywords: ["cross-team","federation","contracts","ICD","context packs","MCP registry","RACI","on-call","policy tests"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (response)**  
> Cross‑team collaboration now **must** account for AI agents. If teams aren’t working effectively **with agents**, they aren’t working effectively—period.

## Thesis
Cross‑team collaboration = **contracts + federation + observability**. Meetings are secondary. Teams publish **interfaces** and **Context Packs**, register their agents in a shared **tool/agent registry**, and coordinate via **policy‑tested** handshakes. Humans own outcomes; agents execute and exchange work through **versioned contracts**.

---

## Operating Model (Federation)
- **Team autonomy**: Each team owns its **human outcomes** and **agent portfolio** (design briefs, evals, runbooks).  
- **Registry first**: Capabilities are discoverable via an **MCP‑style tool/agent registry** (name, scope, owners, permissions, versions).  
- **Producer ↔ Consumer**: Every cross‑team interaction is a **contract** with fixtures and policy tests.  
- **Orchestrator**: Either a human initiative owner or a thin orchestration agent coordinates multi‑team flows—no “god orchestrators.”  
- **One owner**: Each interface and agent has a single accountable owner (RACI).

---

## Cross‑Team Contracts (Minimum Set)
1. **Interface Control Document (ICD)** — API/Events, schemas, error taxonomy, SLOs.  
2. **Security & Data** — PII classes, retention, masking rules, key management.  
3. **Policy Tests** — redaction/secret scans, prompt/response constraints, model/tool allowlists.  
4. **Context Packs** — versioned knowledge needed by consumers; TTL + freshness policy.  
5. **Acceptance Tests** — golden fixtures and pass thresholds for integration.  
6. **Runbooks & On‑call** — escalation paths, change windows, rollback steps.  
7. **Cost & Rate Limits** — unit economics, quotas, back‑pressure behavior.

---

## Patterns for Agent‑Aware Collaboration
### 1) Contract‑First Handoff
- Producer publishes ICD + fixtures.  
- Consumer agents run **pre‑integration policy/acceptance tests** in CI.  
- No meetings unless tests fail.

### 2) Shared Context Packs
- Canonical packs (e.g., **Auth**, **Billing**, **PII policy**) live in a **shared repo** with owners and TTL.  
- Packs are **immutable by version**; teams opt‑in to upgrades.

### 3) Federation Registry Entry
- Every agent capability is **registered** with name, scope, **will/won’t do**, autonomy level, owners, and endpoints.  
- Discoverable by other teams; changes announce on a channel with diffs.

### 4) Joint PIRs (when needed)
- Cross‑team incidents trigger a **joint** post‑incident review; actions land in both teams’ runbooks and policy tests.

---

## Failure Modes (and Fixes)
- **Hidden dependencies** → Enforce registry usage; all cross‑team calls go through registered capabilities only.  
- **Permission sprawl** → Least privilege; rotate credentials; per‑agent identities; automated audits.  
- **Contract drift** → Contract tests in CI; consumers pin versions; producers provide deprecation schedules.  
- **Metric conflicts** → Align to **company OKRs**; declare shared KRs for joint surfaces.  
- **Orphaned ownership** → RACI on each ICD/agent; “one owner” rule.  
- **Chat‑as‑API** → Ban free‑form Slack/DM flows for production tasks; require registered endpoints.

---

## Metrics that Prove Collaboration
- **Contract change success rate**: green rollouts / total changes.  
- **Cross‑team incident MTTR** and **reopen rate**.  
- **Breaking‑change count**: zero is the bar.  
- **Context freshness index** for shared packs.  
- **Registry coverage**: % cross‑team calls via registered capabilities.  
- **Time‑to‑adopt** a new version (p50/p95).

---

## Templates (Drop‑in)

### Interface Control Document (ICD)
```yaml
name: payments.charge.v2
owner: payments-team
consumers: [checkout, fraud]
sla:
  availability: "99.95%"
  p95_latency_ms: 300
schema:
  request: charge_request_v2.json
  response: charge_response_v2.json
errors:
  taxonomy: [AUTH_FAILED, INSUFFICIENT_FUNDS, RATE_LIMIT, PII_BLOCKED]
policy_tests:
  - pii_redaction_v3
  - secret_scan_v2
acceptance_tests:
  fixtures_repo: git://org/fixtures/payments-v2
  pass_thresholds:
    success_rate: ">= 0.99"
    regression_delta: "<= 0.5%"
context_packs:
  - billing-core-v4   # TTL 60d, owner: platform
rate_limits:
  rps: 200
  burst: 400
on_call:
  primary: "#oncall-payments"
  escalation: "pagerduty:payments"
deprecation:
  replaces: payments.charge.v1
  sunset_date: 2026-03-31
```

### Federation Registry (Agent Capability)
```yaml
capability: fraud-screen.v1
type: agent
owner: fraud-team
will_do:
  - score_transaction
  - request_additional_context
wont_do:
  - final_decline_decisions
scope:
  autonomy_level: 3
  permissions: ["read:transactions", "write:flags"]
interfaces:
  input: transaction_event_v1
  output: fraud_score_v1
endpoints:
  grpc: fraud.agent.svc:443
  events: kafka://fraud.score
observability:
  traces: enabled
  scorecard: /dash/fraud-screen
```

### Cross‑Team RACI (Snippet)
```
Interface: payments.charge.v2
R: Payments Team (owner)
A: Platform EM
C: Checkout, Fraud, Security
I: Finance
```

---

## Example (Anonymized)
**Checkout** needs a pre‑auth fraud score before capture.  
- **Fraud team** publishes `fraud-screen.v1` with fixtures/policy tests.  
- **Checkout team**’s orchestrator agent calls it in‑flow; contract tests run in CI.  
- An incident reveals drift in country rules → **joint PIR** adds a **policy test** and bumps context pack `billing-core` to v4 with TTL 60d.  
- Metrics: breaking changes 0, MTTR 22m, version adoption p95 4 days.

---

## Anti‑Patterns
- “Just ping our bot on Slack” as an integration strategy.  
- Orchestration agents with **global** permissions.  
- Shared context with **no TTL** or owner.  
- Undocumented **manual fixes** that bypass contracts.  
- Cross‑team negotiations by slide deck instead of **ICDs and tests**.

---

## Summary
Modern collaboration is **federated and testable**: teams expose **versioned contracts**, register **agent capabilities**, share **Context Packs**, and tie changes to **policy/acceptance tests**. Humans own the outcomes; agents do the busywork—reliably—because the collaboration surface is code and contracts, not meetings.

## Change Log
- 2025-10-06: New chapter—federation model, contracts, registry entries, failure modes, metrics, templates, and a concrete example.
