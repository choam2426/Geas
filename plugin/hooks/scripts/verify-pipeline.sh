#!/bin/bash
# verify-pipeline.sh — Stop hook
# 세션 종료 전 파이프라인 완성도를 확인한다.
# MANDATORY evidence가 누락된 태스크가 있으면 세션 종료를 차단한다 (exit 2).

set -euo pipefail

INPUT=$(cat)
CWD=$(echo "$INPUT" | python -c "import json,sys; d=json.load(sys.stdin); print(d.get('cwd',''))" 2>/dev/null || echo "")

if [ -z "$CWD" ]; then
  exit 0
fi

GEAS_DIR="$CWD/.geas"
RUN_FILE="$GEAS_DIR/state/run.json"

# .geas가 없으면 Geas 프로젝트가 아님 — 무시
if [ ! -d "$GEAS_DIR" ] || [ ! -f "$RUN_FILE" ]; then
  exit 0
fi

STATUS=$(python -c "import json,sys; d=json.load(open(sys.argv[1])); print(d.get('status',''))" "$RUN_FILE" 2>/dev/null || echo "")
PHASE=$(python -c "import json,sys; d=json.load(open(sys.argv[1])); print(d.get('phase',''))" "$RUN_FILE" 2>/dev/null || echo "")

# 이미 complete이면 검사 불필요
if [ "$STATUS" = "complete" ]; then
  exit 0
fi

# mvp 또는 그 이후 phase에서만 검사
if [ "$PHASE" != "mvp" ] && [ "$PHASE" != "polish" ] && [ "$PHASE" != "evolve" ]; then
  exit 0
fi

# completed_tasks 확인 + evidence 검사
MISSING=$(python -c "
import json, sys, os
d = json.load(open(sys.argv[1]))
geas = sys.argv[2]
missing = []
for tid in d.get('completed_tasks', []):
    edir = os.path.join(geas, 'evidence', tid)
    if not os.path.isfile(os.path.join(edir, 'forge-review.json')):
        missing.append(f'  - {tid}: forge-review.json (Code Review) missing')
    if not os.path.isfile(os.path.join(edir, 'sentinel.json')):
        missing.append(f'  - {tid}: sentinel.json (QA Testing) missing')
print('\n'.join(missing))
" "$RUN_FILE" "$GEAS_DIR" 2>/dev/null || echo "")

if [ -n "$MISSING" ]; then
  echo "[Geas] Pipeline incomplete. MANDATORY evidence missing:" >&2
  echo "$MISSING" >&2
  echo "" >&2
  echo "Execute the missing steps before completing the session." >&2
  exit 2  # 세션 종료 차단
fi

exit 0
