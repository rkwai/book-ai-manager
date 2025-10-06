---
title: "Purpose → Problems → Solutions (AgentOps Edition)"
subtitle: "From gaining alignment to **ensuring** it"
author: "Rick Wong"
date: "2025-10-06"
slug: "14-purpose-problem-solutions"
keywords: ["Purpose","Problems","Solutions","alignment","acceptance tests","Context Packs","Agent design brief","Eval harness","HITL","RACI"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (response)**  
> **P→P→S** is still powerful for cross‑department alignment, but in the agent era it’s **less about gaining alignment and more about ensuring it**.

## Thesis
Purpose → Problems → Solutions is not a meeting—it’s an **evidence pipeline**. In the agent era, alignment is **ensured** by turning Purpose into **verifiable acceptance**, binding it to **Context Packs** and **Eval harnesses** that humans and agents both obey.

---

## The Evidence Pipeline
1) **Purpose** → why this matters to users and the business (North Star, constraints).  
2) **Problems** → falsifiable statements of what blocks the Purpose (with measures).  
3) **Solutions** → human/agent plans that meet acceptance and policy tests.

**Ensuring alignment** means every transition emits an artifact that is **testable**.

---

## Artifact Flow (minimal, high‑signal)
```
Purpose Brief
  ↓ emits → Problem Statements (+ measures)
  ↓ emits → Acceptance Tests (KR-aligned)
  ↓ emits → Context Packs (right-sized, fresh)
  ↓ emits → Agent Design Brief(s) (scope, tools, guardrails)
  ↓ emits → Eval Harness (golden datasets, drift checks)
  ↓ emits → Release Notes & Runbook (HITL gates, rollback)
```
Each artifact has an **owner**, **reviewers**, and a **timestamp**.

---

## Templates (drop‑in)

### 1) Purpose Brief (1 pager)
```
Purpose: Reduce onboarding TTFHW p95 from 45m → 15m to unlock activation
User: New admin integrating CSV customer data
Business: AHA-rate ≥ 45%, cost per onboarding ≤ $0.40
Constraints: Zero PII leaks, no downtime; use existing billing
Non-Goals: New data model, net-new vendors this quarter
Owner: PM-Activation
```

### 2) Problem Statements (falsifiable)
```
P1: Import errors block 28% of first-time admins (measure: error taxonomy E1/E2)
P2: Docs lack examples for top 5 edge cases (measure: doc coverage index)
P3: First-response to import failures > 10m (measure: Slack/Sentry timestamps)
```

### 3) Acceptance Tests (verifiable)
```
AT1: Import success rate on golden dataset ≥ 95%
AT2: Doc task success (find & apply) ≥ 90% on user test set
AT3: First-response to import failure ≤ 2m (p95)
```

### 4) Context Packs (right-sized, with TTL)
```
Pack: Import-Triage-v3
Contains: C4 (component), schema map, error taxonomy, top 10 CSV edge cases,
          runbook v2, escalation policy, tool scopes
TTL: 30d (auto-refresh); Owner must approve diffs
```

### 5) Agent Design Brief
```
Agent: import-triage
Purpose: Classify import errors; propose fixes; escalate by policy
Scope: services/importer/* ; read logs, open PRs in module X
Acceptance: AT1, AT3
Guardrails: least privilege; no prod data writes; policy tests in CI
Autonomy: Level 3 (Scenario-Auto); exceptions hit HITL
Owner: eng.rwong
```

### 6) Eval Harness (golden datasets + policy tests)
```
Golden: 500 labeled import failures (stratified by E1/E2/E3 taxonomy)
Policy: pii_redaction, secret_scan, prompt_safety
Thresholds: accuracy ≥ 95%, false-page ≤ 5%, policy pass ≥ 99%
Drift: alert if accuracy delta > 2% over rolling 2 weeks
```

### 7) Release Notes & Runbook
```
Change: import-triage L3 → L3 (expanded edge cases)
Rollback: revert_to_last_good; disable auto-fix
On-call: #agentops-activation; escalation to EM after 2 failed attempts
```

---

## Workshop Cadence (ensure > discuss)
- **60 minutes, time‑boxed**
  - 10m Purpose: confirm North Star & constraints
  - 15m Problems: add/trim to falsifiable list + measures
  - 15m Acceptance: write ATs that satisfy Purpose; tie to KRs
  - 10m Context Packs: name packs, owners, TTL
  - 10m Agent Briefs: draft scope/guardrails/autonomy; assign owners
- **Outputs due same day**: updated artifacts in repo; CI runs eval baseline

**RACI**
- **R**: Purpose owner (usually PM) + Agent owner (for design brief/evals)  
- **A**: EM/Initiative owner (business outcome)  
- **C**: Design, Security/Compliance, Data  
- **I**: Stakeholders affected by agent actions

---

## Ensuring Alignment (Invariants)
- **P→P→S is testable**: if an artifact can’t be tested, it’s not ready.  
- **Context freshness**: packs have TTL and diff approvals.  
- **Acceptance before solutioning**: no agent design without ATs.  
- **HITL until stable**: autonomy graduates only when ATs pass consistently.  
- **Traceability**: decisions logged; runbooks updated on release.

---

## Example (anonymized, condensed)
- **Purpose**: Slash onboarding failures to raise activation.  
- **Problems**: 28% imports fail; slow first-response; missing edge-case docs.  
- **Acceptance**: success ≥ 95%; response ≤ 2m; docs task success ≥ 90%.  
- **Solutions**: 
  - *import-triage* (L3) with Context Pack v3, eval harness;
  - *docs-agent* (L2) to generate examples; 
  - *slack bot* (L2) for instant triage.  
- **Result** (60d): import success +18 pts; TTFHW p95 42m → 13m; tickets/100 accts 5.1 → 1.9.

---

## Anti‑Patterns
- Brainstorming solutions **before** writing acceptance tests.  
- Context packs that are everything; no TTL; stale knowledge.  
- “Do‑everything” agents; unclear producers/consumers.  
- No eval harness; HITL waved off “to move fast.”  
- Meeting notes without artifacts in the repo/CI.

---

## Checklist (printable)
- [ ] Purpose one‑pager written; constraints explicit  
- [ ] Problems are falsifiable with measures  
- [ ] Acceptance tests tie to OKRs/KRs  
- [ ] Context Packs named, scoped, TTL’d, owned  
- [ ] Agent Design Briefs filled; autonomy set; guardrails listed  
- [ ] Eval harness in CI; thresholds set; drift alarms on  
- [ ] Runbook updated; rollback defined; on‑call clear

## Summary
P→P→S remains the clearest way to **agree**—now it’s also how we **prove** that agreement. Convert Purpose into acceptance; bind it to Context Packs, Agent Briefs, and an Eval harness. That’s how you ensure alignment—so agents (and humans) deliver outcomes that actually move the business.

## Change Log
- 2025-10-06: Reframed P→P→S from “alignment meeting” to **evidence pipeline**; added artifacts, cadence, templates, and invariants.
