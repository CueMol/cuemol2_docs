[문서](../Documents)
## 분자 구조 전이 및 몰핑 (Molecular Morphing Animation)

동일하거나 상동성이 높은 단백질이 활성형과 비활성형, 기질 결합형(Apo vs Holo) 등으로 입체 형태가 변하는 과정을 원자 좌표의 선형 보간(Linear Interpolation)을 통해 역동적인 **몰핑(Morphing) 애니메이션**으로 제작할 수 있습니다.

* 샘플 씬 파일: [mol_morph1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/mol_morph1.qsc) (Transducin-&alpha; GTP/GDP 결합형 구조 전이)

---

## 1. 사전 준비: 분자 구조 중첩 및 정렬

출발 구조(GTP 결합형 `1TND`)와 도착 구조(GDP 결합형 `1TAG`)를 불러온 뒤, 두 분자의 공간 좌표 기준을 일치시켜야 합니다.

1. `1TAG`와 `1TND`를 로드합니다:

![morphmol-1](../../assets/images/cuemol2/Anim_MolMorph/morphmol-1.png){ style="zoom: 0.5" .on-glb }

2. [분자 중첩 (MolSuperpose)](./MolSuperpose) 도구의 SSM 알고리즘을 사용하여 `1TAG`(Moving)를 `1TND`(Reference)의 Chain A에 맞춰 정렬합니다:

![morphmol-2](../../assets/images/cuemol2/Anim_MolMorph/morphmol-2.png){ style="zoom: 0.5" .on-glb }

3. 정렬된 `1TAG`를 **File &gt; Save File As...**를 통해 `1TAG-fit.pdb`로 저장합니다.

---

## 2. MolMorph 객체 생성 및 타깃 구조 추가

1. 상단 메뉴에서 **Tools &gt; Mol morphing animation...**을 실행합니다.
2. 출발 기준이 될 분자(`1TND`)를 선택하고 **OK**를 클릭합니다:

![morphmol-3](../../assets/images/cuemol2/Anim_MolMorph/morphmol-3.png){ .on-glb }

3. MolMorph 편집 창이 열리며 기본 메인 좌표(`this`)가 등록되어 있습니다:

![morphmol-4](../../assets/images/cuemol2/Anim_MolMorph/morphmol-4.png){ style="zoom: 0.75" .on-glb }

4. **「+」** 버튼을 눌러 앞서 정렬 저장한 도착 좌표 파일 `1TAG-fit.pdb`를 추가합니다:

![morphmol-5](../../assets/images/cuemol2/Anim_MolMorph/morphmol-5.png){ style="zoom: 0.75" .on-glb }

---

## 3. 몰핑 애니메이션 타임라인 등록

1. Animation 패널에서 **「+」** &gt; **Mol Morphing**을 선택합니다:

![morphmol-6](../../assets/images/cuemol2/Anim_MolMorph/morphmol-6.png){ .on-glb }

2. 속성 대화상자에서 대상 MolMorph 객체와 시작/종료 값을 지정합니다:

![morphmol-7](../../assets/images/cuemol2/Anim_MolMorph/morphmol-7.png){ style="zoom: 0.5" .on-glb }

* **Target MorphMol**: 대상 객체(`1TND`) 선택
* **Start value / End value**: `0.0`(출발 구조 `this`) &rarr; `1.0`(도착 구조 `1TAG-fit`)

타임라인에 몰핑 클립이 등록됩니다:

![morphmol-8](../../assets/images/cuemol2/Anim_MolMorph/morphmol-8.png){ .on-glb }

재생 버튼을 누르면 단백질의 루프와 헬릭스가 유기적으로 전이되는 미려한 몰핑 애니메이션이 부드럽게 재생됩니다.

---

### 주의 사항
* 출발점과 도착점의 원자/잔기 번호가 일치하지 않는 원자는 보간 계산에서 제외되어 정지 상태로 유지됩니다.
* 서열 차이가 있는 호모로그 간의 몰핑은 상동성 모델링(Homology modeling)을 통해 잔기 번호를 일치시킨 후 수행하는 것이 좋습니다.
