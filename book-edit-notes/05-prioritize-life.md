---
title: "Prioritize Life, Before Anything Else"
subtitle: "Agent Management Edition"
author: "Rick Wong"
date: "2025-10-06"
slug: "05-prioritize-life"
keywords: ["work-life balance","burnout","ai agents","escalations","right-to-disconnect","deep work","craft","agentops"]
language: "en"
copyright: "© 2025 Rick Wong"
---

> **Author Intake (responses)**  
> • Agents take on the **mundane, valuable, non‑energizing** work; humans focus on **craft and growth**.  
> • Proper leverage reduces hours *or* reduces **burnout risk** by removing tedium.  
> • Design **escalation boundaries**: agents work nonstop, escalate when needed; humans choose *when* to be pinned.  
> • Leaders remain reachable like C‑levels—but **well‑designed systems** keep escalations rare.  
> • Burnout is real; agents help by turning mundane work into **understand → systemize → operationalize**.  
> • Adopt agents into **how you work** first, then into the company DNA.

## Why Balance Is More Achievable with Agents
- Agents offload the **tedious, repetitive, context‑gathering** parts of work.  
- Humans spend time on **taste, critique, design, and decisions**—the energy‑producing parts.  
- Output increases while **cognitive load** concentrates on **meaningful** problems.

> **Operating mindset**: *Let agents run; let humans steer.*

## Boundaries by Design (Escalations & Quiet Hours)
Agents can work 24/7; humans shouldn’t. Balance emerges from **explicit escalation design**.

**Set the rules:**
- **Quiet hours**: No agent pings outside on‑call or pre‑agreed windows.  
- **Escalation thresholds** (examples):  
  - **Sev1**: customer‑impacting outage or irreversible data risk → page **immediately** (24/7).  
  - **Sev2**: degraded experience or rising error rate w/ mitigations → **business‑hours** page to owner.  
  - **Sev3**: anomalies, cost drift, or quality dips → **daily digest**; review in AgentOps stand‑up.  
- **Ack & abort**: If the human acks with a deferral emoji/command, the agent:  
  1) **Contains** (revert to last‑good),  
  2) **Logs** traces + context,  
  3) **Queues** a review task for the next window.

**Scheduling pattern:**
- **Agent‑review windows** (2×/day, ~15–20 min) to triage escalations and approve queued changes.  
- **Deep‑work blocks** (1–2×/day, 60–90 min) with **agent notifications muted**.  
- **On‑call rotations** for agent portfolios, separate from human production on‑call when possible.

## Rituals That Protect Humans (and Improve Outcomes)
- **Daily (15 m)**: AgentOps stand‑up (incidents, eval deltas, cost/latency SLOs).  
- **Twice daily (20 m)**: Escalation triage windows.  
- **Weekly (60 m)**: Portfolio review—scale/kill; adjust thresholds; update runbooks.  
- **Monthly (60–90 m)**: Burnout & load review—escalations per person, after‑hours pages, context debt.  
- **Quarterly**: Autonomy ladder audit (what can graduate from HITL? what must roll back?).

## Burnout Watchlist (Early Signals)
- **Escalation spam**: high false positives from agents.  
- **Infinite backlog**: agent‑generated tasks without owner capacity.  
- **Novelty chase**: switching stacks weekly; no stabilization period.  
- **Context debt**: stale docs; rising handoffs; unclear acceptance.  
- **Alert fatigue**: tokens/cost/latency spikes paired with off‑hours paging.

**Mitigations**
- Raise **acceptance thresholds**; tighten policy tests to reduce noise.  
- Cap **agent‑generated backlog**; require owner approval to schedule.  
- Commit to **stabilization sprints** after major changes.  
- Enforce **docs‑as‑default** (C4, runbooks, acceptance tests).  
- Institute **right‑to‑disconnect**: only Sev1 breaches after hours.

## Life‑First Norms (Team Policy Snippets)
- **Right‑to‑disconnect** outside on‑call windows.  
- **No unreviewed agent output** to customer surfaces.  
- **Meeting hygiene**: default async updates; synchronous for decisions and design reviews.  
- **Quality over quantity**: accepted, instrumented outcomes beat raw output metrics.  
- **Time‑boxed experimentation**: guardrails for pilots; a path to kill or scale.

## Agent‑Assist for Balance (What to Automate vs. Keep Human)
**Automate (strongly recommended):**
- Calendar triage & focus‑block protection.  
- Meeting capture → action items with owners/due dates.  
- Documentation drafting and indexing (C4 summaries, runbook updates).  
- Observability digests (success/cost/latency/safety).  
- “Nudge” checks: stale PRs, missing acceptance tests, policy gaps.

**Keep Human (never fully delegate):**
- Values and culture signals (promotions, performance calls).  
- Final sign‑off for **customer‑impacting** changes.  
- Prioritization trade‑offs when data conflicts.  
- Incident leadership and public post‑mortem narratives.

## Escalation Matrix (Template)
```
Severity | Example                                     | When to Page        | Channel     | Owner Role      | Agent Action (pre‑page)
---------|---------------------------------------------|---------------------|-------------|-----------------|------------------------
Sev1     | Outage/irreversible data risk               | 24/7 immediately    | PagerDuty   | EM/Incident Cmd | Revert to last‑good; freeze changes
Sev2     | Degradation with mitigations in place       | Business hours      | Slack @owner| Agent Owner     | Throttle; log traces; prepare summary
Sev3     | Quality/cost/latency drift; anomalies       | Daily digest        | #agentops   | Portfolio Owner | Aggregate; link eval deltas & PRs
Info     | Model/tool updates; policy changes          | Weekly review       | #agentops   | All             | Annotate dashboards; propose tests
```

## One Practical Boundary to Start Today
Pick **two 20‑minute agent triage windows** per day and turn **all agent pings off** outside those windows unless **Sev1**. You’ll reclaim focus without losing control.

## Summary
Agents let us **work less on the mindless** and **more on the meaningful**. Balance is not passive; it’s designed: escalation thresholds, quiet hours, rituals, and a clear split between what agents automate and what humans own. This is how we **grow the craft** and the org—without burning out.

## Change Log
- 2025-10-06: New chapter draft—balance via explicit escalation design, burnout watchlist, life‑first policies, and agent‑assist patterns.
