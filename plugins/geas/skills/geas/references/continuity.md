# Continuity Reference

Use this reference to close Work and preserve only the state that helps continue, restore, hand off, or improve later Work.

## Closure Definition

Closure is the state where result, Evidence, User Judgment, remaining limits, restoration notes, and continuity candidates are clear enough for the user or a future agent to understand the Work outcome.

## Closure Schema

|Field|Purpose|
|---|---|
|Result|What the Work actually changed, produced, or decided.|
|Evidence Summary|Checks, reviews, challenge results, and other judgment inputs.|
|User Judgment|The user's explicit decision and accepted limits.|
|Remaining Limits|Unverified areas, unresolved risks, known gaps.|
|Restoration Notes|Current position, accepted decisions, tradeoffs, open questions, and checked limits needed to resume this Work.|
|Continuity Review|Candidates for later Work and classification decisions.|

## Closure By Work Type

|Work type|Closure contents|
|---|---|
|Direct Work|Result, Check and Limits, restoration notes when useful, continuity review.|
|Task|Result, Evidence, User Judgment, restoration notes, continuity review.|
|Mission|Mission Synthesis, Evidence, User Judgment, restoration notes, continuity review.|

Task and Mission reach Closure after User Judgment. Before that point, they are Ready for Judgment.

## Continuity Candidate Criteria

Promote an item as a continuity candidate when it affects later Work:

|Criterion|Meaning|
|---|---|
|Future criteria|It changes later goals, scope, acceptance criteria, or verification.|
|Accepted decision|A user-approved decision or tradeoff must be restored later.|
|Long-term limit|An unverified area or risk creates future cost.|
|Open question|A future decision is blocked or shaped by this question.|
|Session restoration|A future agent needs this state after context loss or handoff.|
|Process improvement|The item improves future workflow quality.|

## Record Placement

Use Work-level `closure.md` for Direct Work and Mission closure. Use Task-level `closure.md` under the Task directory for Task closure.

Record User Judgment in Closure. Include the user's decision value and the evidence considered.

## Continuity Artifact Storage

Store Continuity Artifacts under `.geas/memory/` as type files, committed to git as shared work criteria.

|Type file|Content|
|---|---|
|`facts.md`|Confirmed environment, tool, and domain facts.|
|`preferences.md`|User preferences and interaction style.|
|`decisions.md`|User-accepted choices, tradeoffs, and criteria.|
|`risks.md`|Accepted limits, unverified areas, known risks.|
|`open-questions.md`|Open questions that can block or change later judgment.|
|`process.md`|Workflow improvements, verification surfaces, harness shortcuts.|

Write each entry as a section inside its type file:

```markdown
## test-command-pnpm-unit
- Source: .geas/works/20260610-setup-ci
- Date: 2026-06-10

Unit tests run with `pnpm test:unit`. E2e runs only in CI, not locally.

Apply: use as the unit verification surface in Verification Strategy.
Invalid when: the test scripts in package.json change.
```

|Rule|Content|
|---|---|
|Unit|One entry covers one criterion. Keep it short.|
|Save gate|Show candidates to the user in Continuity Artifact Review before saving. Never save silently. When there are no candidates, record "none".|
|Update|When an entry covers the same criterion, update it instead of adding a new one.|
|Recall|During Alignment for new Work, read the relevant type files and load relevant entries into Context Checked.|
|Verify on recall|Before applying an entry, confirm it still holds. Update or delete it on contradiction.|
|Invalidation|Record the condition that ends an entry's validity when writing it.|
|Cleanup|When a type file grows enough to raise recall cost, consolidate or delete stale entries.|

Never store: anything derivable from the repo (code structure, git history, existing docs), context that only matters to the current Work (that belongs in Closure restoration notes), output or log dumps, or secrets, tokens, and credentials.

## Resume

Resume interrupted Work from its records with the same goal and criteria.

1. Use the user-specified Work record, or find the latest Work under `.geas/works/` that has not reached Closure.
2. Detect the current position from the record files and acceptance records.
3. When the latest user instruction conflicts with the records, follow the instruction; raise a User Judgment point when result criteria change.
4. Continue from the detected position.

|Record state|Position|Resume action|
|---|---|---|
|Only `work-frame.md`|Routing decision|Reconfirm the Work Frame and decide handling.|
|`task-contract.md` without acceptance|Awaiting contract acceptance|Present the contract again for user acceptance.|
|Accepted `task-contract.md`, no `evidence.md`|Executing|Continue execution under the contract.|
|`evidence.md`, no Task `closure.md`|Ready for Judgment|Present Evidence again and wait for Task User Judgment.|
|Task `closure.md` exists|Task closed|Move to the next Task or Mission Synthesis.|
|Accepted `mission-brief.md` with remaining Tasks|Mission in progress|Continue the next Task from Task Structure.|
|`mission-synthesis.md`, no Work-level `closure.md`|Awaiting Mission judgment|Present Mission Synthesis again and wait for Mission User Judgment.|
|Work-level `closure.md` exists|Work closed|Treat as new Work. Pull criteria from Continuity Artifacts and Closure restoration notes.|

On resume, restate the restored position, accepted criteria, and open questions briefly, and proceed after user confirmation.
