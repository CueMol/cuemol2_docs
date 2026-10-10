[문서](../Documents)
## OpenGL 셰이더 설정 (Use GL Shader)

CueMol2는 최신 그래픽 카드의 GPU 프로그래머블 셰이더(GLSL)를 활용하여 다음과 같은 첨단 그래픽 효과를 실시간으로 가속 렌더링합니다:

* GPU 기반 고속 전자 밀도 맵 및 볼륨 렌더링
* CPK 및 Ball&Stick 모델의 수식 기반 초고화질 구체/원기둥 렌더링
* 프래그먼트 셰이더 기반 실시간 알파 블렌딩 및 페이드 애니메이션

---

## 1. OpenGL 및 GLSL 버전 요구사항

CueMol2 실행 시 출력되는 Log Window의 `--- OpenGL Info ---` 섹션에서 현재 환경의 지원 수준을 확인할 수 있습니다:

```
--- OpenGL Info ---
Vendor:   NVIDIA Corporation (또는 AMD / Apple)
Renderer: NVIDIA GeForce RTX ...
Version:
  OpenGL 4.5.0 Compatibility Profile Context
  GLEW 2.1.0
  GLSL 4.50
-------------------
```

* **OpenGL 4.0 이상 / GLSL 4.0 이상**: 모든 셰이더 기능 및 지오메트리 셰이더 가속 완벽 지원
* **OpenGL 3.x 이하 또는 구형 가상 머신 드라이버**: 셰이더 기능이 일부 제한될 수 있습니다.

---

## 2. 셰이더 활성화 및 비활성화 방법

특정 구형 그래픽 카드나 가상화 원격 데스크톱 환경에서 화면이 깜빡거리거나 정상 표시되지 않는 경우, 셰이더 기능을 비활성화할 수 있습니다:

1. 상단 메뉴에서 **Edit &gt; Options...**를 실행합니다.
2. 좌측 목록에서 **Misc**를 선택하고, **Other settings** 그룹의 **"Use OpenGL Shader"** 체크박스를 켜거나 끕니다.
3. **설정 변경 후 반드시 CueMol2 프로그램을 재시작**해야 적용됩니다.

### 비활성화 상태 확인
CueMol2 시작 시 로그 창에 다음과 같은 메시지가 나타나면 셰이더가 안전하게 비활성화된 것입니다:
```
OglView> shaders disabled
```
