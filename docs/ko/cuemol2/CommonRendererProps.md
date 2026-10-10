[문서](../Documents)
## 렌더러 공통 속성 (Common Renderer Properties)

CueMol의 모든 렌더러(Ribbon, Cartoon, BallStick, CPK 등)가 공유하는 기본 공통 속성입니다.

---

### 기본 설정 (Basic Settings)

Name (`name`)
:   렌더러의 식별 이름입니다. 스크립트나 씬 패널에서 렌더러를 구분하고 참조할 때 사용됩니다.

Selection (`sel`)
:   이 렌더러가 표시할 분자 내의 영역(체인, 잔기 번호, 원자 이름 등)을 지정하는 분자 선택식입니다.

Visible (`visible`)
:   렌더러의 화면 표시 여부(ON/OFF)를 결정합니다. OFF로 설정하면 화면에서 숨겨집니다.

Locked (`locked`)
:   ON으로 설정하면 마우스 클릭이나 드래그 선택 시 이 렌더러에 속한 원자가 선택되지 않도록 보호합니다.

Material (`material`)
:   렌더러 표면의 광택, 반사율, 질감을 지정합니다 ([재질 설정 (Material)](./Material) 참조).

Opacity (`alpha`)
:   렌더러의 불투명도를 지정합니다. `1.0`은 완전 불투명, `0.0`은 완전 투명입니다.

---

### 외곽선 설정 (Edge Line Settings)

툰 렌더링 및 카툰 풍의 외곽선 두께, 색상, 실루엣 라인 표시 여부를 설정합니다 ([외곽선 렌더링 (EdgeLines)](./EdgeLines) 참조).
