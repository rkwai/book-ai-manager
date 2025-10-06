---
title: "The T‑Shaped Human & the T‑Shaped Agent (why “A‑shaped” is wrong)"
subtitle: "Agent Management Edition"
author: "Rick Wong"
date: "2025-10-06"
slug: "08-the-t-and-a"
keywords: ["t-shaped","skill matrix","taste","craft","agents","orchestration","sub-agents","interfaces","context packs","autonomy ladder"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (responses)**  
> • **Humans**: T‑shaped = broad upstream/downstream understanding + deep domain expertise.  
> • **Agents**: must also be **T‑shaped**—deep tools/context for their task **and** awareness of upstream producers and downstream consumers. No “A‑shaped” agent.  
> • **Complementarity**: Agents execute deeply within interfaces; humans supply **taste** and make durable decisions.  
> • **Architecture**: Today favors **sub‑agents** (focused attention) with orchestration; “super‑agent” may return later, but **focus (attention)** is the constraint right now.

## T‑Shaped, Precisely
**Human (T)**  
- **Broad**: Understand upstream/downstream systems, stakeholder needs, constraints, and trade‑offs.  
- **Deep**: Mastery in a domain (e.g., reliability, data modeling, mobile UI, performance).  
- **Meta**: **Taste** (what great looks like), acceptance‑test thinking, incident sensemaking, C4 fluency.

**Agent (T)**  
- **Deep**: Equipped with the **right tools** (APIs, repos, scripts) and **Context Packs** (focused knowledge, acceptance tests, error taxonomy) to produce its specific outcomes.  
- **Broad**: Knows the **producers** of its inputs and the **consumers** of its outputs (adjacent tasks/agents), with contracts and quality expectations.

> Agents execute; **humans curate and guarantee**. Taste remains human‑led, with agents improving craft via evals and feedback loops.

## Producer–Consumer Mapping (Upstream/Downstream)
Every agent must publish its **interfaces** and neighbors.

```
Agent: Import-Triage
Deep Scope: CSV import errors (component X)
Upstream Producers: Web uploader, ETL pre-checks
Downstream Consumers: Ticketing bot, PR Copilot, Activation dashboard
Inputs: Error logs, sample rows, schema map
Outputs: Classified error, suggested fix/PR, escalation decision
Acceptance: ≥95% correct classification on golden dataset; false-page ≤5%
Autonomy: Level 3 (Scenario-Auto)
```

## Human ⇄ Agent Complementarity
- **Humans**: set outcomes, decide trade‑offs, define acceptance tests, and apply **taste**.  
- **Agents**: perform the deep, specific execution against those tests, fast and repeatably.  
- **Orchestrator** (human or coordination agent): sequences sub‑agents, enforces policy tests, aggregates traces.

## Skill Matrices (Concise)
**Humans (hire/develop)**
- Taste & critique; acceptance‑test thinking  
- Incident sensemaking; resilience patterns  
- Diagramming (C4); clear writing & runbooks  
- Eval literacy; policy/safety basics  
- Tool registry mindset (MCP‑style), least privilege

**Agents (provision/instrument)**
- Tooling: exact APIs, sandboxes, repos, fixtures  
- Context Packs: minimal, fresh, task‑specific knowledge  
- Evals: golden datasets, thresholds, drift alarms  
- Autonomy: level, gates, rollback/runbook  
- Interfaces: producers/consumers + contracts

## Growth Paths
**Human grows their T**  
- Broaden: learn adjacent systems; cross‑functional comms.  
- Deepen: harder problems in domain; develop exemplars.  
- **Magnify taste with agents**: use agents to surface options, contrasts, and counterexamples; you decide.

**Agent grows its T**  
- Improve deep craft: tools upgraded; Context Packs refined; eval thresholds lifted.  
- Broaden responsibly: add **adjacent** interfaces (one step upstream/downstream).  
- **Graduate autonomy** via the ladder (see Ch.07), only after stability.

## Sub‑Agents vs. Super‑Agent (Today’s Trade‑off)
- **Sub‑agents**: Focused attention and bounded context → higher precision and simpler guarantees. Orchestration overhead exists but is **manageable** with traces and policy tests.  
- **Super‑agent**: Attractive long‑term, but today struggles with **attention/focus** and governance; context overload reduces quality.

**Heuristic**: Start with sub‑agents specialized by **outcome slice**; only fuse scopes when evals show stable, additive gains.

## Exemplars (Pairings)
**Staff Engineer + Codegen PR Copilot**  
- Human: owns outcome “Reduce p95 latency on service S by 30%.”  
- Agent: proposes PRs with perf patches + tests; Autonomy L2 (Suggest‑PR).  
- Acceptance: latency budget met; zero regression tests failing; cost p95 ≤ target.  
- Review: human taste decides architecture acceptability.

**PM + Research/Insight Agent**  
- Human: defines decision memo template and acceptance for “useful insight.”  
- Agent: pulls metrics, runs comparisons, drafts memo; Autonomy L1 (Draft‑only).  
- Acceptance: cites sources; passes rubric for clarity, relevance, and bias checks.

## Templates (Drop‑in)
**Agent T‑Shape Card (YAML)**
```yaml
name: Import-Triage
owner: jane.doe
purpose: Classify import errors and propose fixes
deep_scope:
  code_area: services/importer/*
  tools: [read_logs, run_tests, open_pr]
context_packs:
  - Import-Triage-v3  # C4 (component), error taxonomy, edge cases, runbook
upstream: [web_uploader, etl_precheck]
downstream: [ticket_bot, pr_copilot, activation_dashboard]
acceptance:
  classification_accuracy: ">= 95%"
  false_page_rate: "<= 5%"
autonomy_level: 3  # Scenario-Auto
policy_tests: [pii_redaction, secret_scan]
rollback: revert_to_last_good
```

**Human T‑Shape Growth Snippet**
```
Outcome: Checkout reliability p95 → 99.3%
Deep Focus: idempotency & retries
Breadth: billing gateway & client error taxonomy
Taste Practice: weekly exemplar reviews + critique notes
Agent Portfolio: triage bot (L3), PR copilot (L2)
Milestones: new golden dataset v2; autonomy review; runbook R2
```

## Anti‑Patterns
- **“A‑shaped” myth**: pretending agents can go infinitely deep without upstream/downstream awareness.  
- **Unlimited tools/context**: monolithic super‑agent with fuzzy purpose.  
- **Taste abdication**: shipping agent output without human curation.  
- **Interface amnesia**: agents that don’t publish producer/consumer contracts.

## Summary
Make **both humans and agents T‑shaped**. Equip agents with **deep tools and tight Context Packs**, plus **clear interfaces** to neighbors. Let humans expand breadth and supply **taste**. Today, **sub‑agents** win because attention is the bottleneck; orchestrate them well and grow autonomy by evidence—not vibes.

## Change Log
- 2025-10-06: Rewrote the chapter to define T‑shaped agents (no “A‑shaped”); added matrices, pairings, templates, and sub‑agent guidance.
