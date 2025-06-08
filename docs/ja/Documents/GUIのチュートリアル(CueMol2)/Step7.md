[ [GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/)|
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step6)|
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step8) ]

## 着色(Coloring)について

CueMol2では，レンダラーの設定（プロパティー）のうち，
着色(coloring)に関する部分のみ独立で扱うようになっています．

Coloringに対する操作は，基本的にColorパネルから行います．


![coloring_panel1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/coloring_panel1.png){ style="zoom: 0.5" .on-glb }


Colorパネルには，上方に操作対象のレンダラーを選択するドロップダウンリストボックスがあります．上図では，オブジェクトlysozymeの，レンダラーsimple1が操作対象になっています．

レンダラー選択ボックスの右隣の小さな三角アイコンをクリックすると，
coloring変更メニューが表示されます．


![coloring_panel_change1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/coloring_panel_change1.png)


上図に示すように，現在のところcoloringには４種類ありますが，このページではうち３種類について説明しています．のこりのPaintについては，次のページで別に説明します．

分子オブジェクト(MolCoord)に対して作成・接続できるレンダラーは，
一部を除いて以下に説明するのと同様にcoloringを変更できます．

### CPK coloring
元素の種類ごとに簡易に色付けするためのcoloring．
デフォルトがCorey-Pauling-Koltunの[CPK 色](http://en.wikipedia.org/wiki/CPK_coloring)もどきの色になっているのでこういう名前にしています．

simple, ballstick, cpk等のレンダラーは，このcoloringがデフォルト
となっています．

ここでは，lysozyme/ballstick1の炭素の色を変更してみましょう．
まず，Coloringパネル上方のドロップダウンリストボックスから，**lysozyme/ballstick1**を選択してください．
#### 色の指定方法

![gui_step7_coloredit1_1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_coloredit1_1.png){ .on-glb }


色とHTML色コードが表示されている右隣りの三角アイコンをクリックすると，
上図のようなメニューが出てきます．
このように，色は
*  RGB (red, green, blue)の強度をスライダーで設定する
*  HSB (hue, saturation, brightness)の強度をスライダーで設定する
*  名前付き色リストから選ぶ
*  HSB色パレットから選ぶ

の，４通りの指定の仕方ができます．

#### RGB, HSB
上図メニューからRGBあるいはHSBを選択すると，下図のようなスライダーが表示されますが，スライダーを動かすことで色を変更することができます．図では，HSBの場合を示しています．

![gui_step7_coloredit2_1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_coloredit2_1.png){ .on-glb }

HSBの場合は，H (Hue)で色の種類を選んで，S (Saturation)で白っぽさ，B (Brightness)で黒っぽさを与える，という感じで色を指定します．

RGBの場合も同じ感じでred, green, blueの強度で色の指定を行えますが，
慣れてないと意図した色にするのが結構難しいかもしれません．

#### Named color

![gui_step7_coloredit3_1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_coloredit3_1.png){ style="zoom: 0.5" .on-glb }

図のような，名前付き色のリストから選択して色を指定します．
デフォルトでは，HTMLやSVGで定義されているのと同じ色名のリスト(http://www.w3.org/TR/SVG/types.html#ColorKeywords)が定義されています．
並びが名前のアルファベット順になっている上に，
１００種類以上あるためお世辞にも選びやすいとは言えませんが，
今後改良の余地がありそうです．

#### Palette

![gui_step7_coloredit4_1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_coloredit4_1.png){ style="zoom: 0.5" .on-glb }

図のような，HSBモデルに基づいた色表から選んで指定します．

ここでは，炭素ということで，Paletteの50% Grayから色を選んでください．
simpleレンダラーの炭素部分が，灰色表示に変わったと思います．

![gui_step7_coloredit5_1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_coloredit5_1.png)


### Bfac coloring
原子のプロパティ（位置，温度因子，占有率）に応じて色を付けるcoloringです．
名前はBfac(B-factor)ですが，実際はOccupancyなどに応じて着色することも可能です．

![gui_step7_bfac1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_bfac1.png){ .on-glb }

*  Mode: 何に基づいて着色するかを選ぶ．B-factor, occupancy, center from atomがある．
*  Low: 値が低い（小さい）側の色を指定する
*  High: 値が高い（大きい）側の色を指定する
*  Parameter
    *  Auto (by mol)にすると，分子中の最大値がHighで指定した色に，最小値がLowで指定した色になる．（ただし，実際の最大最小値が何になっているのかが分からないところが難点）
    *  Auto (by rend)にすると，レンダラーで表示されている部分の中での最大値がHighで指定した色に，最小値がLowで指定した色になる．
    *  Manualにすると，下にあるLow, Highの部分で高い側，低い方に相当する値を手動で設定できる．

ここでは，lysozyme/simple1の色を変更してみましょう．
まず，Coloringパネル上方のドロップダウンリストボックスから，
**lysozyme/simple1**を選択してください．

青っぽい色になるので，黒背景では見難いですが，simpleレンダラー表示の色が，温度因子に応じたグラデーション色で表示されます．

![gui_step7_bfac_simple1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_bfac_simple1.png){ style="zoom: 0.5" .on-glb }


### Rainbow coloring
残基番号に基づいて着色するcoloringです．

![gui_step7_rainbow1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_rainbow1.png)

*  Start H: 先頭の残基の色相を度で指定する
*  End H: 最後の残基の色相を度で指定する
*  Brightness: 輝度を指定．100より小さくすると，だんだん黒っぽくなる．
*  Saturation: 飽和度を指定．100より小さくすると，だんだん白っぽくなる．
*  ModeをMoleculeにすると，分子全体の先頭の残基から最後の残基まで，上記の色付けを適用．<br />
Chainにすると，chain毎に，先頭の残基から最後の残基まで，上記の色付けを適用．

ここでは，分子1G59のレンダラーtrace1をrainbow coloringにします．
まず，Coloringパネル上方のドロップダウンリストボックスから，
**1G59/trace1**を選択してください．そして，その右横のColoringメニューからRainbowを選択します．次に，ModeをChainにしてください．

![gui_step7_rainbow_mol1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step7/gui_step7_rainbow_mol1.png){ style="zoom: 0.5" .on-glb }

tRNAとタンパクは別のchainになっていますが，Modeをchainにしたため，それぞれが別々に（タンパクの場合はN末端からC末端に，RNAの場合は5'末端から3'末端にかけて）虹色に表示されるようになりました．

[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step6)|
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step8)