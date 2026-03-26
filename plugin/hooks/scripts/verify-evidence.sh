#!/bin/bash
# verify-evidence.sh — SubagentStop hook
# 서브에이전트 완료 후 evidence 파일 존재를 확인한다.
# 차단하지 않고 경고만 출력 (메인 세션이 재시도 판단).

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

# 현재 태스크 확인 + evidence 존재 검사
python -c "
import json, sys, os, glob
d = json.load(open(sys.argv[1]))
tid = d.get('current_task_id', '')
if not tid:
    sys.exit(0)
edir = os.path.join(sys.argv[2], 'evidence', tid)
if not os.path.isdir(edir):
    print(f'[Geas] Warning: No evidence directory for {tid}', file=sys.stderr)
    sys.exit(0)
files = glob.glob(os.path.join(edir, '*.json'))
if not files:
    print(f'[Geas] Warning: No evidence files in {edir} — agent may not have written results', file=sys.stderr)
" "$RUN_FILE" "$GEAS_DIR" 2>&1 >&2 || true

exit 0
