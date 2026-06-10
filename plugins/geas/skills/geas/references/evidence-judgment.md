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

Check and Limits is the short record left when Direct Work ends: what was checked, how it was checked, and what limits remain. It serves as the compact Evidence surface for Direct Work. For Task and Mission, prepare Evidence before User Judgment.

## Evidence Strengthening

Use strengthening when risk, impact surface, or judgment cost is high.

|Procedure|Use when|Record|
|---|---|---|
|Verification|Result must run, pass tests, or be reproducibly checked.|Checks run, result, failures, limits.|
|Review|Quality, boundaries, omissions, consistency, or preservation matter.|Scope reviewed, findings, remaining risk.|
|Challenge|Assumptions, long-term cost, rollback cost, criteria conflict, or missing scope need pressure.|Assumptions challenged, risks surfaced, User Judgment points.|

Use separated context or a subagent when it materially improves review or challenge quality.

Do not rely on self-assessed risk alone. Apply the matching procedure by default when any condition below holds. When a condition holds and strengthening is skipped, record the reason under Remaining Limits.

|Condition|Default procedure|
|---|---|
|An Acceptance Criteria item was not directly checked.|Verification|
|No test, run, or comparison surface exists for the result.|Review|
|The change is hard to reverse (migration, deletion, external send, deploy, publish).|Challenge|
|The change touches security, permissions, auth, payment, or personal data.|Review and Challenge|
|The Impact Surface grew beyond the accepted contract during execution.|Review|
|Rework repeated twice or more in the same Task.|Challenge|

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
