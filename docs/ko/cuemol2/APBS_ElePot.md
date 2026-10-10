[문서](../Documents)
## APBS를 이용한 정전기 전위 맵 계산 및 표면 매핑 (Electrostatic Potential)

CueMol2는 [APBS (Adaptive Poisson-Boltzmann Solver)](http://www.poissonboltzmann.org/apbs) 및 PDB2PQR과의 연동을 지원하여, 단백질 표면의 정전기 전위(Electrostatic Potential) 맵을 간편하게 계산하고 분자 표면에 색상으로 시각화할 수 있습니다.

---

## 1. 사전 준비

1. [APBS 및 PDB2PQR 설치 가이드](./APBS_Install)를 참조하여 연동 도구가 설치되어 있는지 확인합니다 (Windows/macOS 최신 배포판은 기본 내장).
2. 정전기 전위를 계산할 분자(예: `1CRN`)를 불러옵니다.
3. [분자 표면 생성](./MsmsMolSurface)을 통해 표면 객체(`sf_1CRN`)를 미리 생성해 둡니다.

---

## 2. APBS 계산 도구 설정

상단 메뉴에서 **Tools &gt; APBS elepot calculation...**을 실행합니다:

![apbs_tool_dlg1](../../assets/images/cuemol2/APBS_ElePot/apbs_tool_dlg1.png){ style="zoom: 0.75" .on-glb }

### 1) APBS 실행 파일 경로
* **Windows**: `C:\Program Files (x86)\CueMol 2.0\apbs\APBS.exe`
* **macOS**: `/Applications/APBS.app/Contents/MacOS/apbs` (또는 번들 내장 경로)

### 2) 계산 대상(Target Molecule) 및 선택 범위
* **Target molecule**: 계산할 대상 분자를 선택합니다.
* **Selection**: 물 분자나 결정화 버퍼 이온 등을 제외하고 순수한 단백질만 계산하도록 `protein` 등의 선택식을 지정합니다.
* **Elepot name**: 생성될 정전기 전위 객체의 이름(기본값: `pot_<분자명>`)을 지정합니다.

### 3) 전하 계산 방식 (Charge Calculation Method)
* **Use PDB2PQR (강력 권장)**: PDB2PQR을 사용하여 수소 원자를 올바른 pH에 맞게 부가하고 부분 전하(Partial charge) 및 반데르발스 반경을 정밀 할당합니다.
  * **pdb2pqr.py path**: PDB2PQR 실행 경로(`pdb2pqr_wrap.bat` 또는 `pdb2pqr`) 지정
  * **Force field**: 힘장 세트 선택 (`charmm`, `amber`, `parse` 등)
* **Use internal method**: CueMol 자체 기본 전하 테이블을 사용합니다 (수소 원자가 결여된 경우 정확도가 떨어질 수 있음).

---

## 3. 계산 수행 및 결과 객체

**OK**를 누르면 백그라운드에서 PDB2PQR 및 APBS 계산이 수행됩니다.

계산이 완료되면 Scene 패널에 **`pot_1CRN`**과 같은 정전기 전위 객체가 추가되며, 3D 뷰포트에 계산 영역 경계 박스(Unit cell)가 표시됩니다:

![apbs_tool_calculated1](../../assets/images/cuemol2/APBS_ElePot/apbs_tool_calculated1.png){ .on-glb }
![apbs_tool_calculated2](../../assets/images/cuemol2/APBS_ElePot/apbs_tool_calculated2.png){ .on-glb }

---

## 4. 분자 표면에 정전기 전위 매핑 (Coloring)

1. **Color 패널**에서 대상 분자 표면 렌더러(`sf_1CRN/molsurf1`)를 선택합니다.
2. 드롭다운 메뉴(▼)에서 **Electrostatic potential**을 선택합니다:

![apbs_tool_coloring1](../../assets/images/cuemol2/APBS_ElePot/apbs_tool_coloring1.png)

3. 기본 SES 표면 전위는 원자핵과 너무 가까워 얼룩덜룩해 보일 수 있으므로, **Color by SAS** 체크박스를 켭니다 (용매 접근 가능 표면 기준 매핑).
4. 전위 스케일 범위(High/Low)를 연구 목적에 맞게 조정합니다 (기본 `+10 ~ -10 kT/e`, 필요 시 `+2 ~ -2 kT/e` 등):

![apbs_tool_elepot1](../../assets/images/cuemol2/APBS_ElePot/apbs_tool_elepot1.png)
*(기본 SES 매핑)*

![apbs_tool_elepot2](../../assets/images/cuemol2/APBS_ElePot/apbs_tool_elepot2.png)
*(Color by SAS 활성화 및 -2 ~ +2 kT/e 적용 결과: 양전하 파랑, 음전하 빨강의 선명한 포켓 분포)*

계산된 정전기 전위 데이터는 `.qsc` 씬 파일 저장 시 바이너리로 함께 저장되므로, 언제든지 다시 열어 동일한 상태로 분석할 수 있습니다.
