[문서](../Documents)
## 카메라 모션 애니메이션 (Camera Motion Animation)

특정 분자 전체 조망에서 활성 부위(Active site)로의 부드러운 줌인(Zoom-in), 시점 회전 이동, 궤적 이동 등 뷰포트의 시점 변화를 애니메이션으로 제작할 수 있습니다.

* 샘플 씬 파일: [lyso_cammotion1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_cammotion1.qsc) (Lysozyme 카메라 이동)

---

## 1. 시작 카메라 (Start Camera) 지정

애니메이션이 재생될 때 항상 정해진 기준 시점에서 출발하도록 하려면, Animation 패널 상단의 **Start cam** 항목에서 기준 카메라(예: `camera_0`)를 선택합니다:

> ![anim-panel-cmb1](../../assets/images/cuemol2/Anim_Cmb/anim-panel-cmb1.png) &rArr; ![anim-startcam-1](../../assets/images/cuemol2/Anim_CameraMotion/anim-startcam-1.png)

`(none)`으로 두면 현재 뷰포트의 임의 시점에서 시작되지만, 특정 카메라를 지정하면 재생 버튼을 누를 때 항상 해당 카메라 각도로 자동 정렬된 후 애니메이션이 시작됩니다.

---

## 2. 카메라 모션 클립 추가

1. 뷰포트를 이동/회전/줌인하여 원하는 목표 시점을 잡고, Scene 패널에서 새 카메라(예: `camera_1`)로 저장합니다.
2. Animation 패널의 **「+」** &gt; **Camera motion**을 선택합니다:

![anim-cammot-1](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-1.png)

3. 속성 대화상자에서 세부 옵션을 설정합니다:

![anim-cammot-2](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-2.png){ style="zoom: 0.5" .on-glb }

* **Target camera**: 이동할 목표 카메라(`camera_1`)를 선택합니다.
* **Duration**: 이동에 걸릴 시간(예: `0:0:2.0` = 2초)을 지정합니다.
* **Quadric**: 가감속 부드러움(예: `0.25`)을 지정합니다.
* **Ignore 항목들**: 특정 요소(줌 배율, 슬랩 두께, 중심점 등)의 변경을 제외하고 싶을 때 체크합니다.

---

## 3. 타임라인 구성 및 확인

설정을 마치면 타임라인에 다음과 같이 전체 모션이 체계적으로 연결됩니다:

![anim-cammot-3](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-3.png){ .on-glb }

* `0~1초`: `camera_0` 기준 정회전 (SimpleSpin1)
* `1~2초`: `camera_0` 기준 역회전 (SimpleSpin2)
* `2~4초`: `camera_0`에서 `camera_1` 시점으로 부드럽게 카메라 이동 및 줌인 (CamMotion1)
