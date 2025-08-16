## Materialについて
CueMol2では，レンダラーで描画される3D物体について，
色以外にmaterial(質感)を指定することができます．

現在のところ，materialはPOV-Rayのレイトレーシング時にのみ対応しており，
OpenGLのリアルタイム表示では無視される仕様になっています．

Materialには色指定が可能なものと，material自体で色が決まってしまっているものの２タイプがあります．
現在materialの種類は以下のように少数しかないですが，
今後増やしていく，あるいはユーザ独自に定義するUIを実装していく予定です．

### Materialのタイプ
#### 色指定が効くmaterial
色を指定したうえで，その質感を変化させることができるmaterialです．
Version 2.0.0.183でシステムで定義されているmaterialは以下の通りです．

*  **default** デフォルトの質感，プラスチック光沢
*  **shadow** 「テカリ」のない影のような質感
*  **matte** つや消しの質感
*  **spec_metal** 非常に「テカリ」が強い金属質感
*  **diff_metal** つや消し金属質感

今後増やしていく，あるいはユーザ独自に定義するUIを実装していく予定です．

#### 色指定ができないmaterial
色の指定が無視されるタイプのmaterialには以下のものがシステムに定義されています．

* metallic_chrome クロム金属光沢
* metallic_copper 銅金属光沢
* stone35 石のような模様・質感
* wood31 木のような模様・質感

これらはシステムレベルで定義でされていますが，
一時テスト的であり今後変更される可能性があります．

### Materialの指定方法
#### Renderer全体に対する指定
Rendererのproperty dialog (Commonタブ中)に，以下のようにMaterialという項目があります．
この値を変更することでmaterialを指定できます．
デフォルトでは空（指定なし）になっており，defaultというmaterial
([default_style.xml](../../cuemol2/Style)で定義されている)が適用されるようになっています．

![material_propdlg3](../../assets/images/cuemol2/Material/material_propdlg3.png){ style="zoom: 0.75" .on-glb }

この値をshadowに変更します．
MaterialはOpenGLによるレンダリングには影響しないため画面上の表示は特に変わりませんが，
POV-Rayでレンダリングすると，以下のように変化します．

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } → ![shadow-ribbon2](../../assets/images/cuemol2/Material/shadow-ribbon2.png){ .on-glb }

shadowはすべての陰影付けをoffにして，色だけ塗るような設定になっているため
このような表示になるわけです．
（shadowはハイライト（てかり）がないため，半透明にして他のものと重ねて表示するときに向いています．）

一方で，色を無視するmaterial，例えばmetallic-chromeを適用すると，以下のようになります．

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } → ![metallic-ribbon2](../../assets/images/cuemol2/Material/metallic-ribbon2.png){ .on-glb }

色が指定できない系，特に金属光沢materialは周囲の環境光に影響されるため
上の例では暗くなっています．[povファイルを書き出し](../../cuemol2/ImageExport)たうえで光源指定をいじって明るくするなどの工夫が必要でしょう．


#### 色ごとの指定
色を指定する際のmodifier(修飾子)としてmaterialを指定できます．
具体的には，以下の書式で指定します．
```
<色指定>{material: <material指定>}
```
かぎ括弧内は各々の指定が入りますが，
例で示すと，色を黄色，materialをshadowにする場合は，
```
yellow{material:shadow}
rgb(1,1,0){material:shadow}
#FF0{material:shadow}
```
などと指定します（色に関しては上記３つとも同じ純色の黄色の表記法を変えただけ）．

実際にリボンの着色に適用した例が以下になります．

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } → ![mixed-ribbon2](../../assets/images/cuemol2/Material/mixed-ribbon2.png)

デフォルトの二次構造による着色をColorパネルから以下のように変更した後レンダリングしたものです．

シート(sheet)
:   SteelBlue → SteelBlue{material:stone35}

ヘリックス(helix)
:   khaki → khaki{material:wood31}

その他(*)
:   FloralWhite → FloralWhite{material:metallic_chrome}

ただし，背景は白に，ribbon rendererのプロパティーsmooth colorをoffにしています．

以上で用いているmaterialはいずれも色が無視されるので，指定の意味はないのですが，
何らかしら色は指定していないとエラーになってしまうため，
適当な色を指定してください．


![mixed-ribbon3](../../assets/images/cuemol2/Material/mixed-ribbon3.png){ style="zoom: 0.75" .on-glb }


上図のように木目や石の模様が細かいため，結構拡大しないとあまり見えません．
textureのサイズなどは[default_style.xml](../../cuemol2/Style)にあるmaterialの定義を編集すれば可能です
（POV-Rayの知識が必要になってきますが）．
今後ユーザー定義のmaterialを指定できるような仕組みを作っていく予定です．
