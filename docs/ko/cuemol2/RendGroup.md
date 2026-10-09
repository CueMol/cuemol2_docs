[문서](../Documents)
## 렌더러 그룹 (Renderer Groups)

하나의 분자 객체(MolCoord)에 주쇄 카툰, 곁사슬 스틱, 리간드 볼앤스틱, 수소결합 거리선, 라벨 등 수많은 렌더러를 생성하다 보면 Scene 패널의 목록이 길어져 관리가 복잡해집니다.

CueMol2는 역할이나 도메인별로 렌더러들을 폴더처럼 묶어 정리할 수 있는 **렌더러 그룹(Renderer Group)** 기능을 지원합니다.

> ![rendgroup1](../../assets/images/cuemol2/RendGroup/rendgroup1.png){ style="zoom: 0.75" .on-glb } &rArr; ![rendgroup2](../../assets/images/cuemol2/RendGroup/rendgroup2.png){ style="zoom: 0.75" .on-glb }
*(그룹 접기/펼치기 동작)*

---

## 1. 렌더러 그룹 생성 (New Group)

1. Scene 패널에서 대상 분자 객체(MolCoord)를 우클릭하여 컨텍스트 메뉴를 엽니다:

![mol-ctxtmenu1](../../assets/images/cuemol2/RendGroup/mol-ctxtmenu1.png){ style="zoom: 0.75" .on-glb }

2. **New Group...**을 선택하고 대화상자에서 그룹명을 입력한 뒤 **OK**를 누르면 새 그룹이 생성됩니다:

> ![newgrp1](../../assets/images/cuemol2/RendGroup/newgrp1.png){ style="zoom: 0.75" .on-glb } &rArr; ![newgrp2](../../assets/images/cuemol2/RendGroup/newgrp2.png){ style="zoom: 0.75" .on-glb }

---

## 2. 그룹으로 렌더러 이동 (Drag & Drop)

Scene 패널에서 기존 렌더러 항목을 마우스로 드래그하여 대상 그룹 위로 드롭하면 그룹 내부로 이동됩니다:

> ![dragdrop-grp1](../../assets/images/cuemol2/RendGroup/dragdrop-grp1.png){ style="zoom: 0.75" .on-glb } &rArr; ![dragdrop-grp2](../../assets/images/cuemol2/RendGroup/dragdrop-grp2.png){ style="zoom: 0.75" .on-glb } &rArr; ![dragdrop-grp3](../../assets/images/cuemol2/RendGroup/dragdrop-grp3.png){ style="zoom: 0.75" .on-glb }

---

## 3. 그룹 내부에 새 렌더러 직접 생성

Scene 패널에서 그룹 항목을 우클릭하고 **New renderer...**를 선택하면, 생성되는 렌더러가 처음부터 해당 그룹의 하위 렌더러로 추가됩니다:

![grp-newrend1](../../assets/images/cuemol2/RendGroup/grp-newrend1.png){ style="zoom: 0.75" .on-glb }

> ![grp-newrend2](../../assets/images/cuemol2/RendGroup/grp-newrend2.png){ style="zoom: 0.5" .on-glb } &rArr; ![grp-newrend3](../../assets/images/cuemol2/RendGroup/grp-newrend3.png){ style="zoom: 0.75" .on-glb }

---

## 4. 그룹 일괄 표시/숨김 및 이름 변경

* **일괄 표시/숨김 (Visibility)**: 그룹명 좌측의 **눈(Eye) 아이콘**을 클릭하면 그룹에 속한 모든 하위 렌더러가 한 번에 표시되거나 숨겨집니다:

> ![grpprop_vis1](../../assets/images/cuemol2/RendGroup/grpprop_vis1.png){ style="zoom: 0.75" .on-glb } &rArr; ![grpprop_vis2](../../assets/images/cuemol2/RendGroup/grpprop_vis2.png){ style="zoom: 0.75" .on-glb }

* **그룹 이름 변경**: Scene 패널에서 그룹 항목을 더블 클릭(또는 하단의 속성 버튼 클릭)하여 새 이름을 지정할 수 있습니다.
