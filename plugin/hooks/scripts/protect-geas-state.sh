#!/bin/bash
# protect-geas-state.sh — PostToolUse hook (Write|Edit)
# .geas/ 핵심 상태 파일의 무결성을 감시한다.
# task status가 "passed"로 바뀔 때 필수 evidence가 있는지 확인한다.

set -euo pipefail

INPUT=$(cat)

PARSED=$(echo "$INPUT" | python -c "
import json, sys
d = json.load(sys.stdin)
cwd = d.get('cwd', '')
ti = d.get('tool_input', {})
if isinstance(ti, str):
    try:
        ti = json.loads(ti)
    except:
        ti = {}
fp = ti.get('file_path', '') if isinstance(ti, dict) else ''
print(cwd)
print(fp)
" 2>/dev/null || echo "")

CWD=$(echo "$PARSED" | head -1)
FILE_PATH=$(echo "$PARSED" | tail -1)

if [ -z "$CWD" ] || [ -z "$FILE_PATH" ]; then
  exit 0
fi

GEAS_DIR="$CWD/.geas"

# .geas 파일이 아니면 무시
case "$FILE_PATH" in
  */.geas/tasks/*.json)
    # TaskContract 수정 감시: status가 "passed"로 바뀌는지 확인
    if [ -f "$FILE_PATH" ]; then
      WARN=$(python -c "
import json, sys, os
fp = sys.argv[1]
geas = sys.argv[2]
d = json.load(open(fp))
if d.get('status') == 'passed':
    tid = d.get('id', '')
    edir = os.path.join(geas, 'evidence', tid)
    if not os.path.isfile(os.path.join(edir, 'forge-review.json')):
        print(f'[Geas] Warning: {tid} marked as passed but forge-review.json is missing')
    if not os.path.isfile(os.path.join(edir, 'sentinel.json')):
        print(f'[Geas] Warning: {tid} marked as passed but sentinel.json is missing')
" "$FILE_PATH" "$GEAS_DIR" 2>/dev/null || echo "")
      if [ -n "$WARN" ]; then
        echo "$WARN" >&2
      fi
    fi
    ;;
  */.geas/spec/seed.json)
    # seed.json은 intake 후 고정. 수정 시 경고.
    echo "[Geas] Warning: seed.json was modified after intake. Seed should be frozen." >&2
    ;;
esac

exit 0
