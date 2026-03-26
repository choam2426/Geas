---
name: sprint
description: Add a bounded feature to an existing project with the Geas team — Design, Build, Review, QA.
user-invocable: true
---

# Sprint Mode

One feature, one pipeline. Skips Genesis.

---

## Pre-conditions

1. `.geas/spec/seed.json` should exist from intake.
2. `.geas/memory/_project/conventions.md` — if missing, spawn Forge for onboarding:
   ```
   Agent(agent: "forge", prompt: "Scan this codebase. Write conventions to .geas/memory/_project/conventions.md")
   ```

---

## Sprint Pipeline

### 1. Compile TaskContract
Invoke `/geas:task-compiler` for the feature. If Linear enabled: create issue, store IDs.

### 2. Design (Palette) [DEFAULT — skip-if: no UI/UX component]
Generate ContextPacket, then:
```
Agent(agent: "palette", prompt: "Read .geas/packets/{task-id}/palette.md. Write design to .geas/evidence/{task-id}/palette.json")
```
Verify evidence exists.

### 3. Tech Guide (Forge) [DEFAULT — skip-if: trivial task]
Generate ContextPacket, then:
```
Agent(agent: "forge", prompt: "Read .geas/packets/{task-id}/forge.md. Write tech guide to .geas/evidence/{task-id}/forge.json")
```
Verify evidence exists.

### 4. Implementation [MANDATORY — worktree isolated]
```
Agent(agent: "{worker}", isolation: "worktree", prompt: "Read .geas/packets/{task-id}/{worker}.md. Implement. Write evidence to .geas/evidence/{task-id}/{worker}.json")
```
Verify evidence. Merge worktree.

### 5. Code Review (Forge) [MANDATORY]
```
Agent(agent: "forge", prompt: "Read .geas/packets/{task-id}/forge-review.md. Review code. Write to .geas/evidence/{task-id}/forge-review.json")
```
Verify evidence.

### 6. Testing (Sentinel) [MANDATORY]
```
Agent(agent: "sentinel", prompt: "Read .geas/packets/{task-id}/sentinel.md. Test feature. Write to .geas/evidence/{task-id}/sentinel.json")
```
Verify evidence.

### 7. Evidence Gate
Run eval_commands. Check acceptance criteria. Log detailed result.

### 8. Nova Product Review [MANDATORY]
```
Agent(agent: "nova", prompt: "Read all evidence at .geas/evidence/{task-id}/. Verdict: Ship/Iterate/Cut. Write to .geas/evidence/{task-id}/nova-verdict.json")
```

### 9. Resolve
- Ship → `"passed"`, Linear → Done
- Iterate → re-dispatch with feedback
- Cut → `"failed"`, write DecisionRecord
