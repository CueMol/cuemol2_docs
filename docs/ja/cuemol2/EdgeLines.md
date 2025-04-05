[Documents](../../Documents)
## エッジ線つきのレンダリング
CueMol 2.2以降では，POV-Rayを使用してエッジ線（輪郭線）つきのレンダリングを行うことが出来ます．


> ![01-edgelines-1](../../assets/images/cuemol2/EdgeLines/01-edgelines-1.png){ style="zoom: 0.5" .on-glb }   ![16-edgelines-2](../../assets/images/cuemol2/EdgeLines/16-edgelines-2.png){ style="zoom: 0.5" .on-glb }

### Rendererのstyleによる指定
Sceneパネルにおいて，rendererのstyleを指定することで，簡単にrendererのエッジ線表示をon/offすることが可能です．


![edgelines-ui-2](../../assets/images/cuemol2/EdgeLines/edgelines-ui-2.png){ .on-glb }


Rendererのcontext menuの各項目の意味は以下の通りです．

No edge line
:   エッジ線なし．デフォルト．

Edge line (normal)
:   エッジ線あり，線の太さはふつう (0.06Å)

Edge line (thick)
:   エッジ線あり，線の太さは太め (0.15Å)

Edge line (thin)
:   エッジ線あり，線の太さは細め (0.03Å)


太さの単位はピクセルではなくÅになっていますので，
レンダリング時のイメージのサイズを大きくすると，それに応じて線も太くなるようになっています．

各設定での太さは下図のような感じになります．

-  Normal (0.06Å)<br />
![05-edgelines-normal](../../assets/images/cuemol2/EdgeLines/05-edgelines-normal.png){ .on-glb }

-  Thick (0.15Å)<br />
![04-edgelines-thick](../../assets/images/cuemol2/EdgeLines/04-edgelines-thick.png){ .on-glb }

-  Thin (0.03Å)<br />
![03-edgelines-thin](../../assets/images/cuemol2/EdgeLines/03-edgelines-thin.png){ .on-glb }

設定を変更しても，Mol viewでの表示は変化しません．
エッジ線の設定はPOV-Ray renderingの出力にしか影響しないので注意してください．

### POV-Rayによるレンダリング
以上のようにstyleを変更し，POV-Ray renderingをMenuの「Render」→「POV-Ray rendering」から行います．

この時，Edge linesチェックボックスをonにしてレンダリングを行うと，エッジ線の設定に応じて線が表示されます．
（一時的に線をすべて消したい場合はこれをoffにしてレンダリングを行います）

![07-edgelines-povrendui](../../assets/images/cuemol2/EdgeLines/07-edgelines-povrendui.png){ .on-glb }



### Rendererのpropertyによる指定&aname(rend_props);
Styleによる設定よりもさらに細かい指定を行いたい場合は，Rendererのpropertyからエッジ線の設定を行います．

全てのrendererのproperty dialogのcommonタブに，Edge lines:という項目があります．


![06-edgelines-proppage](../../assets/images/cuemol2/EdgeLines/06-edgelines-proppage.png){ .on-glb }


#### エッジ線のタイプ
Edge lines:横のdrop-down menuの各項目の意味は以下の通りです．
None
:   エッジ線なし．デフォルト．

Edges
:   エッジ線を表示

Silhouette
:   シルエット線を表示


各設定での線は下図のような感じになります．

-  Edges (0.06Å)<br />
![05-edgelines-normal](../../assets/images/cuemol2/EdgeLines/05-edgelines-normal.png){ .on-glb }

-  Silhouette (0.03Å)<br />
![08-edgelines-silhouette](../../assets/images/cuemol2/EdgeLines/08-edgelines-silhouette.png){ .on-glb }

シルエット線の場合は，輪郭の部分のみ線が表示されるようになります．

#### エッジ線の太さ
Å単位で指定します．値と見た目の感じの関係は，上図などを参考にして調節してみてください．

*** 色
線の色を指定します．普通は黒にする場合が多いと思いますが，黒バックに白線など，任意の色が指定可能です．

> ![09-edgelines-red](../../assets/images/cuemol2/EdgeLines/09-edgelines-red.png){ .on-glb } ![10-edgelines-green](../../assets/images/cuemol2/EdgeLines/10-edgelines-green.png){ .on-glb } ![11-edgelines-blue](../../assets/images/cuemol2/EdgeLines/11-edgelines-blue.png){ .on-glb }

### エッジ線の精度
どの程度正しくエッジ線が抽出されて描画されるかは，rendererのポリゴン分割数（propertyのdetail値）に大きく依存しています．
以下の図は，線の太さ0.1Åで，左から順にballstick rendererのdetail値を2, 5, 10, 20と増加させた例です．


> ![12-edgelines-det2](../../assets/images/cuemol2/EdgeLines/12-edgelines-det2.png){ .on-glb } ![13-edgelines-det5](../../assets/images/cuemol2/EdgeLines/13-edgelines-det5.png){ .on-glb } ![14-edgelines-det10](../../assets/images/cuemol2/EdgeLines/14-edgelines-det10.png){ .on-glb }  ![15-edgelines-det20](../../assets/images/cuemol2/EdgeLines/15-edgelines-det20.png){ .on-glb }


以上のように，detail値が大きいほど線がきれいに連続的に描画されます．また，detail値が小さいと，線がとぎれとぎれになる傾向がありますが，これは線が細いほど目立つようになります．なので，特に線を太くする場合はdetail値を大きくするように注意した方が良いでしょう．

特に，ballstickの場合のdetailのdefault値は5ですが，上の例からは，線の太さが0.1Åの場合，default値より増やして10以上にしたほうが良いのではないか？という事がわかります．
