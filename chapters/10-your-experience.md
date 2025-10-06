---
title: "Your Experience is Your Edge"
subtitle: "2015–2025: What changed, what stayed true"
author: "Rick Wong"
date: "2025-10-06"
chapter: 10
keywords: ["ai agents", "agent management", "greenfield vs brownfield", "RAG", "vector databases", "C4 diagrams", "documentation", "observability", "HITL", "tours of duty"]
---

# Chapter 10
## Your Experience is Your Edge

> • 2024: Took focused time off to understand AI deeply—direction and day-to-day leverage.  
> • Speed of change invalidates knowledge monthly; early insights went obsolete in 6 months.  
> • RAG & vector DBs evolved rapidly; context windows and search-style agents changed the calculus.  
> • Greenfield: 100× ideation/iteration gains are real; Brownfield: unmanaged generation becomes a **liability**.  
> • Accountability and **taste** are non-negotiable—humans must understand enough to critique.  
> • Signature loop: (1) Generate what you understand → (2) Leverage AI to understand first → (3) Leverage AI to generate.  
> • Practical deployments: Slack + Observability (Datadog/Sentry) as context, repo access, self-provisioning envs.  
> • Belief shift: AI can do **more** and **less** than expected—scope determines both; humans still guarantee outcomes.  
> • Documentation is newly tractable and higher-leverage; **C4** is useful for humans and agents.

---

Technology has a special place in organizations as it optimizes and automates, even within the technology department itself. If the organization has no further path to leverage technology for growth, it may be best for the leader to step aside.

The final challenge that a leader can give their team is to allow them to make more critical decisions. As the team automates and optimizes the parts of work they are responsible for, they will start to learn about the work the leader is responsible for.

There will be a time when the only path for them to grow is for the leader to step away so that they can make higher-level decisions—or they will need to find those challenges and opportunities to grow somewhere else.

This strategy is common and the industry has adopted the term **"tours of duty"** to define it. The focus is on the work itself, with an understanding that if the work ends, the position ends as well.

**In the agent era, this principle intensifies.** Your role as a leader is to:
1. **Leverage your decade+ of experience** to define what "good" looks like.
2. **Use agents to amplify** that judgment, not replace it.
3. **Know when to step away** when you're no longer the growth bottleneck.

---

## What Changed Fast (and Why It Matters)

### Vector Databases

Vector databases moved from a bespoke decision to a **capability inside mainstream data stores**. Still useful, but no longer the architectural centerpiece.

**What this means**: You no longer need to build a custom vector DB stack to use agents effectively. Most workflows can use existing datastores + search.

### RAG (Retrieval-Augmented Generation)

RAG shifted from "make or break" to **situational** as **context windows grew** and agents improved at **live search/navigation**:

1. Chunking
2. Storage
3. Retrieval
4. Sorting
5. Weighing
6. Context injection

For many workflows, **search + consume** at scale now replaces heavy RAG pipelines—*if* the agent has access to the same resources a human would.

**What this means**: Don't over-invest in RAG infrastructure. Start simple (search + large context windows) and add RAG only when evidence shows you need it.

### Tooling Convergence

Different agent stacks now deliver **similar flows** (plan → call tools → trace → review), reducing lock-in angst and increasing emphasis on **operational discipline** over vendor choice.

**What this means**: Pick a reasonable stack and get good at **AgentOps** (Chapter 8). The discipline is portable; the tools are not.

---

## What Stayed True (and Will Keep Being True)

### Outcome Ownership Doesn't Move

The deployer owns the impact; agents don't self-certify acceptability. This was true in 2015, it's true today, and it will be true in 2035.

### Understanding Precedes Leverage

To critique quality, you must first **close your knowledge gap**. Agents can help you learn faster, but they can't replace your need to understand.

### Taste Wins

High standards and the ability to discern "good vs great" remain the moat. Agents make "medium" easy. Taste is what gets you to "great."

### HITL is Essential

Until metrics prove safety and reliability, Human-in-the-Loop is non-negotiable.

### Documentation Compounds

Lower creation/consumption costs make docs a durable advantage. The original book emphasized quality and process—documentation is how you scale both.

---

## Greenfield vs Brownfield (Two Realities)

### Greenfield

Agents create **order-of-magnitude speed** in ideation, prototyping, and iteration—**100× is not hyperbole** when scope is narrow and stakes are low.

**Example**: Building a throwaway prototype to test a learning question. Agent scaffolds UI, mocks data, runs tests. You iterate 3 times in one day instead of one iteration per week.

### Brownfield/Enterprise

Unreviewed generation becomes a **liability**—it multiplies cleanup, risk, and confusion. Curate aggressively and **review before anything enters the ecosystem**.

**Example**: Agent generates 47 PRs to "improve test coverage." Without review, 12 of them break CI, 8 add flaky tests, and 3 expose PII. Your team spends a week cleaning up.

**The lesson**: Greenfield tolerates fast iteration and throwaway work. Brownfield demands discipline, HITL, and evals.

---

## Signature Framework — *Understand → Generate (Loop)*

A practical loop that codifies accountability and taste:

### 1. Generate what you understand

If you can't explain the task and acceptance, don't delegate it to an agent.

### 2. Leverage AI to understand first

Use agents to **teach you**: summarize systems, surface unknowns, map trade-offs, and propose acceptance criteria.

### 3. Leverage AI to generate

Only after you can **critique** the result should the agent produce artifacts (code, docs, configs) for review/HITL sign-off.

> **Corollary**: Never ship work you can't critique end-to-end.

**This is your edge.** Agents can generate fast, but they can't (yet) guarantee outcomes. You can.

---

## Deployments That Worked

### Context Bridging via Slack + Observability

Treat **Slack** (front of system: users, support, team signal) and **Datadog/Sentry** (end of system: logs, traces, errors) as **first-class context**.

Agents that see **both** sides, plus **read-only repo access**, resolve issues with higher fidelity and speed.

**Why this works**: Agents have the same context a human incident responder would. They can correlate user reports (Slack) with error spikes (Datadog) and propose fixes (PRs).

### Self-Provisioning Dev Environments

Agents spin up working sandboxes, run tests, and propose PRs. **HITL review** remains the quality gate.

**Why this works**: Reduces setup friction; lets engineers focus on design and review instead of env config.

### Documentation as an Operating System

Agents co-create and maintain docs; teams standardize on **C4** to express systems across **multiple granularities** (Context → Container → Component → Code). Docs serve **humans and agents**.

**Why this works**: C4 diagrams are structured enough for agents to parse and update, yet human-readable. Docs stay fresh without manual toil.

---

## Belief Shifts (2021 → 2025)

### Then: RAG is mandatory. → Now: **RAG is situational**.

Search-style agents + larger contexts often suffice.

### Then: Agents will "fill my knowledge gap." → Now: **They won't**.

They make you faster **after** you understand.

### Then: Vendor/tooling choice is the main decision. → Now: **Operations, guardrails, and acceptance** are the main decisions.

The tools change; the discipline is portable.

### Then: Code generation equals progress. → Now: **Curated, reviewed, and instrumented** generation equals progress.

Volume without quality is technical debt at scale.

---

## Case Snapshot (Anonymized)

**Company**: Small, high-performing product org of senior engineers.

**Approach**: Early and open-minded on AI; deployed agents across Slack, observability, and repo access; agents also spun up dev envs.

**Result**: High leverage on triage and iteration speed; **quality still hinged on human critique**.

**Lesson**: It's easy to reach "medium" by default. To reach **top-tier quality**, enforce **curation and HITL**; don't let agents set the bar—**leaders do**.

---

## Documentation: The Quiet Superpower

Historically, documentation suffered from **high creation cost** and **high consumption cost**. Today:

- Agents reduce both costs—**drafting**, **updating**, **finding**, and **summarizing** are cheap.
- **C4** keeps diagrams aligned to audience granularity (org leaders ↔ engineers ↔ agents).
- Maintain one **shared doc graph** that's useful to **humans and agents**; create agent-only pages sparingly when necessary.

The original book emphasized **process and quality**. Documentation is how you operationalize both at scale.

---

## Philosophy: "Scope is Everything"

AI can do **more** and **less** than expected—both truths depend on scope. In the near term, humans must still **guarantee business outcomes**. Over time, as systems understanding scales, agents will produce **larger units** (pages → apps → systems → businesses) with guarantees. Until then, leaders steer.

---

## Knowing When to Step Away

For leaders, it makes sense to re-evaluate the work left each quarter. As the tour of duty comes to an end, it makes sense to actively determine if it should be extended. Growth is change, and sometimes the leader themselves needs to change their own environment in order to ensure that they grow, along with those in their team.

**In the agent era, this also applies to agents**:
- When an agent is no longer needed (workflow retired, scope absorbed by another agent), **retire it gracefully**.
- When a human has automated themselves out of a role (via agents), **celebrate** and help them find the next growth opportunity.

If the company does not grow and change, then the technology will only need to be maintained and optimized. Letting those who understand the details better, make bigger decisions, is a great way to optimize a situation.

---

## One-Paragraph Thesis

> **Incorporate agents into how *you* work before you wire them into company DNA.** Use them to **understand deeply** first; never ship outputs you don't fully grasp. Accountability, taste, and acceptance tests are the bridge from fast output to reliable outcomes.

**Your experience—your decade of managing teams, handling incidents, making trade-offs, building trust—is your edge.** Agents amplify that experience. They don't replace it.

---

## Summary

The speed of AI change is dizzying. What was cutting-edge 6 months ago is now obsolete. But the **fundamentals don't change**:

- Outcome Ownership
- Taste and craft
- HITL until proven safe
- Documentation as infrastructure
- Understanding before leverage

**Your experience is your edge.** Use agents to amplify it, not abdicate it.

---

## Change Log

- **2025-10-06**: New chapter capturing 2024–2025 lessons; RAG/vector DB evolution; greenfield vs brownfield realities; Slack/Observability deployments; documentation & C4; belief shifts; merged original "Understanding when to step away" and "Be a multiplier: invest before you need" with agent-era operating thesis.

