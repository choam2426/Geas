# Work Frame Reference

Use this reference to start Work, clarify unclear requests, route Work as Direct Work, Task, or Mission, or create a new Work Frame after criteria change.

## Work Frame Schema

Record only the fields that materially reduce ambiguity or restoration cost.

|Field|Purpose|
|---|---|
|Background|Why the request exists and what issue is active.|
|User Intent|The user's desired direction and problem framing.|
|Context Checked|Files, docs, outputs, conversation context, and external sources already checked.|
|Assumptions|Agent interpretations and dependencies needed to proceed.|
|Considerations|Constraints, risks, tradeoffs, preferences, and open questions.|
|Harness Setup Need|Preparation needed for style, conventions, environment, tools, verification surface, measurement, observability, or risk control.|
|Recommended Handling|Direct Work, Task, or Mission, with the reason.|

## Alignment Checklist

Ask only for decisions that change result criteria, risk, scope, cost, or User responsibility.

|Question|Reveal|
|---|---|
|What context produced this request?|Background and current issue.|
|What does the user actually want changed?|Intent and problem framing.|
|What context must be checked first?|Docs, code, outputs, conversation, external material.|
|What constraints matter before execution?|Risk, tradeoff, preference, open question.|
|What preparation changes work quality?|Style, conventions, environment, tools, verification, risk controls.|
|What handling fits this Work?|Direct Work, Task, or Mission.|

## Routing Criteria

Use Direct Work when the Work has narrow context, low risk, short verification, small preparation, and a simple closure.

Use Task when the Work needs a Task Contract, separate acceptance criteria, meaningful Evidence, User Judgment, or criteria acceptance before execution.

Use Mission when the Work needs multiple Tasks, multiple User Judgment points, Mission-level synthesis, durable cross-Task context, or state that must survive session changes.

## Direct Work Closure

For Direct Work, report the result, checked evidence, remaining limits, and any restoration note. Create `.geas/works/` records when the user asks or when the criteria/limits need later restoration.

## Escalation

Escalate Direct Work to Task when acceptance criteria, output types, verification methods, preparation needs, impact surface, risk, or User direction decisions become separate judgment surfaces.
