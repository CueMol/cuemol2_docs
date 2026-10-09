## 실행 환경 (System Requirements)

### CueMol2

#### Windows (Windows 10, 11 및 7 등)
Windows 환경에서 GUI를 포함한 대부분의 기능을 원활하게 사용할 수 있습니다.

* **OpenGL 지원 환경**: Win32/Win64에서 OpenGL 3D 가속이 가능한 환경이 필요합니다.
    * OpenGL 버전에 따라 일부 기능에 제한이 있을 수 있습니다. 최신 그래픽 드라이버 및 OpenGL 4.0 이상 환경을 권장하며, 구버전 OpenGL(예: 1.4) 환경에서는 PNG 직접 내보내기 등 일부 기능이 제한될 수 있습니다.
* **화면 색상 모드**: 16비트(High Color) 이상 필수 (**8비트 색상 모드 등에서는 실행되지 않습니다.** 24비트 또는 32비트 True Color 권장).
* **그래픽 카드**: NVIDIA GeForce, AMD Radeon, Intel Arc 등 하드웨어 3D 가속을 지원하는 그래픽 카드를 권장합니다.
* **하드웨어 입체시(Hardware Stereo) 지원**: 액정 셔터 안경을 사용하는 스테레오 표시 방식(StereoGraphics사 장비, NVIDIA 3D Vision + Quadro 등)을 지원합니다.
* *(참고: CueMol2에서는 구버전 CueMol1의 QScript 대신 최신 JavaScript/Python 기반 스크립팅 엔진을 사용합니다.)*

#### macOS
macOS 환경에서 네이티브 GUI 및 전반적인 기능을 쾌적하게 사용할 수 있습니다.

* **운영체제 버전**: macOS 10.6 (Snow Leopard) 이상 지원 (Apple Silicon M1/M2/M3/M4 ARM64 및 Intel x86_64 모두 지원).
* **그래픽 환경**: OpenGL 4.0 이상을 지원하는 Mac 기기 권장.
* 기능 구성은 Windows 버전과 거의 동일합니다 (단, macOS 시스템 특성상 일부 전용 하드웨어 셔터 글래스 스테레오는 제한될 수 있습니다).

#### Linux 및 UNIX 계열 시스템
* 현재 주요 배포판용 바이너리가 제공되거나, GitHub 저장소에서 소스 코드를 내려받아 컴파일하여 사용할 수 있습니다.

---

### CueMol 1 (구버전 참고)

#### Windows
* Windows 98, ME, 2000, XP, NT 4.0 등 구버전 Windows 환경에서 동작하며, GUI 및 QScript의 모든 기능을 지원합니다.
* 16비트 이상 색상 모드 및 OpenGL 가속 카드 필요.
* StereoGraphics, 3Dfx OxygenGVX1, ELSA Quadro 등의 하드웨어 스테레오를 지원합니다.

#### UNIX / Linux
* 구버전 CueMol 1의 경우 UNIX 환경에서는 주로 QScript를 통한 CLI 배치 처리(예: [POV-Ray](http://www.povray.org) 형식 일괄 변환 등) 용도로 사용되었습니다.
