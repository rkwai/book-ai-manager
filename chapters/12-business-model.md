---
title: "Know the Business Model (Agent-Era Edition)"
subtitle: "Agents amplify—but only when aligned to business outcomes"
author: "Rick Wong"
date: "2025-10-06"
chapter: 12
keywords: ["business model canvas", "unit economics", "pricing", "packaging", "agentops", "kpis", "ltv", "cac", "token costs", "per-outcome SLA"]
---

# Chapter 12
## Know the Business Model

> • **Business Model Canvas** is the core lens.  
> • In the age of agents, this is *more* important so agents know what to optimize.  
> • Agents can watch, aggregate, and partner on improving **each business metric**.

---

There is a large ecosystem of business skills that a good engineering leader needs to be proficient in. One of them is the business model. This is how the company makes its money.

For leadership, an awareness of how their work impacts the company bottom line, and the various levers within that model, is critical. This needs to be one of the top filters for all decisions. **It's not enough to understand how the model works; we should understand how to positively impact all aspects of the model.**

---

## Why the Business Model Matters More with Agents

Agents amplify output—but only help the business when their work **improves a business model**. Make the model **explicit** so agents can optimize *the right thing*, and so humans can **guarantee outcomes**.

Your model is a system **inside a larger system** (market, partners, regulation); agents must be instrumented to that system.

---

## One-Page Refresher — Business Model Canvas (BMC)

The Business Model Canvas is a strategic management template for developing new business models and documenting existing ones. It offers a visual chart with elements describing a firm's value proposition, infrastructure, customers, and finances.

### The Nine Building Blocks

1. **Customer Segments** — who you serve.
2. **Value Proposition** — pains solved & gains created.
3. **Channels** — how you reach customers.
4. **Customer Relationships** — support, success, expansion.
5. **Revenue Streams** — how money flows in.
6. **Key Resources** — people, data, models, infra, capital.
7. **Key Activities** — what you do repeatedly to create value.
8. **Key Partners** — vendors, platforms, compliance bodies.
9. **Cost Structure** — what money is spent on.

> **Agent rule**: Tie every agent to one or more **BMC blocks** with **clear acceptance tests and business metrics**.

---

## Agent Instrumentation per BMC Block

### Customer Segments
**Insight Agent**: segments users, detects cohorts, flags misclassification.  
**AC**: precision/recall on golden dataset ≥ 95%.

### Value Proposition
**Research/Discovery Agent**: compiles top jobs-to-be-done evidence.  
**AC**: insight rubric ≥ 90%, sources linked.

### Channels
**Acquisition Agent**: iterates creatives/landing variants.  
**AC**: cost-per-qualified-lead (CPQL) ↓, channel experiment scorecards green.

### Customer Relationships
**Success/Triage Agent**: resolves issues, drafts macros.  
**AC**: first-response < 2m, CSAT ↑, escalation ≤ 5%.

### Revenue Streams
**Pricing/Packaging Agent**: runs price tests & SKUs.  
**AC**: ARPU ↑ without churn spike; guardrails on fairness/compliance.

### Key Resources
**KnowledgeOps Agent**: curates context packs/RAG, freshness SLAs.  
**AC**: doc freshness index ≥ threshold.

### Key Activities
**Spec→PR & Test Agents**: throughput ↑ while defects ↓.  
**AC**: coverage delta +≥ 10%, escape rate ↓.

### Key Partners
**Vendor Watch Agent**: monitors API/model changes, costs, SLAs.  
**AC**: alerts before breakages; renegotiation insights.

### Cost Structure
**Cost Governor**: tracks **$/task, $/req, $/agent-hour**.  
**AC**: unit economics within guardrails; anomaly MTTR < target.

---

## Unit Economics with Agents (Concise)

Let **Outcome** be the thing customers pay for (e.g., successful onboarding, solved ticket, generated report).

```
Cost_per_Outcome = (Inference + Context + Tools + Evals + Ops) / Successful_Outcomes
  where:
  Inference = tokens/API$
  Context   = storage + retrieval + prep
  Tools     = API calls, sandboxes, data egress
  Evals     = golden dataset gen + CI runs + red-team
  Ops       = tracing, dashboards, incident time
```

### Margin Impact

```
Gross_Margin  = (Revenue_per_Outcome - Cost_per_Outcome) / Revenue_per_Outcome
Velocity_Gain = Outcomes_per_Period_with_Agents / Outcomes_per_Period_baseline
```

> **Design agents to a business unit**: track **Cost_per_Outcome** and **Velocity_Gain** on the dashboard next to quality/safety.

---

## "Metric Obsession Map" — Assign an Agent to Every Metric

- **Acquisition**: CPL, CPQL, CAC.
- **Activation**: TTFHW (time to first "hello world"), AHA-rate.
- **Retention**: WAU/MAU, cohort decay, NRR.
- **Revenue**: ARPU/ARPA, expansion %, upsell mix.
- **Efficiency**: $/task, $/req, agent success rate, drift rate.
- **Reliability/Safety**: SLOs, policy pass %, incident rate, MTTR.

Each metric gets: **owner (human)**, **watcher (agent)**, **AC/SLO**, **playbook**.

---

## Business Model Canvas → Agent Map (Template)

```yaml
bmc_to_agent_map:
  customer_segments:
    agent: "insight-segmentation"
    acceptance: { cohort_precision: ">= 95%", recall: ">= 92%" }
  value_proposition:
    agent: "discovery-research"
    acceptance: { insight_rubric: ">= 90%" }
  channels:
    agent: "acquisition-iter"
    acceptance: { cpql_delta: "<= -15%", sample_size: ">= 1000" }
  customer_relationships:
    agent: "success-triage"
    acceptance: { first_response_s: "<= 120", csat: ">= 4.6/5" }
  revenue_streams:
    agent: "pricing-packager"
    acceptance: { arpu_delta: ">= +5%", churn_delta: "<= +1%" }
  key_resources:
    agent: "knowledgeops"
    acceptance: { doc_freshness: ">= 0.85", broken_link_rate: "<= 1%" }
  key_activities:
    agent: "spec-to-pr"
    acceptance: { coverage_delta: ">= +10%", escape_rate: "<= 0.3%" }
  key_partners:
    agent: "vendor-watch"
    acceptance: { breakage_alert_lead_time_h: ">= 24" }
  cost_structure:
    agent: "cost-governor"
    acceptance: { cost_per_task_usd: "<= 0.02", anomaly_mttr_min: "<= 30" }
```

---

## Pricing & Packaging (Agent-Era Patterns)

- **Usage-based tied to outcomes**, not tokens (e.g., per successful import, per resolved ticket).
- **Per-outcome SLAs** with credits; agents make SLOs observable.
- **Model-agnostic pricing**: swap models/tools without changing SKU.
- **Safety tier add-ons**: higher guarantees, extra monitoring, longer retention.
- **Fair-use guardrails**: protect margins; rate/cost caps.

---

## Anti-Patterns to Avoid

### "AI Surcharge" Without Value
Price to **outcome**, not to the existence of AI.

### Counting Outputs as Value
Pages of code/docs are not value. **Accepted outcomes** are value.

### Unbounded Context Costs
No TTL on knowledge = escalating costs with no corresponding value.

### Ignoring Eval/Ops Costs
They're part of **Cost_per_Outcome**. Track them.

### Opaque SLAs
If you can't measure it, don't sell it.

---

## 30-60-90 Business Model Tune-Up (with Agents)

### 30 days
Map BMC to agents; define acceptance & dashboards; baseline unit economics.

### 60 days
Run 2–3 pricing/packaging experiments; tighten guardrails; reduce Cost_per_Outcome by 15–25%.

### 90 days
Portfolio review; promote/demote agents; lock per-outcome SLAs; publish updated business model and investment plan.

---

## Summary

Make the **Business Model Canvas** your shared language for humans *and* agents. Wire each block to a **responsible agent + acceptance test**, track **Cost_per_Outcome** and **Velocity_Gain**, and price **per outcome** with clear SLAs.

Agents aren't magic—they're operators inside your business model. Instrument them like you would any critical system, and they'll amplify the right parts of your business.

**Know the model. Instrument the model. Improve the model.**

---

## Change Log

- **2025-10-06**: New chapter—BMC recap, agent mapping, unit economics, pricing patterns, anti-patterns, and a 30-60-90 tune-up plan.

