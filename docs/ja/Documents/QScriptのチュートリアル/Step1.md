[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



このページのサンプルファイル:
[[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-2.tar.gz?download)] or
[[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-2.zip?download)]

QScriptは，
perl:PHP:java=7:2:1
みたいな感じのスクリプト言語です．
エディターなどで編集する場合はperlモードにしておけば
インデントなどがきれいにいくでしょう．

スクリプトファイルの実行方法は，Windowsでは，
メニュー**"File"->"Execute QScript..."**を選択する．
→スクリプトファイル（拡張子はqs）を選んでOKボタンを押すと
実行されます．

## Ball&StickモデルとCPKモデル
抗生物質ブレオマイシンをStickモデルで表示します．(blm.qs) 

![blm_stick1](../../../assets/images/Documents/QScriptのチュートリアル/Step1/blm_stick1.png){ .on-glb }

<pre>
01: qsys.cleanUpAll();
02: $pwd = sys.getScriptPath();

03: $mol = readPDB($pwd+"blm_ab.pdb","blm_ab");

05: $mol.select(se/resi 1001/);
06: $r_blm = $mol.createRend("blm", "ballstick");
07: $r_blm.setProp("sphr", 0.2);
08: $r_blm.setProp("bondw", 0.2);

09: $mol.deselect();
10: gfx.setCenter($r_blm.getCenter());
11: gfx.updateView();
</pre>

### 説明
```
qsys.cleanUpAll();
```
↑qsys.cleanUpAll()を実行することで，CueMol全体の初期化を行っている．以前に何か（分子等）を読み込んでいる場合を想定して，初期化により起動直後の状態にしてからこのファイルを読み込んだほうが良いだろう．一方，CueMol起動直後にこのファイルを読み込む場合は，この部分は在っても無くても関係ない．

```
$pwd = sys.getScriptPath();
```
↑スクリプトの置かれているディレクトリのパス名を取得し，変数$pwdに格納する．
```
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");
```
↑スクリプトと同じディレクトリにある，blm_ab.pdbファイルを読み込む．<br />
読み込んだ分子オブジェクトには，blm_abという名前を付ける．
（ここで付ける名前は，GUIでPDBファイル読み込み時に付けるオブジェクト名に相当する．）<br />
PDB形式ファイルを読み込むreadPDB()関数は読み込んだ分子オブジェクトへの参照を返すので，後で使用するためにそれを$molに代入する．<br />
ちなみに，blm_ab.pdbにはブレオマイシン結合蛋白質とブレオマイシン2分子が含まれており，$molで参照される分子オブジェクトにはそれらが全て含まれている．
```
$mol.select(se/resi 1001/);
```
↑分子オブジェクトのメソッドであるselect()を使用し，
$molからブレオマイシン1分子のみを選択している．<br />
select()メソッドは引数として選択オブジェクトを取る．
この例では，選択文(se/と/囲まれた部分)で，残基1001番を選択している．
選択文については[分子選択文法のリファレンス](../../../Documents/MolSelSyntax)を参照．
```
$r_blm = $mol.createRend("blm", "ballstick");
```
↑上記で選択した部分に対するレンダラーを作成する．<br />
分子オブジェクトのメソッドであるcreateRend()は，対象とする分子オブジェクト(ここでは$mol)に接続されたレンダラーを生成する．1番目の引数(ここでは文字列blm)はレンダラー名で，GUIからレンダラーを作成する場合に指定するレンダラー名に相当している．2番目の引数(ここでは文字列ballstick)はレンダラーのタイプ名．さらに，作成したレンダラーへの参照を，$r_blmに格納している．<br />
レンダラータイプをcpkにすると，CPKモデルが表示される．下図．

![blm_CPK1](../../../assets/images/Documents/QScriptのチュートリアル/Step1/blm_CPK1.png){ .on-glb }

~ただし，CPKモデルにした場合，CPKレンダラーには"sphr"や"bondw"といったプロパティが無いため，**↓以下の２行をコメントアウトしないとエラーになるので注意**．
```
$r_blm.setProp("sphr", 0.2);
```
```
$r_blm.setProp("bondw", 0.2);
```
↑上記で作成したballstickレンダラーのプロパティーを設定する．<br />
ここでは，スティックモデルで表示したいので，原子部分の球の半径であるsphrプロパティーと，原子間を接続している円柱の半径であるbondwプロパティーを同じ値，0.2Åに指定している．逆に，ボール・アンド・スティックモデルにしたい場合は，sphrプロパティーをbondwプロパティーより大きい値に指定すればよい．（下図; bondw=0.3, sphr=0.5）

![blm_ballstick1](../../../assets/images/Documents/QScriptのチュートリアル/Step1/blm_ballstick1.png){ .on-glb }


```
$mol.deselect();
```
↑分子を非選択（何も選択されていない状態）にする．これを実行しないと，以上で選択した部分（ブレオマイシン分子）がハイライト表示されたままになってしまう．

```
gfx.setCenter($r_blm.getCenter());
```
↑上記で作成したレンダラーの中心位置を取得し，それを視野の中心となるように設定している．<br />
レンダラーのメソッドであるgetCenter()は，対象とするレンダラー(ここでは$r_blm)の中心をベクトル値として返す．<br />
グラフィクス・サブシステムの静的メソッドであるsetCenter()は，現在のビューの中心をベクトルで指定する．  

```
gfx.updateView();
```
↑現在のビューを更新する．これにより，はじめてCueMol内部の状態（ビューの中心等）が画面に反映される．<br />
（シーンが完成してから画面表示を更新することで，全体の処理を高速に行うことができる．）

**Queからの変更点**

>detailプロパティが新設されました．大きめの値に設定すると原子やボンドが滑らかに表示されるようになります（上図のdetailはデフォルトの3）．

**Queからの変更点２**

>CueMolではse★と★（★は空白文字， 数字，アルファベット以外の任意の文字）を
使用した表記を使用してください．%{と%}で囲う表記は互換性のために残されています．

## 色の設定

元素の種類ごとに色を設定します．(blm_color.qs)


![blm_stickcolor1](../../../assets/images/Documents/QScriptのチュートリアル/Step1/blm_stickcolor1.png){ .on-glb }


<pre>
qsys.cleanUpAll();
$pwd = sys.getScriptPath();
 
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");

$mol.select(se/resi 1001/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);
$r_blm.setProp("coloring.col_C", color.hsb( 60, 0.7, 1.0));
$r_blm.setProp("coloring.col_N", color.hsb(270, 0.7, 1.0));
$r_blm.setProp("coloring.col_O", color.hsb(  0, 0.7, 1.0));
$r_blm.setProp("coloring.col_S", color.hsb(120, 0.7, 1.0));
 
$mol.deselect();
gfx.setCenter($r_blm.getCenter());
gfx.updateView();
</pre>

### 説明
<pre>
qsys.cleanUpAll();
$pwd = sys.getScriptPath();
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");
$mol.select(se/resi 1001/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);
</pre>
前回と同じ．

<pre>
$r_blm.setProp("coloring.col_C", color.hsb( 60, 0.7, 1.0));
$r_blm.setProp("coloring.col_N", color.hsb(270, 0.7, 1.0));
$r_blm.setProp("coloring.col_O", color.hsb(  0, 0.7, 1.0));
$r_blm.setProp("coloring.col_S", color.hsb(120, 0.7, 1.0));
</pre>
ballstickレンダラーのプロパティーcoloring.col_C等を変更して，色を指定している．この例では，HSBモデルの表現(Hue, Saturation, Brightness)で色を指定している．<br />
元素の指定は，以下の表に挙げたものが使用できる． 

|property name|対応する元素|h
|coloring.col_H|水素|
|coloring.col_C|炭素|
|coloring.col_N|窒素|
|coloring.col_O|酸素|
|coloring.col_S|硫黄|
|coloring.col_P|リン|
|coloring.col_others|上記以外の全元素|

<pre>
$mol.deselect();
gfx.setCenter($r_blm.getCenter());
gfx.updateView();
</pre>
前回と同じ．


**Queからの変更点**

>ballstickレンダラーの色に関するプロパティ名が上記のように変更されています．また，ベクトルを色の代わりに使用する記法が廃止されました．

#### 色モデルについての補足
color(red, green, blue)あるいはcolor(red, green, blue, alpha) （ここでalphaとは透明度）を使用することで， RGBあるいはRGBAモデルで色を指定することも可能です．この場合，各要素の値の範囲は0.0〜1.0で，color(0,0,0)が黒，color(1,1,1)が白をあらわします．また，alpha値は0.0が透明，1.0が不透明をあらわします．

HSBモデルの表現(Hue, Saturation, Brightness)では，Hueは0度(=360度; 赤), 180度(水色)等で色相を指定します． Hueは単位が度で任意の値を取ることができます．一方，SaturationとBrightnessはそれぞれ0.0から1.0の値であり， 1.0, 1.0で純色，0.5, 1.0で白っぽく，1.0, 0.5で黒っぽくなります

## 温度因子による色の設定

温度因子に応じて色を設定します．(blm_color2.qs)


![blm_stickcolor2](../../../assets/images/Documents/QScriptのチュートリアル/Step1/blm_stickcolor2.png){ .on-glb }

<pre>
qsys.cleanUpAll();
$pwd = sys.getScriptPath();

$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");

$mol.select(se/resi 1001/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);
$r_blm.setProp("coloring.colormode", 1);
$r_blm.setProp("coloring.lowcol", color(0.0, 0.0, 1.0));
$r_blm.setProp("coloring.highcol", color(1.0, 1.0, 0.0));
sys.println("Low:\t"+$r_blm.getProp("coloring.lowpar").tostr()+"A^2");
sys.println("High:\t"+$r_blm.getProp("coloring.highpar").tostr()+"A^2");
gfx.setCenter($r_blm.getCenter());
gfx.updateView();
</pre>

### 説明
<pre>
```
qsys.cleanUpAll();
```
```
$pwd = sys.getScriptPath();
```
```
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");
```
```
$mol.select(se/resi 1001/);
```
```
$r_blm = $mol.createRend("blm", "ballstick");
```
```
$r_blm.setProp("sphr", 0.2);
```
```
$r_blm.setProp("bondw", 0.2);
```
</pre>
↑前回と同じ．

```
$r_blm.setProp("coloring.colormode", 1);
```
↑着色モードを上記で使用してきたsimple(0; default)から，bfac(1で指定)に変更する．このモードでは，温度因子に対応して着色される．他に，占有率に対応して着色するocc(2で指定)がある．

```
$r_blm.setProp("coloring.lowcol", color(0.0, 0.0, 1.0));
```
```
$r_blm.setProp("coloring.highcol", color(1.0, 1.0, 0.0));
```
↑bfacモードで，低い値に対応する色(coloring.lowcol)と，高い値に対応する色(coloring.highcol)を指定する．ここでは，低い温度因子から高い温度因子に対応して，青から黄色で着色している．<br />

```
sys.println("Low:\t"+$r_blm.getProp("coloring.lowpar").tostr()+"A^2");
```
```
sys.println("High:\t"+$r_blm.getProp("coloring.highpar").tostr()+"A^2");
```
↑この部分は，グラフィックス表示とは直接関係ないので省略可能．
低い値，高い値を指定するプロパティー名はそれぞれ，coloring.lowparとcoloring.highparである．ここでは，その値をgetProp()メソッドを使用して取得し，端末に整形して表示している．端末（Windowsの場合はOutput window）には以下のようにデフォルト値が表示される．

>Low:  20.000000 A^2<br />
High: 80.000000 A^2

このように，sys.println()メソッドは，スクリプトのデバッグ等で，変数などの値を調べるときに便利．

<pre>
gfx.setCenter($r_blm.getCenter());
gfx.updateView();
</pre>
↑前回と同じ．

**Queからの変更点**

>ballstickレンダラーの色に関するプロパティ名が上記のように変更されています．また，ベクトルを色の代わりに使用する記法が廃止されました．
