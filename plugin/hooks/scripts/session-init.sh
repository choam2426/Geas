#!/bin/bash
# session-init.sh — SessionStart hook
# 세션 시작 시 .geas/ 상태를 확인하고 컨텍스트를 주입한다.

set -euo pipefail

INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')

if [ -z "$CWD" ]; then
  exit 0
fi

GEAS_DIR="$CWD/.geas"
RUN_FILE="$GEAS_DIR/state/run.json"

# .geas가 없으면 Geas 프로젝트가 아님 — 무시
if [ ! -d "$GEAS_DIR" ]; then
  exit 0
fi

# run.json 존재 확인
if [ ! -f "$RUN_FILE" ]; then
  echo "[Geas] .geas/ directory exists but no run.json. Run setup first." >&2
  exit 0
fi

# 이전 세션 상태 로드
STATUS=$(jq -r '.status // "unknown"' "$RUN_FILE")
PHASE=$(jq -r '.phase // "unknown"' "$RUN_FILE")
MISSION=$(jq -r '.mission // "unknown"' "$RUN_FILE")
COMPLETED=$(jq -r '.completed_tasks | length' "$RUN_FILE" 2>/dev/null || echo "0")

echo "[Geas] Session resumed. Mission: $MISSION | Phase: $PHASE | Status: $STATUS | Tasks completed: $COMPLETED" >&2

# rules.md 존재 확인
if [ ! -f "$GEAS_DIR/rules.md" ]; then
  echo "[Geas] Warning: .geas/rules.md not found. Agent rules may not be enforced." >&2
fi

exit 0
