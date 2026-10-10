[문서](../Documents)
## PyMOL 세션 파일 열기 (PyMOL Session Importer)

CueMol2는 PyMOL 사용자의 원활한 전환과 협업을 위해 **PyMOL 세션 파일(`.pse`)**을 직접 불러오는 세션 임포터 기능을 제공합니다.

상단 메뉴의 **File &gt; Open scene...**을 실행한 후, 파일 형식 필터에서 **PyMOL Session (*.pse)**을 선택하여 파일을 엽니다.

---

### 지원 현황 및 매핑

현재 구현된 PyMOL 세션 임포터는 다음의 주요 표현 및 데이터를 지원합니다:

* **분자 좌표 및 원자별 색상**: PyMOL에서 지정된 구조 좌표와 컬러링을 가져옵니다.
* **스틱 모델 (Sticks representation)**: CueMol의 BallStick(Stick 모드) 렌더러로 자동 변환
* **구체 모델 (Spheres representation)**: CPK 렌더러로 자동 변환
* **카툰 모델 (Cartoon representation)**: Cartoon 렌더러로 자동 변환
* **라인 모델 (Lines representation)**: Simple/Trace 렌더러로 자동 변환
* **표면 모델 (Surface representation)**: MolSurf 표면 렌더러로 자동 변환
* **원자 라벨 (Labels)**: 텍스트 라벨 렌더러로 변환

> [!NOTE] 세션 저장 주의 사항
> 임포트된 PSE 세션에서 일부 특수한 PyMOL 고유 색상 규칙은 QSC 씬으로 저장 시 CueMol 고유 스타일로 정규화될 수 있습니다.
