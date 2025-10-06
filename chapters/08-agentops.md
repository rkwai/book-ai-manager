---
title: "AgentOps — Tool Registry, HITL, and Evals"
subtitle: "Discipline over tools; measure cost, load, and steerability"
author: "Rick Wong"
date: "2025-10-06"
chapter: 8
keywords: ["AgentOps", "tool registry", "HITL", "eval harness", "observability", "tokens", "review time", "steerability", "trainability", "cost per outcome"]
---

# Chapter 8
## AgentOps — Tool Registry, HITL, and Evals

> Tooling is maturing and options change fast. Don't chase a single "best" stack. What matters is that you **use** AgentOps practices and measure:  
> • **Token cost** per task/outcome.  
> • **Human review time** and **escalation load**.  
> • How **steerable/trainable** the agents are via proper **insights & observability**.

---

## Thesis

AgentOps is a **discipline**, not a vendor. Pick a reasonable stack, then get good at three things: **cost**, **load**, and **steerability**. The stack may change; these habits don't.

---

## The Three Non-Negotiables

### 1. Cost
Track **Tokens per Task** and **Cost per Outcome** at p50/p95, broken down by model/tool.

**Why**: Token costs add up fast. If you're not tracking them, you won't know when an agent is burning budget or when a model upgrade saves money.

### 2. Load
Track **Human minutes per accepted outcome**, **Escalation Rate**, and **Correction Rate**.

**Why**: Agents that require constant human intervention aren't saving time—they're creating busywork.

### 3. Steerability
Track **Observability Coverage** (events traced), **Feedback Loop Uptime** (HITL to training), and **Config Lead Time** (PR→prod for guardrails/thresholds).

**Why**: If you can't see what an agent is doing, you can't improve it. If you can't change its behavior quickly, you can't respond to incidents or drift.

> Promote/demote agents based on **evidence**: cost ↓, load ↓, steerability ↑ while success/safety stay green.

---

## Tool / Agent Registry (what to record)

Keep a versioned, PR-based registry. Any format works (YAML/JSON in Git, DB with an API).

```yaml
capability: import-triage
type: agent
version: 1.7.3
owner: activation-team
purpose: classify CSV import errors; propose fixes; escalate per policy
will_do:
  - classify_errors
  - open_prs_in_module_X
wont_do:
  - modify_ci_config
autonomy_level: 3              # scenario-auto
permissions:
  - repo:read:services/importer/*
  - repo:write:services/importer/module_X
  - logs:read:importer
interfaces:
  input: import_error_event_v3
  output: triage_decision_v2
context_packs:
  - import-triage-v3   # TTL 30d, owner activation-team
acceptance_tests:
  - accuracy >= 95%
  - false_page_rate <= 5%
policy_tests:
  - pii_redaction_v3
  - secret_scan_v2
observability:
  traces: enabled
  dashboards: [/dash/onboarding/import-triage]
  scorecard: /scorecards/import-triage
economics:
  token_budget_usd_p95: 0.02
  latency_p95_ms: 800
governance:
  change_control: PR + security review
  audit_cadence: monthly
  deprecation_policy: 60d notice with fixtures
changelog:
  - 2025-08-22 add edge cases; bump acceptance to 95%
```

### Governance Rules (minimal)

- **Add/Change** via PR; **security/data** review for scopes and policy tests.
- Each entry has **one accountable owner**; on-call listed.
- **Deprecations** include fixtures and migration notes; consumers pin versions.

---

## HITL Policy (defaults you can adopt)

**Gates exist at**: customer-visible surfaces, irreversible ops, schema migrations, policy test changes, new tools/permissions.

**Approval**: KR owner (business) + Agent owner (technical).

**Demotion rule**: Any Sev1, safety failure, or sustained drift triggers **immediate demotion** one level; stabilize before reconsidering.

**Graduation**: AAR ≥ 0.90, ER ≤ 0.05, CR ≤ 0.05 for 4 consecutive weeks **and** safety ≥ 0.99.

### HITL Log (what to keep)

- Reason taxonomy (uncertainty, tool error, policy, novelty, performance, cost).
- Minutes spent; outcome accepted/rejected; follow-ups created.
- These power **load** metrics and training loops.

---

## Eval Harness (must-haves)

### Components

- **Golden datasets** with fixtures representative of production; owner & update cadence.
- **Drift detection** against baselines; alerts when delta exceeds threshold.
- **Safety/Policy tests** (PII, secrets, prompt/response constraints).
- **Latency & cost** checks as part of the test suite (fail the build if p95 or cost exceeds caps).
- **Red-team & adversarial** examples for critical surfaces.
- **CI integration** so evals run on PRs and nightly.

### Example Configuration

```yaml
eval_suite: import-triage
datasets:
  - name: golden-v2
    size: 500
    taxonomy: [E1, E2, E3]
thresholds:
  accuracy: ">= 95%"
  false_page_rate: "<= 5%"
  safety_pass: ">= 99%"
  latency_p95_ms: "<= 800"
  token_cost_p95_usd: "<= 0.02"
drift_alert: "delta_accuracy > 0.02 rolling_14d"
ci: ["pr", "nightly"]
```

---

## Dashboards (what leaders need to see)

### Per-Agent Card

- Tokens per task p50/p95
- Cost per outcome
- AAR / ER / CR
- Latency p95
- Safety pass % / Drift %
- Top escalation reasons (last 7 days)
- Version + last change; owner; autonomy level

### Portfolio Roll-Up

- Accepted outcomes per $ (AOPD)
- Cost & latency outliers
- Agents up for promotion/demotion
- Incident & audit status
- Budget burn vs. plan

---

## Put Numbers on the Three Non-Negotiables

### Cost

**TpT** (tokens per task): median and p95; by model/tool.

**CPO** (cost per outcome): include eval + ops, not just inference.

**Formula**: CPO = (Inference + Context + Tools + Evals + Ops) / Accepted_Outcomes

**Why track ops/eval costs**: Many teams only track inference costs and are shocked when the "cheap" agent has expensive eval/ops overhead.

### Load

**HMPAO** (human minutes per accepted outcome).

**ER/CR** (escalation/correction rates).

**After-hours pages** (fatigue proxy).

**Why this matters**: An agent with high AAR but high ER is still creating toil. You want both low.

### Steerability

**Observability coverage**: % of required events traced.

**Feedback loop uptime**: hours per week HITL→training pipeline is healthy.

**Config lead time**: median minutes from guardrail/threshold PR → prod.

**Why this matters**: If you can't see what's happening or change behavior quickly, you're flying blind during incidents.

---

## Quick Start (Day-1 AgentOps, any stack)

1. Create a **registry repo** and add your first entries.
2. Instrument **tokens, latency, acceptance, HITL**, and **cost**.
3. Stand up **scorecards + dashboards**; define promotion/demotion thresholds.
4. Add **policy & eval** tests to CI; gate merges on thresholds.
5. Schedule a **weekly AgentOps** review; publish decisions to the decision log.

---

## Anti-Patterns

### Tool Shopping Instead of Operating
Spending months evaluating vendors instead of running agents and learning from data.

### Measuring Tokens but Not HMPAO and Steerability
Optimizing for token cost while ignoring human toil is a local maximum.

### Global, Non-Expiring Permissions
Shared "bot" accounts make it impossible to trace actions and create audit gaps.

### No Registry, No Owners, No Audits
"We have 47 agents running. I think. Not sure who owns them." This is a recipe for incidents.

### Ignoring Ops/Eval Costs in CPO
Tracking only inference costs creates a false sense of efficiency.

---

## Summary

AgentOps excellence isn't about picking the perfect platform. It's about **running the loop**—track **cost**, **load**, and **steerability**; keep a clear **registry**; enforce **HITL** and **evals** in CI; and make promotion/demotion decisions by evidence.

Do this and any decent stack will look great. Skip this and even the best stack will look like chaos.

**The discipline is portable. The tools are not. Invest in the discipline.**

---

## Change Log

- **2025-10-06**: New chapter—practical registry schema, HITL defaults, eval harness, dashboards, and the cost/load/steerability triad.

