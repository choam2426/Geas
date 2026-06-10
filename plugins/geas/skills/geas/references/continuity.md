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

Store Continuity Artifacts under `.geas/memory/`.

|Rule|Content|
|---|---|
|Location|One artifact per file at `.geas/memory/<slug>.md`.|
|Name|A 3-6 word lowercase kebab-case slug.|
|Content|Type (decision, risk, open-question, criteria, process-improvement), source Work, date, content, and how to apply it in later Work.|
|Index|Keep a one-line summary per artifact in `.geas/memory/index.md`.|
|Reference|During Alignment for new Work, check `index.md` and load relevant artifacts into Context Checked.|
|Update|When an artifact covers the same criteria, update the existing file instead of creating a new one. Delete artifacts that are no longer valid.|

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
