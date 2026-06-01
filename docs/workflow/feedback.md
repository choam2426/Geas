# Feedback Handling

## 목적

User feedback은 `Work Frame`, `Task Contract`, `Mission Brief`, 결과, `Evidence` 중 무엇을 갱신해야 하는지 판단하는 입력이다.

모호한 feedback은 `Feedback Reading`을 거쳐 실행 가능한 기준 갱신 후보로 바꾼다. Agent는 feedback이 어느 기준에 영향을 주는지 드러내고, 그에 맞는 action을 선택한다.

## 흐름

Feedback handling은 다음 흐름으로 진행된다.

```text
Feedback
  -> Feedback Reading
  -> Affected Basis
  -> Action
```

|항목|역할|
|---|---|
|Feedback Reading|User feedback이 무엇을 문제 삼는지 해석한다.|
|Affected Basis|feedback이 `Work Frame`, `Task Contract`, `Mission Brief`, 결과, `Evidence` 중 어디에 영향을 주는지 정리한다.|
|Action|같은 기준 안의 수정인지, `Task` 취소 후 새 `Work`인지, `Mission Brief` 갱신인지 정한다.|

## Action 기준

|Affected Basis|Action|
|---|---|
|결과 품질 문제|같은 `Task Contract` 안에서 `Rework`한다.|
|`Evidence` 부족|`Evidence`를 보완하거나 verification, review, challenge를 강화한다.|
|`Task Contract` 기준 변경|현재 `Task`를 `Cancel`하고 새 `Work Frame`을 작성한다.|
|`Mission Brief` 기준 변경|`Mission Brief`를 갱신하고 User 재수용을 받는다.|
|`Work Frame`의 이해 변경|`Work Frame`을 갱신하고 `Direct Work`, `Task`, `Mission` 중 어떻게 다룰지 다시 판단한다.|
