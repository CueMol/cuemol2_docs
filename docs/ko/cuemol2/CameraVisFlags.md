[문서](../Documents)
## 카메라에 렌더러 표시/숨김(Visibility) 상태 저장

카메라에는 시점 좌표 및 회전 정보뿐만 아니라, **각 객체(Object) 및 렌더러(Renderer)의 표시/숨김(Show/Hide) 가시성 상태**를 함께 저장할 수 있습니다.

* 여러 단백질 복합체나 전자 밀도 맵이 로드된 복잡한 씬에서 각 구성 요소의 표시/숨김을 일일이 토글하기 번거로울 때
* **하나의 씬(`.qsc`) 파일 안에서 여러 도판(Figure 1A, Figure 1B 등)을 카메라 전환만으로 즉시 전환**하고자 할 때

---

## 1. 가시성 상태 저장 (Save with vis flags)

1. 뷰포트에서 원하는 시점을 맞추고, Scene 패널에서 표시할 렌더러는 켜고 숨길 렌더러는 끕니다.
2. Scene 패널의 대상 카메라를 우클릭하고 **Save from scene (with vis flags)**를 선택합니다:

![camvis-ctxtmenu1](../../assets/images/cuemol2/CameraVisFlags/camvis-ctxtmenu1.png){ style="zoom: 0.5" .on-glb }

3. 가시성 플래그가 정상적으로 저장된 카메라는 이름 옆에 **눈(Eye) 아이콘**이 표시됩니다:

![camvis-visset1](../../assets/images/cuemol2/CameraVisFlags/camvis-visset1.png){ .on-glb }

---

## 2. 저장된 가시성 상태 복원

* 대상을 **더블 클릭**하거나, 우클릭 컨텍스트 메뉴에서 **Load to scene (with vis flags)**를 실행합니다.
* 시점과 줌 배율이 이동함과 동시에, 저장되었던 모든 객체와 렌더러의 표시/숨김 상태가 한 번에 복원됩니다.

---

## 3. 세부 가시성 플래그 편집 (Edit vis flags)

컨텍스트 메뉴에서 **Edit vis flags...**를 실행하면 각 객체별 포함 여부를 정밀하게 편집할 수 있는 대화상자가 열립니다:

![camvis-editdlg1](../../assets/images/cuemol2/CameraVisFlags/camvis-editdlg1.png){ .on-glb }

* **Obj/Rend 열**: 현재 씬의 객체 및 렌더러 계층 구조를 보여줍니다.
* **Inc (Include) 열**: 체크 표시된 항목만 해당 카메라의 가시성 제어 대상에 포함됩니다. 체크가 해제된(비활성) 항목은 카메라를 전환해도 기존 표시 상태가 변경되지 않고 유지됩니다.
* **Vis (Visibility) 열**: 눈 아이콘이 켜진 항목은 카메라 로드 시 표시(Show) 상태로 전환되고, 꺼진 항목은 숨김(Hide) 상태로 전환됩니다.

### 가시성 플래그 전체 삭제
컨텍스트 메뉴에서 **Clear vis flags**를 선택하면 저장되어 있던 가시성 정보만 모두 제거되고 순수한 시점(좌표/회전) 전용 카메라로 돌아갑니다.
