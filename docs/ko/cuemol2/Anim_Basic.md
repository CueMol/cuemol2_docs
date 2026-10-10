[문서](../Documents)
## 애니메이션 기초 및 단순 회전 (Animation Basics & Simple Spin)

CueMol2는 복잡한 스크립트 작성 없이도 직관적인 타임라인 GUI를 통해 **단순 스핀 회전, 부드러운 카메라 이동, 페이드 인/아웃, 분자 구조 전이(Morphing), 복합 모션** 등을 제작하고 고화질 동영상으로 렌더링할 수 있는 강력한 내장 애니메이션 엔진을 제공합니다.

* 샘플 씬 파일: [lyso_simplespin1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin1.qsc) (Lysozyme 단순 스핀)

---

## 1. 애니메이션 패널 (Animation Panel)

사이드 패널에서 **Animation** 탭을 클릭하여 패널을 엽니다 (표시되지 않는 경우 상단 메뉴 **Window &gt; Panels &gt; Animation**을 실행):

![anim-palette1](../../assets/images/cuemol2/Anim_Basic/anim-palette1.png)

---

## 2. 애니메이션 추가 (Simple Spin 생성)

1. 리소자임(1QIO 등) 분자를 로드하여 리본 렌더러로 표시하고 화면 중앙에 배치합니다.
2. Animation 패널의 **「+」** 버튼을 클릭하고 드롭다운 메뉴에서 **Simple spin**을 선택합니다:

![anim-palette2](../../assets/images/cuemol2/Anim_Basic/anim-palette2.png)

---

## 3. 애니메이션 속성 설정

Simple spin 추가 시 다음과 같은 설정 대화상자가 표시됩니다:

![anim-simplespin-2](../../assets/images/cuemol2/Anim_Basic/anim-simplespin-2.png){ style="zoom: 0.5" .on-glb }

### 공통 설정 (Common Settings)
모든 유형의 애니메이션 객체가 공유하는 기본 속성입니다:

* **Name**: 애니메이션 클립의 이름
* **Disabled**: 체크 시 해당 애니메이션을 일시적으로 무시/비활성화 (테스트용)
* **Start time**: 애니메이션이 시작될 시점
* **Relative to**: 시작 시간의 기준을 타임라인 절대 시간(`absolute`)으로 할지, 앞선 다른 애니메이션의 종료 시점에 대한 상대 시간으로 할지 선택
* **Duration**: 애니메이션의 지속 시간 (기본값: 1초)
* **Quadric**: 애니메이션의 가감속(가속/감속 스무딩) 곡선 계수 ([복합 애니메이션](./Anim_Cmb) 참조)

> [!NOTE] 시간 위젯 표기법 (`시:분:초.밀리초`)
> ![time_widget](../../assets/images/cuemol2/Anim_Basic/time_widget.png){ .on-glb }
> CueMol2의 시간 위젯은 `Hour : Min : Sec . Millisec` 형식으로 입력합니다. 예를 들어 `0:0:1.23`은 1.23초가 아니라 **1초 23밀리초(=1.023초)**를 의미합니다.

### Simple spin 전용 설정 (SimpleSpin Settings)
* **Rotation angle**: 회전할 각도를 지정합니다 (기본값: 360도 = 1회전).
* **Spin axis**: 회전축을 지정합니다.
  * `X, Y, Z axis`: 화면 수평(X), 화면 수직(Y), 화면 깊이(Z) 기준 회전 (기본값: Y축)
  * `Cartesian`: 사용자가 직접 임의의 3D 공간 벡터 축`(X, Y, Z)`을 입력

설정을 마치고 **OK**를 누르면 패널에 타임라인 클립이 등록됩니다:

![anim-palette3](../../assets/images/cuemol2/Anim_Basic/anim-palette3.png){ style="zoom: 0.5" .on-glb }

---

## 4. 애니메이션 재생 및 제어

툴바 상단의 **Animation** 탭을 클릭하면 애니메이션 재생 리본(Ribbon) 툴바가 나타납니다:

![anim-ribbon1](../../assets/images/cuemol2/Anim_Basic/anim-ribbon1.png)

* **Play / Pause**: 재생 시작 및 일시 정지
* **Stop**: 재생을 중지하고 시작 위치로 되감기
* **Loop**: 애니메이션 종료 시 처음부터 무한 반복 재생
* **타임라인 슬라이더**: 슬라이더를 드래그하여 원하는 시간 프레임으로 즉시 이동

---

### 애니메이션 수정 및 재생 속도 조절
Animation 패널에서 등록된 클립을 더블 클릭하면 속성 대화상자가 다시 열립니다. 회전 속도가 너무 빠르다면 **Duration**을 `0:0:5.0`(5초) 등으로 늘려 여유롭고 부드러운 회전으로 조절할 수 있습니다.
