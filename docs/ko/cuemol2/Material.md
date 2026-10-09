[문서](../Documents)
## 재질 및 질감 설정 (Material)

CueMol2에서는 분자 렌더러 표면에 단순한 색상뿐만 아니라 반사율, 광택, 금속성, 질감 등의 **재질(Material)**을 지정할 수 있습니다.

*(재질 속성은 POV-Ray 레이트레이싱 렌더링 시 완벽하게 반영됩니다.)*

---

## 1. 재질의 종류

### 1) 색상 지정이 가능한 재질 (Color-modulating Materials)
원하는 색상을 유지하면서 표면의 반사 및 광택 질감만 변화시키는 재질입니다:

* **default**: 표준 플라스틱 광택 질감
* **shadow**: 음영 및 하이라이트 반사가 없는 플랫한 무광 질감 (반투명 표면과 중첩할 때 유용)
* **matte**: 차분하고 부드러운 무광 매트 질감
* **spec_metal**: 번쩍이는 강한 하이라이트를 가진 유광 금속 질감
* **diff_metal**: 은은한 반사를 가진 무광 메탈 질감

### 2) 고유 텍스처를 가진 재질 (Fixed Texture Materials)
재질 자체에 고유한 패턴과 색감이 포함된 특수 재질입니다:

* **metallic_chrome**: 거울처럼 반사하는 크롬 금속
* **metallic_copper**: 따뜻한 구리 메탈
* **stone35**: 대리석/화강암 석재 무늬
* **wood31**: 자연스러운 목재 나뭇결 무늬

---

## 2. 재질 적용 방법

### 1) 렌더러 전체에 일괄 적용
렌더러 속성 대화상자의 **Common** 탭에서 **Material** 항목을 원하는 재질명으로 변경합니다:

![material_propdlg3](../../assets/images/cuemol2/Material/material_propdlg3.png){ style="zoom: 0.75" .on-glb }

예를 들어 Material을 `shadow`로 지정하면 다음과 같이 음영이 배제된 플랫한 도판이 렌더링됩니다:

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } &rArr; ![shadow-ribbon2](../../assets/images/cuemol2/Material/shadow-ribbon2.png){ .on-glb }
*(좌: default 플라스틱, 우: shadow 플랫 무광)*

크롬 금속(`metallic_chrome`)을 적용하면 아래와 같이 미래지향적인 금속 리본이 렌더링됩니다:

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } &rArr; ![metallic-ribbon2](../../assets/images/cuemol2/Material/metallic-ribbon2.png){ .on-glb }

---

### 2) 색상 수식어(Modifier)를 통한 부위별 부분 적용
색상 지정 시 수식어 `{material: <재질명>}` 구문을 사용하면 2차 구조별로 서로 다른 재질을 부여할 수 있습니다:

```css
yellow{ material: shadow }
rgb(1, 1, 0){ material: spec_metal }
```

#### 2차 구조별 복합 재질 렌더링 예시
* **시트 (Sheet)**: `SteelBlue{ material: stone35 }` (석재)
* **나선 (Helix)**: `khaki{ material: wood31 }` (목재)
* **루프/코일**: `FloralWhite{ material: metallic_chrome }` (크롬)

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } &rArr; ![mixed-ribbon2](../../assets/images/cuemol2/Material/mixed-ribbon2.png)

![mixed-ribbon3](../../assets/images/cuemol2/Material/mixed-ribbon3.png){ style="zoom: 0.75" .on-glb }
*(확대 시 나타나는 디테일한 목재 및 대리석 질감)*
