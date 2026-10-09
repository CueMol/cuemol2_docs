[문서](../Documents)
## 씬을 이미지 파일(PNG)로 내보내기 (Image Export)

별도의 레이트레이싱 렌더링 과정 없이, 현재 뷰포트의 화면을 고해상도 PNG 이미지 파일로 직접 즉시 내보낼 수 있습니다.

상단 메뉴에서 **Rendering &gt; Export Scene...**을 선택하고, 파일 형식으로 **PNG**를 지정합니다.

![png_export_opt](../../assets/images/cuemol2/ImageExport/png_export_opt.png)

---

### 설정 항목

Resolution
:   출력 이미지의 인쇄 해상도를 DPI(Dot Per Inch) 단위로 지정합니다. PowerPoint나 Illustrator 등에 배치하여 인쇄할 때의 물리적 출력 크기를 결정합니다.

Width / Height
:   이미지의 폭과 높이를 지정합니다. 픽셀(px)뿐만 아니라 mm, cm 단위로도 직접 입력할 수 있습니다.

Retain aspect ratio
:   현재 뷰포트의 화면 가로세로 비율을 유지합니다. 폭이나 높이를 수정하면 다른 축이 비례하여 자동 계산됩니다.

Transparent PNG
:   배경 색상에 상관없이 배경을 투명(알파 채널 포함)으로 내보냅니다.

---

### 투명 배경 PNG 활용 예시

Transparent PNG 옵션을 켜고 내보낸 이미지를 PowerPoint나 발표 슬라이드에 배치하면, 슬라이드의 배경색이나 뒤쪽 텍스트가 자연스럽게 투과되어 깔끔하게 합성됩니다:

![transp_png_example2](../../assets/images/cuemol2/ImageExport/transp_png_example2.png){ style="zoom: 0.3" .on-glb }
