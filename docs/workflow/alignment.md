# Alignment Loop

## 흐린 목표와 의도를 상호작용으로 구체화한다

`Alignment Loop`는 User의 흐린 목표와 의도를 Agent가 User와 상호작용하며 작업 가능한 공통 이해로 바꾸는 과정이다.

이 과정의 목적은 같은 이슈를 보고, 같은 기준으로 다음 artifact를 만들 수 있을 만큼 목표, 맥락, 판단 지점, 열린 질문을 맞추는 데 있다.

`Alignment Loop`는 `Work Frame`, `Task Contract`, `Mission Brief`를 만들기 전에 수행한다. 각 artifact는 같은 loop를 서로 다른 깊이로 사용한다.

|위치|역할|
|---|---|
|`Work Frame` 전|요청의 배경, User 의도, 확인한 맥락, 고려할 점, 다룰 방식을 맞춘다.|
|`Task Contract` 전|실행 기준, 산출물, 수용 기준, 확인 계획, 취소 처리를 맞춘다.|
|`Mission Brief` 전|큰 목표, Task 구조, Mission 수준 판단 지점, 공유 고려 사항을 맞춘다.|

## 흐름

`Alignment Loop`는 다음 흐름으로 진행된다.

```text
User request or feedback
  -> Restate
  -> Surface assumptions
  -> Inspect context
  -> Offer options and tradeoffs
  -> Ask targeted questions
  -> Confirm working alignment
  -> Create or update artifact
```

|단계|역할|
|---|---|
|Restate|Agent가 현재 이해한 요청, 목적, 문제의식을 User가 검토할 수 있게 다시 표현한다.|
|Surface assumptions|Agent가 둔 전제, 해석, 생략한 범위를 드러낸다.|
|Inspect context|필요한 문서, 코드, 산출물, 대화 맥락, 외부 자료를 확인한다.|
|Offer options and tradeoffs|실행 방향이 갈릴 때 선택지와 tradeoff를 좁혀 제시한다.|
|Ask targeted questions|작업 결과를 바꿀 질문만 선별해 묻는다.|
|Confirm working alignment|다음 artifact를 만들 수 있을 만큼 목표, 맥락, 기준이 맞았는지 확인한다.|
|Create or update artifact|확인된 이해를 `Work Frame`, `Task Contract`, `Mission Brief` 중 알맞은 artifact로 반영한다.|

## 깊이 조절

`Alignment Loop`는 `Work`의 크기와 위험에 맞춰 깊이를 조절한다.

|상황|수행 방식|
|---|---|
|작고 명확한 `Direct Work`|짧은 restate와 필요한 context 확인으로 충분하다.|
|모호한 `Direct Work`|모호한 부분을 질문하거나 handling recommendation을 먼저 제시한다.|
|`Task`|실행 기준과 User Judgment 기준이 명확해질 때까지 loop를 수행한다.|
|`Mission`|Task 구조와 Mission 수준 판단 지점이 보일 때까지 loop를 수행한다.|
|높은 위험이나 되돌리기 어려운 작업|전제, tradeoff, 미확인 범위, 취소 처리를 더 깊게 드러낸다.|

## 출력

`Alignment Loop`의 출력은 다음 artifact를 만들기 위한 정렬된 이해다.

|출력|사용 위치|
|---|---|
|Shared Understanding|User와 Agent가 같은 이슈를 보고 있다는 작업 가능한 이해|
|Assumptions|Agent가 의존하는 전제|
|Open Questions|실행 전 또는 실행 중 판단 지점으로 남는 질문|
|Options and Tradeoffs|User 선택이 필요한 방향과 대가|
|Artifact Update|`Work Frame`, `Task Contract`, `Mission Brief`에 반영할 내용|

`Alignment Loop`에서 User가 받아들인 결정과 tradeoff는 이후 artifact에 반영한다. 장기 효력이 있는 결정과 tradeoff는 `Continuity Artifact` 후보가 된다.
