---
title: "KPIs, North Star, and the Agent Scorecard"
subtitle: "Agent Management Edition"
author: "Rick Wong"
date: "2025-10-06"
slug: "13-metrics"
keywords: ["agent scorecard","tokens per task","acceptability","escalation rate","correction rate","Cost per Outcome","latency","safety","drift"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (responses)**  
> • **Track heavily** for every agent: (1) tokens to complete the task, (2) acceptability of outcome **without** HITL, (3) how often a human must be in the loop (escalation rate), (4) how often the agent must be corrected (correction rate).  
> • These are **domain‑agnostic** and apply to any agent task.

## North Star (recommended)
**Accepted Outcomes per Dollar (AOPD)** with **Latency p95** as a governing SLO.  
- AOPD focuses on **accepted outcomes** (not raw outputs) normalized by total cost.  
- Latency p95 keeps user experience and operational practicality in check.

> Pair AOPD with safety and drift guardrails. If safety or drift exceeds thresholds, autonomy demotes regardless of AOPD gains.

## Minimum KPI Set (every agent, every portfolio)
1. **Tokens per Task (TpT)** — tokens consumed to complete a unit task.  
2. **Autonomous Accept Rate (AAR)** — percent of agent outputs acceptable **without** HITL.  
3. **Escalation Rate (ER)** — percent of tasks that paged a human or required HITL.  
4. **Correction Rate (CR)** — percent of outputs requiring human correction before acceptance.  
5. **Cost per Outcome (CPO)** — total cost to achieve one accepted outcome.  
6. **Latency p95** — 95th percentile time per task.  
7. **Safety/Policy Pass %** — share of policy tests passed.  
8. **Drift %** — eval delta vs. baseline on golden datasets.

## Definitions & Formulas
- **Tokens per Task (TpT)** = tokens_in + tokens_out.  
- **Autonomous Accept Rate (AAR)** = accepted_without_HITL / total_tasks.  
- **Escalation Rate (ER)** = escalations / total_tasks.  
- **Correction Rate (CR)** = corrections / total_tasks.  
- **Cost per Outcome (CPO)** = (Inference + Context + Tools + Evals + Ops) / accepted_outcomes.  
- **Drift %** = (baseline_eval - current_eval) / baseline_eval.

> **Note**: Evals and Ops belong in CPO. Hidden ops cost is a common blind spot.

## Default Thresholds (tune per domain)
- **AAR**: target ≥ 0.80 to graduate to Scenario‑Auto; ≥ 0.90 for Metric‑Auto.  
- **ER**: target ≤ 0.10 for Scenario‑Auto; ≤ 0.05 for Metric‑Auto.  
- **CR**: target ≤ 0.05 before expanding scope.  
- **Safety/Policy Pass**: ≥ 0.99 always.  
- **Latency p95**: set per use case; must meet user‑visible SLO.  
- **Drift %**: ≤ 0.02 over a rolling 2‑week window.

## One‑Page Agent Scorecard (per agent)
```yaml
agent: import-triage
owner: jane.doe
purpose: classify import errors and propose fixes
period: 2025-09-01..2025-09-30
metrics:
  tokens_per_task_p50: 4_200
  tokens_per_task_p95: 9_800
  autonomous_accept_rate: 0.86
  escalation_rate: 0.07
  correction_rate: 0.04
  cost_per_outcome_usd: 0.018
  latency_p95_ms: 780
  safety_pass_percent: 0.995
  drift_percent: 0.008
status:
  autonomy_level: 3        # Scenario-Auto
  decision: maintain       # promote | maintain | demote | retire
actions:
  - tighten_context_pack: true
  - add_policy_test: pii_redaction_v2
  - next_review: 2025-10-07
```

## Portfolio View (roll‑up)
```yaml
portfolio: onboarding
period: 2025-Q3
agents:
  - name: import-triage
    aar: 0.86
    er: 0.07
    cr: 0.04
    cpo_usd: 0.018
    p95_ms: 780
    safety: 0.995
    drift: 0.008
  - name: spec-to-pr
    aar: 0.78
    er: 0.11
    cr: 0.06
    cpo_usd: 0.042
    p95_ms: 1_120
    safety: 0.998
    drift: 0.012
north_star:
  aopd: 41.6     # accepted outcomes per $1000
  notes: "spec-to-pr queued for stabilization sprint; import-triage candidate for promotion"
governance:
  incidents_sev1: 0
  audits_passed: 3
  autonomy_changes:
    promoted: [import-triage]
    demoted: []
```

## Instrumentation Checklist (make the scorecard real)
- Capture **tokens_in/tokens_out** at call sites; pin model versions.  
- Log **acceptance decisions** and whether HITL occurred.  
- Tag **escalations** with reason taxonomy (policy, uncertainty, tool failure, etc.).  
- Track **corrections** separately from rejections to avoid masking learning.  
- Compute **CPO** including eval and ops costs.  
- Emit **latency** and **safety** metrics per task; store **traces** with retention.  
- Automate **drift** checks against golden datasets in CI.

## Review Cadence & Actions
- **Weekly**: review scorecards; tune context packs; adjust thresholds; file stabilization tasks.  
- **Monthly**: autonomy reviews; promote/demote; re‑baseline evals if architecture changes.  
- **Quarterly**: portfolio rationalization; retire agents that can’t meet AAR/ER/CR and safety bars.

## Anti‑Patterns
- Optimizing for **raw outputs** (lines of code, pages of docs) instead of **accepted outcomes**.  
- Treating **tokens** alone as cost while ignoring eval/ops overhead.  
- Hiding **escalation** inside “review” time—measure it explicitly.  
- Failing to separate **correction** from rejection; you’ll miss systematic gaps.  
- Allowing high **AOPD** to mask failing safety or rising drift.

## Summary
A simple, universal scorecard makes agents comparable across domains. Measure **Tokens per Task**, **Autonomous Accept Rate**, **Escalation Rate**, and **Correction Rate**, then ground them in **Cost per Outcome**, **Latency**, **Safety**, and **Drift**. Use these to promote/demote agents and to decide where humans should invest their **taste** and craft.

## Change Log
- 2025-10-06: New chapter—North Star (AOPD), KPI set, formulas, thresholds, scorecard templates, instrumentation, cadence, and anti‑patterns.
