---
title: "My Experiences Through This Space (2015–2025 Addendum)"
subtitle: "Agent Management Edition"
author: "Rick Wong"
date: "2025-10-06"
slug: "03-experience"
keywords: ["ai agents","agent management","greenfield vs brownfield","RAG","vector databases","C4 diagrams","documentation","observability","HITL"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (responses)**  
> • 2024: Took focused time off to understand AI deeply—direction and day‑to‑day leverage.  
> • Speed of change invalidates knowledge monthly; early insights went obsolete in 6 months.  
> • RAG & vector DBs evolved rapidly; context windows and search‑style agents changed the calculus.  
> • Greenfield: 100× ideation/iteration gains are real; Brownfield: unmanaged generation becomes a **liability**.  
> • Accountability and **taste** are non‑negotiable—humans must understand enough to critique.  
> • Signature loop: (1) Generate what you understand → (2) Leverage AI to understand first → (3) Leverage AI to generate.  
> • Practical deployments: Slack + Observability (Datadog/Sentry) as context, repo access, self‑provisioning envs.  
> • Belief shift: AI can do **more** and **less** than expected—scope determines both; humans still guarantee outcomes.  
> • Documentation is newly tractable and higher‑leverage; **C4** is useful for humans and agents.

## What Changed Fast (and Why It Matters)
- **Vector databases** moved from a bespoke decision to a **capability inside mainstream data stores**. Still useful, but no longer the architectural centerpiece.  
- **RAG** (Retrieval‑Augmented Generation) shifted from “make or break” to **situational** as **context windows grew** and agents improved at **live search/navigation**:  
  1) Chunking; 2) Storage; 3) Retrieval; 4) Sorting; 5) Weighing; 6) Context injection.  
  For many workflows, **search + consume** at scale now replaces heavy RAG pipelines—*if* the agent has access to the same resources a human would.  
- **Tooling convergence**: Different agent stacks now deliver **similar flows** (plan → call tools → trace → review), reducing lock‑in angst and increasing emphasis on **operational discipline** over vendor choice.

## What Stayed True (and Will Keep Being True)
- **Outcome ownership doesn’t move.** The deployer owns the impact; agents don’t self‑certify acceptability.  
- **Understanding precedes leverage.** To critique quality, you must first **close your knowledge gap**.  
- **Taste wins.** High standards and the ability to discern “good vs great” remain the moat.  
- **HITL is essential** until metrics prove safety and reliability.  
- **Documentation compounds.** Lower creation/consumption costs make docs a durable advantage.

## Greenfield vs Brownfield (Two Realities)
- **Greenfield**: Agents create **order‑of‑magnitude speed** in ideation, prototyping, and iteration—100× is not hyperbole when scope is narrow and stakes are low.  
- **Brownfield/Enterprise**: Unreviewed generation becomes a **liability**—it multiplies cleanup, risk, and confusion. Curate aggressively and **review before anything enters the ecosystem**.

## Signature Framework — *Understand → Generate (Loop)*
A practical loop that codifies accountability and taste:
1. **Generate what you understand.** If you can’t explain the task and acceptance, don’t delegate it to an agent.  
2. **Leverage AI to understand first.** Use agents to **teach you**: summarize systems, surface unknowns, map trade‑offs, and propose acceptance criteria.  
3. **Leverage AI to generate.** Only after you can **critique** the result should the agent produce artifacts (code, docs, configs) for review/HITL sign‑off.

> *Corollary*: Never ship work you can’t critique end‑to‑end.

## Deployments That Worked
- **Context Bridging via Slack + Observability**  
  Treat **Slack** (front of system: users, support, team signal) and **Datadog/Sentry** (end of system: logs, traces, errors) as **first‑class context**.  
  Agents that see **both** sides, plus **read‑only repo access**, resolve issues with higher fidelity and speed.  
- **Self‑Provisioning Dev Environments**  
  Agents spin up working sandboxes, run tests, and propose PRs. **HITL review** remains the quality gate.  
- **Documentation as an Operating System**  
  Agents co‑create and maintain docs; teams standardize on **C4** to express systems across **multiple granularities** (Context → Container → Component → Code). Docs serve **humans and agents**.

## Belief Shifts (2021 → 2025)
- *Then*: RAG is mandatory. → *Now*: **RAG is situational**; search‑style agents + larger contexts often suffice.  
- *Then*: Agents will “fill my knowledge gap.” → *Now*: **They won’t**; they make you faster **after** you understand.  
- *Then*: Vendor/tooling choice is the main decision. → *Now*: **Operations, guardrails, and acceptance** are the main decisions.  
- *Then*: Code generation equals progress. → *Now*: **Curated, reviewed, and instrumented** generation equals progress.

## Case Snapshot (Anonymized)
**Company**: Small, high‑performing product org of senior engineers.  
**Approach**: Early and open‑minded on AI; deployed agents across Slack, observability, and repo access; agents also spun up dev envs.  
**Result**: High leverage on triage and iteration speed; **quality still hinged on human critique**.  
**Lesson**: It’s easy to reach “medium” by default. To reach **top‑tier quality**, enforce **curation and HITL**; don’t let agents set the bar—**leaders do**.

## Documentation: The Quiet Superpower
Historically, documentation suffered from **high creation cost** and **high consumption cost**. Today:
- Agents reduce both costs—**drafting**, **updating**, **finding**, and **summarizing** are cheap.  
- **C4** keeps diagrams aligned to audience granularity (org leaders ↔ engineers ↔ agents).  
- Maintain one **shared doc graph** that’s useful to **humans and agents**; create agent‑only pages sparingly when necessary.

## Philosophy: “Scope is Everything”
AI can do **more** and **less** than expected—both truths depend on scope. In the near term, humans must still **guarantee business outcomes**. Over time, as systems understanding scales, agents will produce **larger units** (pages → apps → systems → businesses) with guarantees. Until then, leaders steer.

## One‑Paragraph Thesis
> **Incorporate agents into how *you* work before you wire them into company DNA.** Use them to **understand deeply** first; never ship outputs you don’t fully grasp. Accountability, taste, and acceptance tests are the bridge from fast output to reliable outcomes.

## Change Log
- 2025-10-06: New addendum capturing 2024–2025 lessons; RAG/vector DB evolution; greenfield vs brownfield realities; Slack/Observability deployments; documentation & C4; belief shifts; operating thesis.
