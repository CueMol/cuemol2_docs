[Documents](../../Documents)
## 複数アニメーションの組み合わせ

前セクション[cuemol2/Anim_Basic](../../cuemol2/Anim_Basic)では１つのSimple spinアニメーションを作成する例を紹介しましたが，
複数の設定が異なるSimple spinを組み合わせる例を説明します．
（もちろん以降のセクションで説明する他のタイプのアニメーションもSimple spin同様に組み合わせ可能です）

Sample scene fileが以下からダウンロードできます．

-  [lyso_simplespin2.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin2.qsc)：　Lysozymeの単純スピンアニメーション（その２）

## ２つ目のSimple spinアニメーションの追加

前セクション[cuemol2/Anim_Basic](../../cuemol2/Anim_Basic)と同様にして，アニメーションパネルからSimple spinを追加します．

ここでは，１つ目のスピン(SimpleSpin1)が終わった直後から次のスピン(SimpleSpin2)が始まるようにします．

### 設定
設定ダイアログでは，以下のように設定します．
Name
:   デフォルトでSimpleSpin2になる筈．そのままでOK

Start time
:   デフォルトで0:0:0.0になっているはず．もしそうならそのままでOK．

Relative to
:   現在ある最後尾のanimation object(SimpleSpin1)の後続animationとして追加されるため，時間指定はdefaultでSimpleSpin1に対する相対指定になっている．ここではSimpleSpin1の直後にSimpleSpin2が開始するようにしたいので，このままでOK．

Duration
:   デフォルトでは１秒．そのままでOK．

Spin axis
:   Cartesianにし，(0, -1, 0)に設定する．（回転角は360どのままだが，軸が反転しているため逆方向に回転することになる）


以上のように設定してOKを押すと，アニメーションパネルには
以下のように２つのアニメーション項目が現れます．

![anim-panel-cmb1](../../assets/images/cuemol2/Anim_Cmb/anim-panel-cmb1.png){ .on-glb }


上図の２項目の意味するところは，
1.  SimpleSpin1 (0,1,0)軸に360度回転をstart=0, end=1秒の１秒間をかけて実行
1.  SimpleSpin2 (0,-1,0)軸に360度回転，すなわち(0,1,0)軸に-360度回転をstart=1, end=2秒の１秒間をかけて実行

ということになります．
ここで注意すべき点は，（分り難くて申し訳ありませんが）リスト中の順番ではなく，右側に示されたstart/end時間に従ってアニメーションが実行される，という点です．

### 再生
以上の設定を行い，Animation ribbonの再生ボタンを押すと，

-  はじめの１秒で１回転

-  次の１秒で逆方向に１回転

して，元に戻るアニメーションになっていることが分かります．

## 相対時間指定の意味
ここで，相対時間指定の意味を確認してみるために，SimpleSpin1のduration値を変化させて見ましょう．

SimpleSpin1をdouble clickし，編集dialogを表示させ，Durationを「0:0:1.0」から「0:0:2.0」に増加させ，OKを押します．

すると以下のように，SimpleSpin1の実行時間が長くなる（回転がゆっくりになる）だけでなく，
SimpleSpin2の開始時間と終了時間も１秒分繰り下がっていることが分かります．


![relanim1](../../assets/images/cuemol2/Anim_Cmb/relanim1.png){ .on-glb }


アニメーションを実行すると，確かにSimpleSpin1が終わってからSimpleSpin2が実行されていることが分かります．

### 相対指定についての注意点


-  相対指定が出来るのは開始時間のみ．

-  開始時間をあるanimation objectに対して相対指定にした場合，そのanimation objectの終了時点からの時間を指定する．

-  相対指定は複数連鎖させることができる．そうすることで，途中の時間を変更しても後続のanimationを変更しなくてもすむ．

-  ただし，連鎖に循環があると時間が決定できなくなりanimationを実行できなくなるので注意．

## Quadric値による滑らかなアニメーション&aname(quadric);
Quadric値は，アニメーションの滑らかさを制御する値です．
アニメーションの時間経過（時間の長さにかかわらず開始0, 終了1とする）と，アニメーション量（この例では0〜360度の回転）の間は，Quadric=0なら１対１対応です．(下図)

![quad_graph_0](../../assets/images/cuemol2/Anim_Cmb/quad_graph_0.png)


一方で，Quadric値を0.25にすると，以下の図のようになります．横軸が時間経過，縦軸がアニメーション量です．すなわち0.25が意味するところは，0〜0.25と，0.75〜1.0の間で二次関数的なふるまいを示すようになる，ということです．

![quad_graph_025](../../assets/images/cuemol2/Anim_Cmb/quad_graph_025.png)


さらにQuadric値を0.5にすると，0〜1に渡ってすべて二次関数的なふるまいを示すようになります．

![quad_graph_05](../../assets/images/cuemol2/Anim_Cmb/quad_graph_05.png)


以上のように，Quadric値を0以上に指定すると，その分だけ，アニメーションの開始・終了時に
加速度運動的な動き（＝滑らかな動き）をするようになります．

### Quadric値を変更してみる

次に，上記２つのアニメーション項目のQuadric値を0から25% (0.25)に変更します．

![anim-simplespin-2](../../assets/images/cuemol2/Anim_Cmb/anim-simplespin-2.png){ .on-glb }

(以上で作成したシーンは，
[lyso_simplespin2.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin2.qsc)からダウンロードできます)

そしてAnimation ribbonの再生ボタンを押すとアニメーションが再生されます．
以下のyoutube動画のようになるはずです．
#youtube(pgGzhlDSZeE)

先ほどは回転の終わりと始め（１つ目のスピンと２つ目のスピンの間の動き）がカクカクしていましたが，
Quadricを0.25にすることで滑らかにつながるようになったと思います．
