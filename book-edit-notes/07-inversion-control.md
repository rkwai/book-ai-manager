---
title: "Inversion of Control & Agent Autonomy"
subtitle: "Agent Management Edition"
author: "Rick Wong"
date: "2025-10-06"
slug: "07-inversion-control"
keywords: ["inversion of control","servant leadership","autonomy","sub‑agents","context scoping","least privilege","policy tests","acceptance tests"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (responses)**  
> • IoC = servant leadership applied to systems: the larger module (org) specifies *what* is needed; smaller modules (teams/agents) decide *how*.  
> • Autonomy rises when goals cascade (company → department → individual). Danger: too many layers → abstraction drift; lose sight of purpose.  
> • For agents and sub‑agents: **right context beats more context**; specialization, tools, and focus matter more than flooding with info.

## Inversion of Control (IoC), Plain and Technical
**Plain**: The organization states the **goal** and **constraints**; teams and individuals decide **how** to achieve it.  
**Technical**: A higher‑level component publishes **interfaces and contracts**; lower‑level components provide the **implementation**.

In leadership, IoC is simply **servant leadership** turned into **operating contracts**: leaders supply purpose, context, constraints, and resources—then **get out of the way**.

## Why IoC (Now with Agents)
- **Autonomy scales**: Teams and agents choose tactics, tools, and processes within clear boundaries.  
- **Throughput increases**: Fewer central choke points; more parallel progress.  
- **Fit‑for‑purpose**: Sub‑agents specialize, improving quality and reliability.  
- **Focus on the right problem**: Leaders define **what** and **why**, not micromanage **how**.

> **Risk**: IoC becomes **abstraction drift** if the *why/context* is opaque. Remedy: **transparency by default**.

## Goal Cascade (Company → Department → Individual/Agent)
```
Company Goal: Grow ARR +25% with NRR ≥115% (SLO: support p95 response < 2m)
  └─ Dept Goal (Product): Reduce onboarding time from 2 days → 2 hours (Task success ≥95%)
      └─ Team Goal (Activation): Ship self‑serve import with agent triage (cost p95 ≤ $0.05/task)
          └─ Individual Goal: Acceptance tests for top 5 CSV edge cases (pass ≥98%)
          └─ Agent Goal: Triage import errors; propose fixes; escalate per runbook (false‑page ≤5%)
```

## Context: Less but Right
Agents, like humans, have **limited working context**. More isn’t better; **relevant and fresh** wins.  
**Provide**: domain docs (C4 at the right granularity), current configs, small task‑specific KBs, API contracts, acceptance criteria, policy tests.  
**Withhold**: unrelated systems, stale docs, ambiguous goals, or conflicting success metrics.

**Pattern**: *Context Packs*  
- *Pack name*: Import‑Triage‑v3  
- *Contains*: C4 (component level), error taxonomy, top 10 edge cases, acceptance tests, rollback runbook, tool scopes.  
- *TTL*: 30 days; auto‑refresh from source of truth; diff review required.

## Autonomy Ladder (IoC Applied to Agents)
1. **Draft‑only (HITL on everything)**  
   - Output: comments/suggestions, never writes.  
   - Gate: owner approves each action.  
   - Metrics: success rate on small tasks; false‑positive pages.
2. **Suggest‑PR (HITL on merge)**  
   - Output: PRs with tests; can trigger CI.  
   - Gate: reviewer merges; rollbacks documented.  
   - Metrics: PR acceptance rate; rework rate; test coverage deltas.
3. **Scenario‑Auto (HITL on exceptions)**  
   - Output: auto‑merges within **whitelisted scenarios**; escalates anomalies.  
   - Gate: policy tests in CI; anomaly triggers page.  
   - Metrics: error budget burn; cost/latency SLOs; exception rate.
4. **Metric‑Auto (Policy‑gated)**  
   - Output: autonomous changes while **metrics ≥ thresholds**; auto‑rollback on regressions.  
   - Gate: continuous policy tests; audit trail; periodic human audit.  
   - Metrics: long‑horizon stability; audit pass rate; MTTR for rollbacks.

**Promotion/Demotion Triggers**  
- **Promote**: 4+ weeks at target success with low exceptions; clean audits.  
- **Demote**: breach of safety policy; drift beyond thresholds; repeated false‑pages; owner revokes scope.

## Guardrails & Permissions
- **Least privilege**: Minimal API/tool scopes; rotate keys; per‑agent identities.  
- **Policy tests**: PII redaction, secret scanning, prompt/response rules.  
- **Rate/Cost limits**: p95 ceilings; back‑off and queue.  
- **Will/Won’t Do**: explicit list; link to escalation/owner.  
- **Observability**: traces, versions, inputs/outputs stored with retention policy.

## Concrete Examples (IoC in Practice)
**Codegen PR Copilot** (Level 2: Suggest‑PR)  
- **Goal**: Improve test coverage for module X by +8%.  
- **Context Pack**: C4 (component), style guide, coverage report, flaky tests list.  
- **Acceptance**: All new tests pass; coverage +≥8%; no lint violations.  
- **Guardrails**: Read/write limited to module X; cannot merge; cannot touch CI config.

**Triage Bot (Slack + Observability)** (Level 3: Scenario‑Auto)  
- **Goal**: Reduce time‑to‑first‑action on Sev2 incidents to <15m.  
- **Context Pack**: runbook, error taxonomy, dashboards.  
- **Acceptance**: Correct classification ≥95%; escalation ≤5%; cost p95 ≤ $0.02/event.  
- **Guardrails**: Can annotate tickets and run safe remediation scripts; must escalate for irreversible steps.

**Analytics Agent** (Level 1→2: Graduating)  
- **Goal**: Weekly insights on adoption funnels; propose fixes.  
- **Acceptance**: Insight accuracy ≥95% on golden dataset; no PII exposure.  
- **Guardrails**: Read‑only warehouse role; cannot change dashboards; PRs for SQL only.

## IoC Checklist (Leaders)
- Write **intent + constraints**; skip prescribing tactics.  
- Publish **acceptance tests** and **policy tests** up front.  
- Define **Context Packs** with TTL and refresh rules.  
- Start agents at **lowest autonomy**; **graduate** via metrics.  
- Run **portfolio reviews**; demote/kill underperformers.

## Anti‑Patterns
- **“Do everything” agents**: Undifferentiated context; poor outcomes.  
- **Opaque goals**: Teams/agents guess the why; drift grows.  
- **Global permissions**: No least privilege; audit gaps.  
- **Approval choke points**: Block autonomy; encourage shadow changes.  
- **Infinite context stuffing**: Slower, not smarter.

## Summary
**Inversion of Control** empowers teams and agents by separating **intent** from **implementation**. Provide crisp goals, constraints, and **Context Packs**; grant autonomy **by ladder** with **guardrails** and **policy tests**. Keep the **why** transparent to prevent drift, and you’ll convert autonomy into reliable outcomes.

## Change Log
- 2025-10-06: New chapter draft—IoC for humans and agents; context scoping; autonomy ladder; guardrails; concrete examples.
