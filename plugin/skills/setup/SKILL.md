---
name: setup
description: First-time setup — validate Linear API key, check dependencies, configure Linear workspace, generate config files.
---

# Setup

Compass should invoke this automatically on the first natural-language request in a new project.

Users should not need to run setup manually unless they are troubleshooting.

## Steps

### Phase A: Initialize `.geas/` Runtime Directory

Before anything else, create the runtime directory structure in the project root:

```bash
mkdir -p .geas/spec .geas/state .geas/tasks .geas/packets .geas/evidence .geas/decisions .geas/ledger .geas/memory/_project
```

Then ensure `.geas/` is gitignored. Check if `.gitignore` exists:
- If yes: append `.geas/` if not already present
- If no: create `.gitignore` with `.geas/` entry

Write the initial run state file `.geas/state/run.json`:
```json
{
  "version": "1.0",
  "status": "initialized",
  "mission": null,
  "mode": null,
  "phase": null,
  "current_task_id": null,
  "completed_tasks": [],
  "decisions": [],
  "created_at": "<ISO 8601 now>"
}
```

### Phase A-2: Generate `.geas/rules.md`

Write `.geas/rules.md` — the shared rules that ALL agents must follow:

```markdown
# Agent Rules

## Evidence
- 작업 결과를 .geas/evidence/{task-id}/{your-name}.json에 JSON으로 작성
- 필수 필드: agent, task_id, summary, files_changed, created_at
- created_at은 실제 현재 시간. Bash에서 date -u +%Y-%m-%dT%H:%M:%SZ 로 가져올 것. 더미 값 금지.

## Linear
- enabled: <true 또는 false — Phase B 결과에 따라 채움>
- 댓글 형식: [AgentName] 요약 내용
- LINEAR_API_KEY를 직접 환경변수로 설정하지 말 것. .env에서 자동 로드됨.
- 이슈 UUID는 ContextPacket의 Reference 섹션에 있음.
- linear-cli 경로: <Phase B에서 발견된 경로로 채움>

## 코드 작성
- TaskContract의 path_boundaries를 준수할 것
- 작업 범위 밖의 파일을 수정하지 말 것
```

Phase B 완료 후 Linear 관련 필드를 실제 값으로 업데이트할 것 (enabled, linear-cli 경로).

### Phase B: Linear Setup (Optional)

Ask the user: "Do you want to connect Linear for issue tracking? (Recommended for team visibility, but not required)"

If the user declines Linear:
- Write `.geas/config.json` with `"linear_enabled": false`
- Skip to Step 9 (Report results)
- The team will use `.geas/` as the sole state store

If the user wants Linear, proceed with the steps below:

1. **Detect existing Linear API key**
   - First, try running `linear_cli.py list-teams` without asking for a key.
     - The script's `load_dotenv()` automatically walks up the directory tree to find `.env` files, so a key in a parent directory will be discovered.
   - Windows: `python <linear-cli skill dir>/scripts/linear_cli.py list-teams`
   - macOS/Linux: `python3 <linear-cli skill dir>/scripts/linear_cli.py list-teams`
   - Use the same script-path convention documented in the `linear-cli` skill; do not assume a repo-root path like `skills/linear-cli/...`
   - **If it returns teams**: report "Found existing Linear API key." and skip to Step 5 (Select Linear team) with the returned team list.
   - **If it fails with "LINEAR_API_KEY not set"**: no key found anywhere. Proceed to Step 2.
   - **If it fails with an auth error**: a key exists but is invalid. Tell the user and proceed to Step 2.

2. **Ask the user for their Linear API key**
   - Direct them to https://linear.app/settings/api to create one
   - The key should start with `lin_api_`
   - Run `linear_cli.py list-teams` with the provided key set as `LINEAR_API_KEY`
   - If it returns teams, the key is valid
   - If it errors, tell the user the key is invalid

3. **Check Python**
   - Run: `python --version` on Windows or `python3 --version` on macOS/Linux
   - Require Python 3.6+
   - If missing, direct user to https://python.org

4. **Create .env file** (only if key was manually provided in Step 2)
   - If the key was auto-discovered in Step 1: skip this step — the key already exists in an ancestor `.env`
   - If the key was manually entered: write `LINEAR_API_KEY=<user's key>` to `.env` at project root
   - Do NOT overwrite if `.env` already exists — ask first

5. **Select Linear team**
   - List teams from the API response (already available from Step 1 or Step 2)
   - If only 1 team → auto-select it
   - If multiple teams → ask the user to choose (show numbered list)
   - Tell the user which team was selected

6. **Initialize Linear workspace structure**
   Using the selected team, run these steps:

   a. **Check existing labels** (`list-issue-labels --team <team-name>`)
      - 먼저 기존 라벨 목록을 가져온다.
      - 필요한 라벨: type(`feature`, `bug`, `design-spec`, `architecture`, `review`, `tech-debt`, `blocked`, `pivot`, `improvement`), area(`frontend`, `backend`, `infra`), role(`needs-review`, `needs-qa`)
      - 기존 목록과 대조하여 **이미 존재하는 라벨은 건너뛴다. 존재하지 않는 것만 생성한다.**
      - Use `create-issue-label --name <name> --team-id <UUID>` for each **missing** label only.
      - Report: count created vs already existed

   b. **Check existing workflow states** (`list-issue-statuses --name <team-name>`)
      - Verify these exist: Backlog, Todo, In Progress, In Review, Testing, Done, Canceled
      - Create `Waiting` if missing (type: `unstarted`, color: `#f59e0b`)
      - Use `save-issue-status --input '{"name":"Waiting","teamId":"<UUID>","type":"unstarted","color":"#f59e0b"}'` if needed
      - Report: count configured

7. **Save startup config**
   - Write `.geas/config.json`:
   ```json
   {
     "linear_enabled": true,
     "team": { "id": "<UUID>", "name": "<team name>", "key": "<team key>" }
   }
   ```
   - This file is gitignored (user-specific)
   - Compass will read this on future runs to skip team selection

8. **Report results**
   ```
   Setup complete:
   - .geas/: initialized (spec, state, tasks, packets, evidence, decisions, ledger)
   - Linear: <connected | skipped>
   - API key: <auto-discovered | manually entered>
   - Team: <team name> (selected) | N/A
   - Python: <version>
   - .env: <created | skipped (key in parent .env)>
   - Labels: <count> configured | N/A
   - Workflow states: <count> configured | N/A
   - Config: .geas/config.json saved

   Ready! Stay in Claude and describe your mission in natural language.
   ```

## If something fails
- Missing Python: "Install Python 3.6+ from https://python.org"
- Missing Node.js: "Install Node.js 18+ from https://nodejs.org"
- Invalid API key: "Check your key at https://linear.app/settings/api"
