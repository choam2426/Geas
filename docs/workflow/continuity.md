# Continuity

## 목적

`Continuity`는 `Work`의 결과, 판단 기준, 남은 한계, 다음 작업에서 다시 참조할 메모리, 작업 방식 개선 후보를 남겨 이후 작업의 생산성을 높이는 기준이다.

Agent는 `Work`가 끝날 때 결과, 확인 근거, 미확인 범위, User 판단, 필요한 복원 정보, `Work` 밖에 남길 메모리 후보, 작업 방식 개선 후보를 구분해 남긴다.

`Continuity Artifact`는 `Work` 밖에 남아 다음 작업에서 다시 참조되는 메모리다.

## Closure

`Closure`는 `Work`의 결과, 확인 근거, 미확인 범위, User 판단 결과, 필요한 복원 정보, `Work` 밖에 남길 후보, 다음 작업 방식의 개선 후보가 정리된 상태다.

Agent는 결과 생성 뒤 확인 근거, 미확인 범위, User 판단 결과, 복원 정보, `Work` 밖에 남길 후보, 다음 작업 방식의 개선 후보를 정리한다. `Closure`는 User 또는 다음 실행자가 같은 기준으로 결과를 판단하거나 이어갈 수 있을 때 성립한다.

복원 정보는 같은 `Work`를 이어서 다룰 때 현재 위치, User가 받아들인 결정과 tradeoff, 열린 질문, 확인한 한계를 짧게 정리한다.

`Continuity Artifact Review`는 모든 `Closure`에 포함한다. review 결과는 `Work` 밖에 남길 후보, 다음 작업 방식의 개선 후보, 각 후보의 분류 판단을 포함한다.

단위별 `Closure` 기준은 다음과 같다.

|단위|Closure 기준|
|---|---|
|`Direct Work`|결과, `Check and Limits`, 필요한 복원 정보, `Continuity Artifact Review` 결과를 남긴다.|
|`Task`|결과, `Evidence`, `User Judgment`, 필요한 복원 정보, `Continuity Artifact Review` 결과를 남긴다.|
|`Mission`|`Mission Synthesis`, `Evidence`, `User Judgment`, 필요한 복원 정보, `Continuity Artifact Review` 결과를 남긴다.|

`Task`와 `Mission`은 User 판단이 필요한 단위다. Agent가 결과와 `Evidence`를 준비한 상태는 `Ready for Judgment`이고, User Judgment 이후에 `Closure` 기준을 충족한다.

## Continuity Artifact

`Continuity Artifact`는 `Work` 밖에 남아 다음 작업에서 다시 참조되는 메모리다.

Closure 안의 복원 정보는 현재 `Work`를 이어서 다룰 때 쓰인다. `Continuity Artifact`는 다음 `Work`의 목표, 기준, 결정, 위험 판단, 작업 방식 개선에 영향을 주는 메모리다.

다음 작업자가 같은 맥락을 다시 복원해야 하는 항목은 `Continuity Artifact` 후보가 된다.

다음 조건을 만족하는 항목은 `Continuity Artifact` 후보가 된다.

|승격 기준|의미|
|---|---|
|이후 `Work`의 기준으로 작동한다.|다음 작업의 목표, 범위, 수용 기준, 확인 방법을 바꾼다.|
|User가 받아들인 결정이나 tradeoff가 이후 작업을 바꾼다.|이후 작업자가 같은 결정을 다시 복원해야 한다.|
|미확인 범위나 위험이 장기 비용으로 남는다.|현재 수용한 한계가 이후 품질, 유지보수, 재작업 비용에 영향을 준다.|
|열린 질문이 다음 판단을 막거나 방향을 바꿀 수 있다.|다음 작업 전에 다시 확인해야 하는 판단이 남아 있다.|
|세션 전환이나 작업자 교체 뒤에도 기준으로 쓰인다.|현재 대화 밖에서도 다음 작업의 판단 기준으로 작동한다.|
|다음 작업 방식의 개선 후보가 된다.|반복된 혼선, 기준 변경, 검증 누락, 질문 방식, artifact 구조 개선처럼 이후 `Work` 품질을 바꿀 수 있다.|

## Continuity Artifact Review

`Continuity Artifact Review`는 `Closure` 안에서 다음 작업의 메모리로 남길 항목과 작업 방식 개선 후보를 확인하는 절차다.

Agent는 `Closure` 중 장기 효력이 있는 결정, 맥락, 기준, 위험, 열린 질문, 작업 방식 개선 후보를 확인한다. 각 후보는 `Continuity Artifact`로 남길 항목, Closure의 복원 정보에만 남길 항목, 이번 `Work` 안에서 마무리된 항목으로 구분한다.

## Continuity Artifact 저장

`Continuity Artifact`는 workspace root의 `.geas/memory/`에 유형별 파일로 남긴다. memory는 git에 커밋해 팀과 다음 실행자가 공유하는 작업 기준으로 다룬다.

|유형 파일|내용|
|---|---|
|`facts.md`|환경, 도구, 도메인에 대해 확인된 사실|
|`preferences.md`|User가 드러낸 선호와 상호작용 방식|
|`decisions.md`|User가 수용한 선택, tradeoff, 기준|
|`risks.md`|수용된 한계, 미확인 범위, 알려진 위험|
|`open-questions.md`|다음 판단을 막거나 바꿀 수 있는 열린 질문|
|`process.md`|작업 방식 개선, 검증 표면, harness 준비 단축 경로|

항목은 유형 파일 안의 섹션으로 남기고 다음 형식을 따른다.

```markdown
## test-command-pnpm-unit
- Source: .geas/works/20260610-setup-ci
- Date: 2026-06-10

단위 테스트는 `pnpm test:unit`으로 실행한다. e2e는 로컬에서 실행하지 않고 CI에서만 돈다.

적용: `Verification Strategy`의 단위 테스트 표면으로 사용한다.
무효 조건: package.json의 테스트 스크립트가 바뀌면 갱신한다.
```

저장과 회상은 다음 규칙을 따른다.

|규칙|내용|
|---|---|
|단위|항목 하나는 기준 하나를 다룬다. 짧게 쓴다.|
|저장 게이트|`Continuity Artifact Review`에서 후보를 User에게 보인 뒤 저장한다. 조용한 자동 저장은 하지 않는다. 후보가 없으면 "없음"으로 끝낸다.|
|갱신|같은 기준을 다루는 항목이 있으면 새 항목을 만들지 않고 기존 항목을 갱신한다.|
|회상|새 `Work`의 Alignment에서 관련 유형 파일을 읽고 관련 항목을 `Work Frame`의 `Context Checked`에 반영한다.|
|회상 시 검증|항목을 적용하기 전에 현재도 유효한지 확인한다. 현재 상태와 모순되면 그 자리에서 항목을 갱신하거나 삭제한다.|
|무효 조건|작성할 때 항목이 효력을 잃는 조건을 함께 남긴다.|
|정리|유형 파일이 길어져 회상 비용이 커지면 오래된 항목을 통합하거나 삭제한다.|

다음은 `Continuity Artifact`로 남기지 않는다.

|제외|이유|
|---|---|
|repo에서 파생할 수 있는 것|코드 구조, git history, 기존 문서가 이미 기록한다.|
|이번 `Work`에서만 의미 있는 맥락|`Closure`의 복원 정보 자리다.|
|산출물과 로그 덤프|memory는 포인터지 보관소가 아니다. 산출물은 자연스러운 위치에 둔다.|
|secret, 토큰, 자격증명|보안 위험이다. 절대 남기지 않는다.|

## Work 재개

중단된 `Work`는 기록된 상태에서 같은 목표와 기준으로 재개한다.

재개 판별이 가능하도록 `Task Contract`와 `Mission Brief` 기록에는 User 수용 여부와 수용 시점을 남긴다.

재개는 다음 순서를 따른다.

1. User가 지정한 `Work` 기록이 있으면 그 기록을, 없으면 `.geas/works/`에서 `Closure`에 도달하지 않은 최신 `Work` 기록을 찾는다.
2. `Work` 기록의 파일 구성과 수용 기록으로 현재 위치를 판별한다.
3. 최신 User 지시와 기록이 충돌하면 User 지시를 우선하고, 결과 기준이나 User 판단이 달라지면 User 판단 지점으로 올린다.
4. 판별한 위치의 workflow 기준으로 이어간다.

|기록 상태|현재 위치|재개 행동|
|---|---|---|
|`work-frame.md`만 있다|처리 방식 결정 전후|`Work Frame` 기준을 재확인하고 처리 방식을 정한다.|
|`task-contract.md`가 있고 수용 기록이 없다|계약 수용 대기|`Task Contract`를 다시 제시하고 User 수용을 받는다.|
|`task-contract.md`가 수용되었고 `evidence.md`가 없다|실행 중|계약 기준으로 실행을 이어간다.|
|`evidence.md`가 있고 Task `closure.md`가 없다|`Ready for Judgment`|`Evidence`를 다시 제시하고 `Task User Judgment`를 기다린다.|
|Task `closure.md`가 있다|Task 종료|다음 `Task`나 `Mission Synthesis`로 진행한다.|
|`mission-brief.md`가 수용되었고 남은 `Task`가 있다|Mission 진행 중|`Task Structure` 기준으로 다음 `Task`를 이어간다.|
|`mission-synthesis.md`가 있고 Work 수준 `closure.md`가 없다|Mission 판단 대기|`Mission Synthesis`를 다시 제시하고 `Mission User Judgment`를 기다린다.|
|Work 수준 `closure.md`가 있다|Work 종료|새 `Work`로 다룬다. 필요한 기준은 `Continuity Artifact`와 `Closure`의 복원 정보에서 가져온다.|

재개 시 Agent는 복원한 위치, 수용된 기준, 열린 질문을 짧게 재진술하고 User 확인 후 진행한다.
