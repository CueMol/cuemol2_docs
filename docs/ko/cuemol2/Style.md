[문서](../Documents)
## 스타일 (Style)

CueMol2는 다양한 렌더러와 수많은 세부 속성을 지원하여 정밀한 표현이 가능하지만, 매번 모든 속성을 하나씩 설정하려면 번거로울 수 있습니다. 이를 해결하기 위해 여러 속성을 패키지 형태로 한 번에 일괄 적용할 수 있는 **스타일(Style)** 시스템을 제공합니다.

---

## 1. GUI에서 스타일 적용하기

### 형상(Shape)에 관한 스타일
Scene 패널에서 대상 렌더러를 마우스 우클릭하여 나타나는 컨텍스트 메뉴에서 원하는 스타일을 선택할 수 있습니다.

예를 들어, Ribbon 렌더러의 컨텍스트 메뉴에서 **Round**를 선택하면 다음과 같이 형상이 즉시 변경됩니다:

![style_ribbon_ctxtmenu1](../../assets/images/cuemol2/Style/style_ribbon_ctxtmenu1.png)

* **Helix(나선) 형상 변화**: <br/>
  ![style_helix_default1](../../assets/images/cuemol2/Style/style_helix_default1.png) &rArr; ![style_helix_round1](../../assets/images/cuemol2/Style/style_helix_round1.png)
* **Sheet(시트) 형상 변화**: <br/>
  ![style_sheet_default1](../../assets/images/cuemol2/Style/style_sheet_default1.png) &rArr; ![style_sheet_round1](../../assets/images/cuemol2/Style/style_sheet_round1.png)

Ribbon 외에도 BallStick, Cartoon, [거리 측정선(atomintr)](./NARenderer) 등 다양한 렌더러에 사전 정의된 프리셋 스타일을 적용할 수 있습니다.

### 채색(Paint)에 관한 스타일
채색(Paint) 스타일은 형상 스타일과 독립적으로 동작하며, **Color 패널**에서 지정합니다.

1. Color 패널에서 대상을 선택하고 우측의 드롭다운(▼) 버튼을 누릅니다.
2. **Paint coloring**을 선택하면 등록된 프리셋 스타일 목록이 나타납니다.
3. 예를 들어 **Woody**를 선택하면 CueMol1 시절의 자연스럽고 차분한 식물성 톤으로 변경됩니다.

![style_paint_ctxtmenu1](../../assets/images/cuemol2/Style/style_paint_ctxtmenu1.png)

> ![style_ribbon_default2](../../assets/images/cuemol2/Style/style_ribbon_default2.png) &rArr; ![style_ribbon_woody2](../../assets/images/cuemol2/Style/style_ribbon_woody2.png){ .on-glb }
*(좌측: Default 스타일, 우측: Woody 페인트 스타일)*

---

## 2. 스타일이 적용되지 않을 때 해결법

스타일을 변경했는데도 화면의 렌더러 형상이 바뀌지 않는 경우가 있습니다. 이는 **속성(Property) 창에서 사용자가 직접 특정 수치를 수동 변경하여 스타일 값을 덮어쓴(Override) 상태**이기 때문입니다.

스타일 프리셋을 정상적으로 다시 작동하게 하려면:

1. 렌더러 속성 대화상자를 열고 하단의 **Reset all to default** 버튼을 클릭합니다. (수동 지정했던 개별 수치가 초기화되고 스타일 정의가 우선 적용됩니다.)
2. 또는 속성 창의 **Generic** 탭에서 각 속성 항목 옆의 **default** 체크박스를 체크하면 해당 속성만 스타일 기본값으로 되돌릴 수 있습니다.

![style_resetall](../../assets/images/cuemol2/Style/style_resetall.png)

---

## 3. 스타일 우선순위 및 계층 구조

CueMol2의 속성 결정은 다음과 같은 명확한 계층 구조(우선순위)에 따라 결정됩니다:

![style_concept1](../../assets/images/cuemol2/Style/style_concept1.png)

1. **Default values (기본 내장값)**: CueMol2 소스 코드 레벨의 기본 수치 (가장 낮은 우선순위)
2. **System settings / Style (시스템 스타일 정의)**: 스타일에 정의된 값이 기본 내장값을 대체합니다.
3. **User-defined / Scene-defined styles (사용자/씬 스타일)**: 사용자 및 씬 레벨 스타일
4. **User specified values (사용자 직접 수동 설정)**: 속성 대화상자에서 사용자가 명시적으로 입력한 수치 (가장 높은 우선순위로 모든 스타일을 덮어씀)

---

### 시스템 스타일 정의 파일 위치

시스템 기본 스타일은 다음 파일에 XML 형식으로 정의되어 있습니다:

* **Windows**: `<CueMol2 설치폴더>\data\default_style.xml`
* **macOS**: `CueMol2.app/Contents/Resources/data/default_style.xml`
