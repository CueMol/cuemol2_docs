[문서](../Documents)
## 공-막대 렌더러 (Ball & Stick Renderer)

Ballstick 렌더러는 분자의 전통적인 **공-막대(Ball-and-stick)** 모델 및 **스틱(Stick)** 모델을 생성하는 렌더러입니다. 단백질 곁사슬, 리간드, 보조 인자(Cofactor), 저분자 화합물 등을 명확하게 나타낼 때 널리 사용됩니다.

렌더러 공통 속성에 대해서는 [공통 렌더러 속성](./CommonRendererProps)을 참조하세요.

---

### Ballstick 렌더러 설정 (Properties)

![ballstick-renderopt1](../../assets/images/cuemol2/BallStickRenderer/ballstick-renderopt1.png){ style="zoom: 0.5" .on-glb }

#### Detail (디테일/분할 정밀도)
원자 구체 및 결합 원기둥의 삼각형 폴리곤 분할 수준을 지정합니다. 값이 클수록 매끄러워지지만 폴리곤 수가 늘어납니다. 기본값(`10`)으로도 대부분의 뷰에서 충분한 고품질을 제공합니다.

*(GL 셰이더 모드 또는 POV-Ray 기본 렌더링 시에는 구체와 원통을 기하학적 수식으로 직접 렌더링하므로 이 값이 무시됩니다.)*

#### Bond width (결합 원기둥 두께)
원자 간 공유결합을 나타내는 원기둥의 반지름을 Å(옹스트롬) 단위로 지정합니다.

#### Atom radius (원자 구체 반지름)
원자 구체의 반지름을 Å 단위로 지정합니다. `Bond width`와 `Atom radius`를 동일한 수치로 설정하면 구체가 돌출되지 않는 매끄러운 순수 **스틱(Stick) 모델**이 완성됩니다.

![ballstick-stick1](../../assets/images/cuemol2/BallStickRenderer/ballstick-stick1.png){ style="zoom: 0.5" .on-glb }

#### Show ring (고리 내부 채움)
활성화하면 페닐알라닌/티로신의 벤젠 고리나 아데노신의 리보오스 고리와 같은 환형 구조 내부에 얇은 평판(Plate)이 생성되어 고리 구조를 한눈에 알아보기 쉽게 강조합니다.

![ballstick-ring1-1](../../assets/images/cuemol2/BallStickRenderer/ballstick-ring1-1.png){ style="zoom: 0.5" .on-glb }

#### Thickness (고리 평판 두께) 및 Color
고리 평판의 두께와 색상을 지정합니다. 두께와 결합 굵기, 원자 반지름을 조화롭게 일치시키면 아래와 같이 일체감 있는 도판을 만들 수 있습니다:

![ballstick-ring2-1](../../assets/images/cuemol2/BallStickRenderer/ballstick-ring2-1.png){ style="zoom: 0.5" .on-glb }

> [!NOTE] 고리(Ring) 토폴로지 정의
> 고리 내부 채움 평판은 런타임 계산이 아닌 잔기 토폴로지 정의 파일에 기술된 링 정보를 참조합니다. 따라서 신약 후보 물질이나 비표준 리간드의 경우 토폴로지에 고리 정의가 포함되어 있어야 올바르게 표시됩니다.

---

### GL 셰이더를 활용한 초고속/초고화질 렌더링

사용 중인 그래픽 카드가 OpenGL 셰이더를 지원하는 경우, 복잡한 폴리곤 분할 과정 없이 GPU 상에서 수식 기반의 완벽하게 매끄러운 구체와 원기둥을 실시간 렌더링합니다.

> ![ballstick-glsl1](../../assets/images/cuemol2/BallStickRenderer/ballstick-glsl1.png){ style="zoom: 0.33" .on-glb } ![ballstick-vbo1](../../assets/images/cuemol2/BallStickRenderer/ballstick-vbo1.png){ style="zoom: 0.33" .on-glb }
*(좌측: GPU 셰이더 렌더링, 우측: 기존 폴리곤 분할 렌더링 Detail=10)*

환경 설정 대화상자에서 OpenGL 셰이더 옵션을 활성화하여 사용할 수 있습니다 ([OpenGL 셰이더 사용](./UseGLShader) 참조).
