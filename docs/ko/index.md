## CueMol

**CueMol**(큐몰)은 [Mozilla XULRunner](http://www.mozilla.org/projects/mozilla-based.html)를 기반으로 개발된 생체 고분자 구조 시각화 및 분자 그래픽스 소프트웨어입니다.

현재 수많은 무료/유료 분자 뷰어 및 모델링 프로그램이 존재하지만, 각각의 조작법이 특이하여 매뉴얼을 꼼꼼히 정독하지 않으면 다루기 어려운 경우가 많습니다.

CueMol은 OS의 표준 GUI와 자연스럽게 어우러지는 **직관적이고 사용하기 쉬운 사용자 인터페이스**를 지향하며 개발되고 있습니다. 또한 논문 및 발표 자료를 위한 고품질의 출판용 분자 그래픽스를 손쉽게 제작할 수 있는 강력한 기능을 제공합니다. 예시 이미지는 [갤러리](./Gallery)에서 확인하실 수 있습니다.

>> ![snapshot2_1](../assets/images/index/snapshot2_1.jpg){ style="zoom: 0.25" .on-glb } ![snapshot2_2](../assets/images/index/snapshot2_2.jpg){ style="zoom: 0.25" .on-glb }

>> ![snapshot2_2m](../assets/images/index/snapshot2_2m.jpg){ style="zoom: 0.28" .on-glb } ![snapshot2_1m](../assets/images/index/snapshot2_1m.jpg){ style="zoom: 0.28" .on-glb }

CueMol에 대한 질문, 피드백, 기능 제안은 아래를 통해 전달해 주시기 바랍니다.

* ![mm1](../assets/images/index/mm1.png)![mm2](../assets/images/index/mm2.png)
* ![icn-twitter](../assets/images/index/icn-twitter.gif) [Twitter/X @cuemolnohito](https://x.com/cuemolnohito) (CueMol 관련 정보 해시태그: `#cuemol`)
* [메일링 리스트](http://sourceforge.net/projects/cuemol/)

---

### 최신 소식 (What's new?)

2025/11/4
:   버전 2.3.0.461 Windows 및 macOS 버전이 공개되었습니다. 변경 사항은 [Releases](https://github.com/CueMol/cuemol2/releases/tag/v2.3.0.461)에서 확인하실 수 있습니다.

2025/8/14
:   버전 2.3.0.460 Windows 및 macOS 버전이 공개되었습니다. 변경 사항은 [Releases](https://github.com/CueMol/cuemol2/releases/tag/v2.3.0.460)에서 확인하실 수 있습니다.

2025/1/16
:   버전 2.3.0.454 Windows 및 macOS 버전이 공개되었습니다. 변경 사항은 [업데이트](./Updates)에서 확인하실 수 있습니다.

2019/1/14
:   버전 2.2.3.443 Windows 및 macOS 버전이 공개되었습니다. 변경 사항은 [업데이트](./Updates)에서 확인하실 수 있습니다.

2018/6/8
:   버그 수정 버전 2.2.3.437 Windows 및 macOS 버전이 공개되었습니다.

2018/5/8
:   버전 2.2.3.434 Windows 및 macOS 버전이 공개되었습니다.

2018/2/6
:   버전 2.2.3.430 Windows 및 macOS 버전이 공개되었습니다.

---

### 주요 기능

CueMol Version 2에서 제공하는 주요 기능은 다음과 같습니다.

* **첨단 사용자 인터페이스 (Advanced GUI)**
    * 탭 브라우저 스타일의 다중 뷰 인터페이스
    * 다중 씬(Multi-scene) 및 멀티 뷰(Multi-view) 지원
    * 씬 내부 및 서로 다른 씬 간 분자 객체와 렌더러 복사 & 붙여넣기
    * 씬마다 독립적으로 동작하는 완벽한 실행 취소/다시 실행(Undo/Redo)

* **강력한 분자 뷰어 기능**
    * 마우스 클릭을 통한 잔기 및 원자 선택
    * 드래그 사각형 영역(Rect selection)을 통한 다중 원자 선택
    * 유연한 선택 문법(Chain, Residue 번호, Atom 이름, 속성 등) 지원
    * 선택된 분자 영역만 개별 표현 및 스타일 지정
    * 결정학적 대칭 분자(Symmetry mates) 자동 생성 및 표시
    * 결정 격자 단위포(Unit cell) 표시
    * 원자 간 거리, 결합각, 이면각(Dihedral angle) 측정 및 표시
    * 입체시(Stereo) 지원 (CrystalEyes, NVIDIA 3D Vision + Quadro 등 하드웨어 스테레오)

* **단백질 및 핵산의 다채로운 구조 표현 (렌더러)**
    * PDB 형식 좌표 파일 읽기/쓰기
    * [공-막대 모델 (Ball & Stick)](./cuemol2/BallStickRenderer)
    * [공간 채움 모델 (CPK)](./cuemol2/CPKRenderer)
    * [튜브 모델 (Tube)](./cuemol2/RibbonRenderer)
    * [리본 모델 (Ribbon)](./cuemol2/RibbonRenderer)
    * [카툰 모델 (Cartoon)](./cuemol2/CartoonRenderer)
    * [핵산 전용 모델 (Nucleic Acid - nucl)](./cuemol2/NARenderer)
    * [MSMS 기반 분자 표면(Solvent-excluded surface) 생성 및 단면 절단](./cuemol2/MsmsMolSurface)

* **전자 밀도 맵 및 볼륨 데이터 표시**
    * CCP4 MAP 형식 지원
    * CCP4 MTZ 구조 인자(Structure factor) 형식 지원 (2Fo-Fc, Fo-Fc 자동 계산)
    * 등밀도면 메시(Mesh) 및 서피스 표시 (실시간 등고선 레벨 조절 가능)
    * 특정 잔기 주변 등 임의 영역(Bounding Box)에 대한 전자 밀도 국소 표시
    * GPU 셰이더 기반 고속 렌더링 지원

* **세션 저장 및 복원**
    * 읽기 쉽고 텍스트 편집기로도 수정 가능한 XML 기반 씬 파일 포맷(`.qsc`)

* **분자 구조 중첩 (Superposition)**
    * 최소제곱법(Least Squares Fit) 기반 분자 중첩
    * 2차 구조 정렬 기반 단백질 분자 자동 중첩

* **고품질 애니메이션 제작**
    * [단순 스핀 회전 애니메이션](./cuemol2/Anim_Basic)
    * 부드러운 [카메라 이동 (Camera Motion)](./cuemol2/Anim_CameraMotion)
    * 렌더러 페이드 인/아웃 및 슬라이드 인/아웃 효과
    * 구조 전이 과정을 보여주는 [분자 몰핑(Morphing)](./cuemol2/Anim_MolMorph)
    * 다양한 모션을 조합하는 [복합 애니메이션](./cuemol2/Anim_Cmb)

* **외부 프로그램과의 긴밀한 연동**
    * [APBS 및 PDB2PQR 연동을 통한 정전기 전위 계산 및 표면 매핑](./cuemol2/APBS_ElePot)
    * [POV-Ray 연동을 통한 포토리얼리스틱 레이트레이싱 & 라디오시티 렌더링](./cuemol2/POVRayRenderDialog)
    * [FFmpeg 연동을 통한 고해상도 동영상 자동 생성](./cuemol2/Anim_RenderMovie)
    * [투명 배경 PNG 직접 내보내기](./cuemol2/ImageExport)
    * [PyMOL 세션 파일(.pse) 가져오기](./cuemol2/PSEImporter)

---

### 바로가기 메뉴

* [홈](./index)
* [문서 (Documents)](./Documents)
* [갤러리 (Gallery)](./Gallery)
* [업데이트 내역 (Updates)](./Updates)
* [실행 환경 (Environment)](./Environment)
* [다운로드 (Download)](./Download)
* [설치 안내 (Install)](./Install)
* [라이선스 (Licence)](./Licence)
* [관련 링크 (Link)](./Link)
