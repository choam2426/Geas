# Example: One Small Task End to End

Use this reference when starting Geas work for the first time in a project or when unsure what proportional records look like in practice.

This example shows one small Task flowing through the whole workflow. Records below are in English; write real records in the user's working language.

## Request

User: `/geas add a --json flag to the status command so scripts can parse the output`

## Work Frame

Shown in conversation, kept short:

- Background: `status` prints human-readable text; scripts need parseable output.
- User Intent: add `--json` without changing the default output.
- Context Checked: `src/commands/status.ts`, flag handling in `src/cli.ts`, `.geas/memory/` (no relevant entries).
- Recommended Handling: Task — one acceptance criteria set, a runnable verification surface, user-visible output change.

User accepts Task handling. No Harness Setup needed: environment and test command are already known.

## Task Contract

`.geas/works/20260610-status-json-flag/tasks/001-add-json-flag/task-contract.md`

Core fields only. No conditional field trigger applies, so all conditional fields are omitted — that omission follows the proportionality rule.

```markdown
# Task Contract: add --json flag to status command

- Accepted: 2026-06-10 14:20 (user)

## Goal
The `status` command supports `--json` for machine-readable output.

## Boundary
In scope: status command output path and flag registration.
Out of scope: other commands, output schema versioning.

## Deliverable
Code change in `src/commands/status.ts` and `src/cli.ts`.

## Acceptance Criteria
- `status --json` prints valid JSON containing the same fields as the text output.
- `status` without the flag is byte-identical to current output.

## Verification Strategy
Run `status` and `status --json`, parse the JSON output, and run the existing CLI tests.

## User Judgment Point
Review Evidence: both command outputs and the test run result.
```

## Execute and Evidence

Agent implements the change, then writes `evidence.md` beside the contract:

```markdown
# Evidence

- Criteria Check: both Acceptance Criteria checked, both met.
- Checked Scope: ran `app status` and `app status --json`; parsed JSON with `jq`; ran `pnpm test cli` (12 passed).
- Evidence Material: command outputs and test summary below.
- Remaining Limits: JSON output not checked on Windows terminal encoding.
- Judgment Points: none beyond acceptance.
```

Strengthening check against the mandatory triggers: every Acceptance Criteria item was directly checked, a verification surface exists, the change is reversible, and no protected surface is touched — no trigger holds, so no strengthening. That check is itself visible in the Evidence above.

## Task User Judgment

Agent presents the result and Evidence, then waits. User answers: Accept, accepting the Windows encoding limit.

## Closure

`closure.md` beside the contract:

```markdown
# Closure

- Result: `--json` flag shipped in `src/commands/status.ts` and `src/cli.ts`.
- User Judgment: Accept (2026-06-10 15:02). Accepted limit: Windows terminal encoding unverified.
- Restoration Notes: none needed; Task closed.
- Continuity Artifact Review: one candidate — "CLI output changes need a script-consumer check" → saved to `.geas/memory/process.md`. No other candidates.
```

## Record Tree

```text
.geas/works/20260610-status-json-flag/
  work-frame.md
  tasks/
    001-add-json-flag/
      task-contract.md
      evidence.md
      closure.md
```

## What This Example Shows

- The contract used only the six core fields; conditional fields were omitted because no trigger applied.
- Acceptance status and time live inside the contract, so resume detection works.
- The mandatory strengthening triggers were checked and the no-strengthening outcome was recorded, not silently assumed.
- Closure recorded the user's explicit decision, the accepted limit, and one memory entry.
