---
title: "Appendix C — OKR Examples: Company to Agent"
author: "Rick Wong"
date: "2025-10-06"
keywords: ["OKRs", "examples", "agent-backed KRs", "AgentOps"]
---

# Appendix C
## OKR Examples: Company to Agent

This appendix provides complete OKR cascades from company level down to agent-level AgentOps sheets, as referenced in Chapter 13.

---

## Example 1: Self-Serve Activation

### Company OKRs (Tool-Agnostic)

```
Objective: Increase profitable activation in self-serve

KR1  Activation AHA-rate ≥ 45% (from 32%)
KR2  Time-to-first-hello-world (TTFHW) ≤ 15 minutes (p95)
KR3  Gross margin ≥ 76% while activation scales
KR4  Support first-response time ≤ 2 minutes (p95)
```

**Note**: No mention of agents. Leadership sees business outcomes only.

---

### Division OKRs (Activation Team)

```
Objective: Shorten setup and reduce support load for onboarding

KR1  Onboarding completion rate ≥ 70% (agent-backed)      # internal flag
KR2  Tickets per 100 new accounts ≤ 2.0
KR3  First-response ≤ 120s (p95), CSAT ≥ 4.6/5            # agent-backed
KR4  Cost per successful onboarding ≤ $0.40               # visible to company
```

**Note**: Some KRs are agent-backed (internal label only). Company sees KR4 (cost).

---

### Internal AgentOps Sheet (KR1: Onboarding Completion)

```yaml
kr: Onboarding completion rate ≥ 70%
owner: jane.doe@company.com
quarter: 2025-Q4

agents:
  - name: import-triage
    level: 3
    purpose: "Classify CSV import errors; propose fixes"
    contribution: "Reduces import failures by 18 pts"
  
  - name: spec-to-pr
    level: 2
    purpose: "Generate sample integration code for new users"
    contribution: "Increases hello-world success by 12 pts"

acceptance_tests:
  - completion_correctness_on_golden: ">= 95%"
  - false_escalation_rate: "<= 5%"
  - integration_code_compiles: "100%"

observability:
  dashboards:
    - /dash/activation/onboarding
    - /dash/agentops/activation-portfolio
  metrics_tracked:
    - success_rate
    - cost_p95
    - latency_p95
    - safety_pass_pct
    - drift_pct
  traces: enabled
  retention_days: 30

controls:
  hitl_gates:
    - customer_visible_surfaces
    - irreversible_operations
  auto_rollback: enabled
  policy_tests:
    - pii_redaction_v3
    - secret_scan_v2
    - prompt_injection_guard

reviews:
  weekly: "15min AgentOps review; check scorecards"
  monthly: "Autonomy ladder review; promote/demote decisions"
  quarterly: "Portfolio rationalization; align with company OKRs"

cost_accounting:
  cost_per_outcome_baseline: 2.40     # human-only baseline
  cost_per_outcome_current: 0.38      # with agents
  savings_per_quarter_usd: 18_420
  visibility: company_scorecard        # cost savings bubble up
```

---

### Internal AgentOps Sheet (KR3: First-Response & CSAT)

```yaml
kr: First-response ≤ 120s (p95), CSAT ≥ 4.6/5
owner: support-lead@company.com
quarter: 2025-Q4

agents:
  - name: triage-bot
    level: 3
    purpose: "Instant triage of support tickets; annotate with likely cause"
    contribution: "Reduces TTFR from 8m to 90s"
  
  - name: macro-suggester
    level: 2
    purpose: "Suggest macros and KB articles to support agents"
    contribution: "Increases first-contact resolution by 22 pts"

acceptance_tests:
  - triage_accuracy_on_golden: ">= 95%"
  - macro_relevance_rubric: ">= 90%"
  - false_page_rate: "<= 3%"

observability:
  dashboards:
    - /dash/support/triage
    - /dash/support/csat
  metrics_tracked:
    - ttfr_p95
    - csat_7d_rolling
    - escalation_rate
    - correction_rate
    - tokens_per_ticket
  traces: enabled

controls:
  hitl_gates:
    - customer_communications
    - account_changes
  escalation_policy: "After 2 failed attempts, page human"
  policy_tests:
    - pii_redaction_v3
    - tone_professionalism_check

reviews:
  daily: "5min scan of triage accuracy and CSAT deltas"
  weekly: "AgentOps review; tune Context Packs"
  monthly: "Autonomy review; compare to SLA"

cost_accounting:
  cost_per_ticket_baseline: 4.50       # human-only
  cost_per_ticket_current: 0.22        # with agents
  savings_per_quarter_usd: 42_300
  visibility: division_scorecard        # support sees; company sees aggregate
```

---

## Example 2: Product Velocity

### Company OKRs

```
Objective: Accelerate product delivery without sacrificing quality

KR1  Lead time (commit-to-deploy) ≤ 24 hours (p95)
KR2  Defect escape rate ≤ 0.5%
KR3  Test coverage ≥ 85% on critical paths
KR4  Deployment success rate ≥ 99.5%
```

---

### Division OKRs (Platform Engineering)

```
Objective: Reduce lead time while maintaining reliability

KR1  PR review-to-merge time ≤ 4 hours (p95)             # agent-backed
KR2  Test coverage on new code +≥ 10% per sprint         # agent-backed
KR3  Flaky test rate ≤ 2%
KR4  Cost per deployed feature ≤ $12                      # visible to company
```

---

### Internal AgentOps Sheet (KR1: PR Review Time)

```yaml
kr: PR review-to-merge time ≤ 4 hours (p95)
owner: platform-em@company.com
quarter: 2025-Q4

agents:
  - name: pr-reviewer
    level: 2
    purpose: "Annotate PRs with style/lint/test feedback"
    contribution: "Reduces back-and-forth by 40%"
  
  - name: auto-approver
    level: 3
    purpose: "Auto-approve low-risk PRs (docs, config tweaks)"
    contribution: "Reduces human review load by 25%"

acceptance_tests:
  - feedback_relevance_rubric: ">= 90%"
  - false_positive_block_rate: "<= 2%"
  - auto_approve_safety: "zero regressions in 90d"

observability:
  dashboards:
    - /dash/platform/pr-velocity
    - /dash/agentops/pr-agents
  metrics_tracked:
    - pr_cycle_time_p95
    - human_review_time_saved_hrs
    - rework_rate
    - safety_pass_pct

controls:
  hitl_gates:
    - changes_to_ci_cd
    - schema_migrations
    - security_sensitive_files
  auto_rollback: enabled
  policy_tests:
    - lint_rules_v2
    - test_coverage_threshold
    - secret_scan_v2

reviews:
  weekly: "AgentOps review; tune auto-approve whitelist"
  monthly: "Expand whitelist if metrics stable"

cost_accounting:
  cost_per_pr_baseline: 18.00          # human time
  cost_per_pr_current: 3.20            # with agents
  savings_per_quarter_usd: 67_200
  visibility: company_scorecard
```

---

### Internal AgentOps Sheet (KR2: Test Coverage)

```yaml
kr: Test coverage on new code +≥ 10% per sprint
owner: qa-lead@company.com
quarter: 2025-Q4

agents:
  - name: test-generator
    level: 2
    purpose: "Generate unit tests for untested code paths"
    contribution: "Adds 200+ tests per sprint; coverage +12 pts"
  
  - name: flake-hunter
    level: 3
    purpose: "Detect and quarantine flaky tests"
    contribution: "Reduces flake rate from 5% to 1.8%"

acceptance_tests:
  - test_correctness: "100% compile and pass"
  - coverage_contribution: "+≥ 10%"
  - flake_detection_precision: ">= 90%"

observability:
  dashboards:
    - /dash/qa/coverage
    - /dash/qa/flakiness
  metrics_tracked:
    - coverage_delta_per_sprint
    - tests_generated_per_agent
    - flake_rate_7d_rolling

controls:
  hitl_gates:
    - tests_for_critical_paths
    - tests_that_modify_schemas
  policy_tests:
    - test_isolation_check
    - no_hardcoded_secrets

reviews:
  weekly: "Review coverage deltas and flake quarantine list"
  monthly: "Autonomy review; consider promoting test-generator to L3"

cost_accounting:
  cost_per_test_baseline: 12.00        # human-written
  cost_per_test_current: 0.18          # agent-generated
  savings_per_quarter_usd: 54_800
  visibility: division_scorecard
```

---

## Example 3: Revenue Growth

### Company OKRs

```
Objective: Grow ARR by 30% with healthy unit economics

KR1  Net Revenue Retention (NRR) ≥ 115%
KR2  Sales cycle ≤ 45 days (p50)
KR3  Customer Acquisition Cost (CAC) ≤ $8,000
KR4  Gross margin ≥ 78%
```

---

### Division OKRs (Sales & Marketing)

```
Objective: Accelerate pipeline velocity and reduce CAC

KR1  Qualified leads per week ≥ 50                        # agent-backed
KR2  Lead-to-MQL conversion ≥ 18%                         # agent-backed
KR3  Cost per qualified lead ≤ $120                       # visible to company
KR4  Sales rep productivity +≥ 25% (meetings booked/rep)
```

---

### Internal AgentOps Sheet (KR1 & KR2: Lead Generation & Qualification)

```yaml
kr: Qualified leads per week ≥ 50; Lead-to-MQL ≥ 18%
owner: marketing-ops@company.com
quarter: 2025-Q4

agents:
  - name: lead-enricher
    level: 2
    purpose: "Enrich leads with firmographics and intent signals"
    contribution: "Increases MQL rate by 8 pts"
  
  - name: lead-scorer
    level: 3
    purpose: "Score leads; route high-intent to sales immediately"
    contribution: "Reduces sales time on low-intent by 40%"

acceptance_tests:
  - enrichment_accuracy: ">= 95%"
  - scoring_precision: ">= 90%"
  - false_positive_mql_rate: "<= 5%"

observability:
  dashboards:
    - /dash/marketing/lead-quality
    - /dash/sales/pipeline-velocity
  metrics_tracked:
    - leads_enriched_per_week
    - mql_rate
    - cost_per_lead
    - sales_accepted_lead_rate

controls:
  hitl_gates:
    - high_value_accounts (>$50k ARR potential)
  policy_tests:
    - gdpr_compliance_check
    - no_scraped_data_without_consent

reviews:
  weekly: "Lead quality review with sales"
  monthly: "Tune scoring model based on closed-won data"

cost_accounting:
  cost_per_lead_baseline: 180.00       # manual enrichment
  cost_per_lead_current: 8.40          # with agents
  savings_per_quarter_usd: 128_400
  visibility: company_scorecard         # CAC reduction visible
```

---

## Summary

These examples show how OKRs cascade from **tool-agnostic company level** down to **agent-backed division KRs** with **internal AgentOps sheets**.

**Key patterns**:
- Company OKRs: No agent mentions
- Division OKRs: Some KRs are agent-backed (internal label)
- AgentOps Sheets: Full instrumentation, observability, and cost accounting
- Cost & Savings: Bubble up to company scorecard

**Download**: Full OKR templates available at **[Your URL]**

