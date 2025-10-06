---
title: "The T-Shaped Human & the T-Shaped Agent"
subtitle: "Why 'A-shaped' is wrong"
author: "Rick Wong"
date: "2025-10-06"
chapter: 7
keywords: ["t-shaped", "skill matrix", "taste", "craft", "agents", "orchestration", "sub-agents", "interfaces", "context packs", "autonomy ladder"]
---

# Chapter 7
## The T-Shaped Human & the T-Shaped Agent

> **Humans**: T-shaped = broad upstream/downstream understanding + deep domain expertise.  
> **Agents**: must also be **T-shaped**—deep tools/context for their task **and** awareness of upstream producers and downstream consumers. No "A-shaped" agent.  
> **Complementarity**: Agents execute deeply within interfaces; humans supply **taste** and make durable decisions.  
> **Architecture**: Today favors **sub-agents** (focused attention) with orchestration; "super-agent" may return later, but **focus (attention)** is the constraint right now.

---

An individual has a varied array of skills and passions. Knowing what those are is important when aligning individuals with what they are most fit for.

In the original *8 Things to Know for New Tech Leaders*, I introduced **the T of each individual**—the idea that engineers grow **deep** (specialized in a domain) and **broad** (understanding adjacent systems).

In the agent era, **both humans and agents must be T-shaped**. The myth of the "A-shaped agent"—infinitely deep with no breadth—is wrong and dangerous.

---

## T-Shaped, Precisely

### Human (T)

**Broad**: Understand upstream/downstream systems, stakeholder needs, constraints, and trade-offs.

**Deep**: Mastery in a domain (e.g., reliability, data modeling, mobile UI, performance).

**Meta**: **Taste** (what great looks like), acceptance-test thinking, incident sensemaking, C4 fluency.

If we look at the skill sets related to technology, it is easy to see how some skills are related to each other. Lining up the technical skills that are needed to take a business idea to reality, it would go in this order: business development, product marketing, product design, front-end implementation, back-end implementation, infrastructure.

An individual normally starts off in one of these verticals and will grow into their neighboring specialties. As the person gains more experience, some of that experience will take them deeper into a specific vertical, while others will push them outside of their specialty. In every scenario, the growth is expected, encouraged, and supported.

### Agent (T)

**Deep**: Equipped with the **right tools** (APIs, repos, scripts) and **Context Packs** (focused knowledge, acceptance tests, error taxonomy) to produce its specific outcomes.

**Broad**: Knows the **producers** of its inputs and the **consumers** of its outputs (adjacent tasks/agents), with contracts and quality expectations.

> Agents execute; **humans curate and guarantee**. Taste remains human-led, with agents improving craft via evals and feedback loops.

---

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

**Why this matters**: If an agent doesn't know its upstream producers, it can't validate inputs. If it doesn't know its downstream consumers, it can't guarantee output quality. The result is brittle systems and surprise failures.

---

## Human ⇄ Agent Complementarity

- **Humans**: set outcomes, decide trade-offs, define acceptance tests, and apply **taste**.
- **Agents**: perform the deep, specific execution against those tests, fast and repeatably.
- **Orchestrator** (human or coordination agent): sequences sub-agents, enforces policy tests, aggregates traces.

As engineering leads, one of our primary responsibilities is to know where our team members stand, what their passions are, where they want to grow into, and to make sure they have that opportunity when it arises.

Individuals will never stop growing, and the environments that we create should always have that in mind. Growing wide, into different verticals, or growing deep, becoming more specialized, is not as important as long as the individual is growing. The value the business will realize, in either scenario, is measurable.

**The same applies to agents.** As agents grow their T, they:
- **Deepen**: More sophisticated tools, refined Context Packs, stricter eval thresholds.
- **Broaden**: Add adjacent interfaces (one step upstream or downstream), never random scope expansion.

---

## Skill Matrices (Concise)

### Humans (hire/develop)

- Taste & critique; acceptance-test thinking
- Incident sensemaking; resilience patterns
- Diagramming (C4); clear writing & runbooks
- Eval literacy; policy/safety basics
- Tool registry mindset (MCP-style), least privilege

### Agents (provision/instrument)

- Tooling: exact APIs, sandboxes, repos, fixtures
- Context Packs: minimal, fresh, task-specific knowledge
- Evals: golden datasets, thresholds, drift alarms
- Autonomy: level, gates, rollback/runbook
- Interfaces: producers/consumers + contracts

---

## Growth Paths

### Human grows their T

**Broaden**: learn adjacent systems; cross-functional comms.

**Deepen**: harder problems in domain; develop exemplars.

**Magnify taste with agents**: use agents to surface options, contrasts, and counterexamples; you decide.

### Agent grows its T

**Improve deep craft**: tools upgraded; Context Packs refined; eval thresholds lifted.

**Broaden responsibly**: add **adjacent** interfaces (one step upstream/downstream).

**Graduate autonomy** via the ladder (see Chapter 6), only after stability.

Individuals who grow broadly will be able to tie the different aspects of the businesses together to create connections and streamlines that have not existed before. Individuals who grow deeper will push the boundaries of what they know and will take the company along with them, unlocking new and unimagined opportunities.

As long as our teams grow, the company's growth will be ensured.

---

## Sub-Agents vs. Super-Agent (Today's Trade-off)

**Sub-agents**: Focused attention and bounded context → higher precision and simpler guarantees. Orchestration overhead exists but is **manageable** with traces and policy tests.

**Super-agent**: Attractive long-term, but today struggles with **attention/focus** and governance; context overload reduces quality.

**Heuristic**: Start with sub-agents specialized by **outcome slice**; only fuse scopes when evals show stable, additive gains.

**Why sub-agents win today**:
- **Attention is the constraint**: Agents with focused scope perform better than agents with sprawling context.
- **Simpler guarantees**: It's easier to write acceptance tests for "classify import errors" than "handle all onboarding issues."
- **Clearer rollback**: If one sub-agent fails, you can isolate and fix without breaking the whole system.

---

## Exemplars (Pairings)

### Staff Engineer + Codegen PR Copilot

- **Human**: owns outcome "Reduce p95 latency on service S by 30%."
- **Agent**: proposes PRs with perf patches + tests; Autonomy L2 (Suggest-PR).
- **Acceptance**: latency budget met; zero regression tests failing; cost p95 ≤ target.
- **Review**: human taste decides architecture acceptability.

### PM + Research/Insight Agent

- **Human**: defines decision memo template and acceptance for "useful insight."
- **Agent**: pulls metrics, runs comparisons, drafts memo; Autonomy L1 (Draft-only).
- **Acceptance**: cites sources; passes rubric for clarity, relevance, and bias checks.

---

## Templates (Drop-in)

### Agent T-Shape Card (YAML)

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

### Human T-Shape Growth Snippet

```
Outcome: Checkout reliability p95 → 99.3%
Deep Focus: idempotency & retries
Breadth: billing gateway & client error taxonomy
Taste Practice: weekly exemplar reviews + critique notes
Agent Portfolio: triage bot (L3), PR copilot (L2)
Milestones: new golden dataset v2; autonomy review; runbook R2
```

---

## Anti-Patterns

### "A-shaped" Myth
Pretending agents can go infinitely deep without upstream/downstream awareness. This creates brittle integrations and surprise failures.

### Unlimited Tools/Context
Monolithic super-agent with fuzzy purpose. Agents with access to everything and unclear goals will drift and cause incidents.

### Taste Abdication
Shipping agent output without human curation. If you can't critique the result, don't ship it.

### Interface Amnesia
Agents that don't publish producer/consumer contracts. This creates hidden dependencies and makes the system impossible to reason about.

---

## Summary

Make **both humans and agents T-shaped**. Equip agents with **deep tools and tight Context Packs**, plus **clear interfaces** to neighbors. Let humans expand breadth and supply **taste**.

Today, **sub-agents** win because attention is the bottleneck; orchestrate them well and grow autonomy by evidence—not vibes.

The T-shaped model applies to:
- **Hiring**: Look for breadth + depth potential.
- **Development**: Provide opportunities to grow both dimensions.
- **Agent design**: Deep tools + upstream/downstream awareness.
- **Portfolio management**: Orchestrate sub-agents; don't build monoliths.

**As long as your teams—human and agent—continue to grow their T, the company's growth will be ensured.**

---

## Change Log

- **2025-10-06**: Rewrote the chapter to define T-shaped agents (no "A-shaped"); merged original "The T of each individual" with agent-specific matrices, pairings, templates, and sub-agent guidance.

