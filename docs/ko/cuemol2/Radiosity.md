[문서](../Documents)
## 라디오시티 기법을 이용한 입체감 있는 렌더링 (Radiosity)

[라디오시티(Radiosity) 기법](http://ko.wikipedia.org/wiki/%EB%9D%BC%EB%94%94%EC%98%A4%EC%8B%9C%ED%8B%B0)은 빛의 다중 반사와 산란을 정밀하게 모사하는 글로벌 일루미네이션(Global Illumination) 기법으로, 기존의 단순 레이트레이싱에 비해 극적인 입체감과 자연스러운 음영을 제공합니다.

> ![radiosity-sample1](../../assets/images/cuemol2/Radiosity/radiosity-sample1.png){ .on-glb } ![radiosity-sample2](../../assets/images/cuemol2/Radiosity/radiosity-sample2.png){ .on-glb }
*(좌측: 일반 레이트레이싱, 우측: 라디오시티 렌더링)*

오른쪽 라디오시티 결과물처럼 결합 포켓의 깊은 공동(Cavity)과 굴곡이 은은한 앰비언트 오클루전(Ambient Occlusion) 효과로 인해 탁월한 깊이감으로 살아납니다.

---

## 1. POV-Ray 대화상자에서 라디오시티 모드 설정

상단 메뉴의 **Render &gt; POV-Ray rendering...** 대화상자에서 **Radiosity** 옵션을 선택합니다:

![radiosity-dlg1](../../assets/images/cuemol2/Radiosity/radiosity-dlg1.png){ .on-glb }

* **Disable**: 라디오시티를 끄고 일반 레이트레이싱으로 렌더링 (기본값)
* **Fast**: 빠른 테스트 렌더링을 위한 경량 라디오시티 모드
* **OutdoorLQ**: 저품질 고속 라디오시티 모드 (구도 검토용)
* **OutdoorHQ**: 고품질 라디오시티 모드 (논문 및 최종 출판용)

---

## 2. 권장 워크플로

라디오시티는 계산량이 많으므로 다음과 같은 단계로 진행하는 것이 효율적입니다:

1. **사전 테스트**: 작은 해상도와 `OutdoorLQ` 모드로 조명과 뷰 각도를 빠르게 조율합니다.
2. **조명 미세 조정**: [조명 설정 가이드](./POVRayRenderLighting)를 참조하여 Flash fraction과 Ambient fraction을 조정합니다.
3. **최종 렌더링**: 원하는 최종 고해상도로 변경한 뒤 `OutdoorHQ` 모드로 렌더링합니다.
