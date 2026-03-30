---
name: linear-sprint-planner
description: Automates Linear sprint planning including cycle creation, backlog triage,
and task assignment. Use when user says "plan the sprint", "set up the next cycle",
"help me prioritize the backlog", or "create sprint tasks in Linear". Requires Linear
MCP server to be connected.
metadata:
  mcp-server: linear
  version: 1.0.0
---

# Linear Sprint Planner

## Prerequisites

Verify the Linear MCP server is connected. If not available, tell the user to connect
it in their MCP settings before continuing.

## Process

### Step 1: Gather current state

Fetch from Linear in sequence:
1. Current active cycle and completion percentage
2. All backlog issues (status: Backlog or Todo, not assigned to any cycle)
3. Team members and current workload
4. Any issues marked high priority

See [references/linear-api.md](references/linear-api.md) for pagination and rate limit handling.

### Step 2: Analyze capacity

- Count team members participating in the sprint
- Estimate points (default: 10 per person per week unless historical velocity exists)
- Subtract planned time off

Present a summary before proceeding:
Team capacity: - [N] engineers x [X] points = [Total] available - Carrying over: [X] points - Net new capacity: [X] points

### Step 3: Prioritize backlog

Sort in this order:
1. P0/P1 bugs and blockers (always include)
2. Items explicitly flagged by the user
3. Items that unblock other teams
4. Features by product priority
5. Tech debt

Do not exceed capacity by more than 10% unless the user asks.

### Step 4: Present for approval

Before creating anything in Linear, show the proposed plan:
Proposed Sprint [N]: [Date Range] Capacity: [X] points Issues: - [ISSUE-123] Fix payment timeout (P0) - 3 pts - [ISSUE-456] Add CSV export (P2) - 5 pts - [ISSUE-789] Refactor auth middleware - 2 pts Total: [X] / [X] points Shall I create this cycle and assign these issues?
Always wait for confirmation before making changes.

### Step 5: Create and confirm

Once approved:
1. Create the cycle with the agreed date range
2. Add each issue to the cycle
3. Update assignments if the user specified owners
4. Return a summary with the Linear cycle link

See [references/error-handling.md](references/error-handling.md) if any API calls fail.