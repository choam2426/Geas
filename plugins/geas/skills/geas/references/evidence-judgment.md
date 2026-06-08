# Evidence And User Judgment Reference

Use this reference to turn results into judgment-ready Evidence and to keep Agent findings separate from User Judgment.

## Evidence Definition

Evidence is the user's judgment input. It shows how the result compares to the current Work criteria, what was checked, what remains uncertain, and what the user must decide.

Connect Evidence to the active Work Frame, Task Contract, or Mission Brief.

## Evidence Schema

|Field|Purpose|
|---|---|
|Result Link|The result, output, change, or state this Evidence supports.|
|Criteria Check|Which accepted criteria were checked.|
|Satisfaction State|Met, partly met, pending judgment, or blocked by missing input.|
|Checked Scope|What was actually checked, how, and with what result.|
|Evidence Material|Outputs, logs, screenshots, comparisons, references, test results.|
|Remaining Limits|Unverified scope, remaining risk, user-accepted limits.|
|Judgment Points|Choices, risks, or tradeoffs requiring user decision.|

For Direct Work, use Check and Limits as a compact Evidence surface. For Task and Mission, prepare Evidence before User Judgment.

## Evidence Strengthening

Use strengthening when risk, impact surface, or judgment cost is high.

|Procedure|Use when|Record|
|---|---|---|
|Verification|Result must run, pass tests, or be reproducibly checked.|Checks run, result, failures, limits.|
|Review|Quality, boundaries, omissions, consistency, or preservation matter.|Scope reviewed, findings, remaining risk.|
|Challenge|Assumptions, long-term cost, rollback cost, criteria conflict, or missing scope need pressure.|Assumptions challenged, risks surfaced, User Judgment points.|

Use separated context or a subagent when it materially improves review or challenge quality.

## User Judgment Boundary

User Judgment is the user's explicit decision after reviewing result and Evidence.

Agent recommendation, verdict, completion statement, test result, review result, and challenge result are judgment inputs. Record the user decision separately in Closure.

|Work type|Judgment values|
|---|---|
|Direct Work|Closure by Agent, with User Judgment raised for user-owned risk acceptance or criteria change.|
|Task|Accept, Rework, Cancel.|
|Mission|Accept, Continue, Cancel.|

## Judgment Surface

Use text for simple judgment. Use tables, Mermaid, HTML previews, screenshots, visual diffs, or comparison reports when they reduce user judgment cost.

Place supporting judgment surfaces beside the active Task or Mission record using role-revealing names.
