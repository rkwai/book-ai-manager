---
title: "Appendix D — P→P→S Checklist"
author: "Rick Wong"
date: "2025-10-06"
keywords: ["Purpose", "Problems", "Solutions", "checklist", "templates"]
---

# Appendix D
## Purpose → Problems → Solutions Checklist

This appendix provides the complete P→P→S checklist and templates referenced in Chapter 15, designed to ensure alignment through testable artifacts.

---

## The Full Checklist

Use this checklist for every new initiative, agent deployment, or cross-team project:

### Phase 1: Purpose

- [ ] **Purpose one-pager written**
  - [ ] User/customer identified
  - [ ] Business value quantified (OKR/KR tied)
  - [ ] Constraints explicit (PII, compliance, budget, timeline)
  - [ ] Non-goals stated clearly
  - [ ] Owner assigned

- [ ] **North Star metric defined**
  - [ ] Measurable
  - [ ] Time-bound
  - [ ] Aligned with company OKRs

- [ ] **Stakeholders identified (RACI)**
  - [ ] Responsible (doer)
  - [ ] Accountable (single owner)
  - [ ] Consulted (experts)
  - [ ] Informed (affected parties)

---

### Phase 2: Problems

- [ ] **Problem statements are falsifiable**
  - [ ] Each problem has a measure
  - [ ] Baseline data collected
  - [ ] Root cause hypotheses stated

- [ ] **Problems prioritized**
  - [ ] Impact estimated (high/med/low)
  - [ ] Effort estimated (high/med/low)
  - [ ] Dependencies mapped

- [ ] **Evidence collected**
  - [ ] User research or support tickets
  - [ ] Metrics dashboards
  - [ ] Incident reports
  - [ ] Competitive analysis

---

### Phase 3: Acceptance Tests

- [ ] **Acceptance tests written**
  - [ ] Tied to OKRs/KRs
  - [ ] Verifiable (pass/fail clear)
  - [ ] Testable in CI

- [ ] **Golden datasets created** (if agent-backed)
  - [ ] Representative of production
  - [ ] Stratified by taxonomy
  - [ ] Owner assigned
  - [ ] Update cadence defined

- [ ] **Policy tests defined** (if agent-backed)
  - [ ] PII redaction
  - [ ] Secret scanning
  - [ ] Prompt/response safety
  - [ ] Compliance requirements

---

### Phase 4: Context Packs

- [ ] **Context Packs named and scoped**
  - [ ] Pack name follows convention (e.g., Import-Triage-v3)
  - [ ] Contents listed (C4, runbooks, edge cases, etc.)
  - [ ] TTL set (e.g., 30 days)
  - [ ] Owner assigned
  - [ ] Refresh policy defined

- [ ] **Context freshness guaranteed**
  - [ ] Auto-refresh from source of truth
  - [ ] Diff review required on changes
  - [ ] Stale pack alerts enabled

---

### Phase 5: Solutions (Agent Design Briefs)

- [ ] **Agent Design Briefs completed** (if agents involved)
  - [ ] Agent name and purpose clear
  - [ ] Scope defined (will/won't do)
  - [ ] Acceptance tests linked
  - [ ] Guardrails listed
  - [ ] Autonomy level set (L1/L2/L3/L4)
  - [ ] Owner assigned

- [ ] **Permissions scoped** (least privilege)
  - [ ] Read/write scopes explicit
  - [ ] API/tool allowlists defined
  - [ ] Credentials rotated regularly
  - [ ] Per-agent identities

- [ ] **Interfaces published** (producer/consumer)
  - [ ] Input schema
  - [ ] Output schema
  - [ ] Upstream producers listed
  - [ ] Downstream consumers listed

---

### Phase 6: Eval Harness

- [ ] **Eval harness created** (if agent-backed)
  - [ ] Golden datasets in CI
  - [ ] Thresholds set (accuracy, false-page, safety)
  - [ ] Drift detection enabled
  - [ ] Latency & cost checks in test suite
  - [ ] Red-team & adversarial examples included

- [ ] **CI integration complete**
  - [ ] Evals run on every PR
  - [ ] Nightly eval runs scheduled
  - [ ] Alerts configured for failures

---

### Phase 7: Release & Runbook

- [ ] **Release notes written**
  - [ ] Change described
  - [ ] Impact estimated
  - [ ] Rollback plan documented

- [ ] **Runbook updated**
  - [ ] On-call contact
  - [ ] Escalation policy
  - [ ] Rollback steps
  - [ ] Known issues & workarounds

- [ ] **Rollback tested**
  - [ ] Rollback procedure verified
  - [ ] Kill-switch functional
  - [ ] Data migration reversible (if applicable)

---

### Phase 8: Observability

- [ ] **Dashboards created**
  - [ ] Outcome metrics (KR values)
  - [ ] AgentOps metrics (if agent-backed)
  - [ ] Cost & latency
  - [ ] Safety & drift

- [ ] **Traces enabled**
  - [ ] All agent actions traced
  - [ ] Retention policy set
  - [ ] PII scrubbed from logs

- [ ] **Alerts configured**
  - [ ] Drift > threshold
  - [ ] Safety failures
  - [ ] Cost spikes
  - [ ] SLA breaches

---

### Phase 9: Reviews & Governance

- [ ] **Review cadence set**
  - [ ] Weekly AgentOps (if agent-backed)
  - [ ] Monthly autonomy review
  - [ ] Quarterly portfolio review

- [ ] **Decision log updated**
  - [ ] Key decisions documented
  - [ ] Alternatives considered
  - [ ] Rationale stated

- [ ] **Audit trail complete**
  - [ ] All changes in Git
  - [ ] PR reviews recorded
  - [ ] Security sign-offs documented

---

## Quick Start Template (60-Minute Workshop)

Use this template for a time-boxed P→P→S workshop:

### Agenda (60 minutes)

**10 minutes: Purpose**
- Confirm North Star & constraints
- Assign owner
- State non-goals

**15 minutes: Problems**
- Add/trim to falsifiable list
- Add measures
- Prioritize by impact/effort

**15 minutes: Acceptance**
- Write acceptance tests
- Tie to OKRs/KRs
- Define pass/fail criteria

**10 minutes: Context Packs**
- Name packs
- Assign owners
- Set TTL

**10 minutes: Agent Briefs** (if applicable)
- Draft scope/guardrails/autonomy
- Assign owners
- List will/won't do

### Outputs (Due Same Day)

- Updated artifacts in repo
- CI runs eval baseline
- Decision log entry
- RACI updated

---

## Example Artifact Flow

Here's what a complete P→P→S artifact flow looks like:

```
1. Purpose Brief (1-pager)
   ├─ User: New admin integrating CSV data
   ├─ Business: AHA-rate ≥ 45%, cost ≤ $0.40
   ├─ Constraints: Zero PII leaks, no downtime
   └─ Owner: PM-Activation

2. Problem Statements
   ├─ P1: 28% imports fail (error taxonomy E1/E2)
   ├─ P2: Docs lack edge case examples
   └─ P3: First-response > 10m

3. Acceptance Tests
   ├─ AT1: Import success ≥ 95% on golden dataset
   ├─ AT2: Doc task success ≥ 90%
   └─ AT3: First-response ≤ 2m (p95)

4. Context Packs
   └─ Import-Triage-v3
      ├─ C4 diagram (component level)
      ├─ Error taxonomy
      ├─ Top 10 edge cases
      ├─ Runbook v2
      └─ TTL: 30 days

5. Agent Design Brief
   └─ import-triage
      ├─ Purpose: Classify errors; propose fixes
      ├─ Scope: services/importer/*
      ├─ Acceptance: AT1, AT3
      ├─ Guardrails: Least privilege; policy tests in CI
      └─ Autonomy: L3 (Scenario-Auto)

6. Eval Harness
   └─ golden-v2
      ├─ 500 labeled failures (E1/E2/E3)
      ├─ Policy: pii_redaction, secret_scan
      ├─ Thresholds: accuracy ≥ 95%, false-page ≤ 5%
      └─ Drift: alert if delta > 2% over 14d

7. Release Notes & Runbook
   ├─ Change: import-triage L3 (expanded edge cases)
   ├─ Rollback: revert_to_last_good
   └─ On-call: #agentops-activation
```

---

## Invariants (Non-Negotiables)

### 1. Testability
If an artifact can't be tested, it's not ready. Everything must have pass/fail criteria.

### 2. Freshness
Context Packs have TTL and diff approvals. No stale knowledge.

### 3. Ownership
Every artifact has one accountable owner. No orphans.

### 4. Acceptance Before Solutioning
No agent design without acceptance tests. No coding without acceptance.

### 5. HITL Until Stable
Autonomy graduates only when acceptance tests pass consistently.

### 6. Traceability
Decisions logged, runbooks updated, changes versioned.

---

## Anti-Patterns to Avoid

- **Brainstorming solutions before acceptance tests**: You'll build the wrong thing.
- **Context packs with no TTL**: Stale knowledge causes drift.
- **"Do-everything" agents**: Unclear scope, poor outcomes.
- **No eval harness**: You can't measure drift or quality.
- **HITL waved off "to move fast"**: You'll move fast into incidents.
- **Meeting notes without repo artifacts**: Theater without action.

---

## Summary

P→P→S is an **evidence pipeline**, not a meeting. Every phase produces **testable artifacts** that humans and agents both execute against.

**Use this checklist to ensure alignment—and prove it.**

---

## Download

Full checklist and templates available at: **[Your URL]**

Includes:
- Printable checklist PDF
- 60-minute workshop template
- Artifact templates (Purpose Brief, Problem Statements, etc.)
- Example flows

