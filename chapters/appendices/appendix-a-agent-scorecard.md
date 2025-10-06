---
title: "Appendix A — Agent Scorecard Template & Usage Guide"
author: "Rick Wong"
date: "2025-10-06"
keywords: ["agent scorecard", "templates", "KPIs", "metrics"]
---

# Appendix A
## Agent Scorecard Template & Usage Guide

This appendix provides the complete Agent Scorecard template referenced throughout the book (especially Chapter 14), along with detailed guidance on how to use it, instrument it, and interpret the results.

---

## Full Template (YAML)

```yaml
agent: import-triage
owner: jane.doe@company.com
purpose: Classify CSV import errors; propose fixes; escalate per policy
period: 2025-09-01..2025-09-30

metrics:
  # Volume & Token Economics
  tasks_completed: 1247
  tokens_per_task_p50: 4_200
  tokens_per_task_p95: 9_800
  total_tokens: 6_429_800
  
  # Quality & Acceptance
  autonomous_accept_rate: 0.86        # 86% of outputs accepted without HITL
  escalation_rate: 0.07               # 7% required human intervention
  correction_rate: 0.04               # 4% needed human corrections before acceptance
  false_positive_rate: 0.03           # 3% flagged incorrectly
  
  # Economics
  cost_per_outcome_usd: 0.018         # $0.018 per accepted outcome
  cost_per_task_usd: 0.015            # includes rejected tasks
  total_cost_usd: 22.43               # full period cost
  
  # Performance
  latency_p50_ms: 620
  latency_p95_ms: 780
  latency_p99_ms: 1_120
  
  # Safety & Reliability
  safety_pass_percent: 0.995          # 99.5% passed policy tests
  drift_percent: 0.008                # 0.8% drift from baseline eval
  incident_count: 0                   # No Sev1/Sev2 incidents
  
  # HITL Details
  avg_human_minutes_per_escalation: 8.2
  escalation_reasons:
    uncertainty: 45
    tool_error: 18
    policy_trigger: 12
    novelty: 10
    other: 2

status:
  autonomy_level: 3                   # Scenario-Auto
  decision: promote                   # promote | maintain | demote | retire
  next_review: 2025-10-07

actions:
  - refine_context_pack_edge_cases
  - add_policy_test_pii_redaction_v2
  - expand_golden_dataset_for_e3_errors
  - document_top_3_escalation_patterns

change_log:
  - date: 2025-09-15
    change: "Added 50 new edge cases to golden dataset"
    impact: "AAR +3pts, drift -0.5pts"
  - date: 2025-09-01
    change: "Promoted from L2 to L3"
    impact: "Escalation rate reduced from 12% to 7%"
```

---

## How to Use This Scorecard

### 1. Setup (First Time)

#### A) Instrument Your Agent

Add logging at these key points in your agent code:

```python
# Pseudo-code example
def agent_task(input_data):
    start_time = time.now()
    tokens_in = count_tokens(input_data)
    
    try:
        result = agent.process(input_data)
        tokens_out = count_tokens(result)
        
        # Log metrics
        log_metric("tokens_per_task", tokens_in + tokens_out)
        log_metric("latency_ms", time.now() - start_time)
        
        # Check if HITL needed
        if needs_escalation(result):
            log_event("escalation", reason=result.escalation_reason)
            return human_review(result)
        
        # Check acceptance
        if acceptance_test_passed(result):
            log_event("autonomous_accept")
            return result
        else:
            log_event("correction", reason=result.failure_reason)
            return None
            
    except PolicyTestFailure as e:
        log_event("safety_failure", test=e.test_name)
        raise
```

#### B) Create Your Dashboard

Set up a dashboard (Datadog, Grafana, custom) that queries these logs and calculates:

- **AAR** = autonomous_accepts / total_tasks
- **ER** = escalations / total_tasks
- **CR** = corrections / total_tasks
- **CPO** = total_cost / autonomous_accepts
- **TpT p50/p95** = percentiles of tokens_per_task
- **Latency p50/p95** = percentiles of latency_ms
- **Safety Pass %** = (total_tasks - safety_failures) / total_tasks
- **Drift %** = calculated from eval runs (see below)

### 2. Weekly Review

Every week, generate a scorecard snapshot (manually or automated):

```bash
# Example CLI tool
./scorecard-gen --agent import-triage --period last-7d
```

**Look for**:

- **AAR trending down** → Context Pack might be stale; eval dataset might need updates
- **ER trending up** → Agent is uncertain more often; investigate escalation reasons
- **CR trending up** → Quality is slipping; tighten acceptance tests or demote autonomy
- **Drift > 2%** → Model or upstream changes; re-baseline evals
- **Safety failures** → Immediate investigation; consider demotion

### 3. Monthly Autonomy Review

Use the scorecard to make **promotion/demotion decisions**:

#### Promotion Criteria (L2 → L3)

- AAR ≥ 0.80 for 4 consecutive weeks
- ER ≤ 0.10 for 4 consecutive weeks
- CR ≤ 0.05 for 4 consecutive weeks
- Safety Pass % ≥ 0.99 always
- Drift ≤ 0.02 over rolling 2-week window
- Zero Sev1/Sev2 incidents in period
- Clean audits

#### Demotion Triggers

- Any Sev1 incident
- Safety Pass % < 0.99
- Drift > 0.05
- Sustained AAR < 0.70
- Owner revokes scope

### 4. Quarterly Portfolio Review

Roll up scorecards across all agents in your portfolio:

```yaml
portfolio: onboarding
period: 2025-Q3
agents:
  - name: import-triage
    aar: 0.86
    er: 0.07
    cr: 0.04
    cpo_usd: 0.018
    safety: 0.995
    drift: 0.008
    decision: promote
  
  - name: spec-to-pr
    aar: 0.78
    er: 0.11
    cr: 0.06
    cpo_usd: 0.042
    safety: 0.998
    drift: 0.012
    decision: maintain
  
  - name: docs-agent
    aar: 0.92
    er: 0.04
    cr: 0.02
    cpo_usd: 0.008
    safety: 0.999
    drift: 0.003
    decision: promote

north_star:
  aopd: 41.6                      # accepted outcomes per $1000
  total_cost_savings_usd: 18_420  # vs. baseline human-only

governance:
  incidents_sev1: 0
  incidents_sev2: 1               # docs-agent; PIR completed
  audits_passed: 3
  autonomy_changes:
    promoted: [import-triage, docs-agent]
    demoted: []
    retired: [legacy-classifier]

recommendations:
  - "Promote import-triage and docs-agent to next autonomy level"
  - "Stabilize spec-to-pr before expanding scope"
  - "Retire legacy-classifier; migrated to import-triage"
  - "Increase golden dataset for spec-to-pr by 200 examples"
```

---

## Drift Detection Setup

Drift measures how much your agent's performance has changed vs. a baseline. Set this up:

### 1. Create Golden Dataset

```yaml
golden_dataset: import-triage-v2
owner: activation-team
size: 500
created: 2025-08-01
taxonomy:
  E1_auth_errors: 150
  E2_schema_errors: 200
  E3_edge_cases: 150
stratification: representative_of_production
storage: git://org/evals/import-triage-golden-v2
```

### 2. Run Baseline Eval

```bash
# Run eval against golden dataset
./eval-runner --agent import-triage --dataset golden-v2

# Results:
# accuracy: 0.952
# false_page_rate: 0.042
# safety_pass: 0.998
```

### 3. Automate Drift Checks

Add to your CI/CD:

```yaml
# .github/workflows/agent-eval.yml
on:
  schedule:
    - cron: '0 2 * * *'  # Daily at 2 AM
  pull_request:
    paths:
      - 'agents/import-triage/**'

jobs:
  eval:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run Evals
        run: |
          ./eval-runner --agent import-triage --dataset golden-v2
      
      - name: Check Drift
        run: |
          # Compare to baseline
          # Fail if drift > 2%
          ./drift-check --baseline 0.952 --threshold 0.02
```

---

## Troubleshooting Common Issues

### AAR is low (< 0.70)

**Possible causes**:
- Context Pack is stale or incomplete
- Acceptance tests are too strict
- Agent is operating in scenarios it wasn't trained for

**Fixes**:
- Refresh Context Pack
- Review recent rejections; add patterns to golden dataset
- Consider narrowing scope or demoting autonomy

### ER is high (> 0.15)

**Possible causes**:
- Agent is correctly uncertain (good!)
- Upstream changes introduced new patterns
- Policy tests are too aggressive

**Fixes**:
- Review escalation reasons taxonomy
- Update Context Pack with new patterns
- Adjust policy test thresholds if appropriate

### CR is high (> 0.10)

**Possible causes**:
- Agent is producing low-quality outputs
- Acceptance tests are catching issues (good!)
- Model degradation

**Fixes**:
- Investigate correction patterns
- Add failing cases to golden dataset
- Consider model upgrade or fine-tuning

### Drift is increasing

**Possible causes**:
- Model version changed
- Upstream data distribution changed
- Golden dataset is no longer representative

**Fixes**:
- Re-baseline evals if intentional change
- Refresh golden dataset
- Investigate upstream changes

---

## Summary

The Agent Scorecard is your **single source of truth** for agent health. Use it to:

- **Track** performance week-over-week
- **Decide** promotion/demotion based on evidence
- **Debug** issues quickly with clear metrics
- **Communicate** agent value to leadership

**Keep scorecards versioned in Git, automate generation, and review them religiously.**

---

## Download

Full template available at: **[Your URL]**

Includes:
- YAML template
- Python/TypeScript instrumentation examples
- Dashboard JSON (Grafana/Datadog)
- CI/CD examples

