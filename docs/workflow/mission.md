# Mission

## 목적

`Mission`은 여러 `Task`와 여러 판단 지점을 묶는 상위 `Work`다.

`Mission`은 User가 큰 목표를 맡기고, Agent가 이를 판단 가능한 `Task` 흐름으로 나누며, 각 `Task` 결과와 Evidence를 종합해 전체 목표 충족 여부를 판단해야 할 때 사용한다.

`Mission`의 기준도 User 판단 비용에 둔다. 하나의 `Task` Evidence로 User가 전체 `Work`를 판단할 수 있으면 `Task`로 유지한다. 여러 판단 지점, 여러 `Task` Evidence, 중간 기준 갱신, 최종 종합 판단이 필요하면 `Mission`으로 승격한다.

## Mission Brief

`Mission Brief`는 큰 `Work`를 여러 `Task`와 판단 지점으로 다루기 위한 상위 briefing이다.

`Mission Brief`는 상위 조율 문서다. 실행 기준은 각 `Task Contract`에서 고정한다. `Mission Brief`는 여러 `Task`가 같은 목표, 배경, 경계, 고려 사항을 공유하게 하고, User가 Mission 수준에서 어디를 판단해야 하는지 드러낸다.

`Mission Brief`는 [Alignment Loop](./alignment.md)를 거쳐 작성한다. 이 loop는 큰 목표, Task 구조, Mission 수준 판단 지점, 공유 고려 사항, 기준 변경 조건을 User와 Agent가 같은 기준으로 볼 수 있게 맞춘다.

`Mission Brief`는 다음 내용을 정리한다.

|항목|역할|
|---|---|
|Mission Intent|큰 `Work`에서 이루려는 방향과 목적을 정리한다.|
|Mission Background|이 `Mission`이 필요한 이유를 정리한다.|
|Mission Boundary|`Mission`에 포함되는 범위와 범위 밖에 둘 내용을 고정한다.|
|Success Shape|`Mission`이 충분하다고 볼 전체 모습을 정리한다.|
|Mission Criteria|Mission 결과를 수용 판단할 기준과 각 기준이 Evidence로 어떻게 확인될지 정리한다.|
|Approach|`Mission`을 어떤 접근으로 진행할지와 그 이유를 정리한다.|
|Key Context|모든 `Task`가 계속 참고해야 할 User 의도, 도메인 맥락, 제약, 선행 결정을 정리한다.|
|Impact Surface|변경이나 산출물이 영향을 줄 수 있는 파일, 문서, 흐름, 의존 관계, 부수 영향 가능 범위를 정리한다.|
|Task Structure|`Mission`을 어떤 `Task`들로 나누어 다룰지 정리한다.|
|Task Contribution Map|각 `Task`가 어떤 Mission 기준에 기여하는지 연결한다.|
|Decision Points|User 판단이 필요한 지점을 정리한다.|
|Shared Considerations|모든 `Task`가 공유해야 할 제약, 위험, tradeoff를 정리한다.|
|Validation And Review Strategy|Mission 수준에서 필요한 검증, review, challenge, 수동 확인의 전략을 정리한다.|
|Change Triggers|`Mission Brief`나 이후 `Task Contract`를 다시 봐야 하는 조건을 정리한다.|
|Continuity Needs|`Mission` 중 복원하거나 인계해야 할 상태를 정리한다.|
|Long-term Record Candidates|Debt Ledger, Memory, `Continuity Ledger`로 이어질 수 있는 후보를 Mission 중 추적할 기준으로 정리한다.|

`Mission Brief`는 여러 `Task`가 같은 상위 기준을 공유하게 한다. 각 `Task`는 실행 전에 별도 `Task Contract`를 정리한다.

`Mission Brief`는 `Mission` 실행 전에 User가 받아들여야 한다. `Mission` 안의 `Task Contract`는 `Mission Brief`를 기준으로 작성한다.

`Mission Brief`가 바뀌면 User 재수용을 받고, `Task Structure`와 이후 `Task Contract`를 갱신한다. 이미 User가 수용한 `Task` 결과는 새 `Mission Brief` 기준에서 재사용, 참고, 보완, 범위 밖 보존 중 하나로 분류한다.

`Mission`은 다음 흐름으로 진행된다.

```text
Work Frame
  -> Mission Brief
  -> Task Contract per Task
  -> Task Closure repeat
  -> Mission Synthesis
  -> Mission User Judgment
```

## Mission Synthesis

`Mission Synthesis`는 수용된 `Task` 결과, Evidence, 남은 한계, 장기 인계 후보를 `Mission Brief` 기준으로 종합하는 판단 표면이다.

User는 `Mission Synthesis`를 보고 `Mission` 결과를 `Accept`, `Continue`, `Cancel` 중 하나로 판단한다.

`Mission Synthesis`는 다음 내용을 정리한다.

|항목|역할|
|---|---|
|Mission Outcome|`Mission`이 실제로 어떤 상태까지 도달했는지 종합한다.|
|Task Results Summary|각 `Task`가 무엇을 남겼고 어떤 User Judgment를 받았는지 종합한다.|
|Brief Criteria Check|`Mission Brief`의 `Success Shape`, `Mission Boundary`, `Mission Criteria`, `Decision Points` 기준으로 결과를 대조한다.|
|Remaining Limits|미확인 범위, 남은 위험, User가 받아들여야 할 한계를 종합한다.|
|Decision Points|Mission User Judgment 전에 User가 판단해야 할 항목을 드러낸다.|
|Continuity Artifact Candidates|`Mission` 밖으로 승격할 장기 인계 후보를 종합한다.|

`Mission Accept`는 수용된 `Task` 결과들을 `Mission Brief` 기준으로 다시 대조한 뒤, User가 전체 `Mission` 결과를 받아들일 때 성립한다.

## Task에서 Mission으로 승격하는 기준

다음 조건 중 하나가 생기면 `Work`는 `Task`에서 `Mission`으로 승격한다.

|승격 기준|의미|
|---|---|
|수용 판단이 여러 번 필요하다.|전체 `Work`를 여러 판단 단위로 나누어 받아들인다.|
|중간 방향 결정이 이후 작업을 바꾼다.|초기 결정, 설계, 기준 선택, 우선순위 판단이 다음 실행에 영향을 준다.|
|여러 `Task` 결과를 종합해야 한다.|각 `Task`는 수용 가능해도 전체 목표 충족 여부는 별도로 판단해야 한다.|
|작업 기준이 실행 중 구체화된다.|User가 중간 결과를 보고 범위, 기준, 방향을 조정할 수 있다.|
|진행 상태를 복원해야 한다.|세션 전환, 컨텍스트 압축, 작업자 교체 뒤에도 이어갈 상태가 필요하다.|
|산출물이나 영향 범위가 여러 갈래다.|문서, 코드, UI, 정책처럼 서로 다른 검토 방식이 섞인다.|
|위험과 미확인 범위가 누적된다.|개별 `Task`의 한계가 전체 `Work`의 수용 판단에 영향을 준다.|
|마지막에 Mission 수준 종합이 필요하다.|수용된 `Task` 결과를 전체 목표와 기준에 다시 대조한다.|

다음 조건을 만족하면 `Task`로 유지한다.

|Task 유지 기준|의미|
|---|---|
|결과와 Evidence를 한 번에 판단할 수 있다.|User가 하나의 수용 판단으로 결과를 받아들일 수 있다.|
|파일이나 실행 단계가 많아도 판단 기준은 하나다.|작업량은 크지만 수용 기준, 확인 방법, 위험 판단이 한 묶음이다.|
|중간 방향 결정이 현재 결과 기준 안에 머문다.|Agent 내부 실행 순서가 길어도 User 판단 지점은 하나로 유지된다.|
|남은 한계가 하나의 판단 범위 안에 머문다.|미확인 범위와 위험을 하나의 `Task` Evidence 안에서 판단할 수 있다.|

## Mission User Judgment

|판단|의미|
|---|---|
|Accept|수용된 `Task` 결과와 남은 한계를 포함해 `Mission` 결과를 받아들인다.|
|Continue|추가 `Task`, 기준 조정, 보완 확인을 이어간다.|
|Cancel|현재 `Mission`을 중단하고 현재 상태로 닫는다. 이미 User가 수용한 `Task` 결과는 별도 판단으로 다룬다.|
