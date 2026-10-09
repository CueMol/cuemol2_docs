[문서](../Documents)
## 분자 표면 생성 및 관리 (Molecular Surface Generation)

CueMol2는 외부 프로그램(MSMS 등) 없이도 자체 내장된 고속 알고리즘을 통해 **용매 배제 표면(Solvent-excluded surface, SES / Connolly surface)**을 직접 생성하고 시각화할 수 있습니다.

상단 메뉴에서 **Tools &gt; Mol surface generation...**을 실행합니다:

![molsurf_tool](../../assets/images/cuemol2/MsmsMolSurface/molsurf_tool.png)

---

## 1. 설정 항목

Target molecule
:   표면을 생성할 대상 분자 객체를 지정합니다.

Selection (선택 범위)
:   체크박스를 활성화하여 표면을 계산할 특정 원자 그룹을 지정합니다. PDB 파일에 포함된 **결정화 물 분자(HOH)나 용매 이온을 제외**하고 순수한 단백질 표면만 생성하려면 `protein` 또는 `!water` 등의 선택식을 지정해야 합니다.

Surface name
:   생성될 분자 표면 객체(MolSurfObj)의 이름을 지정합니다 (기본값: `sf_<분자명>`).

Density (메시 정밀도)
:   생성될 표면 삼각형 메시의 밀도입니다.
    * 10~30 kDa 수준의 작은 분자는 `3.0 ~ 5.0`으로 설정하면 정교하고 매끄러운 표면이 완성됩니다.
    * 100 kDa 이상의 거대 단백질 복합체는 `1.0 ~ 2.0`으로 설정하여 연산 속도와 메모리를 최적화합니다.

Probe radius (프로브 반경)
:   용매 분자의 반지름을 Å 단위로 지정합니다 (물 분자 기준 기본값: `1.4 Å`).

---

## 2. 표면 생성 및 다양한 채색 (Coloring)

**OK**를 누르면 표면 계산이 완료되고 Scene 패널에 `sf_1CRN` 객체와 `molsurf1` 렌더러가 등록됩니다:

![msms_tool_created1](../../assets/images/cuemol2/MsmsMolSurface/msms_tool_created1.png)

Color 패널을 통해 분자 표면에 다양한 컬러링 모드를 적용할 수 있습니다:

* **CPK Coloring (원소별 색상)**: 탄소, 질소, 산소 원소별 색상 (아래 1번째)
* **Bfac Coloring (온도 인자)**: 유연성/결정학적 B-factor 분포 (아래 2번째)
* **Rainbow Coloring (서열 무지개색)**: N말단에서 C말단으로의 서열 변화 (아래 3번째)
* **Paint Coloring (단색)**: 단일 색상 또는 도메인별 색상

![msms_tool_created2](../../assets/images/cuemol2/MsmsMolSurface/msms_tool_created2.png){ style="zoom: 0.5" .on-glb }
![msms_tool_created2_2](../../assets/images/cuemol2/MsmsMolSurface/msms_tool_created2_2.jpg){ style="zoom: 0.5" .on-glb }
![msms_tool_created2_3](../../assets/images/cuemol2/MsmsMolSurface/msms_tool_created2_3.jpg){ style="zoom: 0.5" .on-glb }

---

## 3. 표면 재생성 (Regenerate Surface)

표면의 정밀도(Density)나 선택 범위를 변경하고 싶을 때, 표면을 삭제하고 다시 만들 필요 없이 Scene 패널에서 해당 표면 객체(`MolSurfObj`)를 우클릭하고 **Regenerate surface...**를 선택하여 원하는 파라미터로 즉시 재생성할 수 있습니다:

![molsurf_regen1](../../assets/images/cuemol2/MsmsMolSurface/molsurf_regen1.png){ .on-glb }
