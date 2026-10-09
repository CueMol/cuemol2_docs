[문서](../Documents)
## 카메라 정보 외부 파일(.cam) 저장 및 씬 간 공유

논문용 구조 비교 도판 등을 제작할 때, 서로 다른 씬(Scene) 파일 간에 **완벽하게 동일한 시점, 회전 각도, 줌 배율**을 공유해야 하는 경우가 많습니다.

카메라 객체를 [복사/붙여넣기](./ObjRendCopyPaste)하여 전달할 수도 있지만, 시점을 수정할 때마다 매번 다시 복사해야 하는 번거로움이 있습니다. CueMol2는 카메라 설정만을 독립된 **외부 XML 파일(`.cam`)**로 저장하고 여러 씬에서 실시간 링크로 참조하는 기능을 지원합니다.

---

## 1. 카메라 컨텍스트 메뉴

Scene 패널의 Camera 항목을 마우스 우클릭하면 파일 연동과 관련된 메뉴가 표시됩니다:

![camera_ctxtmenu1](../../assets/images/cuemol2/CameraFile/camera_ctxtmenu1.png){ .on-glb }

* **Load file...**: 외부 `.cam` 파일을 가져와 씬에 링크된 카메라를 생성합니다.
* **Reload file**: 외부 `.cam` 파일의 최신 내용을 다시 읽어와 현재 씬의 카메라에 반영합니다.
* **Save file as...**: 현재 선택된 카메라 설정을 외부 `.cam` 파일로 내보냅니다.
* **Save file**: 현재 씬에서 수정한 카메라 설정을 링크된 외부 `.cam` 파일에 덮어씁니다.

---

## 2. 사용 방법

### 1) 카메라 설정을 `.cam` 파일로 내보내기
1. Scene 패널에서 원하는 카메라를 우클릭하고 **Save file as...**를 선택합니다.
2. 원하는 위치(보통 `.qsc` 씬 파일과 동일한 디렉터리 권장)에 `.cam` 파일을 저장합니다.
3. 저장이 완료되면 카메라 항목 좌측에 **외부 파일 링크 아이콘**이 표시됩니다:

![camera_icon1](../../assets/images/cuemol2/CameraFile/camera_icon1.png){ .on-glb }

### 2) 다른 씬에서 `.cam` 파일 불러와 공유하기
1. 다른 씬(`.qsc`)을 열거나 새로 생성합니다.
2. Scene 패널의 최상위 **Camera** 부모 노드를 우클릭하고 **Load file...**을 클릭합니다:

![camera_ctxtmenu2](../../assets/images/cuemol2/CameraFile/camera_ctxtmenu2.png){ .on-glb }

3. 앞서 저장한 `.cam` 파일을 선택하면 파일 링크 아이콘이 붙은 카메라가 등록됩니다.
4. 해당 카메라를 **더블 클릭**하면 저장된 시점과 줌 배율이 즉시 뷰포트에 적용됩니다.

### 3) 카메라 동기화 및 갱신
* **Save file**: 현재 씬에서 뷰를 조작한 후 컨텍스트 메뉴의 *Save from view* 등으로 카메라를 업데이트했다면, **Save file**을 눌러 외부 `.cam` 파일에도 반영합니다. (씬 파일을 일반 저장해도 링크된 외부 `.cam` 파일에 자동 동기화 저장됩니다.)
* **Reload file**: 다른 씬에서 `.cam` 파일의 시점이 갱신되었다면, **Reload file**을 눌러 현재 씬의 카메라를 즉시 최신 상태로 동기화합니다.

---

## 3. `.cam` 파일 포맷 구조

`.cam` 파일은 텍스트 편집기(VS Code, 메모장 등)로 직접 열어보고 수정할 수 있는 깔끔한 XML 형식입니다:

```xml
<?xml version="1.0" encoding="utf-8"?>
<camera center="(-10.837787,13.999697,15.037303)"
 centerMark="crosshair" distance="200"
 name="camera_0" perspec="false"
 rotation="(0.774185,-0.124804,0.245019,0.570112)"
 slab="50" stereoDist="1" stereoMode="none" zoom="50"/>
```

* **`center`**: 뷰포트 회전 중심의 3차원 좌표 (Å 단위)
* **`centerMark`**: 중심 마크 형태 (`crosshair`, `axis`, `none`)
* **`distance`**: 카메라와 중심점 사이의 거리 (Å 단위)
* **`perspec`**: 원근 투영 여부 (`true`: Perspective, `false`: Orthographic 직교 투영)
* **`rotation`**: 3차원 회전 쿼터니언(Quaternion) 벡터
* **`slab`**: 전후 슬랩(Clipping plane) 두께 (Å 단위)
* **`zoom`**: 확대 수치 (화면 상하단 사이의 실제 거리, Å 단위)
