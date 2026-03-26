#!/bin/bash
# verify-pipeline.sh — Stop hook
# 세션 종료 전 파이프라인 완성도를 확인한다.
# MANDATORY evidence가 누락된 태스크가 있으면 세션 종료를 차단한다 (exit 2).

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

STATUS=$(jq -r '.status // empty' "$RUN_FILE")
PHASE=$(jq -r '.phase // empty' "$RUN_FILE")

# 이미 complete이면 검사 불필요
if [ "$STATUS" = "complete" ]; then
  exit 0
fi

# mvp 또는 그 이후 phase에서만 검사
if [ "$PHASE" != "mvp" ] && [ "$PHASE" != "polish" ] && [ "$PHASE" != "evolve" ]; then
  exit 0
fi

# completed_tasks 확인
COMPLETED_TASKS=$(jq -r '.completed_tasks[]? // empty' "$RUN_FILE")
MISSING=""

for TASK_ID in $COMPLETED_TASKS; do
  EVIDENCE_DIR="$GEAS_DIR/evidence/$TASK_ID"

  # MANDATORY: forge-review.json
  if [ ! -f "$EVIDENCE_DIR/forge-review.json" ]; then
    MISSING="$MISSING\n  - $TASK_ID: forge-review.json (Code Review) missing"
  fi

  # MANDATORY: sentinel.json
  if [ ! -f "$EVIDENCE_DIR/sentinel.json" ]; then
    MISSING="$MISSING\n  - $TASK_ID: sentinel.json (QA Testing) missing"
  fi
done

if [ -n "$MISSING" ]; then
  echo "[Geas] Pipeline incomplete. MANDATORY evidence missing:" >&2
  echo -e "$MISSING" >&2
  echo "" >&2
  echo "Execute the missing steps before completing the session." >&2
  exit 2  # 세션 종료 차단
fi

exit 0
