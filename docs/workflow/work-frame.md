# Work Frame

## 목적

`Work Frame`은 `Work`를 실행하기 전에 요청의 배경, User 의도, 확인한 맥락, 고려할 점, 다룰 방식을 정리하는 산출물이다.

`Work Frame`은 User와 Agent가 같은 이슈를 보고 있는지 확인하게 하고, Agent가 이 `Work`를 `Direct Work`, `Task`, `Mission` 중 어떤 방식으로 다룰지 제안하게 한다.

모든 `Work`는 [Alignment Loop](./alignment.md)를 거쳐 `Work Frame`으로 정리된다. `Alignment Loop`는 흐린 요청을 작업 가능한 공통 기준으로 구체화하고, `Work Frame`은 그 기준을 작업 배경과 처리 방식으로 남긴다.

## Work Frame Alignment

`Work Frame`을 위한 Alignment는 작업 배경을 이해하고 처리 방식을 정하는 데 초점을 둔다.

|질문|드러낼 것|
|---|---|
|이 요청은 어떤 배경에서 나왔는가?|작업이 시작된 이유와 현재 이슈|
|User가 실제로 바꾸고 싶은 방향은 무엇인가?|User 의도와 문제의식|
|작업 전에 확인해야 할 맥락은 무엇인가?|문서, 코드, 산출물, 대화 맥락, 외부 자료|
|작업 전에 드러낼 고려 사항은 무엇인가?|제약, 위험, tradeoff, 선호 지점, 열린 질문|
|이 `Work`는 어떤 방식으로 다루는가?|`Direct Work`, `Task`, `Mission` 추천|

## Work Frame 구성

`Work Frame`은 작업 전에 이슈를 이해하고 다룰 방식을 정하기 위해 다음 내용을 정리한다.

|항목|역할|
|---|---|
|Background|요청이 나온 배경과 현재 이슈를 정리한다.|
|User Intent|User가 원하는 방향과 문제의식을 정리한다.|
|Context Checked|작업 전에 확인한 문서, 코드, 산출물, 대화, 외부 자료와 확인한 맥락을 정리한다.|
|Assumptions|Agent가 진행을 위해 의존하는 전제와 해석을 드러낸다.|
|Considerations|작업 전에 고려해야 할 제약, 위험, tradeoff, 선호 지점, 열린 질문을 정리한다.|

이 내용을 바탕으로 Agent는 이 `Work`를 `Direct Work`, `Task`, `Mission` 중 어떤 방식으로 다룰지 제안한다.

## 처리 방식 확정

모든 `Work`는 `Work Frame`으로 정리된 뒤, `Direct Work`, `Task`, `Mission` 중 하나의 방식으로 다뤄진다. User 확인의 깊이는 `Work`의 성격에 따라 달라진다.

|Work 유형|처리|
|---|---|
|`Direct Work`|Agent가 짧은 `Work Frame`을 드러내고 실행할 수 있다. User 판단이 필요한 방향, 위험, 선호 지점이 있으면 실행 전에 확인한다.|
|`Task`|`Work Frame`을 바탕으로 `Task Contract`를 정리한다. User가 `Task Contract`를 작업 기준으로 받아들인 뒤 실행한다.|
|`Mission`|`Work Frame`을 바탕으로 `Mission Brief`와 초기 `Task` 구조를 정리한다. User가 큰 목표와 판단 구조를 받아들인 뒤 실행한다.|

## Direct Work

`Direct Work`는 `Work Frame`만으로 실행하고 확인할 수 있는 `Work`다.

`Direct Work`는 다음 조건을 만족한다.

|조건|의미|
|---|---|
|배경과 의도가 한 문맥 안에 있다.|`Background`와 `User Intent`가 좁은 이슈로 설명된다.|
|고려할 점이 한 묶음으로 다뤄진다.|제약, 위험, tradeoff가 하나의 판단 범위 안에 머문다.|
|현재 맥락만으로 실행할 수 있다.|실제로 할 일이 현재 맥락에서 충분히 분명하다.|
|보고 전 확인이 짧다.|결과가 의도대로 반영됐는지 짧게 확인하고 보고할 수 있다.|
|실행 전 방향이 정해져 있다.|접근과 tradeoff가 현재 맥락 안에서 정리된다.|
|수정과 되돌리기 비용이 작다.|작은 범위에서 결과를 조정할 수 있다.|

`Direct Work`가 끝날 때 Agent는 결과, 확인한 것, 한계를 짧게 남긴다.

## Direct Work에서 Task로 승격하는 기준

다음 조건 중 하나가 생기면 `Work`는 `Direct Work`에서 `Task`로 승격한다.

|승격 기준|의미|
|---|---|
|수용 기준이 분리된다.|결과 판단에 둘 이상의 `Acceptance Criteria`가 필요하다.|
|산출물 성격이 다르다.|문서, 코드, UI, 데이터처럼 결과의 검토 방식이 달라진다.|
|확인 방법이 다르다.|테스트, 실행 확인, review, 수동 확인처럼 Evidence가 나뉜다.|
|영향 범위가 넓다.|파일, 흐름, 의존 관계에 생기는 영향을 따로 봐야 한다.|
|위험 수준이 높다.|되돌리기 어렵거나 장기 비용, 품질 부채, 기준 이탈 위험이 있다.|
|User 방향 판단이 필요하다.|접근, 구조, 디자인, 선호, tradeoff 선택이 이후 결과를 바꾼다.|
|별도 실행 기준이 필요하다.|결과와 판단 기준을 `Task Contract`로 분리해 설명해야 한다.|
|User 기준 수용이 필요하다.|User가 기준, 설계, 방향을 작업 기준으로 받아들인 뒤 실행해야 한다.|

이 승격 기준은 `Mission` 안에서 `Task`를 나눌 때도 사용한다. `Task` 분해 기준은 User가 결과와 Evidence를 한 번에 판단할 수 있는지에 둔다.
