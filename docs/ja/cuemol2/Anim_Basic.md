[Documents](../../Documents)
## アニメーション
このセクションではversion 2.1.0.241以降で導入された
アニメーション作成機能について説明します．

Sample scene fileが以下からダウンロードできます．

-  [lyso_simplespin1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin1.qsc)：　Lysozymeの単純スピンアニメーション（その１）

### アニメーション・パレット
CueMol2.1以降では，以下のようなアニメーション・パレットがサイドパネルに追加されています．

![anim-palette1](../../assets/images/cuemol2/Anim_Basic/anim-palette1.png)

表示されていない場合は，メニューの「Window」→「Panels」→「Animation」で表示させることができます．

通常，新規作成したシーンは，上図のように項目が空で，何もアニメーションがない状態になっています．

### アニメーションの追加
新たにアニメーションを追加する方法を，単純スピン・アニメーションを例にとって説明します．

まず，適当なPDBファイルを開いてリボン表示をさせてください．
この例では，Lysozyme (1QIO)を使用していますが，それ以外でも構いません．
そして，画面をLysozymeの中心に持ってきておきます．

次に，アニメーション・パレットの「＋」ボタンを押すと，
下図のようにドロップダウン・メニューが表示されます．
そこから，Simple spinを選びます．


![anim-palette2](../../assets/images/cuemol2/Anim_Basic/anim-palette2.png)


### アニメーションの設定
アニメーション(Simple spin)の追加を行うと，以下のようなSimple spinの設定ダイアログが表示されます．


![anim-simplespin-2](../../assets/images/cuemol2/Anim_Basic/anim-simplespin-2.png){ style="zoom: 0.5" .on-glb }


#### 共通設定
アニメーションの設定には，共通設定と，個々のアニメーションに特有の設定があります．
DialogのCommon settingsの項目は，他のタイプのアニメーションにも共通な設定項目です．
ここでは，共通設定について説明します．
Name
:   アニメーションの名前です．デフォルトで他のアニメーションと被らない名前が付けられますが，独自の名前を付けたい場合は変更してください．

Disabled
:   チェックすると，アニメーションが存在しないものとして扱われます．動作テストなどに使用します．

Start time
:   アニメーションの開始時間です．

デフォルトでは，現在あるアニメーションの最後の時刻が開始時間になります（すなわち最後尾に新規追加したアニメーションが追加される）．
時間の指定様式については，下記を参照してください．
Relative to
:   Start timeの時間指定が，アニメーション開始時点からの絶対時間(absolute)か，他のAnimation objectに対する相対指定かを選択する．ここではAnimation objectが1つしかないので，absoluteを選びstart timeは0に．（相対指定については後述[cuemol2/Anim_Cmb](../../cuemol2/Anim_Cmb)で具体例を挙げて説明しています）

Duration
:   アニメーションの継続する時間を指定します．

デフォルトでは１秒継続するアニメーションになっています．
Quadric
:   アニメーションの時間経過に対する反応座標変化の様式を指定します．（といっても意味が分かりにくいと思いますので，後述[cuemol2/Anim_Cmb#quadric](../../cuemol2/Anim_Cmb#quadric)で具体例を挙げて説明しています）


#### 時間の指定
時間の指定は，すべて下図のようなウィジェットで行いますが，

![time_widget](../../assets/images/cuemol2/Anim_Basic/time_widget.png){ .on-glb }

一番左の桁から「時間(hour)」，「分(min)」，「秒(sec)」，「ミリ秒(msec)」を指定します．

ですので，
```
0:0:1.23
```
と指定した場合は，1.23秒ではなく，1秒23ミリ秒＝1.023秒という事になります．

### Simple spin特有の設定
DialogのSimpleSpin settingsの項目は，Simple spin特有の設定項目です．
Rotation angle
:   スピンの回転角を指定します．デフォルトでは360度で１回転するようになっています．GUIの都合上360度以上は指定できません．(何回も回転させたい場合は，後述のGenericタブからangleプロパティーを直接指定してください）

Spin axis
:   スピンの軸を指定します．左のドロップダウン・リストボックスでX, Y, Z axisを指定すると，それぞれの軸でスピンするようになります．Y軸が画面に垂直，X軸が水平な軸となっています．

Cartesianにすると，右のエディットボックスに数値を指定できるようになるので，軸のX,Y,Z座標値を手入力してください．デフォルトではY軸周りに回転するようになっています．

設定の意味は以上のようになっていますが，
ここはまずすべて初期値のままでOKボタンを押してください．
すると，下図のように，パレットに追加されたアニメーション項目が表示されます．

![anim-palette3](../../assets/images/cuemol2/Anim_Basic/anim-palette3.png){ style="zoom: 0.5" .on-glb }


以上で作成したシーンは，
[lyso_simplespin1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin1.qsc)からダウンロードできます．

### アニメーションの実行
次に，作成したアニメーションを実行してみます．
ツールバーの上にあるタブのうち，Animationというのをクリックすると，
Animation ribbon (アニメーション再生UI)が表示されます．

![anim-ribbon1](../../assets/images/cuemol2/Anim_Basic/anim-ribbon1.png)

各ボタン等の役割を以下で説明します．
Play
:   Animationの再生を開始します．開始すると，Pauseに変化します．

Pause
:   再生前は表示されていませんが，再生中に押すとanimationが一時停止します．

Stop
:   Animationの再生を中止します．

Loop
:   チェックすると，animationが終了後自動的に開始時に戻り再生を開始します（ループ再生）．

スライダー
:   アニメーションの時間のうち，現在どの時間に居るかを示しています．ドラッグすることで指定した時間にジャンプすることができます．


以上のAnimationバーを使用して再生を行うと，
以下のyoutube動画のようになるはずです．
#youtube(ufYOyzHft9E,loop)

### アニメーション項目の設定再変更
以上でY軸周りに1周回転するアニメーションができましたが，
アニメーションの設定を変更したい場合は，アニメーションパネルから該当項目（この場合はSimpleSpin1しかない）を選び，ダブルクリックします．

![anim-palette3](../../assets/images/cuemol2/Anim_Basic/anim-palette3.png){ style="zoom: 0.5" .on-glb }


すると，上記で説明した設定ダイアログが現れ，回転角度などの設定を変更できます．

![anim-simplespin-2](../../assets/images/cuemol2/Anim_Basic/anim-simplespin-2.png){ style="zoom: 0.5" .on-glb }


例えば，１回転が１秒は速すぎるというなら，設定ダイアログでDurationを例えば５秒(0:0:5.0)に変更して，
再度再生してみてください．５秒かけて１周するように変わるはずです．
