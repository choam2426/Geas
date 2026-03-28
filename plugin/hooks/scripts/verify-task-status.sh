#!/bin/bash
# verify-task-status.sh — PostToolUse hook (Write|Edit)
# When a task is marked "passed", verifies all mandatory evidence exists.

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

# Only process .geas/tasks/*.json files
case "$FILE_PATH" in
  */.geas/tasks/*.json) ;;
  *) exit 0 ;;
esac

GEAS_DIR="$CWD/.geas"

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
    if not os.path.isfile(os.path.join(edir, 'critic-review.json')):
        print(f'[Geas] Warning: {tid} marked as passed but critic-review.json is missing')
    if not os.path.isfile(os.path.join(edir, 'nova-verdict.json')):
        print(f'[Geas] Warning: {tid} marked as passed but nova-verdict.json is missing')
    retro_path = os.path.join(geas, 'memory', 'retro', tid + '.json')
    if not os.path.isfile(retro_path):
        print(f'[Geas] Warning: {tid} marked as passed but retro/{tid}.json is missing (Scrum retrospective not run)')
" "$FILE_PATH" "$GEAS_DIR" 2>/dev/null || echo "")
  if [ -n "$WARN" ]; then
    echo "$WARN" >&2
  fi
fi

exit 0
