---
title: "Progression Tracks — Humans & Agents"
subtitle: "Agent Management Edition"
author: "Rick Wong"
date: "2025-10-06"
slug: "09-progression"
keywords: ["progression","levels","scope","autonomy","agent promotions","observability","flattened orgs","leadership"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (responses)**  
> • Traditional tracks still matter, but the **road is flattening**—**scope** determines seniority.  
> • With agents, **everyone is a leader/manager**; mindless work shifts to agents.  
> • Human levels = scope, budget, complexity, guarantees.  
> • Agent autonomy has **rapidly increased** (days‑long operation, complex work). Outcomes still require **human guarantees**.  
> • Jr/Mid roles are most directly displaced by agents today; expectations will evolve as orgs absorb agents.  
> • Promotions (humans) = ability to **guarantee outcomes** at larger scope with agents in the loop.  
> • Promotions (agents) = humans decide based on **observability** (evals, logs, quality/safety), then expand scope or combine agents.

## What Changes (and What Doesn’t)
- **Doesn’t**: We still recognize **craft, judgment, and outcomes**. Promotions are earned by **guaranteeing results**.  
- **Does**: Hierarchies flatten; **scope** and **guarantees** dominate titles. Every contributor manages an **agent toolkit** (acceptance, context, evals).

## Dual Progression Framework
### Human Track (Scope‑Based Signals)
- **Outcome scope**: system/component → product area → portfolio.  
- **Budget**: from team tooling to multimillion program lines.  
- **Risk class**: from reversible to highly irreversible & regulated.  
- **People/Agent portfolio**: agents owned, autonomy ladders managed, on‑call stewardship.  
- **Decision rights**: local trade‑offs → cross‑org priorities & policy.  
- **Guarantees**: clarity of acceptance; reliability of hitting them quarter after quarter.

### Agent Track (Autonomy‑Based Signals) — see Ch.07 for ladder
- **L1 Draft‑only** → **L2 Suggest‑PR** → **L3 Scenario‑Auto** → **L4 Metric‑Auto/Policy‑Gated**.  
- Scope expands from **narrow tasks** to **bounded workflows**, then **multi‑step scenarios**, and finally **metric‑guarded** continuous changes.

## Mapping: Human Levels ↔ Agent Autonomy
```
Human Level             Core Scope/Signals                              Typical Agent Portfolio
---------------------   ----------------------------------------------  ---------------------------------------------
Intern/Junior IC        Executes with guidance; learns acceptance        L1 (Draft-only) helpers; zero write access
Mid IC / TL             Owns a component; writes acceptance; reviews     Mix of L1/L2; PR copilot; triage bot (read-only)
Senior / Staff          Owns system outcomes; incident leader            L2/L3 on owned surfaces; scenario auto within guardrails
Principal / EM          Multi-system outcomes; budget & policy           L3 portfolios; policy tests; promotion/demotion authority
Sr EM / Director+       Cross-org portfolio; risk/ethics & audits        L3/L4 where metrics prove safety; kill-switch & audit cadence
```

**Interpretation**: Titles are less predictive than **what you can guarantee**. A Staff who can operate a portfolio of **L3** agents safely may outrank a Principal who can’t.

## Human Promotion Criteria (Evidence, Not Vibes)
- **Outcomes**: Repeatedly meets/raises acceptance across increasing **scope** and **risk class**.  
- **Agent leverage**: Designs **Context Packs**, evals, and guardrails; graduates agents up the ladder.  
- **Economic sense**: Improves **unit economics** (cost/task, latency SLO) while raising quality.  
- **System leadership**: Clear docs (C4), runbooks, incident sensemaking, decision logs.  
- **Portfolio ops**: Establishes **AgentOps** rituals; reduces alert fatigue; healthy escalation stats.  
- **People**: Grows others’ taste and judgment; creates exemplars.

## Agent Promotion Criteria (Graduate Scope & Autonomy)
- **Eval pass rate**: ≥ target for **N** consecutive weeks on golden datasets.  
- **Safety**: Policy tests pass; **zero Sev1** since last review; Sev2 MTTR within SLA.  
- **Quality drift**: within bounds; anomaly rate acceptable.  
- **Cost/Latency**: p95 within SLOs for **M** weeks; no budget breaches.  
- **Ops hygiene**: All changes traced; docs/runbooks updated; clean audits.  
- **Human feedback**: Reviewer rubric average ≥ threshold.

**Demotion / Kill Triggers**  
- Breach of safety policy; repeated false‑pages; cost explosions; stale docs; owner change with no cover; audit failure.

## Everyone Manages (Now What?)
Each contributor maintains an **Agent Owner Kit**:
1. **Purpose** & acceptance tests (what “good” means).  
2. **Context Packs** (right, fresh, minimal).  
3. **Tool scopes** (least privilege).  
4. **Eval harness** in CI with thresholds and drift alarms.  
5. **Runbook** (escalations, rollback).  
6. **Dashboards** (success/cost/latency/safety).

## Combining Agents (When Confidence Is High)
- **Pre‑conditions**: Stable **L3** metrics for ≥ 4–8 weeks, low exceptions, clean audits.  
- **Combine** along **producer/consumer** edges (adjacent scopes), not random mashups.  
- **Re‑baseline** evals; set stricter policy tests; run a stabilization sprint.  
- **Have a kill‑switch** with instant rollback to pre‑fusion agents.

## Rubrics & Templates
**Human Leveling Rubric (excerpt)**
```
Level        | Outcome Scope       | Guarantees | Agent Leverage                | Economics             | Ops & Docs
------------ | ------------------- | ---------- | ----------------------------- | --------------------- | ---------------------------
Mid IC       | Component            | Meets AC   | Uses L1/L2                    | Aware of cost/latency | Updates C4/component docs
Senior/Staff | System               | Exceeds AC | Designs Context Packs; L2/L3  | Optimizes unit costs  | Runbooks, incident cmd
Principal/EM | Product area/Portfolio| Raises AC | Portfolio of L3; policy tests | Cost guardrails set   | Portfolio dashboards, audits
Director+    | Cross‑org            | Sets AC    | L3/L4 governance; demote/kill | Budget ownership      | Audit cadence, risk register
```

**Agent Leveling Record (YAML)**
```yaml
agent: import-triage
owner: jane.doe
level: 3                # scenario-auto
purpose: classify errors & propose fixes
acceptance:
  accuracy: ">= 95%"
  false_page: "<= 5%"
slo:
  cost_p95_usd: "<= 0.02"
  latency_p95_ms: "<= 800"
safety_tests: [pii_redaction, secret_scan]
observability:
  traces: enabled
  dashboards: [success_rate, cost, latency, safety_pass]
autonomy_review:
  last: 2025-09-01
  next: 2025-10-01
  decision: "stay"
```

**AgentOps Review (Monthly)**
```
Inputs: eval trends, incident log, cost/latency, audit notes
Decisions: graduate / maintain / demote / retire
Actions: update Context Packs; tighten policy tests; adjust scopes
```

## Updated Expectations for Early‑Career Roles
- **Jr/Mid hiring** shifts: agents handle more execution; early‑career humans focus on **taste formation**, **acceptance‑test thinking**, and **operational literacy**.  
- **Internships** emphasize **Agent Owner Kit** basics and documentation/C4 fluency.  
- **Mentorship**: pairing on critiques and decision logs, not just coding tasks.

## Summary
Progression in the agent era is about **scope and guarantees**. Humans rise by owning larger, riskier outcomes and **leveraging agents** responsibly. Agents “rise” by **proven reliability**—earning broader scope and autonomy. Flatten the org, keep ownership sharp, and let evidence move both people and agents up.

## Change Log
- 2025-10-06: New chapter defining dual progression, level mappings, promotion criteria, observability, and templates.
