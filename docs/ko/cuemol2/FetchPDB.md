[문서](../Documents)
## 인터넷에서 PDB 및 전자 밀도 맵 가져오기 (Fetch PDB)

웹 브라우저를 열어 수동으로 다운로드할 필요 없이, CueMol2 내부에서 PDB ID(4글자 코드)만 입력하여 RCSB PDB 및 EBI 서버로부터 분자 구조 및 전자 밀도 맵을 즉시 다운로드하여 뷰포트에 표시할 수 있습니다.

상단 메뉴의 **File &gt; GET PDB using accession code...** 또는 툴바 아이콘을 클릭합니다:

![fetch_pdb_toolbtn1](../../assets/images/cuemol2/FetchPDB/fetch_pdb_toolbtn1.png)

실행 시 다음과 같은 **Download PDB** 대화상자가 표시됩니다:

![fetch_pdb_dialog1](../../assets/images/cuemol2/FetchPDB/fetch_pdb_dialog1.png){ style="zoom: 0.5" .on-glb }

---

## 1. PDB 좌표 파일 가져오기
1. 텍스트 상자에 4자리 PDB ID(예: `1AB0`)를 입력합니다.
2. **Fetch pdb file** 항목이 체크되어 있는지 확인하고 **OK**를 누릅니다.
3. 유효한 PDB ID인 경우 렌더러 생성 대화상자가 나타납니다:

![fetch_pdb_setuprenddlg1](../../assets/images/cuemol2/FetchPDB/fetch_pdb_setuprenddlg1.png){ style="zoom: 0.5" .on-glb }

4. 원하는 렌더러 유형(Cartoon, Ribbon 등)을 선택하고 **Recenter view** 옵션을 체크한 후 OK를 누르면 분자 모델이 화면 중앙에 로드됩니다:

![fetch_pdb_pdb1ab01](../../assets/images/cuemol2/FetchPDB/fetch_pdb_pdb1ab01.png){ style="zoom: 0.33" .on-glb }

---

## 2. 전자 밀도 맵 가져오기 (2Fo-Fc, Fo-Fc)
X선 결정학 구조의 전자 밀도 맵을 함께 분석하려면 Download PDB 창에서 다음 옵션을 함께 선택합니다:

* **Fetch map file (2Fo-Fc)**: 기본 구조 전자 밀도 맵
* **Fetch map file (Fo-Fc)**: 차분 전자 밀도 맵 (결합 리간드나 미모델링 영역 확인)

다운로드가 완료되면 2Fo-Fc 맵은 1.1&sigma; 등고선의 파란색 메시로, Fo-Fc 맵은 3.0&sigma; 등고선의 초록색 메시(Coot의 기본 표준 설정)로 즉시 렌더링됩니다:

![fetch_pdb_denmap1](../../assets/images/cuemol2/FetchPDB/fetch_pdb_denmap1.png){ style="zoom: 0.33" .on-glb }

---

### 다운로드 데이터 서버
* **RCSB PDB**: [http://www.rcsb.org/pdb/](http://www.rcsb.org/pdb/)
* **PDBe / EBI**: [http://www.ebi.ac.uk/](http://www.ebi.ac.uk/)
