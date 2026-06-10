---
name: geas
description: Structure agent work with Geas Workflow. Use when the user asks to start, continue, inspect, judge, rework, cancel, close, or record Work; when a request needs a Work Frame, Harness Setup, Task Contract, Mission Brief, Evidence, User Judgment, or Closure; or when resuming saved workflow state from .geas/works.
---

# Geas

Use Geas as a thin workflow controller. Read current state, choose the minimum reference set, act within the current Work position, and preserve User Judgment as the user's explicit decision.

## Core Loop

1. Read state.
2. Identify the current Work position.
3. Load the minimum reference set.
4. Act or raise a User Judgment point.
5. Update the Work record when the record has restoration value.
6. Close or continue.

## Triggers

Use Geas when the user explicitly invokes `geas`, asks to start or continue Work, asks for Task/Mission/User Judgment/Closure handling, asks to inspect or resume saved Work, or gives feedback that changes the current Work criteria.

Treat small requests as Direct Work when a short Work Frame, execution, check, and closure are enough.

## State Source Priority

Use sources in this order:

|Priority|Source|Use|
|---|---|---|
|1|Latest user instruction|Current-turn goal, scope, judgment, stop, change, or continuation request.|
|2|Explicit Work record|Current `.geas/works/` record, user-specified Work directory, active Task/Mission record.|
|3|Related files|User-specified files, directly related repository files, workflow docs.|
|4|Conversation context|Earlier conversation and summaries as supporting context.|

When sources conflict, follow the higher-priority source. Raise a User Judgment point when the conflict changes result criteria or User responsibility.

## Reference Loading

Load only the minimum reference set needed for the current position:

|Situation|Minimum reference set|
|---|---|
|New Work or routing decision|`references/work-frame.md`|
|Preparation changes quality, judgment cost, permission, or risk|`references/work-frame.md`, `references/harness-setup.md`|
|Task Contract creation or update|`references/work-frame.md` or `references/mission.md`, plus `references/task.md`|
|Task judgment preparation|`references/task.md`, `references/evidence-judgment.md`|
|Task closure|`references/task.md`, `references/evidence-judgment.md`, `references/continuity.md`|
|Mission Brief creation or update|`references/work-frame.md`, `references/mission.md`|
|Task design inside a Mission|`references/mission.md`, `references/task.md`|
|Mission synthesis|`references/mission.md`, `references/evidence-judgment.md`|
|Mission closure|`references/mission.md`, `references/evidence-judgment.md`, `references/continuity.md`|
|Direct Work closure|`references/work-frame.md`, `references/continuity.md`|
|Resuming saved Work|`references/continuity.md`, plus the references for the restored position|
|Workflow record creation or update|Current stage references plus the record policy below|

## Record Policy

Store workflow records under `.geas/works/YYYYMMDD-<slug>/` when the record has restoration value or the user asks for a record.

Use these fixed names when the corresponding stage occurs:

|Output|Location|Name|
|---|---|---|
|Work Frame|Work directory root|`work-frame.md`|
|Mission Brief|Work directory root|`mission-brief.md`|
|Mission Synthesis|Work directory root|`mission-synthesis.md`|
|Work-level Closure|Work directory root|`closure.md`|
|Task Contract|`tasks/NNN-<task-slug>/`|`task-contract.md`|
|Evidence summary|`tasks/NNN-<task-slug>/`|`evidence.md`|
|Task-level Closure|`tasks/NNN-<task-slug>/`|`closure.md`|

Put every Task record, including a single-Task Work, under `tasks/NNN-<task-slug>/`. Use `001`, `002`, and so on in Work order.

Record user acceptance status and time inside `task-contract.md` and `mission-brief.md`. Resume position detection depends on these acceptance records.

Keep actual work outputs in their natural project locations. Use `.geas/works/` for workflow criteria, judgment, restoration, and limits.

Store Continuity Artifacts under `.geas/memory/`, one artifact per `<slug>.md` file, with a one-line summary per artifact in `.geas/memory/index.md`. During Alignment for new Work, check `.geas/memory/index.md` and load relevant artifacts into Context Checked.

## User Judgment Boundary

Prepare the judgment surface. Record User Judgment as the user's explicit decision.

Use `closure.md` to record the user's decision, the evidence considered, accepted limits, and next state. Use supporting files such as `judgment-surface.html`, `visual-diff.html`, `screenshot.png`, or structured JSON when they reduce judgment cost.

## Harness Setup Boundary

Use Harness Setup as conditional work-readiness preparation. Fold durable preparation results into existing Work Frame, Task Contract, or Mission Brief fields. Use execution-time setup inside execution when it leaves no reusable criteria or restoration value.
