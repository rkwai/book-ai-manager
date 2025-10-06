---
title: "Appendix B — Registry Entry Template & MCP Integration"
author: "Rick Wong"
date: "2025-10-06"
keywords: ["registry", "MCP", "tool registry", "agent registry", "templates"]
---

# Appendix B
## Registry Entry Template & MCP Integration

This appendix provides the complete Tool/Agent Registry template referenced in Chapters 8 and 16, along with guidance on MCP (Model Context Protocol) integration and federation patterns.

---

## Full Registry Entry Template (YAML)

```yaml
capability: import-triage
type: agent
version: 1.7.3
owner: activation-team
on_call: jane.doe@company.com
created: 2025-06-01
updated: 2025-09-15

purpose: >
  Classify CSV import errors into taxonomy (E1/E2/E3);
  propose fixes via PRs for E2 errors;
  escalate E1 and E3 per policy;
  reduce TTFR (time-to-first-response) for import failures.

will_do:
  - classify_errors_into_taxonomy
  - open_prs_in_module_importer_X
  - annotate_tickets_with_triage_notes
  - escalate_per_runbook

wont_do:
  - modify_ci_config
  - touch_billing_systems
  - write_to_prod_data
  - merge_without_review

autonomy_level: 3                     # scenario-auto
promoted_from: 2
promoted_date: 2025-09-01

permissions:
  - repo:read:services/importer/*
  - repo:write:services/importer/module_X
  - logs:read:importer
  - slack:write:channel_activations
  
interfaces:
  input_schema: import_error_event_v3
  output_schema: triage_decision_v2
  upstream_producers:
    - web_uploader
    - etl_precheck
  downstream_consumers:
    - ticket_bot
    - pr_copilot
    - activation_dashboard

context_packs:
  - name: import-triage-v3
    ttl_days: 30
    owner: activation-team
    last_refresh: 2025-09-10
    contains:
      - c4_diagram_component_level
      - error_taxonomy_e1_e2_e3
      - top_10_csv_edge_cases
      - runbook_v2
      - escalation_policy
      - tool_scopes

acceptance_tests:
  - name: accuracy
    threshold: ">= 95%"
    dataset: golden-v2
  - name: false_page_rate
    threshold: "<= 5%"
  - name: coverage
    threshold: "all E1/E2/E3 represented"

policy_tests:
  - pii_redaction_v3
  - secret_scan_v2
  - prompt_injection_guard
  - response_toxicity_filter

observability:
  traces: enabled
  retention_days: 30
  dashboards:
    - /dash/onboarding/import-triage
    - /dash/agentops/portfolio
  scorecard: /scorecards/import-triage
  alerts:
    - drift_over_2pct_14d
    - safety_failure
    - cost_spike_p95

economics:
  token_budget_usd_p95: 0.02
  latency_p95_ms: 800
  cost_per_outcome_baseline: 0.018

governance:
  change_control: "PR + security review"
  audit_cadence: monthly
  audit_last: 2025-09-01
  audit_next: 2025-10-01
  deprecation_policy: "60d notice with fixtures and migration guide"

endpoints:
  rest_api: https://agents.company.com/import-triage/v1
  grpc: agents.company.svc:443/import-triage
  events:
    subscribe: kafka://import-triage.decisions
    publish: kafka://import-triage.escalations

sla:
  availability: "99.5%"
  p95_latency_ms: 800
  support_hours: "24x7"

documentation:
  readme: git://org/agents/import-triage/README.md
  runbook: git://org/agents/import-triage/RUNBOOK.md
  examples: git://org/agents/import-triage/examples/

changelog:
  - date: 2025-09-15
    version: 1.7.3
    changes: "Added 50 new edge cases; bumped acceptance to 95%"
    impact: "AAR +3pts"
  
  - date: 2025-09-01
    version: 1.7.0
    changes: "Promoted from L2 to L3"
    impact: "ER reduced from 12% to 7%"
  
  - date: 2025-08-15
    version: 1.6.0
    changes: "Expanded Context Pack with runbook v2"
    impact: "Drift reduced by 1.2pts"

deprecation:
  replaces: legacy-import-classifier
  sunset_date: null
  migration_guide: null
```

---

## Registry Governance Rules

### 1. Adding a New Agent

**Process**:
1. Create registry entry YAML
2. Open PR to registry repo
3. Required reviews:
   - **Security** (permissions, policy tests)
   - **Data** (PII handling, retention)
   - **Platform** (observability, SLAs)
   - **Product** (purpose alignment with OKRs)
4. Merge = agent goes live

### 2. Changing an Existing Agent

**Process**:
1. Update registry entry YAML
2. Open PR with **diff clearly shown**
3. Same review requirements as new agent
4. Announce change in `#agent-registry-changes` channel
5. Consumers have 7 days to comment before merge

### 3. Deprecating an Agent

**Process**:
1. Set `deprecation.sunset_date` (minimum 60 days out)
2. Provide `deprecation.migration_guide`
3. Notify all `downstream_consumers`
4. Monitor usage; ensure consumers migrate
5. After sunset date, **archive** (don't delete immediately)

---

## MCP Integration

MCP (Model Context Protocol) is an emerging standard for tool/agent registries. Here's how to wire your registry to MCP:

### Basic MCP Compatibility

```yaml
# mcp-config.json
{
  "registry_url": "https://registry.company.com/mcp",
  "capabilities": [
    {
      "id": "import-triage",
      "type": "agent",
      "version": "1.7.3",
      "endpoints": {
        "invoke": "https://agents.company.com/import-triage/v1",
        "schema": "https://registry.company.com/schemas/import-triage-v1"
      },
      "metadata": {
        "owner": "activation-team",
        "autonomy_level": 3,
        "sla_p95_ms": 800
      }
    }
  ],
  "authorization": {
    "type": "bearer_token",
    "scopes": ["read:agents", "invoke:agents:import-triage"]
  }
}
```

### Discovery API

Expose your registry via REST API:

```bash
# List all capabilities
GET /api/v1/capabilities

# Get specific capability
GET /api/v1/capabilities/import-triage

# Search by tag/owner
GET /api/v1/capabilities?owner=activation-team&autonomy_level=3

# Get capability schema
GET /api/v1/capabilities/import-triage/schema
```

### Example Response

```json
{
  "capability": "import-triage",
  "version": "1.7.3",
  "type": "agent",
  "owner": "activation-team",
  "purpose": "Classify CSV import errors...",
  "endpoints": {
    "rest": "https://agents.company.com/import-triage/v1",
    "grpc": "agents.company.svc:443/import-triage"
  },
  "schema": {
    "input": "import_error_event_v3",
    "output": "triage_decision_v2"
  },
  "sla": {
    "availability": "99.5%",
    "p95_latency_ms": 800
  },
  "metadata": {
    "autonomy_level": 3,
    "cost_per_outcome_usd": 0.018,
    "last_updated": "2025-09-15T10:30:00Z"
  }
}
```

---

## Federation Patterns

When multiple teams run their own agent registries:

### 1. Central Registry

One canonical registry; all teams publish there.

**Pros**: Single source of truth, easy discovery  
**Cons**: Potential bottleneck, single point of failure

### 2. Federated Registries

Each team runs its own registry; central index aggregates.

**Pros**: Team autonomy, scalability  
**Cons**: Discovery complexity, version conflicts

### 3. Hybrid (Recommended)

Central registry for **cross-team** capabilities; team registries for **internal** agents.

**Structure**:
```
Central Registry
├── import-triage (activation-team)
├── fraud-screen (fraud-team)
└── payment-processor (payments-team)

Team Registries
├── activation-team/
│   ├── internal-import-helper
│   └── internal-data-synth
├── fraud-team/
│   ├── internal-ml-pipeline
│   └── internal-feature-eng
```

---

## Templates for Common Scenarios

### Prototyper Agent (Branch-Only)

```yaml
capability: ui-prototype-builder
type: agent
version: 0.1.0
owner: product-prototyping
purpose: "Build throwaway UI flows for learning experiments"
autonomy_level: 3
branch_only: true
permissions:
  - repo:write:experiments/*
  - no_prod_access: true
will_do:
  - scaffold_ui_components
  - mock_api_responses
wont_do:
  - merge_to_main
  - access_prod_data
context_packs:
  - prototype-design-system-v1
acceptance_tests:
  - usability_sessions_without_blocker: ">= 5"
observability:
  traces: disabled  # throwaway work
economics:
  token_budget_usd_p95: 0.50  # higher tolerance for prototypes
```

### Productizer Agent (Staged Rollout)

```yaml
capability: spec-to-pr
type: agent
version: 2.1.0
owner: platform-eng
purpose: "Convert PRDs and design specs into PRs with tests"
autonomy_level: 2
permissions:
  - repo:write:services/*
  - ci:trigger
will_do:
  - generate_code_from_spec
  - generate_tests
  - open_pr_for_review
wont_do:
  - merge_without_approval
  - skip_tests
context_packs:
  - coding-standards-v2
  - design-system-v3
acceptance_tests:
  - spec_compliance_rubric: ">= 90%"
  - test_coverage_delta: ">= +10%"
rollout:
  strategy: feature_flag
  flag_name: spec_to_pr_enabled
  rollout_pct: 20
```

### Platform Agent (Policy-Gated)

```yaml
capability: reliability-guardian
type: agent
version: 3.2.1
owner: sre-team
purpose: "Auto-mitigate incidents within policy; ensure SLOs"
autonomy_level: 4
permissions:
  - infra:read:*
  - infra:write:scaling
  - logs:read:*
will_do:
  - scale_services_within_policy
  - trigger_safe_rollbacks
  - page_oncall_for_novel_incidents
wont_do:
  - delete_data
  - modify_security_rules
context_packs:
  - slo-definitions-v4
  - runbooks-all
  - threat-model-v2
policy_tests:
  - scaling_within_budget
  - no_destructive_ops
  - audit_trail_complete
observability:
  traces: enabled
  audit_retention_days: 365
economics:
  cost_per_mitigation_usd: 0.05
  mttr_target_minutes: 15
```

---

## Summary

A well-maintained registry is the **foundation of agent governance**. It provides:

- **Discoverability**: Teams can find and use agents
- **Accountability**: Every agent has an owner
- **Observability**: Dashboards and traces linked
- **Safety**: Policy tests enforced
- **Economics**: Costs tracked

**Keep your registry in Git, enforce PR-based changes, and review it monthly.**

---

## Download

Full templates available at: **[Your URL]**

Includes:
- Registry entry YAML templates
- MCP integration examples
- Federation setup guides
- Governance workflows

