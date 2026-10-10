[문서](../Documents)
## 서열 표시 패널 (Sequence Display Panel)

CueMol2 창 하단의 **서열 표시 패널(Sequence Display Panel)**을 통해 현재 씬에 로드된 생체 고분자의 아미노산 및 핵산 1차 서열을 한눈에 파악하고, 특정 잔기나 도메인을 시각적으로 선택하여 3D 뷰포트와 양방향으로 연동할 수 있습니다.

![seq-disp-panel1](../../assets/images/cuemol2/SequenceDisplayPanel/seq-disp-panel1.png){ style="zoom: 0.5" .on-glb }

---

### 서열 패널 표시 규칙
* **아미노산 및 핵산**: 표준 1글자 표기법 (A, C, G, T, R, K, D, E 등)
* **비표준 잔기, 리간드, 보조인자, 이온**: 별표 기호 (`*`)
* **선택된 잔기(Selected)**: 청록색(Cyan) 배경으로 강조
* **기준 잔기(Pivot)**: 빨간색 테두리 상자로 표시

---

### 마우스 조작 방법
* **단일 클릭**: 클릭한 잔기의 선택/해제 토글 및 뷰포트 회전 중심 이동
* **Shift + 클릭**: 기준(Pivot) 잔기부터 클릭한 잔기까지 연속 구간 일괄 선택
* **드래그(Drag)**: 마우스로 드래그한 영역의 모든 잔기 일괄 선택
* **더블 클릭**: 해당 잔기로 3D 뷰포트 시점 줌인 및 중심 이동

---

### 우클릭 컨텍스트 메뉴

서열 상에서 잔기를 우클릭하면 빠른 작업을 위한 메뉴가 표시됩니다:

![seq-disp-panel-ctxtmenu1](../../assets/images/cuemol2/SequenceDisplayPanel/seq-disp-panel-ctxtmenu1.png){ .on-glb }

* **Center here**: 3D 뷰포트의 회전 중심을 해당 잔기로 이동
* **Around Byresid**: 선택된 잔기 주변의 인접 잔기들을 거리 기준으로 자동 확장 선택
* **Around**: 선택된 잔기 주변의 모든 원자들을 거리 기준으로 선택
* **Unselect all / Invert sel**: 전체 선택 해제 또는 선택 영역 반전
