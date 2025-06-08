[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



このページのサンプルファイル:
[[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-2.tar.gz?download)] or
[[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-2.zip?download)]

## チューブによる蛋白質分子の表示

ブレオマイシン結合蛋白質をチューブモデルで表示します．(blm-tube.qs) 


![blm_tube1](../../../assets/images/Documents/QScriptのチュートリアル/Step2/blm_tube1.png){ .on-glb }

<pre>
qsys.cleanUpAll();
$pwd = sys.getScriptPath();

$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");

$mol.select(se/chain A,B/);
$r_p = $mol.createRend("protein", "tube");
$mol.select(se/chain A/);
molvis.paint($r_p, color.hsb(60, 0.3, 1.0));
$mol.select(se/chain B/);
molvis.paint($r_p, color.hsb(240, 0.3, 1.0));

$mol.select(se/chain _/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
</pre>

### 説明
<pre>
qsys.cleanUpAll();
$pwd = sys.getScriptPath();
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");
</pre>
↑前回と同じ．

```
$mol.select(se/chain A,B/);
```
↑blm_ab分子中の，蛋白質部分のみを選択している．この場合，蛋白質は鎖A,Bに相当しているので，選択構文の(%{と%}で囲まれた部分)chain命令でAとBを選択している．
選択文については[分子選択文法のリファレンス](../../../Documents/MolSelSyntax)を参照．

```
$r_p = $mol.createRend("protein", "tube");
```
↑上記で選択した蛋白質部分に対し，tubeレンダラーを作成し，proteinと名付けている． また，そのレンダラーへの参照を$r_pに格納している． 
<pre>
$mol.select(se/chain A/);
molvis.paint($r_p, color.hsb(60, 0.3, 1.0));
$mol.select(se/chain B/);
molvis.paint($r_p, color.hsb(240, 0.3, 1.0));
</pre>
↑蛋白質のA鎖とB鎖に異なった色を設定している．まず，分子オブジェクトのselect()メソッドで 各鎖を選択し，molvis.paint()メソッドで色を設定している． 

```
$mol.select(se/chain _/);
```
↑ブレオマイシンを選択している．[step1](../../../Documents/QScriptのチュートリアル/Step1)とは異なり蛋白質ダイマーに2分子結合したリガンド両方とも選択するため，ブレオマイシンが含まれている鎖"_"により選択している． PDBファイル中で鎖名がない(chain columnが空白)の場合は， CueMol内部では鎖名が"_"として扱われる点に注意．
<pre>
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);
</pre>
↑ブレオマイシン分子に対するballstick表示を作成．（前回と同じ）
<pre>
$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
</pre>
↑表示の更新等．（前回と同じ）

## 複雑な着色
上記の例では鎖ごとに色づけしていますが，残基単位で色を指定することも可能です．以下の例では，酸性残基を赤系統，塩基性残基を青系統にしています．(blm-tbcolor.qs)


![blm_tbcolor1](../../../assets/images/Documents/QScriptのチュートリアル/Step2/blm_tbcolor1.png){ .on-glb }

<pre>
qsys.cleanUpAll();
$pwd = sys.getScriptPath();

$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");

$mol.select(%{chain A,B%});
$r_p = $mol.createRend("protein", "tube");
$r_p.setProp("coloring.default", color.hsb(60, 0.2, 1.0));
$mol.select(%{resn ARG, LYS, HIS%});
molvis.paint($r_p, color.hsb(240, 0.4, 1.0));
$mol.select(%{resn ASP, GLU%});
molvis.paint($r_p, color.hsb(0, 0.4, 1.0));
$mol.select(%{resn ASN, GLN, SER, THR, TYR%});
molvis.paint($r_p, color.hsb(120, 0.4, 1.0));

$mol.select(%{chain _%});
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
</pre>
### 説明
<pre>   
qsys.cleanUpAll();
$pwd = sys.getScriptPath();
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");
$mol.select(%{chain A,B%});
$r_p = $mol.createRend("protein", "tube");
</pre>
↑前回と同じ．蛋白側の主鎖のtube表示を作成．

```
$r_p.setProp("coloring.default", color.hsb(60, 0.2, 1.0));
```
↑colorプロパティーで色を指定しなかった場合のデフォルト色を肌色に設定している．

<pre>
$mol.select(%{resn ARG, LYS, HIS%});
molvis.paint($r_p, color.hsb(240, 0.4, 1.0));
</pre>
↑select()メソッドにより塩基性残基（ARG, LYS, HIS）を選択し，色を青系統に設定している． 
<pre>
$mol.select(%{resn ASP, GLU%});
molvis.paint($r_p, color.hsb(0, 0.4, 1.0));
</pre>
↑select()メソッドにより酸性残基（ASP，GLU）を選択し，色を赤系統に設定している． 
<pre>
$mol.select(%{resn ASN, GLN, SER, THR, TYR%});
molvis.paint($r_p, color.hsb(120, 0.4, 1.0));
</pre>
↑select()メソッドにより親水性残基（ASN，GLN，SER，TYR）を選択し，色を緑系統に設定している． 

↓以下前回と同様．
<pre>
$mol.select(%{chain _%});
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);
$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
</pre>

**Queからの変更点**

>Tube, Ribbonレンダラーのdefaultcolorプロパティは， coloring.defaultに変更されました

#### 補足
Tubeが途中で途切れるかどうかは，以下の要件により決まっています（バージョン1.1.0.110以降）．
*  Chain IDが変わる場合は必ずbreak
*  隣り合うPivot atom (proteinの場合はCA, nucleic acidの場合はP)間の距離が，プロパティーautobreakの値より大きい場合にbreak
*  残基番号の連続・不連続は関係ない．

プロパティーautobreakのデフォルト値は10Åになっています．(この閾値はタンパクの場合にはゆる過ぎるかも知れませんので，状況に応じて小さめに変更してください．)

他のレンダラーのプロパティについては，

>[Tubeレンダラーのプロパティ](../../../Ref/molvis/TubeRenderer)<br />
[Splineレンダラーのプロパティ](../../../Ref/molvis/SplineRenderer)<br />
[MainChainレンダラーのプロパティ](../../../Ref/molstr/MainChainRenderer)

を参照してください．