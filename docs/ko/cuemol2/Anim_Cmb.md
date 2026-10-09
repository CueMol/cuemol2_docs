[문서](../Documents)
## 복합 애니메이션 및 상대 시간/가감속 곡선 (Animation Combination & Quadric)

단일 모션뿐만 아니라 회전, 줌인, 카메라 이동, 페이드 효과 등 여러 애니메이션 클립을 타임라인 상에 순차적 또는 병렬적으로 결합하여 완성도 높은 시퀀스를 구성할 수 있습니다.

* 샘플 씬 파일: [lyso_simplespin2.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin2.qsc) (Lysozyme 정회전 후 역회전)

---

## 1. 다중 애니메이션 추가 (정회전 후 역회전)

1. [애니메이션 기초](./Anim_Basic)의 `SimpleSpin1`에 이어 두 번째 애니메이션을 추가합니다.
2. Animation 패널의 **「+」** &gt; **Simple spin**을 클릭합니다.
3. 설정 대화상자에서 다음과 같이 지정합니다:
   * **Relative to**: `SimpleSpin1` (첫 번째 스핀이 끝나는 즉시 시작되도록 지정)
   * **Duration**: `0:0:1.0` (1초)
   * **Spin axis**: `Cartesian` 선택 후 `(0, -1, 0)` 입력 (Y축 기준 반대 방향 회전)

설정을 완료하면 타임라인에 두 개의 클립이 순차적으로 배치됩니다:

![anim-panel-cmb1](../../assets/images/cuemol2/Anim_Cmb/anim-panel-cmb1.png){ .on-glb }

* `0~1초`: Y축 양방향 360도 정회전
* `1~2초`: Y축 음방향 360도 역회전 (원위치 복귀)

---

## 2. 상대 시간(Relative Timing)의 원리와 장점

애니메이션의 시작 시간(`Start time`)을 선행 클립에 대한 **상대 시간(Relative to)**으로 지정하면, 앞선 클립의 지속 시간(`Duration`)을 변경하더라도 뒤따르는 모든 클립의 시작 시점이 자동으로 연동되어 밀려납니다.

예를 들어 `SimpleSpin1`의 Duration을 1초에서 2초로 늘리면:

![relanim1](../../assets/images/cuemol2/Anim_Cmb/relanim1.png){ .on-glb }

`SimpleSpin2`의 시작 시간이 자동으로 1초에서 2초로 뒤로 밀려 완벽한 타이밍 체인이 유지됩니다.

---

<a id="quadric"></a>
## 3. Quadric 값을 이용한 부드러운 가감속(Easing) 곡선

**Quadric 값**은 애니메이션 시작과 종료 시점의 가속 및 감속(Ease-in / Ease-out) 곡선 형태를 제어합니다:

* **Quadric = 0.0**: 완벽한 등속도 운동. 시작과 정지 시점에 갑작스러운 멈춤이 발생합니다.
  
  ![quad_graph_0](../../assets/images/cuemol2/Anim_Cmb/quad_graph_0.png)

* **Quadric = 0.25**: 시작 25%와 종료 25% 구간에 부드러운 2차 함수 가감속이 적용됩니다.
  
  ![quad_graph_025](../../assets/images/cuemol2/Anim_Cmb/quad_graph_025.png)

* **Quadric = 0.50**: 전 구간에 걸쳐 극적인 S자형 가감속 완화 곡선이 적용됩니다.
  
  ![quad_graph_05](../../assets/images/cuemol2/Anim_Cmb/quad_graph_05.png)

두 스핀 클립의 Quadric 값을 `0.25`로 설정하면, 방향 전환 시 급격한 끊김 없이 매우 유려하고 자연스럽게 이어지는 회전 모션이 완성됩니다:

![anim-simplespin-2](../../assets/images/cuemol2/Anim_Cmb/anim-simplespin-2.png){ style="zoom: 0.5" .on-glb }
