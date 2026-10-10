[문서](../Documents)
## 동영상 렌더링 및 비디오 파일 생성 (Movie Rendering)

제작한 타임라인 애니메이션을 POV-Ray 레이트레이싱 엔진과 FFmpeg 비디오 인코더를 연동하여 고화질의 동영상 파일(MP4, QuickTime MOV, AVI 등)로 자동 렌더링하고 출력할 수 있습니다.

상단 메뉴의 **Render &gt; Animation rendering...**을 실행합니다:

![anim-render-1](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-1.png){ style="zoom: 0.5" .on-glb }

---

## 1. 메인 옵션 (Main Options)

* **Output dir**: 렌더링된 연속 프레임 PNG 파일들이 저장될 출력 폴더 경로입니다 (수백~수천 장의 파일이 생성되므로 전용 빈 폴더를 지정하는 것을 권장합니다).
* **Width, Height / Preset size**: 동영상의 해상도를 지정합니다 (VGA 640x480, HD 1280x720, Full HD 1920x1080 등).
* **Frame rate**: 초당 프레임 수(FPS)를 지정합니다 (부드러운 영상을 위해 `24` 또는 `30` FPS 권장).
* **NCPU**: 렌더링에 투입할 CPU 코어/스레드 수입니다 (시스템 코어 수 - 1 권장).
* **Loop**: 무한 반복 재생되는 루프 동영상의 경우 첫 프레임과 마지막 프레임이 자연스럽게 이어지도록 보정합니다.

---

## 2. 렌더 옵션 (Render Options)

![anim-render-2](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-2.png){ style="zoom: 0.5" .on-glb }

* **Clipping plane**: 슬랩 절단면 유지 (기본값: ON)
* **Post-render alpha blending**: 씬에 반투명 표면이나 페이드 인/아웃 효과가 포함된 경우 필수적으로 활성화합니다.
* **Shadow**: 그림자 효과 여부 (일반적으로 OFF 권장)

---

## 3. 동영상 인코딩 옵션 (Movie Options)

![anim-render-3](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-3.png){ style="zoom: 0.5" .on-glb }

* **Make movie**: 활성화(ON)하면 개별 PNG 프레임 렌더링 후 FFmpeg를 통해 단일 동영상 파일로 자동 압축 인코딩합니다.
* **Output format**: 출력 비디오 포맷을 지정합니다 (H.264 MP4, QuickTime MOV 등).
* **Bitrate**: 비디오 비트레이트를 kbit/s 단위로 지정합니다 (예: `10240` = 약 10 Mbps의 고화질).

---

## 4. 렌더링 실행 및 진행 상황

하단의 **Start** 버튼을 누르면 멀티코어 병렬 렌더링이 시작되며 진행률 바(Progress)와 실시간 렌더링 프레임이 표시됩니다:

![anim-render-4](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-4.png){ style="zoom: 0.5" .on-glb }

렌더링이 완료되면 지정한 출력 폴더에 완성된 고화질 동영상 파일과 원본 프레임 PNG 시퀀스가 안전하게 생성됩니다.
