---
title: "Appendix E — JIRA & Tooling Setup (Classic Reference)"
author: "Rick Wong"
date: "2025-10-06"
keywords: ["JIRA", "tooling", "classic management", "workflow"]
---

# Appendix E
## JIRA & Tooling Setup (Classic Reference)

This appendix preserves content from the original *8 Things to Know for New Tech Leaders* on JIRA and classic tooling setup. While agents can now handle much of this workflow, the principles remain useful—especially for teams just starting their agent journey.

---

## Why This Still Matters

JIRA (or similar project management tools) remains the **system of record** for work. Even when agents generate tickets, update statuses, or triage issues, humans need a clear workflow.

**In the agent era**:
- Agents can **create** tickets based on incidents or user feedback
- Agents can **triage** and add context to tickets
- Agents can **link** tickets to PRs, deployments, and metrics
- Humans still **own** the outcome and **approve** resolutions

---

## Classic JIRA Setup (Pre-Agent Era)

From the original book:

### Workflow States

```
Backlog → Ready → In Progress → In Review → Done
```

**Backlog**: Ideas and requests not yet prioritized.

**Ready**: Approved and scoped; ready for development.

**In Progress**: Actively being worked on.

**In Review**: Code complete; awaiting review/test.

**Done**: Shipped to production; accepted by stakeholders.

### Board Setup

**Columns**:
- Backlog
- Ready (This Sprint)
- In Progress
- In Review
- Done

**Swim Lanes**:
- Blocked
- Urgent
- Regular

### Ticket Types

- **Epic**: Large initiative (e.g., "Self-Serve Onboarding")
- **Story**: User-facing feature (e.g., "As a user, I want to import CSV data")
- **Task**: Technical work not tied to user story (e.g., "Refactor importer module")
- **Bug**: Defect (e.g., "Import fails for files > 10MB")
- **Spike**: Research/investigation (e.g., "Evaluate vector DB options")

### Estimation

Use **Story Points** (Fibonacci: 1, 2, 3, 5, 8, 13) to estimate complexity, not hours.

**Why**: Points abstract uncertainty and team velocity. Hours create false precision.

---

## Agent-Era Enhancements

### 1. Agent-Created Tickets

Agents can monitor errors, user feedback, and metrics to auto-create tickets:

```yaml
# Example: Triage bot creates ticket from error spike
ticket:
  type: bug
  title: "Import failures spiked 40% for CSV files > 5MB"
  description: |
    Detected via Sentry alert at 2025-10-06 10:30 UTC.
    Affected users: 42 (28% of imports in last hour).
    Error: "Memory limit exceeded during parse."
    Suggested fix: Increase memory allocation or stream parse.
  labels:
    - agent-created
    - import
    - sev2
  assignee: oncall-activation
  links:
    - sentry: https://sentry.io/issue/12345
    - dashboard: https://dash.company.com/import-health
```

**Human action**: Review ticket, confirm priority, assign owner.

### 2. Agent-Enhanced Triage

Agents can add context to existing tickets:

```yaml
# Example: Triage agent annotates ticket
annotation:
  ticket_id: PROJ-1234
  agent: import-triage
  context_added:
    - "Similar to PROJ-1156 (resolved 2025-09-15)"
    - "Affects only CSV files with non-UTF-8 encoding"
    - "Suggested runbook: /runbooks/import-encoding-fix"
    - "Cost impact: $42/day if unresolved"
  suggested_actions:
    - "Apply fix from PROJ-1156"
    - "Add encoding detection to pre-checks"
    - "Update Context Pack with encoding edge cases"
```

**Human action**: Decide whether to accept suggestions, adjust scope, or escalate.

### 3. Agent-Linked PRs

Agents can open PRs and link them to tickets:

```yaml
# Example: Agent opens PR and links
pr:
  title: "[PROJ-1234] Add encoding detection to CSV importer"
  description: |
    Fixes PROJ-1234.
    
    Changes:
    - Add chardet library for encoding detection
    - Pre-check encoding before parse
    - Fallback to UTF-8 if detection fails
    
    Tests:
    - Added 10 test cases for non-UTF-8 files
    - All existing tests pass
    
    Agent: spec-to-pr (L2)
    Human review required before merge.
  jira_link: PROJ-1234
  reviewers: [jane.doe, eng-lead]
```

**Human action**: Code review, approve/request changes, merge.

---

## Updated Workflow with Agents

```
Backlog (agent-monitored)
  ↓
Ready (agent-triaged, human-prioritized)
  ↓
In Progress (agent-assisted)
  ├─ Agent opens draft PR
  ├─ Agent generates tests
  └─ Human reviews & refines
  ↓
In Review (agent-annotates, human-approves)
  ├─ Agent checks policy tests
  ├─ Agent runs evals
  └─ Human approves for merge
  ↓
Done (agent-updates dashboards)
  ├─ Agent links to deployment
  ├─ Agent updates metrics
  └─ Human confirms acceptance
```

---

## Metrics to Track

### Classic Metrics

- **Velocity**: Story points completed per sprint
- **Cycle Time**: Time from "In Progress" to "Done"
- **Lead Time**: Time from "Backlog" to "Done"
- **Throughput**: Tickets completed per week
- **Work In Progress (WIP)**: Number of tickets "In Progress" at any time

### Agent-Era Additions

- **Agent Contribution %**: Tickets where agents did >50% of work
- **Human Review Time**: Time spent reviewing agent outputs
- **Agent-Created Ticket Quality**: % of agent tickets that are accepted as-is
- **Escalation Rate**: % of agent work that required human intervention
- **Cost per Ticket**: Including agent costs (tokens, evals, ops)

---

## JIRA Automation with Agents

### Example 1: Auto-Triage on Creation

```yaml
# JIRA automation rule
trigger: issue_created
conditions:
  - labels_contain: "import"
actions:
  - call_agent:
      agent: import-triage
      action: annotate_ticket
  - add_comment: "Triaged by import-triage agent. Review suggested actions."
  - notify: oncall-activation
```

### Example 2: Auto-Link PRs

```yaml
# JIRA automation rule
trigger: pr_opened
conditions:
  - pr_title_contains: "[PROJ-"
actions:
  - extract_ticket_id_from_title
  - link_pr_to_ticket
  - transition_ticket_to: "In Review"
  - add_comment: "PR opened by agent: [link]"
```

### Example 3: Auto-Close on Deploy

```yaml
# JIRA automation rule
trigger: deployment_success
conditions:
  - environment: "production"
actions:
  - find_linked_tickets
  - transition_tickets_to: "Done"
  - add_comment: "Deployed to production at [timestamp]"
  - call_agent:
      agent: metrics-updater
      action: update_dashboards
```

---

## Classic Tips (Still Valid)

### 1. Keep Tickets Small

Large tickets (>13 points) should be split. Agents can help break down epics into stories:

**Prompt**: "Break this epic into 5–8 user stories, each <5 points."

### 2. Write Clear Acceptance Criteria

Every ticket should have **acceptance criteria**. Agents can draft them:

**Prompt**: "Generate acceptance criteria for this story: [description]"

Example output:
```
Given a user uploads a CSV file with non-UTF-8 encoding
When the import is triggered
Then the system detects the encoding
And converts to UTF-8 before parsing
And imports successfully without errors
```

### 3. Link Related Tickets

Agents can suggest links:

**Prompt**: "Find tickets related to PROJ-1234 based on description similarity."

### 4. Use Labels Wisely

Labels help filter and search. Common labels:
- `agent-created`
- `agent-assisted`
- `needs-human-review`
- `sev1`, `sev2`, `sev3`
- `security`, `performance`, `ux`

### 5. Review Closed Tickets

Weekly, review "Done" tickets to ensure:
- Acceptance criteria were met
- No regressions introduced
- Metrics improved
- Follow-ups created

---

## Tool Integrations (Agent-Era)

### Slack ↔ JIRA

Agents can post updates to Slack when tickets change:

```yaml
# Slack integration
on_ticket_transition:
  from: "In Review"
  to: "Done"
  action:
    post_to_slack:
      channel: "#eng-updates"
      message: "✅ [PROJ-1234] CSV encoding fix deployed. Impact: 28% import success increase."
```

### GitHub ↔ JIRA

Agents can link commits and PRs to tickets automatically:

```yaml
# GitHub integration
on_commit:
  if_message_contains: "PROJ-"
  action:
    - extract_ticket_id
    - add_commit_link_to_ticket
    - add_comment: "Commit [hash] by [author]"
```

### Datadog/Sentry ↔ JIRA

Agents can create tickets from incidents:

```yaml
# Sentry integration
on_error_spike:
  threshold: "40% increase in 15 minutes"
  action:
    - create_jira_ticket:
        type: bug
        severity: sev2
        agent: triage-bot
    - notify: oncall
```

---

## Anti-Patterns (Still Relevant)

### 1. Too Much WIP

**Problem**: 20 tickets "In Progress" simultaneously.

**Fix**: Limit WIP to 2–3 per person. Finish before starting.

### 2. Stale Tickets

**Problem**: Tickets sitting "In Review" for weeks.

**Fix**: Set SLA (e.g., 48 hours) and auto-escalate.

### 3. No Acceptance Criteria

**Problem**: "Done" means different things to different people.

**Fix**: Require acceptance criteria on every ticket. Agents can draft them.

### 4. Epic Bloat

**Problem**: Epics that never close because scope keeps expanding.

**Fix**: Time-box epics (e.g., 1 quarter). Anything beyond that is a new epic.

### 5. Status Theater

**Problem**: Updating tickets without actual progress.

**Fix**: Tie status to code/deployments. Agents can auto-update.

---

## Summary

JIRA (or similar tools) remains the system of record, but agents can:
- **Create** tickets from incidents and feedback
- **Triage** and add context
- **Open PRs** and link them
- **Update statuses** based on deployments
- **Generate** acceptance criteria and breakdowns

**Humans still own the outcome.** Agents make the process faster and more consistent.

---

## Download

Classic JIRA setup guide and agent integration examples available at: **[Your URL]**

Includes:
- Workflow templates
- Automation rules
- Integration configs (Slack, GitHub, Sentry)
- Ticket templates

