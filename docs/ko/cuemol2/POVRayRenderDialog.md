[문서](../Documents)
## POV-Ray 렌더링 대화상자 (POV-Ray Rendering Dialog)

CueMol2에 내장된 POV-Ray 연동 도구를 사용하면 외부 프로그램을 별도로 실행하지 않고도 포토리얼리스틱한 고화질 출판용 분자 그래픽 이미지를 생성할 수 있습니다.

상단 메뉴에서 **Render &gt; POV-Ray rendering...**을 선택하면 대화상자가 표시됩니다:

![povrender-dlg1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg1.png){ style="zoom: 0.33" .on-glb }

---

## 1. 주요 옵션 (Main Options)

![povrender-dlg2](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg2.png){ style="zoom: 0.5" .on-glb }

Width (W), Height (H)
:   출력할 이미지의 해상도를 픽셀 단위로 지정합니다. 기본값은 현재 뷰포트 창의 크기와 동일합니다.

DPI
:   출력 이미지의 인쇄 해상도(DPI: Dot Per Inch)를 지정합니다 (논문/포스터용으로 300~600 DPI 권장).

Preset size
:   우측 드롭다운 메뉴에서 일반적인 표준 크기 프리셋을 선택하여 가로/세로/DPI를 한 번에 설정할 수 있습니다.

Projection
:   원근감 있는 **Perspective (투시 투영)** 또는 왜곡 없는 **Orthographic (정사 투영/직교 투영)** 중 선택합니다.

Stereo
:   입체시 이미지를 생성합니다. `None`(기본 단일 이미지), `Right`(우안용), `Left`(좌안용).

Stereo depth
:   입체시 렌더링 시 양안 간격(돌출 깊이감)을 설정합니다.

CPU
:   POV-Ray 렌더링에 할당할 CPU 코어(스레드) 수를 지정합니다. 시스템 코어 수에 맞춰 병렬 렌더링 속도를 대폭 단축할 수 있습니다.

Transp background
:   배경을 투명(Transparent Alpha)으로 렌더링합니다. *(단, Radiosity 모드에서는 투명 배경이 지원되지 않으며 Fog 효과가 제외됩니다.)*

Clipping plane (슬랩 절단면)
:   현재 뷰포트에 적용된 전후방 슬랩(Slab) 클리핑을 POV-Ray 렌더링에도 적용할지 결정합니다.

![povrender-clip0](../../assets/images/cuemol2/POVRayRenderDialog/povrender-clip0.png){ style="zoom: 0.5" .on-glb }
![povrender-clip1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-clip1.png){ style="zoom: 0.5" .on-glb }
*(좌측: Clipping plane = OFF, 우측: Clipping plane = ON)*

Post-render alpha blending
:   렌더링 후 알파 블렌딩 합성 기법을 활성화합니다 ([반투명 객체 렌더링 (PostAlphaBlend)](./PostAlphaBlend) 참조).

Edge lines
:   툰(Toon) 스타일의 외곽선 렌더링을 활성화합니다 ([외곽선 렌더링 (EdgeLines)](./EdgeLines) 참조).

Pix labels
:   텍스트 라벨을 렌더링 결과물에 합성합니다.

---

## 2. POV-Ray 옵션 (POV-Ray Options)

![povrender-dlg3](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg3.png){ style="zoom: 0.5" .on-glb }

Povray-exe-path / Povray-inc-path
:   POV-Ray 실행 파일 및 인클루드 디렉터리 경로입니다. 공식 인스톨러나 DMG로 설치한 경우 콘솔용 POV-Ray가 번들되어 자동으로 설정되므로 별도로 수정할 필요가 없습니다.

Radiosity
:   라디오시티 글로벌 일루미네이션 활성화 여부 및 품질 모드를 지정합니다 ([라디오시티 렌더링 (Radiosity)](./Radiosity) 참조).

Lighting
:   스포트라이트, 플래시라이트, 주변광의 비율을 설정합니다 ([조명 설정 (Lighting)](./POVRayRenderLighting) 참조).

Shadow
:   그림자 생성 여부를 지정합니다 (기본값: OFF).

![povrender-shadow0](../../assets/images/cuemol2/POVRayRenderDialog/povrender-shadow0.png){ style="zoom: 0.5" .on-glb }
![povrender-shadow1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-shadow1.png){ style="zoom: 0.5" .on-glb }
*(좌측: Shadow = OFF, 우측: Shadow = ON)*

---

## 3. 렌더링 수행 및 이미지 저장

* **Start / Stop**: 하단의 Start 버튼을 누르면 렌더링이 시작되며, 진행 상황이 미리보기 화면에 실시간으로 표시됩니다.
* **Save image...**: 렌더링 완료 후 고해상도 PNG 파일로 저장합니다.
* **Copy to clipboard**: 결과 이미지를 클립보드에 복사하여 PowerPoint나 Photoshop에 즉시 붙여넣을 수 있습니다.
* **비동기 작업**: 대화상자를 띄워둔 채로 메인 뷰포트에서 분자를 회전하거나 스타일을 수정한 뒤 다시 렌더링할 수 있습니다.
* **로그 확인**: 렌더링 중 오류가 발생할 경우 Log Window를 통해 POV-Ray 엔진의 표준 에러 출력을 확인할 수 있습니다.
