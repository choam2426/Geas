---
name: sprint
description: Add a bounded feature to an existing project with the Geas team — Design, Build, Review, QA.
user-invocable: true
---

# Sprint Mode

One feature, one pipeline. Skips Genesis.

**EVERY step in the pipeline is executed. Code Review and Testing are MANDATORY. Do NOT skip them.**

---

## Pre-conditions

1. `.geas/spec/seed.json` should exist from intake.
2. `.geas/memory/_project/conventions.md` — if missing, spawn Forge for onboarding:
   ```
   Agent(agent: "forge", prompt: "Read .geas/rules.md first. Scan this codebase. Write conventions to .geas/memory/_project/conventions.md")
   ```

---

## Sprint Pipeline

### 1. Compile TaskContract
Invoke `/geas:task-compiler` for the feature. If Linear enabled: create issue, store IDs.

### 2. Design (Palette) [DEFAULT — skip-if: no user-facing interface]
**프론트엔드 페이지/폼/대시보드가 있으면 반드시 실행.**
```
Agent(agent: "palette", prompt: "Read .geas/rules.md first. Read .geas/packets/{task-id}/palette.md. Write design to .geas/evidence/{task-id}/palette.json")
```
Verify evidence exists.

### 3. Tech Guide (Forge) [DEFAULT — skip-if: trivial task]
```
Agent(agent: "forge", prompt: "Read .geas/rules.md first. Read .geas/packets/{task-id}/forge.md. Write tech guide to .geas/evidence/{task-id}/forge.json")
```
Verify evidence exists.

### 4. Implementation [MANDATORY — worktree isolated]
```
Agent(agent: "{worker}", isolation: "worktree", prompt: "Read .geas/rules.md first. Read .geas/packets/{task-id}/{worker}.md. Implement. Write evidence to .geas/evidence/{task-id}/{worker}.json")
```
Verify evidence. Merge worktree.

### 5. Code Review (Forge) [MANDATORY]
```
Agent(agent: "forge", prompt: "Read .geas/rules.md first. Read .geas/packets/{task-id}/forge-review.md. Review code. Write to .geas/evidence/{task-id}/forge-review.json")
```
Verify evidence.

### 6. Testing (Sentinel) [MANDATORY]
```
Agent(agent: "sentinel", prompt: "Read .geas/rules.md first. Read .geas/packets/{task-id}/sentinel.md. Test feature. Write to .geas/evidence/{task-id}/sentinel.json")
```
Verify evidence.

### 7. Evidence Gate
Run eval_commands. Check acceptance criteria. Log detailed result.

### 8. Nova Product Review [MANDATORY]
```
Agent(agent: "nova", prompt: "Read .geas/rules.md first. Read all evidence at .geas/evidence/{task-id}/. Verdict: Ship/Iterate/Cut. Write to .geas/evidence/{task-id}/nova-verdict.json")
```

### Ship Gate
**Before marking "passed", verify these exist:**
- `.geas/evidence/{task-id}/forge-review.json`
- `.geas/evidence/{task-id}/sentinel.json`
- `.geas/evidence/{task-id}/nova-verdict.json`
**If ANY missing: execute the missing step.**

### Rules Update
태스크 완료 후, evidence에 `suggested_rules` 필드가 있으면 `.geas/rules.md`에 반영하라. 또한 이번 태스크에서 발견된 프로젝트 규칙(컨벤션, 패턴, 제약)이 있으면 직접 추가하라.

### 9. Resolve
- Ship → `"passed"`
- Iterate → re-dispatch with feedback
- Cut → `"failed"`, write DecisionRecord
