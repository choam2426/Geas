# Task

## 목적

`Task`는 하나의 수용 판단 단위가 필요한 `Work`다.

`Task`는 User가 결과와 Evidence를 함께 보고 수용, 재작업, 취소 같은 판단을 내려야 할 때 사용한다.

`Task`의 기준은 User 판단 비용에 둔다. `Work Frame`에서 배경, 맥락, 고려할 점을 확인한 뒤 실행 기준이 충분히 분명하면 `Direct Work`로 다룬다. 실행 기준, 산출물, 확인 방법, 영향 범위, 위험, User 결정 지점이 분리되면 `Task`로 승격한다.

## Task Contract

`Task Contract`는 `Task` 실행과 User Judgment를 위한 상세 실행 합의다.

`Work Frame`은 작업 전 배경과 고려할 점을 정리하고, `Task Contract`는 `Task`를 실행하기 전에 실제 실행 기준을 합의한다. Agent는 `Task Contract`를 기준으로 실행하고, User는 `Task Contract`를 기준으로 `Accept`, `Rework`, `Cancel`을 판단한다.

`Task Contract`는 [Alignment Loop](./alignment.md)를 거쳐 작성한다. 이 loop는 실행 기준, 산출물, 수용 기준, 확인 계획, 취소 처리를 User와 Agent가 같은 기준으로 볼 수 있게 맞춘다.

`Task Contract`는 다음 내용을 정리한다.

|항목|역할|
|---|---|
|Goal|`Task`가 이루려는 목표를 고정한다.|
|Work Relation|`Work Frame` 또는 `Mission Brief`에서 이 `Task`가 담당하는 기준과 맥락을 고정한다.|
|Boundary|포함 범위와 범위 밖에 둘 내용을 고정한다.|
|Accepted Direction|Task Direction이 있었으면 User가 받아들인 접근, 산출물 형태, tradeoff를 고정한다.|
|Starting Context|수용된 선행 결과, 기준 산출물, 필요한 입력, 전제, 먼저 읽거나 확인할 파일, 문서, 테스트, 실행 흐름을 고정한다.|
|Execution|Agent가 실제로 수행할 작업을 고정한다.|
|Deliverable|`Task`가 남길 결과물을 고정한다.|
|Acceptance Criteria|User가 받아들일 기준을 고정한다.|
|Guardrails|지켜야 할 제약, 보존할 영역, 유지해야 할 기준을 고정한다.|
|Impact Surface|변경이나 산출물이 영향을 줄 수 있는 파일, 문서, 흐름, 의존 관계를 고정한다.|
|Verification Strategy|어떤 테스트, 실행 확인, 수동 확인, regression 확인을 수행할지 고정한다.|
|Review And Challenge Focus|review와 User 검토에서 볼 품질, 경계, 사용자 영향, edge case, 유지보수 위험, challenge 조건을 고정한다.|
|Evidence Plan|어떤 Evidence를 남기고 어떤 미확인 범위와 한계를 드러낼지 고정한다.|
|User Judgment Point|User가 무엇을 보고 `Accept`, `Rework`, `Cancel`을 판단할지 고정한다.|
|Change Triggers|목표, 경계, 산출물, 수용 기준, 확인 방법, 영향 범위, 위험 수준을 다시 봐야 하는 조건을 고정한다.|
|Cancel Handling|`Cancel` 시 rollback, 참고자료 보존, 새 `Work Frame` 작성 등 후속 처리를 고정한다.|

`Starting Context`는 실행 전에 이해해야 할 기준과 입력이다. `Impact Surface`는 변경이나 산출물이 닿을 수 있어 확인해야 할 표면이다. `Verification Strategy`는 실제 확인 행위를 정하고, `Evidence Plan`은 User 판단을 위해 남길 근거와 한계를 정한다.

`Task`는 실행 전에 `Task Contract`를 User가 받아들여야 한다. `Task`의 `Goal`, `Boundary`, `Execution`, `Deliverable`, `Acceptance Criteria`, 확인 방법, 영향 범위, 위험 수용 조건이 바뀌면 현재 `Task`를 `Cancel`하고 새 `Work Frame`을 작성한다.

## Task User Judgment

|판단|의미|
|---|---|
|Accept|현재 `Outcome`과 `Evidence`를 기준으로 `Task` 결과를 받아들인다.|
|Rework|현재 `Task` 기준을 유지한 채 실행, 확인, 정리의 부족한 부분을 다시 진행한다.|
|Cancel|현재 `Task` 결과를 수용 범위 밖에 두는 판단이다. 기본 처리는 가능한 범위에서 `Task` 시작 전 상태로 되돌리는 것이다.|

`Rework`는 같은 `Task Contract` 안에서만 사용한다. `Goal`, `Boundary`, `Execution`, `Deliverable`, `Acceptance Criteria`, 위험 수용 조건이 바뀌면 현재 `Task`를 `Cancel`하고 새 `Work Frame`을 작성한다.

`Cancel`은 필요한 후속 처리를 함께 남긴다. 후속 처리는 가능한 범위의 rollback, 수용 범위 밖에 둔 결과의 참고자료 보존, 새 `Work Frame` 작성으로 나뉠 수 있다. rollback 범위 밖에 남는 변경, 참고할 만한 결과, 새 `Work`에 넘길 기준 변화는 `Closure`에 남긴다.
