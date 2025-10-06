---
title: "Execution Styles — Prototyper, Productizer, Platform"
subtitle: "Agents mirror human archetypes"
author: "Rick Wong"
date: "2025-10-06"
chapter: 11
keywords: ["execution styles", "prototyper", "productizer", "scaler", "platform", "agent portfolios", "context packs", "guardrails", "acceptance", "SLOs"]
---

# Chapter 11
## Execution Styles — Prototyper, Productizer, Platform

> • Three human archetypes: **Prototyper**, **Productizer & Scaler**, **Org-Scale Platform**.  
> • Agents mirror these modes; context, guardrails, and acceptance criteria differ by mode.  
> • **Prototyper agent** optimizes for usable product and speed; backend optional; UI flexibility paramount.  
> • **Productizer/Scaler agent** adheres to specs and cohesion while expanding value at speed.  
> • **Platform/Org-Scale agent** optimizes for scalability, resilience, cost, security, uptime, and cost of change.

---

Everyone is very unique in what they enjoy and, in turn, what they are very proficient at. Knowing the way people prefer to work, and what gives them a sense of fulfillment, is important to helping them grow.

Teams will need to be balanced with different mindsets in order to fully cover all aspects of a high-performing team. There are three main execution styles in engineering. Each with very different motivational origins, strengths, and impact. The style with the best business return will depend on the needs and phase of the organization.

**In the agent era, these styles apply to both humans and agents.** The archetype is constant—the **context, guardrails, and acceptance** change.

---

## The Three Styles (Human ⇄ Agent)

### 1. Prototyper

Find the right problem/solution fast. Ship experiments, gather signal, iterate.

### 2. Productizer & Scaler

Grow a validated product. Add features coherently, maintain quality, scale users/revenue.

### 3. Org-Scale Platform

Scale the platform and the org: stability, performance, security, migration paths, and cost discipline.

Agents embody these styles by changing **context**, **guardrails**, and **acceptance**.

---

## Style 1: Prototyper (Speed & Learning Over Elegance)

**Goal**: *Usable prototype that answers a learning question.*

### From the Original Book

Prototyper — Enjoys delivering solutions that bring immediate value. They are able to put into production a solution using the least amount of resources and time. They will address the business concerns directly.

### Typical Agent Portfolio

- **UI Builder** (L3 Scenario-Auto on branches): rapidly scaffolds screens/flows.
- **Mock API Agent** (L2): stubs data; fakes latency; no production access.
- **Research/Insight Agent** (L1): user-interview summarizer; competitor scans.
- **Data Synth Agent** (L2): generates synthetic datasets; privacy-safe.

### Context Packs

Problem statement, user archetypes, success question(s), throwaway repo, design sketches, "what we do **not** care about yet."

### Guardrails

- **No prod** writes; synthetic data only.
- **Low ceremony**: minimal tests; temporary docs.
- **Time-boxing**: fixed cycles (1–2 weeks) then kill/keep/merge decision.

### Acceptance & SLOs (examples)

- **Learning metric**: ≥ 3 validated insights or a decisive "no."
- **Usability**: 5 user sessions without blocking defects.
- **Velocity**: 2–3 iteration loops/week.
- **Cost**: within lightweight prototype budget; no infra commitments.

### Common Failures → Guardrails

- **Gold-plating** → Enforce throwaway repos and "learning questions."
- **Scope creep** → Lock the question; new ideas go to next cycle.
- **Hidden prod coupling** → Disallow prod credentials; mock service layer.

---

## Style 2: Productizer & Scaler (Cohesion, Speed, Quality)

**Goal**: *Expand value with coherence; maintain quality and reliability.*

### From the Original Book

Technical Scale — Enjoys working on challenging technical problems with long business value. They are able to scale a tech stack to increase the system's capability without increasing its complexity.

### Typical Agent Portfolio

- **Spec-to-PR Agent** (L2): converts PRDs/Design specs into PRs + tests.
- **Test Authoring Agent** (L3): generates/maintains unit/integration/e2e tests.
- **Experiment Agent** (L2): creates feature flags/experiments; sets guardrails.
- **Changelog/Docs Agent** (L2): updates release notes, C4, runbooks.

### Context Packs

Product spec, design system, coding standards, migration plan, experiment playbook, data contracts.

### Guardrails

- **Design & spec adherence** required.
- **Test coverage** thresholds; no merge below bar.
- **Staged rollout** with flags/holdouts; rollback plan in runbook.

### Acceptance & SLOs (examples)

- **Spec compliance**: rubric ≥ 90%.
- **Coverage**: module coverage +≥ 10% vs. baseline; critical paths ≥ 85%.
- **Reliability**: defect escape rate ↓; error budget stay green.
- **Delivery**: lead time ≤ target; FTUE/activation metric ↑.

### Common Failures → Guardrails

- **Spec drift** → Spec linting pre-CI; design token checks.
- **Flaky tests** → Flake quarantine bot; weekly stabilization sprints.
- **Flag chaos** → TTLs on flags; auto-cleanup agent; scorecards.

---

## Style 3: Org-Scale Platform (Stability, Cost, Security, Scale)

**Goal**: *Make the platform safe, fast, and affordable at scale.*

### From the Original Book

Organizational Scale — Enjoys improving the technology team's organizational value. They are able to optimize a tech team and increase their output without incurring the cost of increased communication points.

### Typical Agent Portfolio

- **Reliability/SRE Agent** (L3→L4): policy-gated auto-mitigations; incident triage.
- **Performance Coach Agent** (L2→L3): proposes perf patches; regression guards.
- **Cost Governor Agent** (L3): detects waste; suggests infra & model right-sizing.
- **Security/Policy Agent** (L3): runs policy tests (PII, secrets, SBOM).
- **Dependency/Upgrade Agent** (L2): safe upgrades with canary & rollback.

### Context Packs

SLO/SLA definitions, error budgets, architecture C4, threat model, cost dashboards, policy suite, migration playbooks.

### Guardrails

- **Least privilege**; audit trails.
- **Change windows**; canary + auto-rollback.
- **Policy tests** must pass; periodic audits.

### Acceptance & SLOs (examples)

- **SLOs**: availability 99.9%+, p95 latency within target; budget adherence.
- **Security**: zero critical vulns; policy pass rate ≥ 99%.
- **Cost**: unit economics within guardrails (e.g., $/req, $/task).
- **Migration**: zero-downtime; error budget respected.

### Common Failures → Guardrails

- **Over-tuning** → Track cost of change; require business case.
- **Rollback gaps** → Mandatory runbooks; simulated game-days.
- **Policy bypass** → Enforced in CI/CD; cannot be skipped without sign-off.

---

## Choosing the Style (Decision Heuristic)

```
Is the problem/solution validated?
  No  → Prototyper
  Yes → Is growth constrained by product capacity or platform limits?
         Product capacity → Productizer & Scaler
         Platform limits  → Org-Scale Platform
```

All 3 styles are valuable. Every experienced engineer will know which style to use depending on the situation. Each engineer, however, will have a default execution style that they are best at.

The quickest way to determine the style is to watch how they solve problems given very little direction and context. Each style has a time when it is most critical for the company's growth. Having all three mindsets available to evaluate the situation and scrutinize the proposed solution is what makes a team effective.

---

## Quick Reference — Context & Autonomy by Style

```
Style               Context Pack Size     Autonomy (typical)      Primary Metrics
------------------  --------------------  -----------------------  -----------------------------------------
Prototyper          Small, throwaway      L1–L3 (branch only)     learning velocity, user signal, time-to-insight
Productizer/Scaler  Medium, curated       L2–L3 (staged rollout)  spec compliance, coverage, reliability, delivery
Org-Scale Platform  Large, formal         L3–L4 (policy-gated)    SLOs, security pass, cost/unit, change safety
```

---

## Templates

### Prototyper Agent (YAML)

```yaml
name: ui-builder
level: 3
branch_only: true
purpose: build throwaway UI flows for learning question
context_packs: [prototype-problem, design-sketches]
guardrails: [no_prod_access, synthetic_data_only]
acceptance: { sessions_without_blocker: ">= 5", iterations_per_week: ">= 2" }
rollback: abandon_branch
```

### Productizer Agent (YAML)

```yaml
name: spec-to-pr
level: 2
purpose: convert PRDs/designs into PRs with tests
context_packs: [prd, design_system, coding_standards]
guardrails: [coverage_thresholds, staged_rollout]
acceptance: { spec_rubric: ">= 90%", coverage_delta: ">= 10%" }
rollback: feature_flag_off
```

### Platform Agent (YAML)

```yaml
name: reliability-guardian
level: 3
purpose: auto-mitigate incidents within policy
context_packs: [slo_defs, runbooks, threat_model]
guardrails: [least_privilege, change_windows, canary_required]
acceptance: { slo_breach_mitigation: "<= 15m", policy_pass: ">= 99%" }
rollback: auto_rollback_to_last_good
```

---

## From the Original Book: Being Well-Rounded

Being well-rounded is great, as long as that is what the person wants for their career path. Allowing people to practice their strengths, and improve in those dimensions, is key. We do not need people to be well-rounded, so much as we need them to continue to be better at what they love doing.

We need team members to constantly practice their craft and break through their own personal limits. Then, share their discoveries with everyone else and show why they love those disciplines so much. Allowing people to grow deeper into their own definition of success will allow the organization to benefit from new levels of creativity.

**The same applies to agents.** Don't try to make a single "well-rounded" super-agent. Build specialized agents that excel at their archetype, then orchestrate them.

---

## Summary

Match **agent design** to the **execution style** of the moment. Prototyper agents chase signal fast; Productizer/Scaler agents expand value coherently; Platform agents make growth safe and affordable.

The archetype is constant—the **context, guardrails, and acceptance** change.

Know your team's default styles. Balance the team with all three. And when designing agents, ask: "What style is needed for this phase?"

---

## Change Log

- **2025-10-06**: New chapter on execution styles with agent portfolios, context/guardrails, acceptance, failure modes, and templates. Merged original "3 engineering execution styles" with agent-specific frameworks.

