#!/bin/bash
# verify-evidence.sh — SubagentStop hook
# 서브에이전트 완료 후 evidence 파일 존재를 확인한다.
# 차단하지 않고 경고만 출력 (메인 세션이 재시도 판단).

set -euo pipefail

INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')

if [ -z "$CWD" ]; then
  exit 0
fi

GEAS_DIR="$CWD/.geas"
RUN_FILE="$GEAS_DIR/state/run.json"

# .geas가 없으면 Geas 프로젝트가 아님 — 무시
if [ ! -d "$GEAS_DIR" ] || [ ! -f "$RUN_FILE" ]; then
  exit 0
fi

# 현재 태스크 확인
CURRENT_TASK=$(jq -r '.current_task_id // empty' "$RUN_FILE")
if [ -z "$CURRENT_TASK" ]; then
  exit 0
fi

EVIDENCE_DIR="$GEAS_DIR/evidence/$CURRENT_TASK"

# evidence 디렉토리가 없으면 경고
if [ ! -d "$EVIDENCE_DIR" ]; then
  echo "[Geas] Warning: No evidence directory for $CURRENT_TASK" >&2
  exit 0
fi

# evidence 파일이 하나도 없으면 경고
FILE_COUNT=$(find "$EVIDENCE_DIR" -name "*.json" 2>/dev/null | wc -l)
if [ "$FILE_COUNT" -eq 0 ]; then
  echo "[Geas] Warning: No evidence files in $EVIDENCE_DIR — agent may not have written results" >&2
fi

exit 0
