#!/bin/bash
# protect-geas-state.sh — PostToolUse hook (Write|Edit)
# .geas/ 핵심 상태 파일의 무결성을 감시한다.
# task status가 "passed"로 바뀔 때 필수 evidence가 있는지 확인한다.

set -euo pipefail

INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')
TOOL_INPUT=$(echo "$INPUT" | jq -r '.tool_input // empty')
FILE_PATH=$(echo "$TOOL_INPUT" | jq -r '.file_path // empty' 2>/dev/null || echo "")

if [ -z "$CWD" ] || [ -z "$FILE_PATH" ]; then
  exit 0
fi

GEAS_DIR="$CWD/.geas"

# .geas 파일이 아니면 무시
case "$FILE_PATH" in
  */.geas/tasks/*.json)
    # TaskContract 수정 감시: status가 "passed"로 바뀌는지 확인
    if [ -f "$FILE_PATH" ]; then
      NEW_STATUS=$(jq -r '.status // empty' "$FILE_PATH" 2>/dev/null || echo "")
      if [ "$NEW_STATUS" = "passed" ]; then
        TASK_ID=$(jq -r '.id // empty' "$FILE_PATH" 2>/dev/null || echo "")
        EVIDENCE_DIR="$GEAS_DIR/evidence/$TASK_ID"

        if [ ! -f "$EVIDENCE_DIR/forge-review.json" ]; then
          echo "[Geas] Warning: $TASK_ID marked as 'passed' but forge-review.json is missing" >&2
        fi
        if [ ! -f "$EVIDENCE_DIR/sentinel.json" ]; then
          echo "[Geas] Warning: $TASK_ID marked as 'passed' but sentinel.json is missing" >&2
        fi
      fi
    fi
    ;;
  */.geas/spec/seed.json)
    # seed.json은 intake 후 고정. 수정 시 경고.
    echo "[Geas] Warning: seed.json was modified after intake. Seed should be frozen." >&2
    ;;
esac

exit 0
