# Work Frame

## 목적

`Work Frame`은 User 요청을 실행하기 전에 작업 배경, 관련 맥락, 조사한 내용, 고려할 점을 정리하는 soft framing이다.

`Work Frame`의 목적은 Agent의 암묵적 해석을 드러내고, User와 Agent가 같은 이슈를 보고 있는지 맞추는 데 있다.

`Work Frame`은 [Alignment Loop](./alignment.md)를 거쳐 작성한다. `Alignment Loop`는 흐린 목표와 의도를 상호작용으로 구체화하고, `Work Frame`은 그 결과를 작업 전 배경과 고려할 점으로 정리한다.

`Work Frame`은 현재 이해, 조사한 맥락, 고려해야 할 제약, 위험, 열린 질문을 드러낸다. `Work Frame`은 `Work`를 `Direct Work`, `Task`, `Mission` 중 어떻게 다룰지 판단하게 한다.

## Work Frame 구성

`Work Frame`은 작업 전에 이슈를 이해하고 다룰 방식을 정하기 위해 다음 내용을 가진다.

|항목|역할|
|---|---|
|Background|요청이 나온 배경과 현재 이슈를 잡는다.|
|User Intent|User가 원하는 방향과 문제의식을 잡는다.|
|Sources Checked|작업 전에 읽거나 확인한 문서, 코드, 산출물, 대화, 외부 자료를 잡는다.|
|Observed Context|작업 전에 확인한 문서, 코드, 산출물, 대화 맥락, 조사 내용을 잡는다.|
|Issue Reading|확인한 맥락을 바탕으로 Agent가 현재 이슈를 어떻게 이해했는지 잡는다.|
|Considerations|작업 전에 고려해야 할 제약, 위험, tradeoff, 열린 질문을 잡는다.|
|Open Questions|실행 전 닫아야 하거나 실행 중 판단 지점이 될 질문을 잡는다.|
|Handling Recommendation|이 `Work`를 `Direct Work`, `Task`, `Mission` 중 어떻게 다룰지 제안한다.|

`Work Frame`은 이번 `Work`를 어떻게 다뤄야 하는지 판단하는 표면이다.

필요한 경우 `Assumptions`, `Relevant References`, `Research Notes` 같은 내용은 위 항목 안에 포함해 드러낸다.

## Work Frame 수용

모든 `Work`는 `Work Frame`을 가진다. 명시적인 User 수용 여부는 `Work`의 성격에 따라 달라진다.

`Direct Work`는 Agent가 compact `Work Frame`을 드러내고 바로 실행할 수 있다. 모호성, 위험, 기준 변경, 결과 사용 판단처럼 User 책임의 판단이 필요한 경우에는 실행 전에 User 확인을 받는다.

`Task`는 실행 전에 `Task Contract`를 User가 작업 기준으로 받아들여야 한다. `Task`는 User Judgment 단위이므로, 결과 판단 기준을 먼저 공유한 뒤 실행한다.

`Mission`은 `Mission` 수준의 `Work Frame`과 초기 `Task` 구조를 User가 작업 기준으로 받아들여야 한다. 큰 목표를 여러 판단 단위로 나누는 결정은 User 판단 지점이다.

## Direct Work

`Direct Work`는 `Work Frame`만으로 실행하고 확인할 수 있는 `Work`다.

`Direct Work`는 다음 조건을 만족한다.

|조건|의미|
|---|---|
|배경과 의도가 한 문맥 안에 있다.|`Background`와 `User Intent`가 좁은 이슈로 설명된다.|
|고려할 점이 한 묶음으로 다뤄진다.|제약, 위험, tradeoff가 하나의 판단 범위 안에 머문다.|
|현재 맥락만으로 실행할 수 있다.|실제로 할 일이 현재 맥락에서 충분히 분명하다.|
|짧은 확인으로 충분하다.|결과, 확인한 것, 한계가 짧게 보고될 수 있다.|
|실행 전 방향이 정해져 있다.|접근과 tradeoff가 현재 맥락 안에서 정리된다.|
|수정과 되돌리기 비용이 작다.|결과가 맞지 않아도 작은 범위에서 고칠 수 있다.|

`Direct Work`가 끝날 때 Agent는 결과, 확인한 것, 확인하지 못한 것, 필요한 `Continuation State`를 짧게 남긴다.

## Direct Work에서 Task로 승격하는 기준

다음 조건 중 하나가 생기면 `Work`는 `Direct Work`에서 `Task`로 승격한다.

|승격 기준|의미|
|---|---|
|수용 기준이 분리된다.|결과 판단에 둘 이상의 `Acceptance Criteria`가 필요하다.|
|산출물 성격이 다르다.|문서, 코드, UI, 데이터처럼 결과의 검토 방식이 달라진다.|
|확인 방법이 다르다.|테스트, 실행 확인, review, 수동 확인처럼 Evidence가 나뉜다.|
|영향 범위가 넓거나 다르다.|side effect를 따로 봐야 하는 파일, 흐름, 의존 관계가 있다.|
|위험 수준이 높다.|되돌리기 어렵거나 장기 비용, 품질 부채, 기준 이탈 위험이 있다.|
|User 방향 판단이 필요하다.|접근, 구조, 디자인, tradeoff 선택이 이후 결과를 바꾼다.|
|독립적인 설명이 필요하다.|결과와 판단 기준을 현재 `Work Frame` 밖에서 별도로 설명해야 한다.|
|기준 산출물과 실행이 섞인다.|먼저 기준, 설계, 방향을 수용한 뒤 실행해야 한다.|

이 승격 기준은 `Mission` 안에서 `Task`를 나눌 때도 사용한다. `Task` 분해의 기준은 Agent가 얼마나 오래 작업하는지가 아니라 User가 결과와 Evidence를 한 번에 판단할 수 있는지다.
