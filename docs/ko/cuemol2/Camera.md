[문서](../Documents)
## 카메라 (Camera)

CueMol2의 카메라는 3차원 분자 씬(Scene)의 **시점(Center 좌표), 회전 각도(Rotation), 줌 배율(Zoom), 슬랩 두께(Slab), 원근법(Perspective/Orthographic), 입체시(Stereo)** 및 각 객체/렌더러의 **표시/숨김 가시성(Visibility flags)** 정보를 보관하고 언제든지 불러올 수 있는 핵심 기능입니다.

---

### 카메라 주요 기능 안내

* **카메라 기본 사용법**: [CueMol2 GUI 튜토리얼 (Step9)](../Documents)
* **[카메라 정보 파일(.cam) 저장 및 씬 간 공유](./CameraFile)**: 동일한 시점과 각도를 여러 씬 파일 간에 완벽하게 일치시키고 공유하는 방법
* **[카메라에 렌더러 표시/숨김(Visibility) 상태 저장](./CameraVisFlags)**: 시점 전환과 동시에 특정 분자/렌더러의 표시 상태를 일괄 전환하는 방법
