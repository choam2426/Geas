# Mission Reference

Use this reference when Work needs multiple Tasks, multiple User Judgment points, Mission-level synthesis, or durable state across sessions.

## Mission Definition

A Mission is a higher-level Work structure that groups Tasks and Mission-level User Judgment. Use a Mission when the whole goal requires Mission-level representation beyond one Task result and Evidence surface.

## Mission Brief Schema

|Field|Purpose|
|---|---|
|Mission Intent|The direction and purpose of the larger Work.|
|Mission Background|Why Mission handling is needed.|
|Mission Boundary|Included scope and outside scope.|
|Success Shape|The overall sufficient end state.|
|Mission Criteria|Mission-level acceptance criteria and how Evidence will support them.|
|Approach|How the Mission proceeds and why.|
|Accepted Decisions|User-approved approach, tradeoff, condition, or risk acceptance.|
|Key Context|Intent, domain context, environment facts, constraints, prior decisions shared by all Tasks.|
|Task Structure|The Tasks that make up the Mission.|
|Task Structure Coverage|How Tasks cover Mission criteria, overlap, dependencies, and size balance.|
|Task Contribution Map|How each Task contributes to Mission criteria.|
|Task Judgment Boundary|Which decisions remain Mission-level and which belong to Tasks.|
|Decision Points|User Judgment points in the Mission.|
|Mission Synthesis Plan|How Task results, Evidence, and limits will be combined.|
|Shared Considerations|Shared constraints, style, conventions, risks, tradeoffs.|
|Impact Surface|Files, docs, flows, dependencies, and side effects touched by Mission outputs.|
|Validation And Review Strategy|Mission-level verification, review, challenge, manual checks, separated context use.|
|Change Triggers|Conditions that refresh the Mission Brief or later Task Contracts.|
|Continuity Needs|State and work-readiness context to restore or hand off.|
|Continuity Candidates|Decisions, risks, open questions, memory candidates for later Work.|

## Proportionality

Write the Mission Brief in proportion to Mission size, risk, and judgment cost. The goal is the smallest judgment surface that lets the user confirm the larger goal, judgment structure, and synthesis criteria.

Always write the core fields: Mission Intent, Mission Boundary, Success Shape, Mission Criteria, Task Structure, Decision Points, Mission Synthesis Plan.

Add the remaining fields only when their trigger applies:

|Field|Trigger|
|---|---|
|Mission Background|The need is not evident from Mission Intent alone.|
|Approach|Multiple approach candidates existed or the chosen approach changes result criteria.|
|Accepted Decisions|A direction, tradeoff, condition, or risk acceptance decision was made.|
|Key Context|Shared context, environment facts, or prior decisions apply to all Tasks.|
|Task Structure Coverage|Many Tasks, or overlap, dependencies, and size balance need separate confirmation.|
|Task Contribution Map|The criteria-to-Task links are not evident from Task Structure alone.|
|Task Judgment Boundary|The split between Mission-level and Task-level judgment needs to be explicit.|
|Shared Considerations|Shared constraints, style, conventions, or risks apply to all Tasks.|
|Impact Surface|Mission-level touched surfaces need separate confirmation.|
|Validation And Review Strategy|Mission-level verification surfaces or Evidence strengthening are needed.|
|Change Triggers|Specific Mission criteria-change points should be fixed in advance.|
|Continuity Needs|Session switch, handoff, or restoration is expected.|
|Continuity Candidates|Durable decisions, risks, or open questions are already visible.|

Omitted conditional fields fall back to workflow defaults: Mission Brief criteria changes always require user re-acceptance. When a trigger clearly applies but the field is omitted, record the reason.

## Flow

1. Align Mission Brief.
2. Ask for Direction Judgment when approach or Task structure changes Mission criteria.
3. Present the Mission Brief core fields and Task Structure in the conversation as a short summary, with the record path, and ask for acceptance. Writing the record file alone is not presentation.
4. Create Task Contracts per Task.
5. Close each Task through Task Evidence and Task User Judgment.
6. Prepare Mission Synthesis from accepted Task results and limits.
7. Strengthen Mission Evidence when risk, impact, or judgment cost warrants it.
8. Wait for Mission User Judgment.
9. Close, continue with additional Tasks, or cancel.

Record user acceptance status and time inside `mission-brief.md`. Resume position detection depends on it.

## Mission User Judgment

|Decision|Meaning|
|---|---|
|Accept|The user accepts the Mission result with accepted Task results and remaining limits.|
|Continue|The Mission continues with additional Tasks, criteria adjustment, or additional checks.|
|Cancel|The current Mission result is outside accepted scope and closes through cancel handling.|

## Mission Brief Refresh

When the Mission goal, boundary, acceptance criteria, or Task Structure changes, refresh the Mission Brief with user re-acceptance and update later Task Contracts.

When a running Task's Change Trigger conflicts with the Mission Brief, raise it through this refresh path instead of a Task-level contract amendment. Classify already-accepted Task results as reuse, reference, supplement, or out-of-scope preservation under the refreshed Mission Brief.

## Mission Task Registry

Use `Mission Brief` fields as the active registry before execution:

- `Task Structure`
- `Task Structure Coverage`
- `Task Contribution Map`
- `Task Judgment Boundary`

Use `Mission Synthesis` fields as the registry after Task results exist:

- `Task Results Summary`
- `Criteria Check`
- `Evidence Summary`
- `Remaining Limits`

## Mission Synthesis Schema

|Field|Purpose|
|---|---|
|Mission Result|The state reached by the Mission.|
|Task Results Summary|Each Task result and User Judgment received.|
|Criteria Check|Result compared to Success Shape, Boundary, Criteria, Decision Points.|
|Evidence Summary|Evidence and strengthening used for Mission judgment.|
|Remaining Limits|Unverified areas, remaining risks, limits the user must accept.|
|Pending Decisions|Items the user must judge before Mission closure.|
|Continuity Candidates|Memory candidates that can affect later Work.|

## Escalation And Retention

Escalate Task to Mission when multiple judgments, shared and individual preparation, Task result synthesis, resumable progress, multiple output types, accumulated risk, or final Mission synthesis becomes necessary.

Retain Task handling when one result and one Evidence surface can support one User Judgment.
