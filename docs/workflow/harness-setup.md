# Harness Setup

## 목적

`Harness Setup`은 Agent가 `Work`를 더 완성도 있게 수행하기 위해 필요한 작업 준비 상태를 구성하는 조건부 단계다.

Agent는 코드 스타일, 프로젝트 관례, 환경 정보, 필요한 도구, 확인 표면, 관찰/측정 표면, 위험 통제처럼 `Work`의 결과 품질, 실행 가능성, 판단 비용을 의미 있게 바꾸는 준비를 `Harness Setup`으로 다룬다.

`Harness Setup`은 별도 plan field를 만들지 않는다. 복원할 가치가 있는 준비 결과만 `Work Frame`, `Task Contract`, `Mission Brief`의 기존 필드에 연결한다.

## 수행 조건

Agent는 `Work Frame`, `Task Contract`, `Mission Brief`를 정리할 때 작업 준비 상태를 별도로 구성할 필요가 있는지 판단하고, 필요한 경우 어떤 수준으로 구성할지 제안한다.

|질문|드러낼 것|
|---|---|
|현재 맥락만으로 실행 품질이 충분한가?|추가 context, 문서, 코드맵, 외부 자료 필요 여부|
|코드 스타일과 프로젝트 관례를 파악했는가?|formatting, lint, naming, component pattern, error handling, documentation convention 필요 여부|
|작업 환경을 설명하고 복원할 수 있는가?|runtime version, package manager, dev server, test command, env var, local dependency 필요 여부|
|실행을 재현할 수 있는가?|fixture, seed data, mock, replay, sandbox 필요 여부|
|결과를 확인할 표면이 충분한가?|테스트, 수동 확인, 비교 화면, snapshot, property-based test 필요 여부|
|품질을 수치로 측정해야 하는가?|benchmark, profiling, Lighthouse, load test, latency, throughput, memory 측정 필요 여부|
|실행 중 관찰해야 할 신호가 있는가?|log, trace, metric, screenshot, video, run artifact 필요 여부|
|위험을 사전에 줄일 수 있는가?|static analysis, dependency scan, secret scan, 권한 검토, rollback 준비 필요 여부|
|Agent 산출물을 반복 평가해야 하는가?|golden case, rubric, grader, eval suite, regression eval 필요 여부|
|다른 관점의 압박이 필요한가?|review, challenge, 분리된 context, sub agent 필요 여부|

## Harness 유형

`Harness Setup`은 `Work` 성격에 맞는 준비만 선택한다.

|유형|목적|예시|
|---|---|---|
|Context Harness|Agent가 필요한 맥락에 안정적으로 접근하게 한다.|MCP resource/tool, 문서 인덱스, 코드맵, dependency graph, API schema|
|Convention Harness|Agent가 프로젝트의 작성 기준을 따르게 한다.|formatting, lint rule, naming convention, file layout, component pattern, error handling convention|
|Execution Harness|작업을 재현 가능한 방식으로 실행하게 한다.|dev server, local environment, fixture, seed data, mock API, replay script, sandbox|
|Verification Harness|결과가 기준에 맞는지 확인하게 한다.|unit/integration/e2e test, Playwright, snapshot, property-based test, visual comparison|
|Measurement Harness|성능과 품질 특성을 수치로 보게 한다.|benchmark, profiling, Lighthouse, k6, latency, throughput, memory, bundle size|
|Observability Harness|실행 중 발생한 일을 추적하게 한다.|logs, traces, metrics, screenshots, videos, run artifacts, telemetry export|
|Safety Harness|권한, 보안, 의존성, 유출 위험을 다루게 한다.|SAST, SCA, secret scan, dependency vulnerability scan, MCP permission review|
|Evaluation Harness|Agent나 LLM 기반 산출물을 반복 측정하게 한다.|golden cases, rubric, grader, eval suite, regression eval|
|Review And Challenge Harness|누락, 약한 가정, 장기 비용을 다른 관점에서 보게 한다.|분리된 context review, adversarial checklist, challenge agent|
|Recovery Harness|실패, 취소, 되돌리기를 다루게 한다.|backup, rollback script, feature flag, migration down path, artifact preservation|

## Work 유형별 처리

|Work 유형|처리|
|---|---|
|`Direct Work`|짧은 준비로 충분하면 실행 전에 구성한다. 준비가 작업 기준을 바꾸면 `Task`로 승격한다.|
|`Task`|필요한 작업 준비 상태를 실행 전에 구성하고, 복원할 가치가 있는 준비 결과는 `Task Contract`의 `Starting Context`, `Guardrails`, `Verification Strategy`, `Review And Challenge Focus` 중 관련 항목에 반영한다.|
|`Mission`|공유 작업 준비 상태를 실행 전에 구성하고, 복원할 가치가 있는 준비 결과는 `Mission Brief`의 `Key Context`, `Shared Considerations`, `Validation And Review Strategy`, `Continuity Needs` 중 관련 항목에 반영한다. Task별 준비 결과는 각 `Task`의 기존 필드에 반영한다.|

## User 판단 지점

다음 경우 Agent는 작업 준비 상태 구성을 User 판단 지점으로 올린다.

|상황|User가 판단할 것|
|---|---|
|새 도구 설치나 외부 서비스 연결이 필요하다.|설치, 비용, 계정, 네트워크, 유지 부담 수용 여부|
|MCP나 외부 tool이 권한 있는 시스템에 접근한다.|노출할 tool, resource, 권한, 확인 프롬프트 수준|
|성능, 보안, 품질 기준이 결과 수용 기준을 바꾼다.|측정 기준, 통과 기준, 위험 수용 조건|
|준비가 작업량과 일정에 영향을 준다.|준비 범위, 깊이, 생략 가능한 항목|
|생성한 script나 fixture가 이후에도 남는다.|보존 위치, 재사용 조건, 소유 기준|

## Boundary

`Harness Setup`은 모든 `Work`의 의무 단계가 아니다.

작업 품질, 실행 가능성, 판단 비용, 위험 통제를 의미 있게 바꾸지 않는 준비는 생략한다.

단순 실행보다 준비 비용이 더 크고 결과 판단을 개선하지 않는 경우 Agent는 생략 이유를 현재 `Work`에 맞는 위치에 남긴다.

기준을 바꾸지 않는 세부 runtime 준비는 `Execute` 안에서 수행한다. 복원할 가치가 없는 준비 결과는 별도 기록으로 남기지 않는다.

권한, 보안, 비용, 외부 연결, 장기 유지 부담이 생기는 준비는 Agent가 임의로 고정하지 않고 User 판단 지점으로 올린다.
