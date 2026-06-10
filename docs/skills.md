# Geas Skill Structure

## 목적

`Geas Skill Structure`는 [Geas Workflow](./workflow/index.md)를 하나의 skill package와 workflow별 reference로 실행하는 기준이다.

Geas는 하나의 entrypoint인 `geas`만 둔다. `SKILL.md`는 현재 `Work` 상태를 읽고 필요한 reference를 선택하는 controller 역할만 한다. 세부 schema, 작성 규칙, 판단 기준은 `references/*.md`에 둔다.

## 기본 구조

```text
geas/
  SKILL.md
  references/
    work-frame.md
    harness-setup.md
    task.md
    mission.md
    evidence-judgment.md
    continuity.md
    example.md
```

Script는 반복적이고 취약한 기계 작업이 실제로 생길 때 추가한다.

## 설계 원칙

|원칙|기준|
|---|---|
|단일 entrypoint|User는 `geas` 하나만 호출한다.|
|얇은 controller|`SKILL.md`는 상태 판별, reference 선택, hard boundary만 담는다.|
|Schema는 reference|runtime schema와 작성 규칙은 `references/*.md`에 둔다.|
|Workflow와 같은 축|reference 파일은 workflow 문서의 축과 맞춘다.|
|중복 최소화|reference는 workflow 문서를 skill 실행에 필요한 schema/checklist로 압축한다.|
|User Judgment 분리|Agent는 판단 표면을 준비하고 User의 명시적 판단만 기록한다.|
|조건부 Harness Setup|작업 준비 상태 구성은 필요한 `Work`에서만 수행한다.|
|기록 위치 고정|Geas workflow 기록은 정해진 위치와 grouping 규칙을 따른다.|

## `SKILL.md` 책임

`SKILL.md`는 다음 책임만 가진다.

|책임|내용|
|---|---|
|Trigger|명시적 `geas` 호출, Work 시작/계속/점검/종료 요청, Task/Mission/User Judgment/Closure 요청, 저장된 Work 재개 요청을 Geas workflow 대상으로 판단한다. 새 작업의 시작은 명시적 호출을 따르되, `.geas/works/`에 `Closure`에 도달하지 않은 Work가 있고 요청이 그 Work를 잇는 경우 명시적 호출 없이도 발동한다. 시작된 Work는 `Closure`나 명시적 Cancel까지 Geas가 관할하고, 게이트 생략 요청은 워크플로우 이탈이 아니라 User Judgment로 기록해 처리한다.|
|State Read|현재 요청, 대화 맥락, 관련 파일, 저장된 Work 상태를 우선순위에 따라 읽는다.|
|Flow Decision|현재 `Work`가 시작, 기준 정리, 실행, 판단 대기, rework, cancel, closure 중 어디인지 판별한다.|
|Reference Selection|현재 상태에 맞는 minimum load set을 읽는다.|
|User Interaction|결과를 바꾸는 기준, 위험, tradeoff, 권한, 비용을 User 판단 지점으로 올린다.|
|Record Action|reference 기준에 따라 필요한 Work 기록을 만들거나 갱신한다.|
|Boundary|User Judgment는 User의 명시적 결정으로 기록하고 Mission/Task 기록은 필요한 범위에서 만든다.|

기본 루프는 다음과 같다.

```text
Read state
  -> identify current Work position
  -> select reference
  -> act or ask for User Judgment
  -> update Work state
  -> close or continue
```

State source priority는 다음 순서를 따른다.

|우선순위|Source|기준|
|---|---|---|
|1|최신 User 지시|현재 턴에서 User가 명시한 목표, 범위, 판단, 중단, 변경 요청을 최우선 기준으로 둔다.|
|2|명시적 Work 기록|`.geas/works/`의 현재 Work 기록, User가 지정한 Work directory, 현재 Task/Mission 기록을 따른다.|
|3|관련 파일|User가 지정한 파일, 현재 작업과 직접 연결된 repository 파일, workflow 문서를 따른다.|
|4|대화 맥락|이전 대화와 요약은 위 source를 해석하는 보조 맥락으로 사용한다.|

Source 사이 기준이 충돌하면 더 높은 우선순위 source를 기준으로 삼고, 결과 기준이나 User Judgment가 달라지는 경우 User 판단 지점으로 올린다.

## Workflow 기록 위치

Geas가 남기는 기록은 workflow 기준, 판단, 복원 정보를 위한 것이다. 실제 작업 산출물은 각 작업의 자연스러운 위치에 둔다.

기본 위치는 workspace root의 `.geas/works/`다.

```text
.geas/
  works/
    20260604-harness-setup-redefine/
      work-frame.md
      mission-brief.md
      mission-synthesis.md
      closure.md
      tasks/
        001-update-workflow/
          task-contract.md
          evidence.md
          closure.md
```

Work directory 이름은 `YYYYMMDD-<slug>` 형식을 사용한다.

|부분|규칙|
|---|---|
|`YYYYMMDD`|Work를 기록으로 만들기 시작한 local time을 사용한다.|
|`slug`|User 요청이나 Work 목표를 3-6 단어의 lowercase kebab-case로 줄인다.|
|충돌|같은 이름이 있으면 뒤에 `-2`, `-3`을 붙인다.|
|문자|ASCII lowercase letter, digit, hyphen만 사용한다.|

기록은 Work 수준과 Task 수준으로 나눈다.

|수준|위치|
|---|---|
|Work 수준 기록|Work directory root|
|Task 수준 기록|`tasks/NNN-<task-slug>/`|

Task 기록은 단일 `Task`라도 `tasks/` 아래의 디렉터리로 둔다. Task는 `Task Contract`, `Evidence`, `User Judgment`, `Closure`를 모두 갖는 판단 단위이므로 디렉터리로 보존한다. `NNN`은 같은 Work 안의 Task 순서를 001부터 부여한다.

고정 workflow 산출물은 정해진 basename을 사용한다.

|산출물|기본 위치|기본 이름|
|---|---|---|
|`Work Frame`|Work directory root|`work-frame.md`|
|`Mission Brief`|Work directory root|`mission-brief.md`|
|`Mission Synthesis`|Work directory root|`mission-synthesis.md`|
|Work 수준 `Closure`|Work directory root|`closure.md`|
|`Task Contract`|`tasks/NNN-<task-slug>/`|`task-contract.md`|
|`Evidence` 요약|`tasks/NNN-<task-slug>/`|`evidence.md`|
|Task 수준 `Closure`|`tasks/NNN-<task-slug>/`|`closure.md`|

User Judgment는 `closure.md` 안에 남긴다. Agent는 판단 표면을 준비하고, User Judgment는 User의 명시적 결정으로 기록한다.

고정 산출물의 확장자는 기본적으로 `.md`를 사용한다. User 판단 표면, 시각 비교, screenshot, 구조화된 검사 결과처럼 Markdown보다 적합한 형식이 있으면 같은 Task directory 안에 역할이 드러나는 이름으로 `html`, `json`, `png`, `txt` 등을 둔다.

```text
tasks/
  001-update-workflow/
    task-contract.md
    evidence.md
    judgment-surface.html
    visual-diff.html
    screenshot.png
    closure.md
```

단일 `Task`로 끝나는 `Work`도 Task 수준 기록은 `tasks/NNN-<task-slug>/` 아래에 둔다. 이 규칙은 단일 Task가 이후 여러 Task로 커져도 파일 이동을 줄이고, Task 판단 단위를 항상 같은 구조로 복원하기 위한 것이다.

`Task`와 `Mission`으로 다루는 `Work`는 기록을 항상 만든다. 계약, 수용 기록, `Evidence`, `Closure`가 User 판단과 `Work` 재개의 기반이기 때문이다. 작은 `Direct Work` 기록만 조건부로, User가 명시적으로 기록을 원하거나 이후 복원할 가치가 있는 기준/판단/한계가 있을 때 `.geas/works/`에 남긴다.

기록은 User의 작업 언어로 쓴다.

`Work Frame`, `Task Contract`, `Mission Brief` 기록에는 User 수용 여부와 수용 시점을 남긴다. 이 수용 기록은 중단된 `Work`를 재개할 때 현재 위치를 판별하는 기준이 된다. 수용 성립 기준은 [workflow/alignment.md](./workflow/alignment.md)의 `수용`을 따른다.

`Continuity Artifact`는 `.geas/memory/`에 유형별 파일로 남기고 git에 커밋한다.

```text
.geas/
  memory/
    facts.md
    preferences.md
    decisions.md
    risks.md
    open-questions.md
    process.md
```

|부분|규칙|
|---|---|
|단위|항목 하나는 기준 하나. 유형 파일 안의 `## <slug>` 섹션으로 남긴다.|
|형식|Source, Date, 내용, 적용 방법, 무효 조건을 남긴다.|
|참조|새 `Work`의 Alignment에서 관련 유형 파일을 읽고 관련 항목을 `Context Checked`에 반영한다.|
|검증|항목 적용 전에 유효한지 확인하고, 모순이면 그 자리에서 갱신하거나 삭제한다.|
|제외|repo에서 파생 가능한 것, 이번 `Work` 한정 맥락, 산출물/로그 덤프, secret은 남기지 않는다.|

세부 형식과 규칙은 [workflow/continuity.md](./workflow/continuity.md)의 `Continuity Artifact 저장`을 따른다.

## Reference 구성

### `references/work-frame.md`

역할:

- `Work Frame` schema와 작성 규칙을 제공한다.
- `Direct Work`, `Task`, `Mission` 처리 방식 선택 기준을 제공한다.

포함:

- `Work Frame` schema
- `Work Frame Alignment` checklist
- `Harness Setup Need` field guidance
- `Direct Work` criteria
- `Direct Work`에서 `Task`로 승격하는 기준

사용:

- 새 `Work`가 시작될 때
- 요청이 흐리거나 처리 방식 판단이 필요할 때
- 작업 중 기준 변경으로 새 `Work Frame`이 필요할 때

### `references/harness-setup.md`

역할:

- 작업 준비 상태 구성을 위한 `Harness Setup` 판단 기준을 제공한다.

포함:

- `Harness Setup Need`
- style, conventions, environment, tools, verification surface, risk controls 기준
- 수행 조건
- User 판단 지점
- 생략 기준

사용:

- 작업 전 준비가 결과 품질, 실행 가능성, 판단 비용, 위험 통제를 바꿀 때
- 코드 스타일, 프로젝트 관례, 환경 정보, 도구 설치, MCP 연결, fixture, benchmark, observability, safety, eval 준비가 필요할 때
- 준비 자체가 비용, 권한, 보안, 외부 연결, 유지 부담을 만들 때

### `references/task.md`

역할:

- `Task`와 `Task Contract`의 runtime schema와 진행 규칙을 제공한다.

포함:

- `Task` 분리 기준
- `Task Contract` schema
- `Verification Strategy`, `Review And Challenge Focus`, `Evidence Plan`
- `Change Trigger`
- `Task User Judgment`
- `Cancel Handling`

사용:

- `Work`가 `Task`로 다뤄질 때
- `Task Contract`를 작성하거나 갱신할 때
- `Task` 실행 중 기준 변화, rework, cancel이 발생할 때
- Task 결과를 User 판단 표면으로 만들 때

### `references/mission.md`

역할:

- `Mission Brief`, `Mission Synthesis`, `Mission User Judgment`의 runtime schema와 진행 규칙을 제공한다.

포함:

- `Mission Brief` schema
- `Task Structure`
- `Task Contribution Map`
- `Task Judgment Boundary`
- `Mission Synthesis` schema
- `Mission User Judgment`
- `Task`에서 `Mission`으로 승격하는 기준

사용:

- `Work`가 `Mission`으로 다뤄질 때
- `Mission Brief`를 작성하거나 갱신할 때
- 여러 `Task` 결과를 Mission 기준으로 종합할 때
- Mission 수준 User 판단이 필요할 때

### `references/evidence-judgment.md`

역할:

- `Evidence`와 `User Judgment` 분리 기준을 제공한다.

포함:

- `Evidence` schema
- `Check and Limits`
- Evidence 강화 기준
- verification, review, challenge 선택 기준
- Agent verdict와 User Judgment 분리 기준
- `Task User Judgment`, `Mission User Judgment` 기록 boundary

사용:

- 결과와 확인 근거를 판단 입력으로 정리할 때
- verification, review, challenge가 필요한지 판단할 때
- User 판단을 준비하거나 기록할 때

### `references/continuity.md`

역할:

- `Closure`와 continuity review의 runtime schema와 정리 기준을 제공한다.

포함:

- `Closure` schema
- `Direct Work` closure checklist
- `Task` closure checklist
- `Mission` closure checklist
- continuity review
- 다음 `Work`로 넘길 상태와 이번 `Work` 안에서 마무리할 상태의 분리

사용:

- `Direct Work`, `Task`, `Mission`을 닫을 때
- User Judgment 이후 결과, 확인 근거, 남은 한계, 복원 정보를 정리할 때
- 다음 작업에 남길 기준, 위험, 열린 질문, 작업 방식 개선 후보를 분류할 때

### `references/example.md`

역할:

- 작은 `Task` 하나의 전체 흐름을 비례 작성된 실제 기록 형태로 보여준다.

포함:

- 짧은 `Work Frame`
- 핵심 필드만 사용한 `Task Contract`와 수용 스탬프
- `Evidence`와 강화 발동 조건 검사
- `User Judgment`, `Closure`, `Continuity Artifact Review`
- 기록 트리

사용:

- 프로젝트에서 Geas를 처음 사용할 때
- 기록 형태나 비례 작성 수준이 불확실할 때

## Reference 선택 기준

Reference는 상황별 minimum load set을 기준으로 읽는다.

|상황|minimum load set|
|---|---|
|새 `Work` 시작|`work-frame.md`|
|처리 방식 판단|`work-frame.md`|
|작업 준비 상태 구성이 결과 품질, 판단 비용, 권한, 위험을 바꿀 때|`work-frame.md`, `harness-setup.md`|
|`Task Contract` 작성 또는 갱신|`work-frame.md` 또는 `mission.md`, `task.md`|
|Task 결과 판단 준비|`task.md`, `evidence-judgment.md`|
|Task 종료|`task.md`, `evidence-judgment.md`, `continuity.md`|
|`Mission Brief` 작성 또는 갱신|`work-frame.md`, `mission.md`|
|Mission 안의 Task 설계|`mission.md`, `task.md`|
|Mission 수준 종합|`mission.md`, `evidence-judgment.md`|
|Mission 종료|`mission.md`, `evidence-judgment.md`, `continuity.md`|
|Direct Work 종료|`work-frame.md`, `continuity.md`|
|프로젝트 첫 Geas 사용 또는 기록 형태 판단|`example.md`|
|Workflow 기록 생성 또는 갱신|해당 단계 reference와 이 문서의 기록 위치 규칙|

## Boundary

이 문서는 하나의 `geas` entrypoint와 references 구조를 정의한다.

Geas는 하나의 entrypoint와 references 구조를 사용한다.

Script는 반복적이고 취약한 기계 작업이 실제로 생길 때 추가한다.

`SKILL.md`는 상태 판별, reference 선택, hard boundary를 담고, runtime schema는 references에 둔다.

Harness 준비 결과는 기존 workflow 필드에 반영한다.

작업 산출물은 각 작업의 자연스러운 위치에 둔다.

Reference는 workflow 문서를 실행용 schema/checklist로 압축한다.

작은 `Direct Work` 기록은 User 요청이나 복원 가치가 있을 때 만든다.

User Judgment는 User의 명시적 결정으로 기록한다.

`Harness Setup`은 필요한 `Work`에서 조건부로 수행한다.
