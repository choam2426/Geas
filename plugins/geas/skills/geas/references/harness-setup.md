# Harness Setup Reference

Use Harness Setup to configure work readiness when preparation meaningfully improves result quality, execution feasibility, User judgment cost, or risk control.

Harness Setup is a conditional preparation step. It produces durable criteria only when the preparation has restoration value.

## Setup Triggers

Use this reference when any answer below changes Work criteria or judgment cost.

|Question|Reveal|
|---|---|
|Is current context enough for quality execution?|Extra docs, code map, external source, domain context.|
|Are style and project conventions clear?|Formatting, lint, naming, file layout, error handling, docs convention.|
|Can the environment be described and restored?|Runtime version, package manager, dev server, test command, env var.|
|Can execution be reproduced?|Fixture, seed data, mock, replay, sandbox.|
|Is the verification surface sufficient?|Test, manual check, comparison view, snapshot, property-based check.|
|Should quality be measured numerically?|Benchmark, profile, Lighthouse, load, latency, memory, bundle size.|
|Should execution be observed?|Log, trace, metric, screenshot, video, telemetry export.|
|Can risk be reduced before execution?|Static analysis, dependency scan, secret scan, permission review, rollback.|
|Should the output be evaluated repeatedly?|Golden case, rubric, grader, eval suite, regression eval.|
|Is a separate challenge perspective useful?|Review, challenge, separated context, subagent.|

## Harness Types

|Type|Use|
|---|---|
|Context|Stable access to docs, code maps, schemas, resources, or tools.|
|Convention|Project style, naming, layout, component, or error handling rules.|
|Execution|Reproducible local run, fixture, mock, seed data, replay, sandbox.|
|Verification|Tests, e2e checks, snapshots, visual comparison, manual checks.|
|Measurement|Benchmarks, profiles, load tests, latency, throughput, memory.|
|Observability|Logs, traces, metrics, screenshots, videos, run records.|
|Safety|Permission, security, dependency, secret, rollback review.|
|Evaluation|Rubrics, graders, golden cases, regression evals.|
|Review And Challenge|Separate perspective for omissions, weak assumptions, long-term cost.|
|Recovery|Backup, rollback route, feature flag, migration down path.|

## Record Placement

Fold durable setup results into existing fields:

|Work type|Place durable setup results in|
|---|---|
|Direct Work|Work Frame and Closure notes.|
|Task|`Starting Context`, `Guardrails`, `Verification Strategy`, `Review And Challenge Focus`.|
|Mission|`Key Context`, `Shared Considerations`, `Validation And Review Strategy`, `Continuity Needs`.|

## User Judgment Points

Raise User Judgment for setup that changes cost, account access, external connections, permissions, security exposure, maintenance burden, acceptance criteria, or risk acceptance.

## Boundary

Use execution-time setup inside Execute when setup leaves no reusable criteria or restoration value. Preserve durable setup results in the current workflow record fields.
