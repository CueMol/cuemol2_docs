## Radiosity法を使用した奥行き感のあるレンダリング
[Radiosity法](http://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%B8%E3%82%AA%E3%82%B7%E3%83%86%E3%82%A3)は，
実世界の現象に近い光の挙動を模して，[レイトレーシング法](http://ja.wikipedia.org/wiki/%E3%83%AC%E3%82%A4%E3%83%88%E3%83%AC%E3%83%BC%E3%82%B7%E3%83%B3%E3%82%B0)よりもよりリアルに物体表面の陰影を表現したレンダリングが可能になります．


>![radiosity-sample1](../../assets/images/cuemol2/Radiosity/radiosity-sample1.png){ .on-glb }　　![radiosity-sample2](../../assets/images/cuemol2/Radiosity/radiosity-sample2.png){ .on-glb }

右がRadiosity法，左がレイトレーシング法で作成した図です．
このように，特に奥行き感が分かりやすくなりますが，
しかし，その分計算量が多くなるため，レンダリングに時間がかかります．

CueMolでは，POV-Ray rendering dialogで指定することで，
Radiosity法によるレンダリングをおこなうことができます．


![radiosity-dlg1](../../assets/images/cuemol2/Radiosity/radiosity-dlg1.png){ .on-glb }


### Radiosity renderingのモード
上記のdialogのRadiosityの項目にある設定のように，Radiosity renderingには以下のようなモードがあります．

Disable
:   Radiosity法を使用せず，レイトレーシング法を使用する(default)

Fast
:   簡便な方法でradiosity renderingをおこなう．

OutdoorLQ
:   簡便な方法でradiosity renderingをおこなう．

OutdoorHQ
:   高精度な方法でradiosity renderingをおこなう．

他
:   いろいろ設定があるが，これ以外はあまり使用する必要はない．


OutdoorHQ（やFinal, IndoorHQ）は計算に非常に時間がかかります．
ためしに小さめの画像でOutdoorLQで試して，
その後必要なサイズの画像でOutdoorHQでレンダリングするのがよいでしょう．
レンダリング画像のサイズ設定については[POV-Ray rendering dialogについて](../POVRayRenderDialog)を参照してください．

### 光源の設定
Radiosity法を使ったrenderingにおいては，光源の設定が重要になってきます．詳しくは，[光源の設定について](../POVRayRenderLighting)を参照してください．
