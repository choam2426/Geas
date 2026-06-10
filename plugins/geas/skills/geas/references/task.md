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

## Proportionality

Write the contract in proportion to Task size, risk, and judgment cost. The goal is the smallest judgment surface that lets the user confirm execution criteria and judgment criteria, not a fully filled schema.

Always write the core fields: Goal, Boundary, Deliverable, Acceptance Criteria, Verification Strategy, User Judgment Point.

Add the remaining fields only when their trigger applies:

|Field|Trigger|
|---|---|
|Work Relation|The Task belongs to a Mission or needs an explicit link to Work Frame criteria.|
|Accepted Decisions|A direction, tradeoff, condition, or risk acceptance decision was made.|
|Starting Context|The Task depends on prior results, baseline outputs, environment facts, or required inputs.|
|Execution|The execution method is not self-evident or its order affects result criteria.|
|Guardrails|There are preserved areas, style, conventions, or risk-control constraints.|
|Impact Surface|Touched files, docs, flows, or dependencies need separate confirmation.|
|Review And Challenge Focus|Risk, impact, or judgment cost warrants Evidence strengthening.|
|Evidence Plan|The judgment surface goes beyond the default Evidence structure.|
|Change Triggers|Specific criteria-change points should be fixed in advance for this Task.|
|Cancel Handling|Cancel handling goes beyond default rollback and reference preservation.|

Omitted conditional fields fall back to workflow defaults: criteria changes always go through Contract Change Judgment, and default cancel handling is best-effort rollback plus reference preservation. When a trigger clearly applies but the field is omitted, record the reason.

## Flow

1. Align Task Contract.
2. Ask for Direction Judgment when a direction changes criteria or Evidence.
3. Present Task Contract for user acceptance.
4. Execute within the accepted contract.
5. Raise a Contract Change Judgment when a Change Trigger fires during execution.
6. Prepare Evidence.
7. Strengthen Evidence when risk, impact, or judgment cost warrants it.
8. Wait for Task User Judgment.
9. Close, rework within the same contract, or cancel.

## User Judgment

|Decision|Meaning|
|---|---|
|Accept|The user accepts the current result and Evidence as the Task result.|
|Rework|The Task Contract remains valid and execution, verification, or cleanup continues.|
|Cancel|The current Task result is outside the accepted scope and the Task closes through cancel handling.|

Record the user's explicit decision in Task `closure.md`.

## Change Boundary

Use Rework only inside the accepted Task Contract.

When Goal, Boundary, Execution, Deliverable, Acceptance Criteria, verification method, impact surface, or risk acceptance changes during execution, treat it as a Change Trigger and raise a Contract Change Judgment:

|Decision|Handling|
|---|---|
|Amend|Record the changed fields, reasons, and prior criteria in the contract, get user re-acceptance, and continue execution.|
|Keep|Keep the current contract and record the change as an assumption, limit, or open question in Evidence.|
|Cancel|Use when the Task goal itself is invalid or the change cannot be handled by amendment. Close through Cancel Handling and return to a new Work Frame.|

When repeated amendments make the result and Evidence too large for one judgment surface, consider splitting the Task or escalating to a Mission.

For a Task inside a Mission, when the change conflicts with the Mission Brief, raise it through the Mission Brief refresh path instead of a Task-level amendment.

## Record Layout

Place Task records under `.geas/works/YYYYMMDD-<slug>/tasks/NNN-<task-slug>/`.

Use fixed basenames when the record is created:

|Record|Name|
|---|---|
|Task Contract|`task-contract.md`|
|Evidence summary|`evidence.md`|
|Closure|`closure.md`|

Use additional role-named supporting files for judgment surfaces, screenshots, structured check output, or comparison reports.
