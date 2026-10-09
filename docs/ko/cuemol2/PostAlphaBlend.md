[문서](../Documents)
## 반투명 객체의 효율적인 렌더링 (Post Alpha Blending)

POV-Ray를 이용해 분자 표면(Solvent-excluded surface)이나 등밀도면을 반투명하게 렌더링할 때, 물리적인 다중 굴절 및 투과 연산으로 인해 다음과 같은 문제가 발생할 수 있습니다:

* 반투명한 거대 표면이 포함되면 렌더링 연산 시간이 극단적으로 증가합니다.
* 표면의 뒷면(Inside)까지 모두 복잡하게 중첩 계산되어 내부 리본이나 리간드가 지저분하게 가려져 보입니다.

![alpha_scene_rendering2](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_rendering2.jpg){ style="zoom: 0.5" .on-glb }
*(기존 물리적 반투명 렌더링: 내부가 어둡고 복잡해짐)*

CueMol2의 **Post-render alpha blending (렌더링 후 알파 블렌딩 합성)** 기능은 불투명 내부 객체와 반투명 외부 표면을 각각 초고속으로 분리 렌더링한 후 지능적으로 합성하여, **압도적인 렌더링 속도와 깔끔하고 선명한 도판**을 생성합니다.

---

## 1. 사용 예제 (반투명 분자 표면 씬 구성)

1. [1CRN.pdb](https://files.rcsb.org/download/1CRN.pdb) 분자를 불러와 **Ribbon** 렌더러로 표시합니다.

![alpha_scene_colorpanel5](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel5.jpg){ style="zoom: 0.5" .on-glb }

2. [분자 표면 생성](./MsmsMolSurface)을 통해 `sf_1CRN` 표면을 생성합니다.
3. Color 패널에서 `sf_1CRN`의 렌더러를 선택하고 단색(Paint Coloring &gt; Default)으로 변경합니다:

![alpha_scene_colorpanel2](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel2.png)
![alpha_scene_colorpanel3](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel3.png)
![alpha_scene_colorpanel4](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel4.png)

뷰포트에서 표면 모델이 적용됩니다:

![alpha_scene_colorpanel4](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel4.jpg){ style="zoom: 0.5" .on-glb }

4. Scene 패널에서 표면 렌더러(`molsurf1`)를 더블 클릭하여 속성 창을 열고, **Opacity** 슬라이더를 `0.5`로 설정합니다:

![alpha_scene_colorpanel6](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel6.png){ style="zoom: 0.5" .on-glb }

뷰포트 상에서 반투명 표면이 설정됩니다 (배경색을 흰색으로 지정하는 것을 권장합니다):

![alpha_scene_colorpanel7](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel7.jpg){ style="zoom: 0.5" .on-glb }

---

## 2. POV-Ray 합성 렌더링 수행

1. 상단 메뉴에서 **Render &gt; POV-Ray rendering...**을 실행합니다.
2. 대화상자에서 **Post-render alpha blending** 체크박스가 활성화(ON)되어 있는지 확인합니다.
3. **Start** 버튼을 누르면 내부 분자와 외부 표면이 순차적으로 분리 렌더링된 후 자동 합성됩니다:

![alpha_scene_rendering1](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_rendering1.jpg){ style="zoom: 0.5" .on-glb }

내부의 리본 구조가 또렷하게 드러나면서도 외부 표면의 부피감이 투명하게 살아있는 완벽한 출판용 도판이 완성됩니다.
