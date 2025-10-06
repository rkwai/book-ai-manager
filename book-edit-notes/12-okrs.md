---
title: "Leveraging OKRs for Alignment (Agent-Era Truths)"
subtitle: "Agent Management Edition"
author: "Rick Wong"
date: "2025-10-06"
slug: "12-okrs"
keywords: ["OKRs","AgentOps","Cost per Outcome","per-outcome SLA","evaluation harness","HITL","observability","cost savings"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (responses)**  
> • Company/organization OKRs **do not call out agents**; agents deliver business outcomes invisibly.  
> • Divisions/teams own OKRs; some KRs are **executed by agents**.  
> • Those agent-backed KRs require **observability** so owners can see decisions and steer.  
> • **AgentOps** = operating controls, oversight/insight, improvement know-how.  
> • The only agent signal that rises to company-level metrics: **cost and, importantly, cost savings**.

## Thesis
OKRs should measure **business outcomes**, not machinery. At the **company level**, there are no “agent OKRs.” At the **division/team level**, some KRs are **agent-backed**, which requires **AgentOps** (evals, observability, guardrails) so human owners can steer outcomes. Company leadership sees **results and cost impact**—not the how.

## Structure: Where Agents Show Up (and Where They Don’t)
- **Company OKRs**: user value, growth, profitability, reliability. *No agent mentions.*  
- **Division/Team OKRs**: same style of outcomes, but some KRs are **implemented by agents**. These KRs link to **internal AgentOps dashboards** (not to the company scorecard).  
- **Agent Owners**: accountable for the **AgentOps sheet** behind any agent-backed KR.

## Design Rules (Keep It Boring and Effective)
1. **Outcome-first**: KRs define accepted outcomes; tools (agents or humans) are implementation details.  
2. **One human owner per KR**—even when agents do the work.  
3. **Observability required** for any agent-backed KR (traces, evals, safety metrics).  
4. **HITL until proven**: agents graduate autonomy only when KR-aligned evals are stable.  
5. **Cost accounting**: surface **Cost per Outcome** and **Cost Savings vs. baseline** to the company scorecard.

## Templates

### A) Company OKRs (no mention of agents)
```
Objective: Increase profitable activation in self-serve

KR1  Activation AHA-rate ≥ 45% (from 32%)
KR2  Time-to-first-hello-world (TTFHW) ≤ 15 minutes (p95)
KR3  Gross margin ≥ 76% while activation scales
KR4  Support first-response time ≤ 2 minutes (p95)
```

### B) Division OKRs (some KRs are agent-backed, but labeled only internally)
```
Objective: Shorten setup and reduce support load for onboarding

KR1  Onboarding completion rate ≥ 70% (agent-backed)      # internal flag only
KR2  Tickets per 100 new accounts ≤ 2.0
KR3  First-response ≤ 120s (p95), CSAT ≥ 4.6/5
KR4  Cost per successful onboarding ≤ $0.40 (company-visible)
```

### C) Internal AgentOps Sheet (attached to a KR, not the company scorecard)
```
KR      : Onboarding completion rate ≥ 70%
Owner   : jane.doe
Agent(s): import-triage (L3), spec-to-pr (L2)
Acceptance tests:
  - Completion correctness on golden dataset ≥ 95%
  - False escalation rate ≤ 5%
Observability:
  - Success rate, cost p95, latency p95, safety pass %, drift %
  - Traces stored 30d; policy tests (PII, secrets) in CI
Controls:
  - HITL on exceptions; auto-rollback on eval regression
Reviews :
  - Weekly AgentOps; monthly autonomy ladder review
```

### D) Cost & Savings (company-visible)
```
Cost per Outcome = (Inference + Context + Tools + Evals + Ops) / Successful_Outcomes

Savings vs Baseline = (Baseline_Cost_per_Outcome - Cost_per_Outcome) × Outcomes
```

## Observability: What the KR Owner Sees
- **Outcome metrics**: KR value (e.g., completion %, defect escape, TTFHW).  
- **AgentOps metrics** *(internal)*: eval pass %, cost p95, latency p95, safety/policy pass %, drift, incident MTTR.  
- **Decision traces**: why an agent took an action; links to runbooks.  
- **Controls**: autonomy level, rollback status, pending promotions/demotions.

> **Rule of thumb**: if a KR is agent-backed, the **AgentOps sheet** must exist and be current.

## Cadence (Short, Consistent)
- **Weekly**: AgentOps review (15–30m) for any agent-backed KRs.  
- **Monthly**: Division OKR review; demote/promote agents as needed.  
- **Quarterly**: Company OKRs—roll up results and **cost impact**; no agent mechanics.

## Anti‑Patterns to Avoid
- **Agent vanity KRs** (e.g., “agent uptime”) on company scorecards.  
- **Orphaned KRs** without a human owner because “an agent does it.”  
- **No observability**: shipping agent work without evals/safety/traceability.  
- **Cost blind spots**: token/API costs tracked, but **ops & evals** excluded.  
- **Mid‑cycle thrash**: changing KRs to fit agents; instead, fix the agents.

## Example Set (Anonymized)
**Company O**: “Activation AHA‑rate ≥ 45%; TTFHW ≤ 15m; Gross margin ≥ 76%.”  
**Division D**: “Onboarding completion ≥ 70% (agent‑backed); Support tickets ≤ 2.0/100 accts; Cost per onboarding ≤ $0.40.”  
**Internal AgentOps Sheet** (D.KR1): import‑triage L3, spec‑to‑pr L2; eval pass ≥ 95%; safety pass ≥ 99%; cost p95 ≤ $0.04; drift ≤ 2%; weekly review.

## Summary
Keep OKRs **tool‑agnostic** at the top. Let divisions/teams run **agent‑backed KRs** with strong **AgentOps** and make **cost and savings** the only agent signals that bubble up. That way, leadership steers by outcomes, while owners have the visibility and control to improve the machinery.

## Change Log
- 2025-10-06: New chapter—OKR architecture with agent‑backed KRs, AgentOps sheets, and company‑visible cost/savings.
