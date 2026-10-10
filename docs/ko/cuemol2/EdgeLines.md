[문서](../Documents)
## 외곽선 및 툰 렌더링 (Edge Lines & Toon Rendering)

CueMol2는 POV-Ray 렌더링 시 만화나 일러스트레이션 느낌의 깔끔한 **외곽선(Edge lines) 및 실루엣 라인(Silhouette lines)**을 생성하여, 복잡한 단백질 구조의 형태를 한눈에 알아볼 수 있도록 강조하는 툰 렌더링(Toon rendering)을 완벽하게 지원합니다.

> ![01-edgelines-1](../../assets/images/cuemol2/EdgeLines/01-edgelines-1.png){ style="zoom: 0.5" .on-glb } ![16-edgelines-2](../../assets/images/cuemol2/EdgeLines/16-edgelines-2.png){ style="zoom: 0.5" .on-glb }

---

## 1. 스타일을 통한 간편 외곽선 설정

Scene 패널에서 렌더러를 우클릭하고 컨텍스트 메뉴에서 **Edge line** 프리셋을 선택할 수 있습니다:

![edgelines-ui-2](../../assets/images/cuemol2/EdgeLines/edgelines-ui-2.png){ .on-glb }

* **No edge line**: 외곽선 없음 (기본값)
* **Edge line (normal)**: 표준 두께 (0.06 Å)
* **Edge line (thick)**: 굵은 외곽선 (0.15 Å)
* **Edge line (thin)**: 얇은 외곽선 (0.03 Å)

선 두께의 단위는 픽셀이 아닌 **Å(실제 구조 거리)**이므로, 출력 해상도를 크게 확대해도 비례하여 일관된 굵기를 유지합니다.

* **Normal (0.06 Å)**:
  ![05-edgelines-normal](../../assets/images/cuemol2/EdgeLines/05-edgelines-normal.png){ .on-glb }
* **Thick (0.15 Å)**:
  ![04-edgelines-thick](../../assets/images/cuemol2/EdgeLines/04-edgelines-thick.png){ .on-glb }
* **Thin (0.03 Å)**:
  ![03-edgelines-thin](../../assets/images/cuemol2/EdgeLines/03-edgelines-thin.png){ .on-glb }

---

## 2. POV-Ray 렌더링 대화상자에서 외곽선 활성화

상단 메뉴에서 **Render &gt; POV-Ray rendering...**을 열고, **Edge lines** 체크박스를 체크한 상태에서 렌더링을 실행합니다:

![07-edgelines-povrendui](../../assets/images/cuemol2/EdgeLines/07-edgelines-povrendui.png){ .on-glb }

---

## 3. 렌더러 속성 창을 통한 상세 외곽선 설정

렌더러 속성 대화상자의 **Common** 탭에 있는 **Edge lines** 섹션에서 더욱 세밀하게 제어할 수 있습니다:

![06-edgelines-proppage](../../assets/images/cuemol2/EdgeLines/06-edgelines-proppage.png){ .on-glb }

* **Edges (모든 외곽선)**: 표면의 꺾임 능선과 전체 윤곽을 모두 그립니다.
* **Silhouette (실루엣 라인)**: 물체의 바깥쪽 가장자리 윤곽선만 깔끔하게 그립니다.

![08-edgelines-silhouette](../../assets/images/cuemol2/EdgeLines/08-edgelines-silhouette.png){ .on-glb }
*(실루엣 라인 0.03 Å 적용 예시)*

* **Color (선 색상)**: 기본 검은색 외에도 흰색, 빨강, 파랑 등 원하는 색상을 자유롭게 지정할 수 있습니다:

> ![09-edgelines-red](../../assets/images/cuemol2/EdgeLines/09-edgelines-red.png){ .on-glb } ![10-edgelines-green](../../assets/images/cuemol2/EdgeLines/10-edgelines-green.png){ .on-glb } ![11-edgelines-blue](../../assets/images/cuemol2/EdgeLines/11-edgelines-blue.png){ .on-glb }

---

## 4. 외곽선 추출 정밀도 (Detail)

외곽선이 얼마나 매끄럽고 끊김 없이 추출되는지는 렌더러의 폴리곤 분할 수(`Detail`)에 큰 영향을 받습니다.

아래는 굵기 0.1 Å에서 BallStick 렌더러의 Detail을 2, 5, 10, 20으로 높여가며 비교한 도판입니다:

> ![12-edgelines-det2](../../assets/images/cuemol2/EdgeLines/12-edgelines-det2.png){ .on-glb } ![13-edgelines-det5](../../assets/images/cuemol2/EdgeLines/13-edgelines-det5.png){ .on-glb } ![14-edgelines-det10](../../assets/images/cuemol2/EdgeLines/14-edgelines-det10.png){ .on-glb } ![15-edgelines-det20](../../assets/images/cuemol2/EdgeLines/15-edgelines-det20.png){ .on-glb }
*(왼쪽부터 Detail = 2, 5, 10, 20)*

굵은 외곽선을 사용할 때는 렌더러의 Detail 값을 `10` 이상으로 높여주면 선이 끊어지지 않고 매끄럽게 연결됩니다.
