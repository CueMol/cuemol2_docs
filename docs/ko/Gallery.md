## 이미지 갤러리 (Image Gallery)

CueMol2로 제작된 대표적인 고화질 분자 그래픽스 샘플 갤러리입니다.

---

### 1. 외곽선 및 툰 렌더링 (Edge Rendering)
#### 다양한 외곽선 두께, 색상 및 카툰 셰이딩

>> ![EdgeLine2-1-16](../assets/images/Gallery/EdgeLine2-1-16.png){ style="zoom: 0.5" .on-glb }&#12288;&#12288;&#12288;&#12288;&#12288;![POT_alafos1_8bpc](../assets/images/Gallery/POT_alafos1_8bpc.png){ style="zoom: 0.22" .on-glb }

> *(왼쪽)* 크램빈(Crambin) [1CRN](http://www.rcsb.org/pdb/explore.do?structureId=1CRN) 구조에서 Arg 잔기와 C말단 카르복실기 간의 염교(Salt bridge) 상호작용.  
> *(오른쪽)* 펩타이드 유사체 알라포스팔린과 복합체를 형성한 올리고펩타이드 수송체 POT [4IKZ](http://www.rcsb.org/pdb/explore.do?structureId=4IKZ).

* **이 씬의 QSC 파일**:
  * 왼쪽: [EdgeLine2-1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/EdgeLine2-1.qsc)
  * 오른쪽: [POT_alafos1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/POT_alafos1.qsc) 및 [POT_alafos1_styles.xml](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/POT_alafos1_styles.xml) *(같은 폴더에 저장 필요)*
* **관련 문서**: [외곽선 렌더링 (EdgeLines)](./cuemol2/EdgeLines)

---

### 2. 카툰 모델 (Cartoon Model)
#### 곡률(Smoothness) 조절에 따른 나선 원통 표현

>> ![GkPOT_hsm2](../assets/images/Gallery/GkPOT_hsm2.png){ style="zoom: 0.4" .on-glb }&#12288;![GkPOT_hsm3](../assets/images/Gallery/GkPOT_hsm3.png){ style="zoom: 0.4" .on-glb }&#12288;![GkPOT_hsm5](../assets/images/Gallery/GkPOT_hsm5.png){ style="zoom: 0.4" .on-glb }

> 다양한 `helix_smooth` 값(왼쪽부터 각각 2.0, 3.0, 5.0)으로 렌더링된 막단백질 수송체 POT([4IKV](http://www.rcsb.org/pdb/explore.do?structureId=4IKV))의 막통과 나선 실린더 모델.

* **이 씬의 QSC 파일**: [POT_overall1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/POT_overall1.qsc) 및 [POT_overall1_styles.xml](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/POT_overall1_styles.xml)
* **관련 문서**: [카툰 렌더러 (CartoonRenderer)](./cuemol2/CartoonRenderer)

---

### 3. 핵산 모델 (Nucleic Acid Model)

>> ![Cas9_nucltype_basepair1](../assets/images/Gallery/Cas9_nucltype_basepair1.png){ style="zoom: 0.35" .on-glb }&#12288;![Cas9_nucltype_simple1](../assets/images/Gallery/Cas9_nucltype_simple1.png){ style="zoom: 0.35" .on-glb }&#12288;![Cas9_nucltype_detail2](../assets/images/Gallery/Cas9_nucltype_detail2.png){ style="zoom: 0.35" .on-glb }

> *S. pyogenes* Cas9 복합체([4OO8](http://www.rcsb.org/pdb/explore.do?structureId=4OO8))의 가이드 RNA-표적 DNA 복합체 구조. `nucl` 렌더러의 `basepair`, `simple1`, `detail2` 모드로 각각 표현됨 (왼쪽, 가운데, 오른쪽 순).

* **이 씬의 QSC 파일**: [Cas9_nucltype_detail2.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/Cas9_nucltype_detail2)
* **관련 문서**: [핵산 렌더러 (NARenderer)](./cuemol2/NARenderer)

---

### 4. 분자 표면 및 라디오시티 (Molecular Surface & Radiosity)

#### 용매 배제 표면의 단면 절단 (Mol Surface Cut)
>> ![YidC_Surface4-L](../assets/images/Gallery/YidC_Surface4-L.png){ style="zoom: 0.33" .on-glb }![YidC_Surface4-R](../assets/images/Gallery/YidC_Surface4-R.png){ style="zoom: 0.33" .on-glb }

> 정전기 전위가 매핑된 *B. halodurans* 막단백질 YidC ([3WO6](http://www.rcsb.org/pdb/explore.do?structureId=3WO6))의 친수성 포켓 단면 절단 렌더링.

* **이 씬의 QSC 파일**: [YidC_Surface4.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/YidC_Surface4.qsc)
* **관련 문서**: [분자 표면 평면 절단 (MolSurfCut)](./cuemol2/MolSurfCut)

#### 라디오시티 글로벌 일루미네이션 (Radiosity)
>> ![YidC_surf_norad](../assets/images/Gallery/YidC_surf_norad.jpg){ style="zoom: 0.5" .on-glb }![YidC_surf_radio1](../assets/images/Gallery/YidC_surf_radio1.jpg){ style="zoom: 0.5" .on-glb }

> *(좌측: 일반 레이트레이싱, 우측: POV-Ray 라디오시티 렌더링)*  
> 라디오시티 기법을 적용하면 깊은 막단백질 내부 포켓의 은은한 그림자와 입체감이 극대화됩니다.

* **관련 문서**: [라디오시티 렌더링 (Radiosity)](./cuemol2/Radiosity)

---

### 5. 애니메이션 (Animation)

#### 스핀 회전, 카메라 모션 및 곁사슬 페이드 인/아웃
<iframe width="425" height="350" src="https://www.youtube.com/embed/pHL52i3kzxE?mute=1&autoplay=1&loop=1&controls=1&rel=0&playlist=pHL52i3kzxE"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>

* **이 씬의 QSC 파일**: [lyso_showhide1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_showhide1.qsc)
* **관련 문서**: [애니메이션 기초](./cuemol2/Anim_Basic), [카메라 모션](./cuemol2/Anim_CameraMotion), [표시/숨김 애니메이션](./cuemol2/Anim_ShowHide)

#### 선형 몰핑(Morphing) 기반 분자 구조 전이 애니메이션
<iframe width="425" height="350" src="https://www.youtube.com/embed/4RKA3VUVcPo?mute=1&autoplay=1&loop=1&controls=1&rel=0&playlist=4RKA3VUVcPo"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>

* **이 씬의 QSC 파일**: [mol_morph1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/mol_morph1.qsc)
* **관련 문서**: [분자 몰핑 애니메이션 (Anim_MolMorph)](./cuemol2/Anim_MolMorph)
