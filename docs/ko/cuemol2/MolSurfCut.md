[문서](../Documents)
## 분자 표면 평면 절단 (Mol Surface Cut)

결합 포켓의 내부 구조나 리간드와의 상호작용 깊이를 명확히 보여주기 위해, 뷰포트의 슬랩(Slab) 평면을 기준으로 분자 표면을 평면 절단(Cross-section cut)하고 단면을 생성할 수 있습니다.

---

## 1. 사전 준비 및 슬랩 위치 지정

1. 분자 구조(`1CRN.pdb`)를 로드하고 [분자 표면](./MsmsMolSurface)을 생성합니다:

![cbp_surf1](../../assets/images/cuemol2/MolSurfCut/cbp_surf1.jpg){ style="zoom: 0.5" .on-glb }

2. 뷰포트에서 마우스 휠이나 제스처로 **슬랩(Slab) 두께와 Z축 위치**를 조절하여, 표면의 내부 공동이나 결합 부위가 드러나도록 절단면 구도를 잡습니다:

![cbp_surf2](../../assets/images/cuemol2/MolSurfCut/cbp_surf2.jpg){ style="zoom: 0.5" .on-glb }

---

## 2. 절단 도구 실행 및 설정

상단 메뉴에서 **Tools &gt; Mol surface cutter...**를 실행합니다:

![cbp_surf_dlg2](../../assets/images/cuemol2/MolSurfCut/cbp_surf_dlg2.png)

Target surface
:   절단할 대상 분자 표면 객체(`sf_1CRN`)를 선택합니다.

Cross section type (절단 방식)
:   * **Complete**: 절단된 표면 외피와 단면 캡을 단일 표면 객체로 결합하여 생성
    * **Separately**: 절단된 외피와 단면 캡을 서로 다른 2개의 독립 객체로 분리 생성 (단면만 다른 색상으로 채색할 때 유용)
    * **Section only**: 단면 평판만 생성
    * **No section**: 캡 없이 내부가 뚫린 절단 표면 외피만 생성

Section mesh density
:   단면 캡을 구성할 삼각형 메시의 밀도입니다 (기본값 `1.0` 권장).

---

## 3. 결과 확인

**OK**를 누르면 현재 슬랩 평면을 기준으로 표면 객체가 영구적으로 절단되며, 슬랩을 다시 넓히더라도 아래와 같이 완벽한 단면 캡이 채워진 표면 모델이 유지됩니다:

![cbp_surf3](../../assets/images/cuemol2/MolSurfCut/cbp_surf3.jpg){ style="zoom: 0.5" .on-glb }
![cbp_surf4](../../assets/images/cuemol2/MolSurfCut/cbp_surf4.jpg){ style="zoom: 0.6" .on-glb }
*(좌측: 솔리드 렌더링, 우측: 균일하게 분할된 단면 와이어프레임 메시 구조)*
