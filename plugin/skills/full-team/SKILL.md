---
name: full-team
description: Start a new product with the full Geas team — Genesis, MVP Build, Polish, Evolution.
user-invocable: true
---

# Full Team Mode

4 phases: Genesis → MVP Build → Polish → Evolution.

---

## Phase 1: Genesis

### 1.1 Seed Check
- `.geas/spec/seed.json` should exist from intake. If not, invoke `/geas:intake`.
- If readiness_score < 60 and no override: ask the user, re-run intake.

### 1.2 Linear Bootstrap (if enabled)
- Create project, milestones (Genesis, MVP, Polish, Evolution).
- Discover team/label/state IDs. Save to `.geas/memory/_project/linear-config.json`.

### 1.3 Vision (Nova)
```
Agent(agent: "nova", prompt: "Read .geas/spec/seed.json. Deliver vision, MVP scope, user value proposition. Write to .geas/evidence/genesis/nova.json")
```
Verify evidence exists.

### 1.4 Architecture (Forge)
```
Agent(agent: "forge", prompt: "Read .geas/spec/seed.json and .geas/evidence/genesis/nova.json. Propose architecture and tech stack. Write conventions to .geas/memory/_project/conventions.md and evidence to .geas/evidence/genesis/forge.json")
```
Verify evidence exists. Write DecisionRecord to `.geas/decisions/dec-001.json`.

### 1.5 Vote Round
Spawn Circuit and Palette to vote on Forge's architecture:
```
Agent(agent: "circuit", prompt: "Read .geas/evidence/genesis/forge.json. Vote agree/disagree with rationale. Write to .geas/evidence/genesis/vote-circuit.json")
Agent(agent: "palette", prompt: "Read .geas/evidence/genesis/forge.json. Vote agree/disagree with rationale. Write to .geas/evidence/genesis/vote-palette.json")
```
If any disagree: run debate, then re-vote.

### 1.6 Compile TaskContracts
- Create 5-10 granular tasks. For each, invoke `/geas:task-compiler`.
- If Linear enabled: create issues, store IDs in TaskContracts.
- Log each: `{"event": "task_compiled", "task_id": "...", "timestamp": "<actual>"}`

### 1.7 Close Genesis
- Update run state: `{ "phase": "mvp", "status": "in_progress" }`
- Log: `{"event": "phase_complete", "phase": "genesis", "timestamp": "<actual>"}`

---

## Phase 2: MVP Build

For **each** TaskContract in `.geas/tasks/` (ordered by dependencies):

### 2.0 Start Task
- Read TaskContract. Check dependencies are `"passed"`.
- Update status to `"in_progress"`. Log `task_started` event.

### 2.1 Design (Palette) [DEFAULT — skip-if: no UI/UX component]
Generate ContextPacket, then:
```
Agent(agent: "palette", prompt: "Read .geas/packets/{task-id}/palette.md. Write design spec to .geas/evidence/{task-id}/palette.json")
```
Verify evidence exists.

### 2.2 Tech Guide (Forge) [DEFAULT — skip-if: trivial task]
Generate ContextPacket, then:
```
Agent(agent: "forge", prompt: "Read .geas/packets/{task-id}/forge.md. Write tech guide to .geas/evidence/{task-id}/forge.json")
```
Verify evidence exists.

### 2.3 Implementation [MANDATORY — worktree isolated]
Generate ContextPacket, then:
```
Agent(agent: "{worker}", isolation: "worktree", prompt: "Read .geas/packets/{task-id}/{worker}.md. Implement the feature. Write evidence to .geas/evidence/{task-id}/{worker}.json")
```
Verify evidence exists. Merge worktree branch.

### 2.4 Code Review (Forge) [MANDATORY]
Generate ContextPacket, then:
```
Agent(agent: "forge", prompt: "Read .geas/packets/{task-id}/forge-review.md. Review implementation. Write to .geas/evidence/{task-id}/forge-review.json")
```
Verify evidence exists.

### 2.5 Testing (Sentinel) [MANDATORY]
Generate ContextPacket, then:
```
Agent(agent: "sentinel", prompt: "Read .geas/packets/{task-id}/sentinel.md. Test the feature. Write QA results to .geas/evidence/{task-id}/sentinel.json")
```
Verify evidence exists.

### 2.6 Evidence Gate
Run eval_commands from TaskContract. Check acceptance criteria against all evidence.
Log detailed result with tier breakdown.
If fail → invoke `/geas:verify-fix-loop`. After fix, re-run gate.

### 2.7 Nova Product Review [MANDATORY]
```
Agent(agent: "nova", prompt: "Read all evidence at .geas/evidence/{task-id}/. Verdict: Ship, Iterate, or Cut. Write to .geas/evidence/{task-id}/nova-verdict.json")
```

### 2.8 Resolve
- **Ship**: status → `"passed"`.
- **Iterate**: re-dispatch with Nova's feedback.
- **Cut**: status → `"failed"`. Write DecisionRecord.

### Close Phase 2
Log: `{"event": "phase_complete", "phase": "mvp", "timestamp": "<actual>"}`

---

## Phase 3: Polish

```
Agent(agent: "shield", prompt: "Security review. Write to .geas/evidence/polish/shield.json")
Agent(agent: "scroll", prompt: "Write README and docs. Write to .geas/evidence/polish/scroll.json")
```
Fix issues found. Log phase complete.

---

## Phase 4: Scoped Evolution

Assess remaining work within seed's `scope_in`. Reject `scope_out` features.
Spawn agents as needed for improvements. Close out with Nova briefing.
Log: `{"event": "phase_complete", "phase": "complete", "timestamp": "<actual>"}`
