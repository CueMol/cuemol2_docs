[문서](../Documents)
## 객체, 렌더러 및 카메라의 복사/붙여넣기 (Copy & Paste)

CueMol2에서는 동일한 씬 내부뿐만 아니라 **서로 다른 씬(탭) 간에도 분자 객체(Object), 렌더러(Renderer), 카메라(Camera)를 클립보드를 통해 자유롭게 복사하고 붙여넣기**할 수 있습니다.

---

## 1. 렌더러 복사 및 붙여넣기 (Copy & Paste Renderer)

특정 분자에 정성껏 설정해 둔 렌더러 스타일(색상, 두께, 선택 범위 등)을 다른 분자 객체에 그대로 적용할 때 유용합니다.

1. Scene 패널에서 복사할 렌더러를 우클릭하고 **Copy**를 선택합니다:

![copypaste_renderer1](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer1.png)

*(예: 분자 1CRN.pdb의 리본 렌더러 `ribbon1` 복사)*

2. 붙여넣을 대상 분자 객체(예: `1QRA.pdb`)를 우클릭하고 **Paste Renderer**를 선택합니다:

![copypaste_renderer2](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer2.png)

3. 대상 분자에 복사된 렌더러가 즉시 추가되고 뷰포트에도 동일한 스타일의 모델이 표시됩니다:

> ![copypaste_renderer3](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer3.png) ![copypaste_renderer4](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer4.png)

> [!NOTE] 유효성 검사 및 이름 충돌 방지
> * 호환되지 않는 객체(예: 전자 밀도 렌더러를 단백질 분자 객체에 붙여넣기)에는 붙여넣기가 제한됩니다.
> * 동일한 이름의 렌더러가 이미 존재할 경우 `copy1_` 등의 접두사가 자동으로 부여됩니다.

---

## 2. 분자/데이터 객체 복사 및 붙여넣기 (Copy & Paste Object)

분자 좌표(MolCoord), 전자 밀도 맵(DensityMap) 등의 전체 데이터 객체를 렌더러와 함께 통째로 복제하거나 다른 씬으로 가져올 수 있습니다.

1. Scene 패널에서 복사할 객체를 우클릭하고 **Copy Object**를 선택합니다:

![copypaste_obj1](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_obj1.png)

2. 대상 씬의 최상위 Scene 노드를 우클릭하고 **Paste**를 선택합니다:

![copypaste_obj2](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_obj2.png)

3. 해당 씬에 객체와 소속된 모든 렌더러(예: `ribbon1`)가 일괄 복제되어 추가됩니다:

![copypaste_obj3](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_obj3.png)

---

## 3. 카메라 복사 및 붙여넣기 (Copy & Paste Camera)

카메라 역시 동일한 방법으로 Scene 패널에서 **Copy** 및 **Paste**하여 다른 씬으로 복제할 수 있습니다. 동일한 관찰 시점과 줌 배율을 공유하는 도판을 신속하게 구성할 때 매우 편리합니다.
