[문서](../Documents)
## 렌더러 표시/숨김 애니메이션 (Show/Hide & Slide In/Out)

애니메이션 도중 특정 리간드, 곁사슬, 표면 렌더러가 부드럽게 나타나거나(Fade In) 사라지도록(Fade Out), 혹은 화면 밖에서 날아오거나(Slide In) 빠져나가도록(Slide Out) 연출할 수 있습니다.

* 샘플 씬 파일: [lyso_showhide1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_showhide1.qsc) (Lysozyme 곁사슬 페이드인 및 슬라이드아웃)

---

## 1. Show/Hide (Fade In / Out) 애니메이션

투명도(Alpha)가 서서히 변하면서 객체가 부드럽게 나타나거나 사라지는 효과입니다.

1. 표시할 대상 렌더러(예: 리소자임 핵심 잔기 Glu35, Asp52의 볼앤스틱 렌더러 `ballstick1`)를 미리 생성해 둡니다.
2. Animation 패널의 **「+」** &gt; **Show** (또는 Hide)를 선택합니다:

![anim-fadeio-1](../../assets/images/cuemol2/Anim_ShowHide/anim-fadeio-1.png)

3. 속성 대화상자에서 **Target renderers**에 대상 렌더러(`ballstick1`)를 추가하고 시작 시간과 지속 시간(Duration)을 설정합니다:

![anim-fadeio-2](../../assets/images/cuemol2/Anim_ShowHide/anim-fadeio-2.png){ style="zoom: 0.5" .on-glb }

* **Fade**: 체크 해제 시 서서히 나타나지 않고 지정 시점에 즉시 ON/OFF 전환됩니다.

타임라인에 페이드인 클립이 추가됩니다:

![anim-fadeio-3](../../assets/images/cuemol2/Anim_ShowHide/anim-fadeio-3.png)

---

## 2. Slide In / Out 애니메이션

렌더러가 화면 바깥에서 특정 방향으로 날아 들어오거나, 화면 밖으로 밀려나며 퇴장하는 동적인 모션 그래픽 효과입니다.

1. Animation 패널의 **「+」** &gt; **Slide out** (또는 Slide in)을 선택합니다:

![anim-slideio-1](../../assets/images/cuemol2/Anim_ShowHide/anim-slideio-1.png)

2. 속성 대화상자에서 이동 방향과 거리를 설정합니다:

![anim-slideio-2](../../assets/images/cuemol2/Anim_ShowHide/anim-slideio-2.png){ style="zoom: 0.5" .on-glb }

* **Direction angle**: 슬라이드 이동 방향 각도 (9시 방향=0도 기준 시계 방향; `Up=90도`, `Right=180도`, `Down=270도` 등)
* **Distance**: 이동 거리 (화면 반폭 `W/2`를 `1.0` 기준으로 지정)
* **Quadric**: 가감속 부드러움 (예: `0.5` = 50%)

설정을 마치면 타임라인에 슬라이드 아웃 클립이 연결됩니다:

![anim-slideio-3](../../assets/images/cuemol2/Anim_ShowHide/anim-slideio-3.png)

* `4~5초`: `ballstick1` 곁사슬 페이드 인 (ShowAnim1)
* `5~6초`: 정지 상태에서 관찰
* `6~7초`: `ballstick1`이 화면 상단으로 슬라이드 아웃 퇴장 (SlideOutAnim1)
