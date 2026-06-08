# Task Reference

Use this reference when Work needs a Task Contract, Task-level Evidence, or Task User Judgment.

## Task Definition

A Task is a User Judgment unit. The user can review the result, Evidence, and remaining limits together and decide Accept, Rework, or Cancel.

Use one Task for one goal, one acceptance criteria set, one verification strategy, and one explainable impact surface.

Split Tasks when acceptance criteria, output type, verification method, preparation needs, impact surface, risk level, or User direction decisions differ.

## Task Contract Schema

|Field|Purpose|
|---|---|
|Goal|The objective this Task must achieve.|
|Work Relation|How this Task connects to the Work Frame or Mission Brief.|
|Boundary|Included scope and outside scope.|
|Accepted Decisions|User-approved direction, tradeoff, condition, or risk acceptance.|
|Starting Context|Accepted prior context, inputs, environment facts, files, docs, tests, execution flow.|
|Execution|What the agent will actually do.|
|Deliverable|The concrete result the Task will leave.|
|Acceptance Criteria|The criteria the user will judge against.|
|Guardrails|Constraints, preserved areas, style, conventions, risk controls.|
|Impact Surface|Files, docs, flows, dependencies, and related outputs touched by the result.|
|Verification Strategy|Tests, run checks, manual checks, regression checks, and verification surface.|
|Review And Challenge Focus|Quality, boundaries, user impact, edge cases, maintainability risks, separated context use.|
|Evidence Plan|Evidence format, judgment surface, unverified areas, and limits.|
|User Judgment Point|What the user will review to decide Accept, Rework, or Cancel.|
|Change Triggers|Conditions that require contract refresh or new Work Frame.|
|Cancel Handling|Rollback, reference preservation, and next Work Frame handling.|

## Flow

1. Align Task Contract.
2. Ask for Direction Judgment when a direction changes criteria or Evidence.
3. Present Task Contract for user acceptance.
4. Execute within the accepted contract.
5. Prepare Evidence.
6. Strengthen Evidence when risk, impact, or judgment cost warrants it.
7. Wait for Task User Judgment.
8. Close, rework within the same contract, or cancel.

## User Judgment

|Decision|Meaning|
|---|---|
|Accept|The user accepts the current result and Evidence as the Task result.|
|Rework|The Task Contract remains valid and execution, verification, or cleanup continues.|
|Cancel|The current Task result is outside the accepted scope and the Task closes through cancel handling.|

Record the user's explicit decision in Task `closure.md`.

## Change Boundary

Use Rework only inside the accepted Task Contract. Use Cancel and return to Work Frame when Goal, Boundary, Execution, Deliverable, Acceptance Criteria, verification method, impact surface, or risk acceptance changes.

## Record Layout

Place Task records under `.geas/works/YYYYMMDD-<slug>/tasks/NNN-<task-slug>/`.

Use fixed basenames when the record is created:

|Record|Name|
|---|---|
|Task Contract|`task-contract.md`|
|Evidence summary|`evidence.md`|
|Closure|`closure.md`|

Use additional role-named supporting files for judgment surfaces, screenshots, structured check output, or comparison reports.
