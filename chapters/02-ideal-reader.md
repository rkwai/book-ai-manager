---
title: "The Ideal Reader & How to Use This Book"
author: "Rick Wong"
date: "2025-10-06"
chapter: 2
keywords: ["ICP", "engineering management", "product management", "agent manager", "AgentOps", "people first"]
---

# Chapter 2
## The Ideal Reader & How to Use This Book

---

## Who This Is For

This book is written for **e-leaders** in product development—anyone directly responsible for **outcomes and value delivery**:

- **Engineering Managers** and **Team Leads**: You own the delivery, the culture, and the people. With agents, you now also own the agent portfolio.
- **Staff and Principal Engineers**: You're accountable for technical outcomes across systems. Agents are tools in your kit, not replacements for judgment.
- **Product Managers**: You define what's valuable and ensure it gets built. Agents help you execute faster—but you still own the "why" and the acceptance criteria.
- **Program Managers**: You coordinate cross-functional initiatives. Agents can reduce coordination overhead, but someone still needs to own the outcome.

If your organization builds software—or uses PM/Eng/Design to deliver value—this book is for you.

### The New Reality: Using Agents Is a Requirement

In today's world, **using agents is not optional**. Your competitors are already leveraging them. Your customers expect faster iteration. Your CFO wants better margins.

But here's the thing: **agents don't manage themselves**. They need:
- Clear goals and acceptance criteria.
- Context that's right-sized and fresh.
- Observability so you can see what they're doing.
- Promotion and demotion based on evidence, not vibes.

If you're an e-leader, you're now also an **agent manager**.

---

## Assumptions

This book assumes you already care about the **right things**:

### 1. You Care About Business Outcomes, Not Output Theater

You know the difference between:
- **Output**: "We shipped 47 PRs this sprint."
- **Outcome**: "We reduced onboarding time from 45 minutes to 13 minutes, increasing activation rate by 18 points."

Agents amplify both. Your job is to ensure they amplify **outcomes**.

### 2. You Will Own What Agents Ship

**No unreviewed agent output reaches customers.** This is non-negotiable.

Agents draft. Agents suggest. Agents even auto-merge in bounded scenarios. But **you own the outcome**. If an agent ships a bug, it's your bug. If an agent violates a policy, it's your policy failure.

This is why **Outcome Ownership** (Chapter 3) is the master key.

### 3. You'll Adopt AgentOps Basics

To manage agents responsibly, you need:
- **A registry**: versioned, with owners, scopes, and acceptance criteria.
- **Evals**: golden datasets, thresholds, drift checks.
- **HITL (Human in the Loop)**: gates at customer-visible surfaces, irreversible ops, and policy changes.
- **Scorecards**: Tokens per Task, Autonomous Accept Rate, Escalation Rate, Correction Rate, Cost per Outcome.

We'll cover these in depth in **Chapter 8: AgentOps**, but you need to commit to the discipline. Agents without ops are liabilities, not assets.

---

## People First (Still)

The original *8 Things to Know for New Tech Leaders* emphasized **people first**. That hasn't changed.

### With Agents, It's Still About People

Here's a truth that might surprise you: **managing agents requires the same skills as managing people**.

Both humans and agents need:
- **Clear goals**: What does success look like? What are the acceptance criteria?
- **Context**: What's the current state? What are the constraints? What are the adjacent systems?
- **Access to support**: Who do they escalate to? What's the runbook?
- **Guidance with autonomy**: Constraints that guide without over-constraining improvement.

The best people managers already do this. The best agent managers do it too—they just apply it to a portfolio that includes humans *and* agents.

### The Shift: From Managing People to Leading Outcomes

With agents handling execution, your role shifts from **managing work** to **guaranteeing outcomes**.

You're no longer spending hours reviewing every line of code or every design iteration. Instead, you're:
- Defining what "good" looks like (acceptance tests, rubrics, taste).
- Curating Context Packs so agents (and humans) have the right knowledge.
- Running AgentOps reviews to promote, maintain, or demote agents based on evidence.
- Making trade-offs between cost, latency, quality, and safety.
- Building trust—with your team and with stakeholders—through consistent, evidence-based decisions.

**This is still people-first leadership.** The people are your team. The agents are tools your team uses to amplify their impact.

---

## How to Read This Book

### Three Reading Paths

#### Path A: New to Management
**Start here**: Chapters 1–5 (Foundation)  
**Why**: You need the mindset before the tactics. Outcome Ownership, life balance, trust, and care are the foundation. Even if you're not managing humans yet, you'll be managing agents—and the principles are the same.

**Then**: Chapters 6–8 (Agent Operating System)  
**Why**: Inversion of Control, T-shaped agents, and AgentOps are the infrastructure. You need these before diving into execution.

**Finally**: Skim Part IV (Execution) and focus on **Chapter 15: P→P→S** and **Chapter 17: Meetings → Outcomes → Tools**. These will help you translate ideas into shipped outcomes.

#### Path B: Experienced Manager, New to Agents
**Start here**: Chapter 3 (Outcome Ownership), Chapter 6 (Inversion of Control), Chapter 8 (AgentOps)  
**Why**: These three chapters ground you in the operating model. If you already know how to manage people, these show you how agents fit.

**Then**: Chapters 12–14 (Business Model, OKRs, Metrics)  
**Why**: You already know these concepts—now adapt them for agents. Agent-backed KRs, Cost per Outcome, and Agent Scorecards.

**Finally**: Skim the rest for reinforcement. Use the **Appendices** as drop-in templates.

#### Path C: Already Running Agent Portfolios
**Start here**: Skim Part I for alignment, then dive into Chapters 8–14.  
**Why**: You're already doing this. These chapters refine your practice with scorecards, promotion criteria, and OKR architecture.

**Use heavily**: The **Appendices**. Copy the templates, adapt them to your context, and iterate.

### Use the Templates Inline

Throughout this book, you'll see YAML and Markdown templates for:
- Agent Design Briefs
- Context Packs
- Registry Entries
- Agent Scorecards
- OKR Cascades
- P→P→S Workshops
- Decision Logs

**Copy them. Adapt them. Use them.**

They're not theoretical—they're field-tested patterns that work.

### Use the Bonus Pack (Appendices)

The appendices are full, working implementations:
- **Appendix A**: Agent Scorecard Template & Usage Guide
- **Appendix B**: Registry Entry Template & MCP Integration
- **Appendix C**: OKR Examples (Company → Division → Team → Agent)
- **Appendix D**: P→P→S Checklist
- **Appendix E**: JIRA & Tooling Setup (Classic Reference)

Each appendix includes:
- **Purpose**: Why this artifact matters.
- **How to use**: Step-by-step guide.
- **Examples**: 2–3 realistic, annotated examples.
- **Integration**: How it fits into the overall system.

---

## What You'll Need (Optional: For Local AgentOps Setup)

**The concepts in this book apply whether you use a managed agent platform or build your own.** If you manage people, you already understand outcome ownership, measurement, and trust—the same principles apply to agents.

**This section is only relevant if you're setting up AgentOps infrastructure yourself.** Many teams use existing platforms (cloud providers, startups, or internal tools). If that's you, skip ahead—Chapter 8 will still be valuable for understanding what to measure and how to manage.

**If you are running agents locally or building custom infrastructure**, here's what you'll need. Don't worry—none of this is complicated, and we'll walk you through it in **Chapter 8: AgentOps**.

### 1. A Code/Doc Repo for Artifacts
Store your:
- **Context Packs**: focused knowledge bundles with TTL and refresh rules.
- **Design Briefs**: agent purpose, scope, acceptance tests, guardrails.
- **Eval harnesses**: golden datasets, thresholds, policy tests.
- **Runbooks**: escalation paths, rollback procedures, RACI.

Use Git. Version everything. Make it PR-based. This ensures auditability and prevents "doc drift."

### 2. A Dashboard to Track Agent Performance
You need to see:
- **Tokens per Task** (p50/p95) by model and tool.
- **Autonomous Accept Rate**: % of outputs acceptable without HITL.
- **Escalation Rate**: % of tasks that paged a human.
- **Correction Rate**: % of outputs requiring human correction.
- **Cost per Outcome**: total cost / accepted outcomes.
- **Latency p95**: time per task.
- **Safety pass %**: policy tests passed.
- **Drift %**: eval delta vs. baseline.

Tools like Datadog, Grafana, or even a custom dashboard in Streamlit work fine. The key is **visibility**.

### 3. A Decision Log (Append-Only)
Every time you make a decision (promote an agent, change a threshold, kill a project), log it:
- **What** was decided.
- **Why** (what evidence or trade-off drove the decision).
- **Who** owns follow-up actions.
- **When** the decision was made.

Append-only means you never delete. If you change your mind, you add a new entry. This creates **traceability** and helps you learn from past decisions.

### 4. A Tool/Agent Registry
Track every agent (and critical tool) in a versioned registry:
- **Purpose**: What does it do?
- **Owner**: Who's accountable?
- **Scope**: What can it access?
- **Autonomy level**: Draft-only, Suggest-PR, Scenario-Auto, Metric-Auto?
- **Acceptance tests**: How do we know it's working?
- **Policy tests**: PII redaction, secret scanning, prompt/response rules?
- **Observability**: Traces, dashboards, scorecards.
- **Changelog**: What's changed and when?

YAML in Git works great. A DB with an API works too. Just make sure it's versioned and PR-gated.

---

## What This Book Won't Cover

To keep this book focused, we're **not** covering:
- **How to build or fine-tune models**: This is a management book, not an ML engineering book.
- **Specific agent frameworks**: LangChain, CrewAI, AutoGPT, etc. These change too fast. The principles here apply regardless of your stack.
- **Prompt engineering deep-dives**: We'll cover **Context Engineering** (how to scope and package knowledge), but we won't debug your prompts.
- **Legal and compliance details**: We'll emphasize policy tests and safety, but you need to consult your legal and compliance teams for specifics.

---

## The Ideal Customer Profile (ICP)

Let's be explicit about who this book is for—and who it's not for.

### This Book Is For You If:
- You're an **engineering leader** (EM, Staff/Principal, Architect) who realizes agents are changing the game.
- You're a **product manager** who needs to ship faster without losing quality.
- You're a **program manager** coordinating cross-functional work and want agents to reduce coordination overhead.
- You **already manage people** and want to extend those skills to managing agents.
- You care about **business outcomes**, not just outputs.
- You're willing to adopt **AgentOps** basics (registry, evals, HITL, scorecards).

### This Book Is NOT For You If:
- You're looking for a **technical guide** to building or fine-tuning LLMs.
- You want **vendor comparisons** or tool recommendations that will be outdated in six months.
- You believe agents will "just work" without management discipline.
- You're not responsible for outcomes—you're just following orders.

---

## A Word on Expectations

### Agents Are Not Magic

Agents are tools. Powerful tools, but tools nonetheless. They will:
- Make mistakes.
- Drift over time.
- Require tuning and maintenance.
- Need clear goals and context to be effective.

**Your job is to manage them responsibly.** That means evals, observability, HITL, and constant improvement.

### Expectations Are Rising

With agents, the bar for "good enough" rises. Your customers will expect:
- Faster iteration.
- Higher quality (because agents can run more tests, generate more docs, catch more edge cases).
- Lower prices (because your cost per outcome drops).

This is both an opportunity and a pressure. The organizations that adopt agents **and** manage them well will win. Those that use agents carelessly will create technical debt at scale.

---

## Let's Get Started

You're here because you know agents are changing the game. You want to lead effectively—with humans and agents—and deliver outcomes that matter.

The principles haven't changed: care about people, understand business value, maintain quality, build trust.

The tools have changed. This book shows you how to use them.

Let's go.

---

## Change Log

- **2025-10-06**: Updated for agent era. Emphasized people-first philosophy remains; added agent-specific requirements (registry, evals, HITL, scorecards).

