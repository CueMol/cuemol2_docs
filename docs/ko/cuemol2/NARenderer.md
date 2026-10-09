[문서](../Documents)
## 핵산 전용 렌더러 (Nucleic Acid Renderer - nucl)

RNA 및 DNA와 같은 핵산 분자 전용 렌더러입니다. 주쇄를 튜브(Tube) 형태로 표현함과 동시에, 염기(Base) 잔기를 스틱(Stick) 또는 평판(Block/Plank) 등 다양한 형태로 표현할 수 있습니다.

![fig1-2](../../assets/images/cuemol2/NARenderer/fig1-2.png){ style="zoom: 0.75" .on-glb }

---

## 1. 속성 창을 통한 상세 설정

### Nucleic acid 탭

#### Show Tube (주쇄 튜브 표시)
주쇄 튜브의 표시 여부를 설정합니다. 이 옵션을 끄고 별도의 [튜브 렌더러 (Tube Renderer)](./TubeRenderer)를 추가하여 조합하면, 굵기나 색상이 서로 다른 복합 주쇄 연출이 가능합니다.

> ![nucl-showtube1-2](../../assets/images/cuemol2/NARenderer/nucl-showtube1-2.png){ style="zoom: 0.75" .on-glb } ![nucl-showtube2-2](../../assets/images/cuemol2/NARenderer/nucl-showtube2-2.png){ style="zoom: 0.75" .on-glb }
*(좌측: Show Tube = OFF, 우측: 별도 Tube 렌더러 2개를 조합한 복합 연출)*

#### Connect base pair (염기쌍 연결)
두 염기가 수소결합으로 염기쌍(Base-pair)을 형성하고 있을 때, 이를 하나의 연속된 단일 막대(ON)로 이을지, 각각 분리된 두 개의 막대(OFF)로 표시할지 결정합니다.

> ![nucl-connbp1-2](../../assets/images/cuemol2/NARenderer/nucl-connbp1-2.png){ style="zoom: 0.75" .on-glb }
*(Connect base pair = OFF 상태)*

#### Base type (염기 표현 형태)

basepair
:   염기 잔기를 단순한 스틱(원기둥) 형태로 표시합니다 (기본값).

simple1
:   스틱 형태로 표시하되, 염기와 당 사이의 N-글리코시드 결합(N-glycosyl bond) 위치에서 실제 결합 각도에 맞춰 꺾이는 형태를 구현합니다.

![nucl-basetype-simple1-1](../../assets/images/cuemol2/NARenderer/nucl-basetype-simple1-1.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-simple1-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-simple1-2.png){ style="zoom: 0.75" .on-glb }
*(좌측: Connect base pair = ON, 우측: OFF)*

detail1
:   염기(Base) 고리 부분을 직사각형 평판(Plank) 형태로 입체감 있게 표시합니다.

![nucl-basetype-detail1](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail1.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-detail1-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail1-2.png){ style="zoom: 0.85" .on-glb }

detail2
:   염기 평판뿐만 아니라 리보오스/디옥시리보오스 당(Sugar) 부분까지 평판으로 확장하여 표시합니다.

![nucl-basetype-detail2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail2.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-detail2-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail2-2.png){ style="zoom: 0.85" .on-glb }

#### Detail (폴리곤 정밀도)
염기 및 결합 원기둥의 폴리곤 분할 정밀도를 지정합니다. 값이 클수록 곡면이 매끄러워집니다.

#### Base size (염기 굵기)
스틱 원기둥의 반지름을 Å 단위로 지정합니다.

#### Base thick (평판 두께)
`Base type`이 `detail1` 또는 `detail2`일 때 평판의 두께 비율을 지정합니다.
* 100%: 평판 두께가 스틱 굵기와 동일해집니다.
* 50%: 평판 두께가 절반으로 얇아져 슬림한 책 형태의 도판을 연출할 수 있습니다.

> ![nucl-basethick-1](../../assets/images/cuemol2/NARenderer/nucl-basethick-1.png){ style="zoom: 0.85" .on-glb }
*(Base thick = 50% 적용 예시; detail2 모드)*

---

### Tube 탭 (주쇄 궤적 설정)

Pivot atom name (기준 원자명)
:   주쇄 튜브가 통과할 기준 원자의 이름을 지정합니다. 기본값은 `P` (인산기 인 원자)이지만, 이 경우 튜브 궤적이 실제 염기쌍보다 바깥쪽으로 크게 돌아가는 경향이 있습니다.
:   필요 시 `C5'`(리보오스 5번 탄소) 등으로 변경하면 염기 평판과의 연결 궤적이 한층 단정하고 아름답게 정돈됩니다.

![nucl-tube-pivot-1](../../assets/images/cuemol2/NARenderer/nucl-tube-pivot-1.png){ style="zoom: 0.85" .on-glb }
*(좌측: Pivot=P, 우측: Pivot=C5')*

---

## 2. 염기쌍(Base pair) 자동 판정 알고리즘

CueMol은 PDB 파일을 로드할 때 핵산 구조를 자동 검사하여, 두 염기 사이의 **수소결합 거리**와 **고리면 간의 평면성(Coplanarity)**을 계산하고 왓슨-크릭(Watson-Crick) 염기쌍을 자동으로 식별하여 마킹합니다.

`nucl` 렌더러는 이렇게 자동 판정된 염기쌍 정보에 기반하여 염기쌍 연결 표시를 수행합니다.
