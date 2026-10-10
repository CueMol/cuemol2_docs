[문서](../Documents)
## 리본 렌더러 (Ribbon Renderer)

단백질 및 폴리펩타이드의 주쇄(Main chain)를 스플라인(Spline) 곡선을 사용하여 미려한 리본 형태로 표현하는 단백질 전용 렌더러입니다.

* **나선(Helix)**: 리본 또는 나선형 띠로 표시
* **시트(Sheet)**: 평판 또는 방향성을 나타내는 화살표로 표시
* **코일(Coil)**: 매끄러운 튜브로 표시

다양한 세부 속성을 조절하여 출판용 논문이나 프레젠테이션에 최적화된 리본 그래픽을 제작할 수 있습니다.

> [!NOTE] 2차 구조 할당 안내
> 리본 모델이 올바른 2차 구조 형태로 표시되려면 단백질 분자에 2차 구조 정보가 할당되어 있어야 합니다. PDB 파일 로드 시 자동으로 계산되므로 일반적으로는 신경 쓰지 않아도 되지만, 2차 구조를 직접 재할당하거나 수정하고 싶은 경우 [2차 구조 할당 (Prot2ndryStr)](./Prot2ndryStr) 문서를 참조하세요.
> *(RNA/DNA 등 핵산에 리본 렌더러를 적용하면 자동으로 [튜브 렌더러 (Tube Renderer)](./TubeRenderer)와 유사한 단순 튜브 형태로 표시됩니다.)*

---

## 1. 스타일을 통한 간편 설정 (Simple Style)

자주 사용되는 리본 표현 프리셋(Style)을 컨텍스트 메뉴에서 클릭 한 번으로 간편하게 적용할 수 있습니다.

Scene 패널에서 리본 렌더러를 우클릭하고 **Style** 메뉴를 선택하면 적용 가능한 스타일 목록이 나타납니다:

* **Default**: 기본 리본 설정. 굵은 튜브 코일과 사각 단면의 헬릭스 및 시트로 구성됩니다. (아래 그림 좌측)
* **Fancy1**: Molscript 스타일의 고급 리본 설정. 헬릭스 안쪽면과 시트 측면이 밝은 대비 색상으로 채워지며, 헬릭스 단면이 덤벨(Dumbbell) 형태가 됩니다. (아래 그림 중앙)
* **Round**: 타원형 단면을 사용하여 둥글고 부드러운 리본과 얇은 튜브 코일로 구성됩니다. (아래 그림 우측)

> ![01-style-default-1](../../assets/images/cuemol2/RibbonRenderer/01-style-default-1.png){ style="zoom: 0.5" .on-glb } ![02-style-fancy1-1](../../assets/images/cuemol2/RibbonRenderer/02-style-fancy1-1.png){ style="zoom: 0.5" .on-glb } ![03-style-round-1](../../assets/images/cuemol2/RibbonRenderer/03-style-round-1.png){ style="zoom: 0.5" .on-glb }
*(왼쪽부터 Default, Fancy1, Round 스타일)*

---

## 2. 세부 속성 설정 (Properties)

렌더러 속성(Property) 창을 열어 세부 항목을 정밀하게 조절할 수 있습니다.

<a id="common_settings"></a>
### 공통 탭 (Common Tab)

Section detail
:   단면 방향의 폴리곤 분할 정밀도를 지정합니다. 값이 클수록 곡면이 매끄러워지지만 폴리곤 수가 늘어납니다.

Axial detail
:   주쇄 주축(길이) 방향의 폴리곤 분할 정밀도를 지정합니다. 값이 클수록 굴곡이 매끄럽게 표현됩니다.

Smooth color
:   인접한 잔기 간의 색상이 서로 다를 때, **ON**이면 경계가 부드러운 그라데이션(아래 그림 좌측)으로 연결되고, **OFF**이면 잔기 중심에서 색상이 즉시 전환(아래 그림 우측)됩니다.

> ![05-prop-smoothcolor-2](../../assets/images/cuemol2/RibbonRenderer/05-prop-smoothcolor-2.png){ style="zoom: 0.5" .on-glb } ![04-prop-smoothcolor-1](../../assets/images/cuemol2/RibbonRenderer/04-prop-smoothcolor-1.png){ style="zoom: 0.5" .on-glb }

Pivot atom name
:   리본 곡선이 통과할 기준 원자의 이름을 지정합니다. 단백질의 기본값은 `CA` (Cα 탄소 원자)이며 일반적으로 변경할 필요가 없습니다.

Start/End type
:   사슬 말단부의 캡(Cap) 형태를 지정합니다. **Sphere**(구형 캡; 아래 좌측), **Flat**(평면 캡; 아래 중앙), **None**(캡 없음/개방형 파이프; 아래 우측).

> ![06-prop-cap-sphere-2](../../assets/images/cuemol2/RibbonRenderer/06-prop-cap-sphere-2.png){ style="zoom: 0.7" .on-glb } ![07-prop-cap-flat-2](../../assets/images/cuemol2/RibbonRenderer/07-prop-cap-flat-2.png){ style="zoom: 0.7" .on-glb } ![08-prop-cap-none-2](../../assets/images/cuemol2/RibbonRenderer/08-prop-cap-none-2.png){ style="zoom: 0.7" .on-glb }

*(외곽선 관련 설정은 [외곽선 설정 (EdgeLines)](./EdgeLines) 문서를 참조하세요.)*

---

### 나선 탭 (Helix Tab)

<a id="helix_section"></a>
#### Helix Section (단면 형상)
나선 구간의 단면 형상 및 크기를 설정합니다.

Type
:   단면의 기하학적 형태를 지정합니다.
    * **Elliptical**: 타원형 (아래 1번째)
    * **Rectangle**: 직사각형 (아래 2번째)
    * **Round rectangle**: 모서리가 둥근 직사각형 (아래 3번째)
    * **Fancy**: 덤벨(Dumbbell) 형태 (아래 4번째)

![10-prop-hsectype-oval-2](../../assets/images/cuemol2/RibbonRenderer/10-prop-hsectype-oval-2.png){ .on-glb }
![09-prop-hsectype-rect-2](../../assets/images/cuemol2/RibbonRenderer/09-prop-hsectype-rect-2.png){ .on-glb }
![11-prop-hsectype-rrect-2](../../assets/images/cuemol2/RibbonRenderer/11-prop-hsectype-rrect-2.png){ .on-glb }
![12-prop-hsectype-fancy-2](../../assets/images/cuemol2/RibbonRenderer/12-prop-hsectype-fancy-2.png){ .on-glb }

Back color
:   나선 안쪽 면의 색상을 별도로 지정할 수 있습니다(Molscript 효과). Off일 경우 바깥쪽과 동일한 색상이 적용됩니다.

![13-prop-hsecbackcol](../../assets/images/cuemol2/RibbonRenderer/13-prop-hsecbackcol.png){ .on-glb }

Width
:   나선의 두께(단면의 얇은 축)를 Å 단위로 지정합니다.

Tuber
:   나선의 폭(단면의 긴 축)을 지정합니다 (Width에 대한 배율).

Sharpness
:   단면의 모서리 각진 정도 또는 덤벨 형태를 조절합니다.
    * **Round rectangle인 경우**: 1에 가까울수록 각진 사각형이 되고, 0에 가까울수록 타원에 가까운 둥근 형태가 됩니다.
    * **Fancy인 경우**: 덤벨 양쪽 끝 원형의 상대적 크기를 조절합니다. 0에 가까우면 가장자리가 얇고 또렷해지며(아래 좌측; 0.0), 0.5에 가까우면 둥근 사각 형태(아래 중앙; 0.5), 0.5 이상이면 모서리가 두툼해집니다(아래 우측; 0.75).

![14-prop-hsecsha1](../../assets/images/cuemol2/RibbonRenderer/14-prop-hsecsha1.png){ .on-glb }
![15-prop-hsecsha2](../../assets/images/cuemol2/RibbonRenderer/15-prop-hsecsha2.png){ .on-glb }
![16-prop-hsecsha3](../../assets/images/cuemol2/RibbonRenderer/16-prop-hsecsha3.png){ .on-glb }

Smoothness
:   곡선의 완만함을 조절합니다. 0이면 중심 원자(Cα)를 엄밀하게 통과하는 곡선이 되며, 음수 값을 주면 원자 위치를 지나치게 꺾지 않고 더욱 매끄러운 곡선 궤적을 그립니다.

#### Helix Head & Tail (나선의 시작과 끝)
나선이 끝나는 부분(Head)과 시작하는 부분(Tail)의 전환 형태를 설정합니다.

Type
:   전환 형태를 지정합니다. **Round**(부드러운 연결; 아래 좌측), **Flat**(수직 절단; 아래 중앙), **Arrow**(화살표; 아래 우측).

![17-prop-hhead-type1](../../assets/images/cuemol2/RibbonRenderer/17-prop-hhead-type1.png){ .on-glb }
![18-prop-hhead-type2](../../assets/images/cuemol2/RibbonRenderer/18-prop-hhead-type2.png){ .on-glb }
![19-prop-hhead-type3](../../assets/images/cuemol2/RibbonRenderer/19-prop-hhead-type3.png){ .on-glb }

Power
:   연결 부위의 완만함(곡률 파워)을 지정합니다. Type이 Round일 때 1, 1.5, 3으로 변화시킨 예시입니다.

![20-prop-hhead-pow1](../../assets/images/cuemol2/RibbonRenderer/20-prop-hhead-pow1.png){ .on-glb }
![21-prop-hhead-pow2](../../assets/images/cuemol2/RibbonRenderer/21-prop-hhead-pow2.png){ .on-glb }
![22-prop-hhead-pow3](../../assets/images/cuemol2/RibbonRenderer/22-prop-hhead-pow3.png){ .on-glb }

---

### 시트 탭 (Sheet Tab)

베타 시트(β-sheet) 구간에 대한 설정이며, 나선 탭과 유사한 구조를 가집니다. 시트 특유의 주요 설정은 다음과 같습니다:

Back color
:   시트의 경우 안쪽면이 아닌 **측면(두께 모서리면)**의 색상이 지정한 색으로 채색됩니다.

![29-prop-sheet-bkcol](../../assets/images/cuemol2/RibbonRenderer/29-prop-sheet-bkcol.png){ .on-glb }

Smoothness
:   시트의 신장 평활도를 조절합니다. 0으로 설정하면 주쇄의 지그재그 기복이 그대로 드러나므로 기본값은 0.5(평평하게 펴진 시트 형태)로 설정되어 있습니다. *(단, 곁사슬을 함께 표시할 때 0.5에서는 Cα 결합 부위가 리본에서 약간 떠 보일 수 있으므로 0으로 조절하는 것이 자연스럽습니다.)*

![23-prop-shead-smo1](../../assets/images/cuemol2/RibbonRenderer/23-prop-shead-smo1.png){ .on-glb }
![24-prop-shead-smo2](../../assets/images/cuemol2/RibbonRenderer/24-prop-shead-smo2.png){ .on-glb }
![25-prop-shead-smo3](../../assets/images/cuemol2/RibbonRenderer/25-prop-shead-smo3.png){ .on-glb }

화살표 머리 설정 (Sheet Head - Arrow)
:   SheetHead의 Type을 **Arrow**로 설정하면 β-시트의 C말단 방향 끝부분에 화살표 머리가 생성됩니다.
    * **Power**: 화살표 촉의 뾰족한 기울기를 조절합니다 (아래 우측: 0.5, 중앙: 1.0, 좌측: 2.0).

![26-prop-shead-pow1](../../assets/images/cuemol2/RibbonRenderer/26-prop-shead-pow1.png){ .on-glb }
![27-prop-shead-pow2](../../assets/images/cuemol2/RibbonRenderer/27-prop-shead-pow2.png){ .on-glb }
![28-prop-shead-pow3](../../assets/images/cuemol2/RibbonRenderer/28-prop-shead-pow3.png){ .on-glb }

Arrow width / height
:   화살표 머리의 폭과 높이(돌출 크기)를 조절합니다. Width 100%는 시트 본체 너비의 3배가 되며, 0%는 본체 너비와 동일해집니다.

![30-prop-shead-arrow](../../assets/images/cuemol2/RibbonRenderer/30-prop-shead-arrow.png){ style="zoom: 0.5" .on-glb }

---

### 코일 탭 (Coil Tab)

코일(루프) 부분은 시작/끝 구분이 없으므로 단면(Section) 관련 설정만 제공됩니다. 단면 형태(원형, 타원 등)와 두께(Width/Tuber)를 자유롭게 지정할 수 있습니다.
