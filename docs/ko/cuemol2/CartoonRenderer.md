[문서](../Documents)
## 카툰 렌더러 (Cartoon Renderer)

카툰 렌더러(Cartoon Renderer)는 단백질 전용 렌더러로, 분자의 전체적인 3차원 폴딩(Fold)을 간결하고 직관적으로 파악할 수 있도록 단순화하여 표현합니다.

* **나선(Helix)**: 깔끔한 원통(Cylinder) 형태
* **시트(Sheet)**: 완만한 판(Plank/Arrow) 형태
* **코일(Coil)**: 굵기가 정돈된 튜브(Tube) 형태

리본 렌더러와 유사하지만, 리본 모델이 Cα 원자의 위치를 엄밀하게 추종하는 반면, 카툰 모델은 세부적인 기복을 과감히 스무딩(Smoothing)하여 폴딩 구조의 아름다움을 극대화합니다. (필요 시 아래에서 설명하는 Smooth 파라미터나 Anchor 기능을 통해 특정 Cα를 정확히 통과하도록 맞출 수도 있습니다.)

> ![cartoon_cartoon1](../../assets/images/cuemol2/CartoonRenderer/cartoon_cartoon1.png){ .on-glb } ![cartoon_ribbon1](../../assets/images/cuemol2/CartoonRenderer/cartoon_ribbon1.png){ .on-glb }
*(좌측: Cartoon 렌더러 기본값, 우측: Ribbon 렌더러 기본값)*

PyMOL이나 Molscript 등에서도 널리 쓰이는 표현이지만, **CueMol2의 카툰 렌더러는 곡률, 원통 굵기, 가변 두께, 앵커(Anchor) 등 매우 세밀하고 정교한 파라미터 제어가 가능하다는 독보적인 장점**이 있습니다.

---

## 1. 나선(Helix) 원통 표시 옵션

### `helix_smooth` (원통 곡률 완만함)
나선 원통의 직선화/곡률 정도를 실수값으로 지정합니다. 기본값은 `3.0`으로 시각적으로 곧게 뻗은 형태입니다.

* 값을 줄일수록 Cα 궤적의 나선형 회전을 따라 구부러집니다.
* 값을 늘릴수록 완벽한 직선에 가까워집니다.
* 권장 사용 범위는 `2.0 ~ 4.0`입니다.

> ![cartoon_helix_smooth_1](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_1.png){ .on-glb } ![cartoon_helix_smooth_2](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_2.png){ .on-glb } ![cartoon_helix_smooth_4](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_4.png){ .on-glb }
*(왼쪽부터 helix_smooth = 1.0, 2.0, 4.0)*

### `helix_waver` 및 `helix_wsmooth` (가변 두께)
* **`helix_waver`** (Helix width averaging): 기본값은 `true`로, 원통 전체가 균일한 평균 두께를 유지합니다. `false`로 설정하면 Cα 원자의 변위 정도에 따라 원통의 굵기가 유동적으로 변합니다.
* **`helix_wsmooth`**: `helix_waver=false`일 때 원통 굵기 변화의 완만함을 지정합니다. 기본값은 `5.0`이며, 값을 낮출수록 굵기 변화가 뚜렷해집니다.

> ![cartoon_helix_wsmooth_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_0.png){ .on-glb } ![cartoon_helix_wsmooth_1](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_1.png){ .on-glb } ![cartoon_helix_wsmooth_2](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_2.png){ .on-glb }
*(왼쪽부터 helix_wsmooth = 0.0, 1.0, 2.0; helix_waver=false 기준)*

### `helix_wplus` (연결부 코일 가림 보정)
구조에 따라 나선 실린더와 코일의 연결 부위에서 코일의 끝단 모서리가 실린더 밖으로 삐져나오는 경우가 있습니다. 이 때 `helix_wplus` 값을 늘리면 실린더 반지름이 확장되어 이음새가 깔끔하게 덮입니다.

> ![cartoon_helix_wplus_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wplus_0.png){ .on-glb } ![cartoon_helix_wplus_1](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wplus_1.png){ .on-glb }
*(왼쪽: helix_wplus = 0.0, 오른쪽: helix_wplus = 0.5)*

---

## 2. 시트(Sheet) 표시 옵션

### `sheet_smooth` (시트 완만함)
베타 시트의 직선화 정도를 설정합니다. 기본값은 `3.0`으로, 시트의 전반적인 비틀림 흐름을 유지하면서도 적당히 곧게 펴진 형태를 만듭니다.

* `-2.0` 이하: 실제 Cα 원자 위치를 거의 그대로 통과합니다.
* `3.0` 이상: 거의 평평한 직선 판 형태가 됩니다.

> ![cartoon_sheet_smooth_-5](../../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_-5.png){ .on-glb } ![cartoon_sheet_smooth_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_0.png){ style="zoom: 0.97" .on-glb } ![cartoon_sheet_smooth_3](../../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_3.png){ style="zoom: 0.9" .on-glb }
*(왼쪽부터 sheet_smooth = -5.0, 0.0, 3.0)*

---

## 3. 코일(Coil) 표시 옵션

### `coil_smooth` (코일 완만함)
루프/코일 구간의 완만함을 지정합니다. 기본값은 `-1.0`으로, 코일의 곡률 특징을 적절히 살리면서도 깔끔한 곡선을 그립니다.

* `-2.0` 이하: 실제 Cα 위치에 밀착합니다.
* `0.0` 이상: Cα 위치에서 다소 멀어지며 크게 완만해집니다.

> ![cartoon_coil_smooth_-5](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-5.png){ .on-glb } ![cartoon_coil_smooth_-2](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-2.png){ .on-glb } ![cartoon_coil_smooth_-1](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-1.png){ .on-glb } ![cartoon_coil_smooth_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_0.png){ .on-glb }
*(왼쪽부터 coil_smooth = -5.0, -2.0, -1.0, 0.0)*

---

## 4. 앵커(Anchor) 설정 (주요 잔기 밀착)

카툰 모델 위에 특정 중요 잔기의 곁사슬(Ball & Stick 등)을 함께 표시할 때, 주쇄 곡선이 Cα를 벗어나 있으면 곁사슬이 공중에 붕 떠 보이는 문제가 생길 수 있습니다.

### `anchor_sel` 속성
이 때 `anchor_sel` 속성에 특정 잔기 선택식(예: `A.76.*`)을 지정하면, 전체적인 스무딩을 유지하면서도 **지정한 잔기의 Cα 원자만 정확히 통과**하도록 곡선 궤적을 국소 보정합니다.

> ![cartoon_anchor_sel0](../../assets/images/cuemol2/CartoonRenderer/cartoon_anchor_sel0.png){ .on-glb } &rArr; ![cartoon_anchor_sel1](../../assets/images/cuemol2/CartoonRenderer/cartoon_anchor_sel1.png){ .on-glb }
*(왼쪽: 일반 스무딩 상태, 오른쪽: 루프 끝 76번 잔기에 Anchor 적용)*

> [!TIP]
> 활성 부위나 결합 부위 등 핵심 잔기 1~2개에 Anchor를 적용하면 모델의 미관을 해치지 않으면서 완벽하게 밀착된 곁사슬 결합 도판을 제작할 수 있습니다.

---

### 주의 사항
* 분자 선택식(Selection)을 적용할 때 2차 구조(Helix/Sheet)의 중간에서 끊기도록 지정하면 끝단 단면 처리가 매끄럽지 않을 수 있습니다. 부분 렌더링 시에는 가급적 코일(Coil) 구간을 기준으로 선택 범위를 나누는 것이 좋습니다.
