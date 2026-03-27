#!/bin/bash
# verify-evidence.sh — SubagentStop hook
# Checks evidence file existence after sub-agent completion.
# Warning only — does not block (main session decides on retry).

set -euo pipefail

INPUT=$(cat)
CWD=$(echo "$INPUT" | python -c "import json,sys; d=json.load(sys.stdin); print(d.get('cwd',''))" 2>/dev/null || echo "")

if [ -z "$CWD" ]; then
  exit 0
fi

GEAS_DIR="$CWD/.geas"
RUN_FILE="$GEAS_DIR/state/run.json"

# Not a Geas project — skip
if [ ! -d "$GEAS_DIR" ] || [ ! -f "$RUN_FILE" ]; then
  exit 0
fi

# Check current task + evidence existence
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
