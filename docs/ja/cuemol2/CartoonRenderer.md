[Documents](../Documents)

## Cartoon表示について
この項ではversion 2.0.1.171以降で導入されたcartoon rendererについて説明します．

## これは何？
タンパク質専用のレンダラーで，

-  ヘリックスを筒状

-  シートを板状

-  コイルをチューブ状

に表示する機能を持ちます．

表示としてはRibbonレンダラーと類似していますが，
デフォルトでベータシート以外は基本的にCα原子を通るように表示されるribbonとは異なり，
分子のフォールドのみを強調するようにスムージングされた表示となります．
（ただし後述のsmooth値やanchorを設定することで強制的に通るようにすることも可能です）

以下にcartoon (左)とribbon (右)を同じ分子についてデフォルトのパラメータ値で表示させた例を示します．


> ![cartoon_cartoon1](../assets/images/cuemol2/CartoonRenderer/cartoon_cartoon1.png){ .on-glb } ![cartoon_ribbon1](../assets/images/cuemol2/CartoonRenderer/cartoon_ribbon1.png){ .on-glb }

#### なぜ今さら？
pymolやmolscriptでおなじみの表示で，なぜ今さらという感じもしますが，
**CueMol2のcartoon表示の特徴は，より詳細なoptionが指定できる点**かもしれません．

以下では，主なプロパティーについて説明します．

## Helixのcylinder表示のオプション
### helix_smooth
Helixのcylinder表示にてシリンダーの滑らかさを実数値で指定します．
デフォルトは3.0で，かなり直線的になっていますが，

-  減少させるとCαにそったらせん状に近づく

-  増加させるとほぼ直線になる

という性質をもちます．
下図は，左からhelix_smooth値が1.0,2.0,4.0の場合です．


> ![cartoon_helix_smooth_1](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_1.png){ .on-glb } ![cartoon_helix_smooth_2](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_2.png){ .on-glb } ![cartoon_helix_smooth_4](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_4.png){ .on-glb }

4以上になるとほぼ直線であまり違いは出ないです．
1以下にすると，おひねりのようになってしまいます．
負の値や小数値も指定できますが，妥当な使用範囲は2〜4といったところでしょうか．

### helix_waverとhelix_wsmooth
helix_waver (=helix width averagingの意味)は，デフォルトでtrueになっていますが，この状態だとシリンダーの太さ(width)は平均値で一定になります．

一方で，falseにするとシリンダーの中心線からCα原子のはずれ具合に合わせてシリンダーの太さが変わるようになります．

helix_wsmoothは，helix_waver=falseの場合のみ有効な値で，シリンダーの太さの滑らさを指定する値です．
大きい値ほど滑らかになります．デフォルトは5.0ですが，これだとhelix_waver=trueの場合とほとんど変わりませんが，小さくすることで太さの変化が現れます．

下図は，helix_wsmooth=0.0, 1.0, 2.0に変化させた場合の形状です．(ほかのパラメータはhelix_waver=false, helix_smooth=3.0で固定)


> ![cartoon_helix_wsmooth_0](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_0.png){ .on-glb } ![cartoon_helix_wsmooth_1](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_1.png){ .on-glb } ![cartoon_helix_wsmooth_2](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_2.png){ .on-glb }

上記はhelix_smooth値は3.0で固定ですが，この値によっても見え方が大きく変わってきます．

### helix_wplus
構造によっては，helixのcylinderとcoilのつなぎ目で図のようにcoil部分がはみ出してしまう場合があります．
そういう場合は，helix_wplusを増やすとその分だけcylinderの半径が増やせるので，うまく隠れるように設定しましょう．

下図は，helix_wplus=0.0, 0.5の場合です．

> ![cartoon_helix_wplus_0](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wplus_0.png){ .on-glb } ![cartoon_helix_wplus_1](../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wplus_1.png){ .on-glb }

デフォルト値はcoilの太さ0.2と同じになっており，大体の場合で隠れるようになっているので特にいじらなくても良いでしょう．あと，意図的に負の値を指定して細いシリンダー表示にすることも可能です．


## Sheetの表示オプション
### sheet_smooth
helixの場合同様に，シート表示の滑らかさを実数値で指定します．
デフォルト値は3.0で，シートの曲がり具合の特徴を捉えながらも，ある程度まっすぐになるような設定になっています．

下図は，sheet_smooth=-5.0, 0.0, 3.0の場合です．-2以下にすると大体Cαを通るようになります．3以上にするとほぼ直線状になります．

> ![cartoon_sheet_smooth_-5](../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_-5.png){ .on-glb } ![cartoon_sheet_smooth_0](../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_0.png){ style="zoom: 0.97" .on-glb } ![cartoon_sheet_smooth_3](../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_3.png){ style="zoom: 0.9" .on-glb }


## Coilの表示オプション
### coil_smooth
helixの場合同様に，coil表示の滑らかさを実数値で指定します．
デフォルト値は-1.0で，coilの曲がり具合の特徴を捉えながらも，すっきりとした見栄えになるような設定になっています．

下図は，coil_smooth=-5.0, -2.0, -1.0, 0.0の場合です．-2以下にすると大体Cαを通るようになります．0以上にすると実際のCα位置から乖離しすぎかもしれません．

> ![cartoon_coil_smooth_-5](../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-5.png){ .on-glb } ![cartoon_coil_smooth_-2](../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-2.png){ .on-glb } ![cartoon_coil_smooth_-1](../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-1.png){ .on-glb } ![cartoon_coil_smooth_0](../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_0.png){ .on-glb }




## Anchorの設定
Cartoon表示に側鎖をはやした場合，
主鎖表示がCαの位置を通らないため，側鎖が宙に浮いたような状態になり，見栄えがよくありません．

### anchor_selプロパティー
CueMol2のcartoon表示では，anchor_selプロパティーに残基を指定して，
できるだけCαを通らせるようにすることが可能です．

以下に，coil_smooth=-1の場合（デフォルト）に，anchor_selにA.76.*（図のループの先端部分の残基）
を指定した場合の図を示します．

> ![cartoon_anchor_sel0](../assets/images/cuemol2/CartoonRenderer/cartoon_anchor_sel0.png){ .on-glb } ⇒ ![cartoon_anchor_sel1](../assets/images/cuemol2/CartoonRenderer/cartoon_anchor_sel1.png){ .on-glb }

このように，ループやシート中に1残基程度なら効果的にanchorが設定されますが，
多くなってくると結局smooth値を小さくした場合と同じようになってしまうので，
多くのCα原子を通らせたい場合はsmooth値をいじったほうが良いでしょう．

## 制限やバグ等

-  selectionで二次構造の途中から表示させたりすると，意図したように表示されない場合があります．部分表示させるときはcoilの部分で切れるように調節したほうがよいでしょう（今後修正予定）


