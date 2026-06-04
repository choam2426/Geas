# Continuity

## 목적

`Continuity`는 `Work`의 결과, 판단 기준, 남은 한계, 다음 작업에서 다시 참조할 메모리, 작업 방식 개선 후보를 남겨 이후 작업의 생산성을 높이는 기준이다.

Agent는 `Work`가 끝날 때 결과, 확인 근거, 미확인 범위, User 판단, 필요한 복원 정보, `Work` 밖에 남길 메모리 후보, 작업 방식 개선 후보를 구분해 남긴다.

`Continuity Artifact`는 `Work` 밖에 남아 다음 작업에서 다시 참조되는 메모리다.

## Closure

`Closure`는 `Work`의 결과, 확인 근거, 미확인 범위, User 판단 결과, 필요한 복원 정보, `Work` 밖에 남길 후보, 다음 작업 방식의 개선 후보가 정리된 상태다.

Agent는 결과 생성 뒤 확인 근거, 미확인 범위, User 판단 결과, 복원 정보, `Work` 밖에 남길 후보, 다음 작업 방식의 개선 후보를 정리한다. `Closure`는 User 또는 다음 실행자가 같은 기준으로 결과를 판단하거나 이어갈 수 있을 때 성립한다.

복원 정보는 같은 `Work`를 이어서 다룰 때 현재 위치, User가 받아들인 결정과 tradeoff, 열린 질문, 확인한 한계를 짧게 정리한다.

`Continuity Artifact Review`는 모든 `Closure`에 포함한다. review 결과는 `Work` 밖에 남길 후보, 다음 작업 방식의 개선 후보, 각 후보의 분류 판단을 포함한다.

단위별 `Closure` 기준은 다음과 같다.

|단위|Closure 기준|
|---|---|
|`Direct Work`|결과, `Check and Limits`, 필요한 복원 정보, `Continuity Artifact Review` 결과를 남긴다.|
|`Task`|결과, `Evidence`, `User Judgment`, 필요한 복원 정보, `Continuity Artifact Review` 결과를 남긴다.|
|`Mission`|`Mission Synthesis`, `Evidence`, `User Judgment`, 필요한 복원 정보, `Continuity Artifact Review` 결과를 남긴다.|

`Task`와 `Mission`은 User 판단이 필요한 단위다. Agent가 결과와 `Evidence`를 준비한 상태는 `Ready for Judgment`이고, User Judgment 이후에 `Closure` 기준을 충족한다.

## Continuity Artifact

`Continuity Artifact`는 `Work` 밖에 남아 다음 작업에서 다시 참조되는 메모리다.

Closure 안의 복원 정보는 현재 `Work`를 이어서 다룰 때 쓰인다. `Continuity Artifact`는 다음 `Work`의 목표, 기준, 결정, 위험 판단, 작업 방식 개선에 영향을 주는 메모리다.

다음 작업자가 같은 맥락을 다시 복원해야 하는 항목은 `Continuity Artifact` 후보가 된다.

다음 조건을 만족하는 항목은 `Continuity Artifact` 후보가 된다.

|승격 기준|의미|
|---|---|
|이후 `Work`의 기준으로 작동한다.|다음 작업의 목표, 범위, 수용 기준, 확인 방법을 바꾼다.|
|User가 받아들인 결정이나 tradeoff가 이후 작업을 바꾼다.|이후 작업자가 같은 결정을 다시 복원해야 한다.|
|미확인 범위나 위험이 장기 비용으로 남는다.|현재 수용한 한계가 이후 품질, 유지보수, 재작업 비용에 영향을 준다.|
|열린 질문이 다음 판단을 막거나 방향을 바꿀 수 있다.|다음 작업 전에 다시 확인해야 하는 판단이 남아 있다.|
|세션 전환이나 작업자 교체 뒤에도 기준으로 쓰인다.|현재 대화 밖에서도 다음 작업의 판단 기준으로 작동한다.|
|다음 작업 방식의 개선 후보가 된다.|반복된 혼선, 기준 변경, 검증 누락, 질문 방식, artifact 구조 개선처럼 이후 `Work` 품질을 바꿀 수 있다.|

## Continuity Artifact Review

`Continuity Artifact Review`는 `Closure` 안에서 다음 작업의 메모리로 남길 항목과 작업 방식 개선 후보를 확인하는 절차다.

Agent는 `Closure` 중 장기 효력이 있는 결정, 맥락, 기준, 위험, 열린 질문, 작업 방식 개선 후보를 확인한다. 각 후보는 `Continuity Artifact`로 남길 항목, Closure의 복원 정보에만 남길 항목, 이번 `Work` 안에서 마무리된 항목으로 구분한다.
