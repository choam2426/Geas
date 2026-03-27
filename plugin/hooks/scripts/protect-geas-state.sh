#!/bin/bash
# protect-geas-state.sh — PostToolUse hook (Write|Edit)
# Monitors .geas/ state file integrity.
# Warns when task marked "passed" without required evidence.

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

# Not a .geas file — skip
case "$FILE_PATH" in
  */.geas/tasks/*.json)
    # Watch TaskContract edits: check if status changed to "passed"
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
    # seed.json is frozen after intake — warn on modification
    echo "[Geas] Warning: seed.json was modified after intake. Seed should be frozen." >&2
    ;;
esac

exit 0
