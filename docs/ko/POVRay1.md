## CueMol 출력 POV-Ray 파일 편집을 통한 고품질 렌더링 가이드

CueMol에서 출력한 POV-Ray(`.pov` / `.inc`) 파일을 직접 편집하면, GUI 기본 기능만으로는 구현하기 어려운 다음과 같은 고급 연출이 가능합니다:

* 전체 논문 및 발표 자료 간 일관성 있는 색상 및 질감 유지
* 금속, 유리, 목재 등 다양한 질감(Material/Texture) 적용
* 특정 분자 체인이나 잔기만 선별적으로 반투명 처리
* 볼-앤-스틱(Ball & Stick) 모델의 깔끔한 반투명 렌더링 (Merge 기법)
* 2차 구조별 서로 다른 텍스처 블렌딩(Texture blending)

---

### 전체 작업 흐름

CueMol 및 QScript/Python을 활용하여 논문용 고품질 도판을 제작할 때는 대략 다음과 같은 순서로 작업합니다:

1. **구조 데이터 준비**: PDB 좌표 및 전자 밀도 맵 준비
2. **씬 구성**: CueMol GUI 또는 스크립트로 분자 표현, 뷰포트 각도, 조명 설정
3. **POV-Ray 파일 출력 및 편집**: `.pov` 및 `.inc` 파일 수정 (재질, 광원, 투명도 등)
4. **POV-Ray 렌더링**: 원하는 해상도 및 안티에일리어싱 옵션으로 렌더링 수행
5. **후가공**: Photoshop/Illustrator 등을 통한 레이블링 및 최종 마무리

---

### CueMol에서의 색상 지정 요령

나중에 `.pov` 파일을 직접 편집하여 세밀하게 조율할 계획이라면, CueMol 단계에서 최종 색상을 완벽하게 맞추려 애쓸 필요는 없습니다. POV-Ray의 Material 설정 단계에서 색상과 반사율을 모두 재정의할 수 있기 때문입니다.

다만, **동일한 렌더러에서 같은 색으로 지정된 부분은 POV-Ray 파일 상에서도 하나로 묶여 개별 색상 변경이 어렵습니다.** 따라서 나중에 서로 다른 색이나 질감, 투명도를 부여하고 싶은 부분은 CueMol 단계에서 **서로 구별되는 임의의 색상**으로 지정해 두는 것이 핵심 팁입니다.

> [!TIP] 공통 색상/재질 스크립트 분리
> 동일한 단백질 복합체에 대해 여러 각도나 도판을 연속해서 제작할 때는 일관된 색상 스키마를 유지하는 것이 중요합니다. 공통 정의 파일(`materials.inc` 등)을 별도로 만들어 두고 각 `.pov` 파일에서 `#include`하여 참조하면, 한 번의 수정으로 모든 도판에 일괄 적용할 수 있습니다.

---

### `#include`를 통한 POV-Ray 기본 라이브러리 활용

POV-Ray에는 수준 높은 기본 재질 라이브러리가 기본 내장되어 있습니다. `.pov` 파일 상단(`version` 구문 뒤)에 아래와 같이 인클루드하여 즉시 활용할 수 있습니다:

```pov
#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"
```

* `colors.inc`: 표준 색상 정의
* `metals.inc`: 금속 질감(Chrome, Brass, Copper 등)
* `woods.inc`: 목재 나뭇결 질감
* `stones.inc`: 대리석 및 화강암 질감

---

### 사용자 전용 `materials.inc` 구성 예시

자주 사용하는 질감을 모아 `materials.inc` 파일을 만들어 프로젝트 폴더에 두고 사용하면 매우 편리합니다.

```pov
#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"

// 리본 모델용 텍스처 (나뭇결)
#declare tex_of_hsc = texture { P_WoodGrain1B }

// 리간드용 텍스처 (플라스틱 광택)
#declare tex_of_ligand = texture {
  finish { ambient 0.10 diffuse 0.70 specular 0.60 roughness 0.01 }
}

// 곁사슬 잔기용 텍스처 (무광 금속)
#declare tex_of_resid = texture { finish { F_MetalA } }

// 전자 밀도 맵용 텍스처
#declare tex_of_map = texture {
  finish { ambient 0.10 diffuse 0.78 specular 0.02 roughness 0.05 brilliance 1.50 }
}
```

---

### `.pov` 파일 편집 실전 예제

리본 모델과 리간드 스틱 모델로 구성된 씬(`blm_ribbon5`)에서 CueMol이 출력한 `.pov` 파일을 열면 다음과 같은 정의가 포함되어 있습니다:

```pov
#declare _blm_ab_p_tex = texture {
  normal { granite 0.0 scale 1.0 }
  finish {
    ambient 0.10
    diffuse 0.70  brilliance 1.00
    specular 0.30 roughness 0.0050
  }
}
#declare _blm_ab_p_col0 = <0.501961, 1.000000, 1.000000, 0.000000>;
...
#declare _blm_ab_p_col5 = <1.000000, 0.749020, 0.501961, 0.000000>;
```

여기서 `_blm_ab_p_tex`의 정의를 앞서 선언한 사용자 재질로 교체합니다:

```pov
#declare _blm_ab_p_tex = tex_of_hsc;
#declare _blm_ab_blm_tex = tex_of_resid;
```

또한 `_blm_ab_p_col0` ~ `col5`의 RGB 값을 변경하여 색상을 직접 미세 조정할 수도 있습니다.

---

### POV-Ray 렌더링 설정 및 해상도 지정

POV-Ray Windows 버전(v3.6/3.7) 기준으로 설명합니다:

1. POV-Ray 실행 후 상단 메뉴에서 **Render &gt; Edit Settings/Render**를 선택합니다.

   ![povray-inisettings](../assets/images/POVRay1/povray-inisettings.png){ .on-glb }

2. 대화상자 중앙의 **Browse** 버튼을 눌러 `quickres.ini` 파일을 선택한 뒤 **Edit** 버튼을 클릭합니다.
3. 원하는 해상도 및 안티에일리어싱(AA) 설정을 추가합니다 (예: 1:1 정사각형 해상도):
   ```ini
   [500x500, AA 0.3]
   Width=500
   Height=500
   Antialias=On
   Antialias_Threshold=0.3
   ```
4. 다시 **Render &gt; Edit Settings/Render** 창에서 방금 추가한 `[500x500, AA 0.3]` 섹션을 선택하고 **Render** 버튼을 누르면 고품질 렌더링이 시작됩니다.

   ![blm_ribbon_c](../assets/images/POVRay1/blm_ribbon_c.png){ .on-glb }

#### 광원 밝기 조절
결과물이 다소 어둡게 느껴지는 경우, `.pov` 파일 내의 `light_source` 설정을 수정합니다:

```pov
light_source { <_stereo*_distance*0.05, 0, _distance> color rgb <1,1,1> }
light_source { <-1, 1, 1>*_distance color rgb 0.8 shadowless } // 그림자 없는 보조광 밝기 상향
```

기본값인 0.5에서 0.7~1.0 수준으로 높이면 전체적으로 화사하고 선명한 이미지를 얻을 수 있습니다.

---

### 투명도(Transparency) 적용

특정 2차 구조나 체인을 반투명하게 표현하려면, 색상 벡터의 4번째 요소(알파/투명도 값: 0.0=불투명, 1.0=완전 투명)를 조절합니다:

```pov
// 투명도를 0.0에서 0.85로 지정
#declare _blm_ab_p_col0 = <0.501961, 1.000000, 1.000000, 0.85>;
```

![blm_ribbon_tp](../assets/images/POVRay1/blm_ribbon_tp.png){ .on-glb }

> [!NOTE] 동일 색상 영역 분리 테크닉
> 동일한 색상을 가진 구조 중 특정 부분만 반투명하게 만들고 싶다면, CueMol에서 미리 **서로 다른 색상**으로 지정해 둔 뒤, `.pov` 파일에서 RGB는 같게 하고 4번째 투명도 값만 다르게 주면 완벽하게 분리 제어할 수 있습니다.

---

### Ball & Stick 모델의 반투명 처리와 `merge` 기법

스틱(원기둥)과 볼(구체)이 결합된 모델을 위의 방식으로 단순히 반투명 처리하면, 아래와 같이 겹치는 내부 원자 구체가 지저분하게 비쳐 보이는 문제가 발생합니다:

![blm_ribbon_tp2](../assets/images/POVRay1/blm_ribbon_tp2.png){ .on-glb }

이유는 CueMol이 출력한 `.inc` 파일이 기본적으로 객체들을 `union { ... }`으로 묶기 때문입니다. `union`은 내부 경계면을 제거하지 않고 모두 렌더링하므로 투명할 때 내부가 비치게 됩니다.

이를 해결하려면 내부 경계면을 엄밀하게 제거하는 **`merge { ... }`** 구문으로 감싸야 합니다:

```pov
merge { // union 대신 merge 사용
  cylinder { <-7.880457, 0.385846, 0.826740>, <-8.656734, ...> }
  sphere { ... }
}
```

반투명 스틱 모델만 별도 `.inc`로 분리하여 `merge`로 감싸 렌더링하면 아래와 같이 매끄럽고 일체화된 반투명 결과를 얻을 수 있습니다:

![blm_ribbon_tp3](../assets/images/POVRay1/blm_ribbon_tp3.png){ .on-glb }

*(주의: `merge` 연산은 객체 간의 교차면을 정밀 계산하므로 `union`에 비해 렌더링 연산 시간이 증가합니다.)*

---

### 텍스처 블렌딩 (Texture Blending)

CueMol 1/QScript에서는 씬을 내보낼 때 `texblend` 옵션을 활성화하여 2차 구조별로 서로 다른 텍스처를 독립 부여할 수 있습니다:

```javascript
gfx.writeScene("output.pov", "pov", { texblend: true });
```

출력된 `.pov` 파일에서는 다음과 같이 텍스처가 분리 정의됩니다:

```pov
#declare _blm_ab_p_tex3 = texture { T_Chrome_4D }; // 코일: 크롬 금속
#declare _blm_ab_p_tex4 = texture { T_Stone35 };   // 헬릭스: 석재
#declare _blm_ab_p_tex5 = texture { T_Wood31 };    // 시트: 목재
```

![blm_ribbon_txb](../assets/images/POVRay1/blm_ribbon_txb.png){ .on-glb }

이러한 기법을 응용하면 분자의 도메인별 기능적 차이나 상호작용 부위를 극적으로 강조하는 창의적인 그래픽 연출이 가능합니다.
