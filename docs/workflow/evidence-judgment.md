# Evidence And User Judgment

## 목적

`Evidence And User Judgment`는 Agent가 결과를 어떤 근거로 제시하고, User가 그 결과를 어떤 결정으로 다룰지 분리하는 기준이다.

Agent는 결과, 확인 근거, 남은 한계, 위험, 판단 지점을 분리해 User가 낮은 비용으로 판단할 수 있게 한다.

`Evidence`는 Agent의 완료 선언과 분리된 판단 입력이다. `User Judgment`는 User가 그 입력을 보고 남기는 결정이다.

## Evidence

`Evidence`는 Agent가 결과를 현재 `Work` 기준에 어떻게 대조했는지 User가 판단할 수 있게 남기는 입력이다.

결과와 `Evidence`는 분리한다. 결과는 이번 `Work`가 실제로 남긴 상태, 산출물, 변경이고, `Evidence`는 그 결과를 판단할 수 있게 하는 기준 대조, 확인 근거, 남은 한계다.

`Evidence`는 `Work Frame`, `Task Contract`, `Mission Brief` 중 현재 `Work`의 기준에 연결되어야 한다.

## Evidence 구성

`Evidence`는 User가 결과를 판단할 수 있도록 다음 내용을 드러낸다.

|항목|역할|
|---|---|
|결과 연결|어떤 결과, 산출물, 변경을 판단하는 근거인지 연결한다.|
|기준 대조|현재 `Work` 기준 중 무엇에 대조했는지 남긴다.|
|충족 상태|대조한 기준이 충족됐는지, 일부만 충족됐는지, 판단 보류인지 남긴다.|
|확인한 범위|실제로 확인한 범위, 방법, 결과를 남긴다.|
|판단 근거|출력, 관찰, 비교 기준, 참조 자료처럼 판단에 쓸 근거를 남긴다.|
|남은 한계|미확인 범위, 남은 위험, User가 받아들여야 할 한계를 남긴다.|
|판단 지점|User가 결정해야 할 선택, 위험, tradeoff를 남긴다.|

`Check and Limits`는 `Direct Work`가 끝날 때 남기는 짧은 확인 기록으로, 확인한 것, 확인 방법, 남은 한계를 포함한다. `Direct Work`에서는 `Check and Limits`가 작은 `Evidence` 역할을 한다. `Task`와 `Mission`은 `User Judgment`의 입력으로 별도 `Evidence`를 남긴다.

문장만으로 판단 비용이 커지면 표, Mermaid, HTML 산출물, 실행 결과 캡처, 비교 화면처럼 User가 직접 대조하기 쉬운 형태로 `Evidence`를 제시한다.

## Evidence 강화

Geas의 기본 요구는 `Evidence`다. Verification, review, challenge는 `Work`의 위험, 영향 범위, 판단 비용이 커질 때 `Evidence`를 강화하는 절차로 사용한다.

강화 절차는 가능하면 sub agent처럼 분리된 context에서 수행한다. 분리된 context는 실행한 Agent의 암묵적 가정, 낙관적 해석, 누락된 확인을 다른 관점에서 드러내는 데 도움이 된다.

|강화 절차|사용 조건|남길 근거|
|---|---|---|
|Verification|결과가 실행 가능해야 하거나, 테스트, 실행 확인, 재현 가능한 비교가 판단 근거가 될 때 사용한다.|실행한 확인, 결과, 실패나 한계|
|Review|산출물 품질, 경계, 누락, 일관성, 기존 의미 보존이 User 판단 비용에 영향을 줄 때 사용한다.|점검 범위, 발견한 문제, 남은 위험|
|Challenge|숨은 가정, 장기 비용, 되돌리기 비용, 기준 충돌, 중요한 미확인 범위를 압박해야 할 때 사용한다.|압박한 가정, 드러난 위험, User 판단 지점|

강화 절차는 `Task Contract`나 `Mission Brief`에서 정한 확인 계획에 맞춰 선택한다. 실행 중 위험, 영향 범위, 판단 비용이 커지면 Agent는 어떤 강화가 필요한지 드러낸다. 그 판단이 현재 기준 안에 있으면 `Evidence`에 남기고, 기준 변경이나 위험 수용이 필요하면 User 판단 지점으로 올린다.

강화는 Agent의 자체 위험 판단에만 맡기지 않는다. 다음 조건 중 하나가 충족되면 해당 강화를 기본으로 적용한다.

|발동 조건|기본 강화|
|---|---|
|`Acceptance Criteria` 중 직접 확인하지 못한 항목이 있다|Verification|
|결과를 확인할 테스트, 실행, 비교 표면이 없다|Review|
|변경을 쉽게 되돌릴 수 없다 (data migration, 삭제, 외부 전송, 배포, 공개)|Challenge|
|보안, 권한, 인증, 결제, 개인정보 표면을 건드린다|Review, Challenge|
|실행 중 `Impact Surface`가 계약 범위보다 넓어졌다|Review|
|같은 `Task`에서 `Rework`가 두 번 이상 반복됐다|Challenge|

발동 조건이 충족됐는데 강화를 생략하는 경우 그 이유를 `Evidence`의 남은 한계에 남긴다.

## User Judgment

`Task`와 `Mission`은 Agent가 결과와 `Evidence`를 정리한 뒤 User Judgment를 기다린다. User Judgment 이후 `Closure`로 들어간다.

`User Judgment`는 User가 결과와 `Evidence`를 보고 `Work` 결과를 받아들일지 판단하는 결정이다.

`User Judgment`는 결과, 확인 근거, 미확인 범위, 남은 위험을 함께 보고 내린다. Agent의 추천, verdict, 완료 선언은 판단 참고 정보로만 사용한다.

단위별 판단 방식은 다음과 같다.

|단위|판단 방식|
|---|---|
|`Direct Work`|Agent가 `Closure`까지 진행할 수 있다. 결과 사용 여부, 위험 수용, 기준 변경처럼 User 책임의 판단이 있으면 User Judgment를 요청한다.|
|`Task`|User가 `Task User Judgment`로 `Accept`, `Rework`, `Cancel` 중 하나를 선택한다.|
|`Mission`|User가 `Mission User Judgment`로 `Accept`, `Continue`, `Cancel` 중 하나를 선택한다.|

`Task User Judgment`의 값은 [task.md](./task.md)의 `Task User Judgment`에서 정의한다.

`Mission User Judgment`의 값은 [mission.md](./mission.md)의 `Mission User Judgment`에서 정의한다.
