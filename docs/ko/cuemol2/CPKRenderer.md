[문서](../Documents)
## 공간 채움 렌더러 (CPK Renderer)

CPK 렌더러는 분자의 각 원자를 반데르발스(van der Waals) 반지름 크기의 구체로 표현하는 **공간 채움(Space-filling)** 모델 렌더러입니다. 분자의 실제 물리적 부피와 표면 굴곡, 패킹 밀도를 시각화하는 데 적합합니다.

렌더러 공통 설정에 대해서는 [공통 렌더러 속성](./CommonRendererProps)을 참조하세요.

---

### CPK 렌더러 상세 설정 (Properties)

![cpk-renderopt1](../../assets/images/cuemol2/CPKRenderer/cpk-renderopt1.png){ style="zoom: 0.5" .on-glb }

#### Atomic radii (원소별 반지름)
공간 채움 구체의 반지름을 원소별(C, N, O, P, S, H 및 기타 X)로 개별 지정할 수 있습니다.

#### Detail (분할 정밀도)
구체의 삼각형 폴리곤 분할 정밀도를 지정합니다. 값이 클수록 구체가 매끄러워지지만 렌더링 부하가 늘어납니다.

*(GL 셰이더 모드 또는 POV-Ray 렌더링 시에는 구체를 직접 수식으로 계산하므로 Detail 값이 무시됩니다.)*

---

### GL 셰이더를 활용한 CPK 렌더링

OpenGL 셰이더가 활성화된 환경에서는 거친 폴리곤 메시 분할 없이 GPU 광선 투사(Ray-casting)를 통해 완벽한 구체를 초고속으로 실시간 렌더링합니다.

> ![cpk-sphere-glsl1](../../assets/images/cuemol2/CPKRenderer/cpk-sphere-glsl1.png){ style="zoom: 0.5" .on-glb } ![cpk-sphere-vbo1](../../assets/images/cuemol2/CPKRenderer/cpk-sphere-vbo1.png){ style="zoom: 0.5" .on-glb }
*(좌측: GPU 셰이더 렌더링, 우측: 기존 폴리곤 분할 렌더링)*

자세한 설정 방법은 [OpenGL 셰이더 사용 (UseGLShader)](./UseGLShader)을 참조하세요.
