[문서](../Documents)
## 조명 및 광원 설정 (Lighting Settings)

POV-Ray 렌더링 시 조명(Lighting) 배치를 적절히 조절하면 복잡한 분자 구조의 깊이감과 윤곽을 극적으로 살릴 수 있습니다.

조명 설정은 POV-Ray 렌더링 대화상자의 **Lighting** 섹션에서 설정합니다:

![povrender-lighting1](../../assets/images/cuemol2/POVRayRenderLighting/povrender-lighting1.png){ style="zoom: 0.5" .on-glb }

---

## 1. 광원의 종류

CueMol2가 구성하는 가상 스튜디오에는 다음과 같은 3가지 광원이 사용됩니다:

1. **Spot light (주 광원 / 스포트라이트)**: 시선의 우측 대각선 뒤쪽에서 분자를 비추며, 입체적인 그림자를 형성합니다.
2. **Flash light (보조 광원 / 플래시라이트)**: 카메라 시점과 정확히 일치하는 위치에서 정면으로 비춥니다. 시선과 같은 방향이므로 그림자가 생기지 않아 어두운 사각지대를 밝히는 역할을 합니다.
3. **Ambient light (환경광 / 간접 산란광)**: 씬 전체를 감싸는 부드러운 산란광으로, Radiosity 렌더링 모드에서 주로 활용됩니다.

---

## 2. 레이트레이싱(Raytracing) 모드에서의 조명

Shadow
:   스포트라이트에 의한 음영 그림자를 생성합니다. (좌: OFF, 우: ON)

![raytr-light1](../../assets/images/cuemol2/POVRayRenderLighting/raytr-light1.png){ .on-glb } ![raytr-light2](../../assets/images/cuemol2/POVRayRenderLighting/raytr-light2.png){ .on-glb }

Spread (그림자 부드러움)
:   점광원의 반경을 조절합니다. `1.0`은 선명하고 날카로운 그림자를 만들며, 값을 올릴수록 광원이 넓어져 부드럽고 자연스러운 그림자가 형성됩니다 (아래 그림: `Spread = 3.0`).

![raytr-light3](../../assets/images/cuemol2/POVRayRenderLighting/raytr-light3.png){ .on-glb }

Intensity
:   전체 광원의 총 광량을 조절합니다.

Flash fraction
:   총 광량 중 정면 플래시 라이트가 차지하는 비율입니다. 값을 높이면 정면 조명이 강조되어 어두운 틈새가 환해집니다.

![raytr-light4-flash1](../../assets/images/cuemol2/POVRayRenderLighting/raytr-light4-flash1.png){ .on-glb } ![raytr-light4-flash0](../../assets/images/cuemol2/POVRayRenderLighting/raytr-light4-flash0.png){ .on-glb }
*(좌측: Flash fraction = 1.0, 우측: Flash fraction = 0.0)*

---

## 3. 라디오시티(Radiosity) 모드에서의 조명

Shadow
:   라디오시티 모드에서도 그림자를 켤 수 있습니다. (좌: 기본값, 우: Shadow ON)

![radio-light1-default](../../assets/images/cuemol2/POVRayRenderLighting/radio-light1-default.png){ .on-glb } ![radio-light1-shadow1](../../assets/images/cuemol2/POVRayRenderLighting/radio-light1-shadow1.png){ .on-glb }

Spread
:   라디오시티에서도 Spread 값을 올리면(예: `Spread = 3.0`) 그림자 경계가 부드럽게 번집니다.

![radio-light1-shadow3](../../assets/images/cuemol2/POVRayRenderLighting/radio-light1-shadow3.png){ .on-glb }

Flash fraction / Ambient fraction
:   * `Flash fraction`을 지나치게 높이면 라디오시티 고유의 은은한 깊이감이 반감될 수 있습니다.
    * `Ambient fraction`은 간접 산란광의 비율을 결정하며, 자연스러운 포토리얼리즘을 위해 적정 비율을 유지하는 것이 좋습니다.

![radio-light1-flash1](../../assets/images/cuemol2/POVRayRenderLighting/radio-light1-flash1.png){ .on-glb } ![radio-light1-flash0.5](../../assets/images/cuemol2/POVRayRenderLighting/radio-light1-flash0.5.png){ .on-glb }
*(좌: Flash fraction=1.0, 우: Flash fraction=0.5)*

![radio-light1-ambient1](../../assets/images/cuemol2/POVRayRenderLighting/radio-light1-ambient1.png){ .on-glb } ![radio-light1-ambient0](../../assets/images/cuemol2/POVRayRenderLighting/radio-light1-ambient0.png){ .on-glb }
*(좌: Ambient fraction=1.0, 우: Ambient fraction=0.0)*

---

### 효율적인 조명 튜닝 팁
1. **고속 모드로 사전 테스트**: Radiosity 품질을 `Fast`나 `OutdoorLQ`로 두고 작은 해상도로 빠르게 테스트 렌더링합니다.
2. **광량 및 플래시 비율 조절**: 결합 포켓 내부가 너무 어둡다면 `Intensity`나 `Flash fraction`을 살짝 올립니다.
3. **최종 렌더링**: 조명 밸런스가 잡히면 `OutdoorHQ` 및 `Spread = 3.0`으로 설정하고 고해상도로 최종 출력합니다.
