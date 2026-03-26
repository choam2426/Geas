#!/bin/bash
# session-init.sh — SessionStart hook
# 세션 시작 시 .geas/ 상태를 확인하고 컨텍스트를 주입한다.

set -euo pipefail

INPUT=$(cat)
CWD=$(echo "$INPUT" | python -c "import json,sys; d=json.load(sys.stdin); print(d.get('cwd',''))" 2>/dev/null || echo "")

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
python -c "
import json, sys, os
d = json.load(open(sys.argv[1]))
status = d.get('status', 'unknown')
phase = d.get('phase', 'unknown')
mission = d.get('mission', 'unknown')
completed = len(d.get('completed_tasks', []))
print(f'[Geas] Session resumed. Mission: {mission} | Phase: {phase} | Status: {status} | Tasks completed: {completed}', file=sys.stderr)

rules = os.path.join(sys.argv[2], 'rules.md')
if not os.path.isfile(rules):
    template = '''# Agent Rules

## Evidence
- .geas/evidence/{task-id}/{your-name}.json에 JSON으로 작성
- 필수 필드: agent, task_id, summary, files_changed, created_at
- created_at은 실제 현재 시간. `date -u +%Y-%m-%dT%H:%M:%SZ`로 가져올 것. 더미 값 금지.

## Linear
- enabled: false

## 코드 작성
- TaskContract의 path_boundaries를 준수할 것
- 작업 범위 밖의 파일을 수정하지 말 것
'''
    with open(rules, 'w', encoding='utf-8') as f:
        f.write(template)
    print('[Geas] Created .geas/rules.md with initial template.', file=sys.stderr)
" "$RUN_FILE" "$GEAS_DIR" 2>&1 >&2 || true

exit 0
