# Continuity

## Continuation State

`Continuation State`는 `Work`가 끝났거나 중단된 뒤, 같은 `Work` 맥락을 복원하기 위해 필요한 Work-local 상태다.

`Continuation State`의 핵심은 현재 목표, 기준, 결정, tradeoff, 완료된 것, 확인한 것, 미확인 범위, 남은 판단을 복원하는 데 있다. 가능한 다음 행동은 이 상태를 이해하는 데 필요한 보조 정보로 포함한다.

`Continuation State`는 다음 내용을 남긴다.

|항목|역할|
|---|---|
|Current Position|현재 `Work`가 어디까지 진행되었는지 남긴다.|
|Accepted Decisions|User 상호작용 중 확정된 결정을 남긴다.|
|Accepted Tradeoffs|User가 알고 받아들인 대가, 위험, 포기한 선택지를 남긴다.|
|Open Questions|열린 판단과 이후 확인해야 할 질문을 남긴다.|
|Confirmed Limits|이번 `Work`의 미확인 범위와 범위 밖에 둔 것을 남긴다.|

User 상호작용 중 확정된 결정과 받아들인 tradeoff는 `Continuation State`에 남긴다. Agent의 추천, 추정, 미확인 해석은 User가 받아들인 뒤에만 `Accepted Decisions`나 `Accepted Tradeoffs`로 기록한다.

## Continuity Artifact

`Continuity Artifact`는 여러 `Work`, 다음 세션, 다른 Agent까지 이어져야 하는 장기 인계 artifact다.

`Continuation State`는 `Work` 안에 남는 로컬 상태이고, `Continuity Artifact`는 `Work` 밖에서도 효력이 있는 상태와 결정을 담는다. 이후 작업의 기준을 바꾸는 항목만 `Continuity Artifact`로 승격한다.

다음 조건을 만족하는 항목은 `Continuity Artifact` 후보가 된다.

|승격 기준|의미|
|---|---|
|이후 `Work`의 기준으로 작동한다.|다음 작업의 목표, 범위, 수용 기준, 확인 방법을 바꾼다.|
|User가 받아들인 결정이나 tradeoff가 이후 작업을 바꾼다.|이후 작업자가 같은 결정을 다시 복원해야 한다.|
|미확인 범위나 위험이 장기 비용으로 남는다.|현재 수용한 한계가 이후 품질, 유지보수, 재작업 비용에 영향을 준다.|
|열린 질문이 다음 판단을 막거나 방향을 바꿀 수 있다.|다음 작업 전에 다시 확인해야 하는 판단이 남아 있다.|
|세션 전환이나 작업자 교체 뒤에도 복원되어야 한다.|현재 대화 맥락 밖에서도 유지되어야 하는 상태다.|

## Work Closure

`Work Closure`는 `Work`의 결과가 판단 가능하고 복원 가능한 상태로 닫히는 것이다.

`Completion`은 Agent가 이번 `Work`의 결과를 만든 상태다. `Closure`는 결과, 확인 근거, 미확인 범위, 필요한 User 판단, 복원 상태가 정리되어 User 또는 다음 실행자가 같은 기준으로 판단하거나 이어갈 수 있는 상태다.

`Work Closure`는 `Continuity Artifact Review`를 포함한다. `Continuity Artifact Review`는 이번 `Work`에서 `Work` 밖으로 승격할 항목이 있는지 확인하는 Closure 행위다.

`Continuation State`는 같은 `Work` 맥락을 복원하기 위한 Work-local 상태다. `Continuity Artifact`는 `Work` 밖에서도 효력이 있는 장기 인계 artifact다. `Continuity Artifact`는 `Continuation State`와 별도로 `Continuity Artifact Review`에서 직접 나올 수 있다.

장기 효력이 있는 항목은 `Continuity Artifact` 후보로 승격한다. Work-local 복원이 필요한 항목은 `Continuation State`에 남긴다.

단위별 `Closure` 기준은 다음과 같다.

|단위|Closure 기준|
|---|---|
|`Direct Work`|결과, `Check and Limits`, `Continuity Artifact Review`를 남긴다. 같은 `Work` 맥락의 복원이 필요할 때만 짧은 `Continuation State`를 남긴다.|
|`Task`|결과, `Evidence`, `User Judgment`, `Continuation State`, `Continuity Artifact Review`를 남긴다.|
|`Mission`|`Synthesis`, `Evidence`, `User Judgment`, `Continuation State`, `Continuity Artifact Review`를 남긴다.|

`Task`와 `Mission`은 User 판단이 필요한 단위다. Agent가 결과와 `Evidence`를 준비한 상태는 `Ready for Judgment`이고, User Judgment 이후에 `Closed` 상태가 된다.
