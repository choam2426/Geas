# Evidence And User Judgment

## Evidence

`Evidence`는 Agent가 `Outcome`을 어떤 기준으로 확인했는지, 무엇을 확인했고 무엇을 확인하지 못했는지, User가 판단할 수 있게 남기는 근거다.

`Outcome`과 `Evidence`는 분리한다. `Outcome`은 이번 `Work`의 결과이고, `Evidence`는 그 결과를 판단할 수 있게 하는 확인 근거와 한계다.

`Evidence`는 다음 내용을 드러낸다.

|항목|역할|
|---|---|
|Checked|실제로 확인한 것을 남긴다.|
|Basis|확인에 사용한 근거, 출력, 관찰, 비교 기준을 남긴다.|
|Limits|확인하지 못한 것과 남은 위험을 남긴다.|

`Direct Work`에서는 `Check and Limits`가 가벼운 `Evidence` 역할을 한다. `Task`와 `Mission`은 `User Judgment`의 입력으로 `Evidence`를 남긴다.

Geas의 기본 요구는 `Evidence`다. Verification, review, challenge는 `Work`의 위험, 영향 범위, 판단 비용이 커질 때 `Evidence`를 강화하는 절차로 사용한다.

|강화 절차|사용 조건|
|---|---|
|Verification|결과가 실행 가능해야 하거나, 테스트, 실행 확인, 재현 가능한 비교가 판단 근거가 될 때 사용한다.|
|Review|산출물 품질, 경계, 누락, 일관성, 기존 의미 보존이 User 판단 비용에 영향을 줄 때 사용한다.|
|Challenge|숨은 가정, 장기 비용, 되돌리기 비용, 기준 충돌, 중요한 미확인 범위를 압박해야 할 때 사용한다.|

## User Judgment

`User Judgment`는 User가 `Outcome`과 `Evidence`를 보고 `Work` 결과를 받아들일지 판단하는 결정이다.

`User Judgment`는 User가 결과, 확인 근거, 미확인 범위, 남은 위험을 보고 내리는 결정이다. Agent의 추천, verdict, 완료 선언은 판단 참고 정보로만 사용한다.

`Direct Work`는 기본적으로 Agent가 `Closure`까지 진행할 수 있다. 결과 사용 여부, 위험 수용, 기준 변경처럼 User 책임의 판단이 필요한 경우에는 `User Judgment`를 요구한다.

`Task`와 `Mission`은 `User Judgment` 이후에 `Closed` 상태가 된다.

`Task User Judgment`의 값은 [task.md](./task.md)의 `Task User Judgment`에서 정의한다.

`Mission User Judgment`의 값은 [mission.md](./mission.md)의 `Mission User Judgment`에서 정의한다.
