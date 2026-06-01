# Task

## 목적

`Task`는 하나의 수용 판단 단위가 필요한 `Work`다.

`Task`는 User가 결과와 Evidence를 함께 보고 수용, 재작업, 취소 같은 판단을 내려야 할 때 사용한다.

`Task`의 기준은 Agent 작업량이 아니라 User 판단 비용이다. `Work Frame`에서 배경, 맥락, 고려할 점을 확인한 뒤 별도 실행 계약 없이 처리할 수 있으면 `Direct Work`로 다룬다. 실행 기준, 산출물, 확인 방법, 영향 범위, 위험, User 결정 지점이 분리되면 `Task`로 승격한다.

## Task Contract

`Task Contract`는 `Task` 실행과 User Judgment를 위한 detailed agreement다.

`Work Frame`은 작업 전 배경과 고려할 점을 정리하고, `Task Contract`는 `Task`를 실행하기 전에 실제 실행 기준을 합의한다. Agent는 `Task Contract`를 기준으로 실행하고, User는 `Task Contract`를 기준으로 `Accept`, `Rework`, `Cancel`을 판단한다.

`Task Contract`는 [Alignment Loop](./alignment.md)를 거쳐 작성한다. 이 loop는 실행 기준, 산출물, 수용 기준, 확인 계획, 취소 처리를 User와 Agent가 같은 기준으로 볼 수 있게 맞춘다.

`Task Contract`는 다음 내용을 가진다.

|항목|역할|
|---|---|
|Goal|`Task`가 이루려는 목표를 고정한다.|
|Boundary|포함 범위와 제외 범위를 고정한다.|
|Inputs|실행 전에 사용할 입력, 먼저 읽을 자료, 필요한 선행 맥락을 고정한다.|
|Execution|Agent가 실제로 수행할 작업을 고정한다.|
|Deliverable|`Task`가 남길 결과물을 고정한다.|
|Acceptance Criteria|User가 받아들일 기준을 고정한다.|
|Guardrails|지켜야 할 제약, 건드리지 않을 영역, 유지해야 할 기준을 고정한다.|
|Impact Surface|변경이나 산출물이 영향을 줄 수 있는 파일, 문서, 흐름, 의존 관계를 고정한다.|
|Evidence Plan|무엇을 확인하고 어떤 한계를 드러낼지 고정한다.|
|User Judgment Point|User가 무엇을 보고 `Accept`, `Rework`, `Cancel`을 판단할지 고정한다.|
|Cancel Handling|`Cancel` 시 rollback, 참고자료 보존, 새 `Work Frame` 작성 등 후속 처리를 고정한다.|

`Task`는 실행 전에 `Task Contract`를 User가 받아들여야 한다. `Task`의 `Goal`, `Boundary`, `Execution`, `Deliverable`, `Acceptance Criteria`가 바뀌면 현재 `Task`를 `Cancel`하고 새 `Work Frame`을 만든다.

## Task User Judgment

|판단|의미|
|---|---|
|Accept|현재 `Outcome`과 `Evidence`를 기준으로 `Task` 결과를 받아들인다.|
|Rework|현재 `Task` 기준을 유지한 채 실행, 확인, 정리의 부족한 부분을 다시 진행한다.|
|Cancel|현재 `Task` 결과를 받아들이지 않는 판단이다. 기본 처리는 가능한 범위에서 `Task` 시작 전 상태로 되돌리는 것이다.|

`Rework`는 같은 `Task Contract` 안에서만 사용한다. `Goal`, `Boundary`, `Execution`, `Deliverable`, `Acceptance Criteria`, 위험 수용 조건이 바뀌면 현재 `Task`를 `Cancel`하고 새 `Work Frame`을 만든다.

`Cancel`은 필요한 후속 처리를 함께 남긴다. 후속 처리는 가능한 범위의 rollback, 받아들이지 않은 결과의 참고자료 보존, 새 `Work Frame` 작성으로 나뉠 수 있다. 되돌릴 수 없는 변경, 참고할 만한 결과, 새 `Work`에 넘길 기준 변화는 `Closure`에 남긴다.
