[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



このページのサンプルファイル:
[[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-2.tar.gz?download)] or
[[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-2.zip?download)]

## リボンモデルによる蛋白質分子の表示

ブレオマイシン結合蛋白質をリボンモデルで表示します．(blm-ribbon1.qs) 


![blm_ribbon1](../../../assets/images/Documents/QScriptのチュートリアル/Step3/blm_ribbon1.png){ .on-glb }

```
qsys.cleanUpAll();
$pwd = sys.getScriptPath();

$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");

$mol.select(se/chain A,B/);
$r_p = $mol.createRend("protein", "ribbon");
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
```

### 説明
```
qsys.cleanUpAll();
$pwd = sys.getScriptPath();
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");
$mol.select(se/chain A,B/);
```
↑前回と同じ．

```
$r_p = $mol.createRend("protein", "ribbon");
```
↑リボン表示を作成．（前回と違うのはこの部分だけ）

```
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
```
↑前回と同じ．

**Queからの変更点**

>レンダラーのプロパティ名が変更されています．また，着色の方法が変更されています．

## 2次構造の割り当て
CueMolは，PDBファイルを読み込むと同時に，PDBファイル中にHELIXレコードとSHEETレコードが定義されている場合は，それに基づいて二次構造（ヘリックス・シートなど）を割り当てます．([PDB](http://www.rcsb.org/pdb)から取って来たPDBファイルには通常これらのレコードが含まれています)．

一方，自分で作ったり人からもらったPDBファイルの場合，往々にしてHELIXレコードやSHEETレコードがなかったりするわけです．その場合は，CueMolが二次構造を勝手に計算して割り当てるようになっています．

一方で，CueMolの二次構造の割り当て方が気に入らない場合は，自分で定義してしまうことも可能です．例えば，他の2次構造計算ができるソフト（DSSPやprocheck等）で2次構造を計算させ，その情報を元に，QScriptでどの部分がシートでへリックスかを指定できます．（ただし，CueMolはDSSPと同じアルゴリズムを使用しているため，DSSPだと同じ結果になります．） 

以下は，このブレオマイシン結合蛋白に対してprocheckを用いて2次構造をアサインする場合の例です． procheckで出来るファイルのうち，"<なんとか>.rin"というファイルに2次構造の情報があります．以下はその例で，矢印のカラムのアルファベットが2次構造の種類をあらわしています（E:シート，H,G:へリックス）．その手前のカラムが残基番号です．

```
             ↓
   1THR A   2   999.90 167.26 ...
   2ASP A   3   -66.67 147.35 ...
   3GLN A   4 E 176.46 139.22 ...
   4ALA A   5 E-101.49 129.06 ...
   5THR A   6 E-113.40 153.70 ...
...
```

これをもとに，H(helix)やE(sheet)の列のみ集めてきて，以下のように編集し，2ndry.qsというファイルを作成します．

```
$helix = se/resi 14:22,69:78/;
$sheet = se/resi 4:11,27:31,35:40,43:49,61:66,90:96,102:107,113:118/;
```

上の例では，変数$helixにヘリックス残基を選択する選択オブジェクトが代入され，変数$sheetにはシート残基を選択する選択オブジェクトが代入されます．（この例の場合，A鎖もB鎖も同じポリペプチド鎖で同じ構造をとっているので，鎖は無視して残基だけ指定していますが，ヘテロダイマー等の場合は，chain命令も追加して鎖を指定します．） 

他の出力から2次構造をアサインする場合も，同様のファイルを作成してください． 

さらに，blm-ribbon1.qsの4と5行目の間，PDBファイルを読み込んだ直後に以下の文を追加して2次構造を$molに対して割り当てます．

```
...
sys.exec($pwd+"2ndry.qs");
$mol.select($helix & se/chain A,B/);
$mol.setProp("secondary", "helix");
$mol.select($sheet & se/chain A,B/);
$mol.setProp("secondary", "sheet");
...
```

先ずはじめに，sys.exec()メソッドで上記で作成した2ndry.qsを実行します．これにより，$helixと$sheetが定義されます．
次に，select()メソッドを使用して，ヘリックス部分を選択しています．（この例では$helixのみを使用しても問題ありませんが，他のケースでは上の例のように，chainまで限定したほうが無難でしょう．）
さらに，setProp()メソッドを使用して，各残基のsecondaryプロパティーを指定しています．残基のsecondaryプロパティーがhelixである残基はヘリックスであるとみなされ， sheetである残基はシートであるとみなされます．
シートに対しても同様の操作を行っています． 

この例のように，2次構造の選択オブジェクトを格納するスクリプトを別ファイルにしておくと，他の作図スクリプトからも参照できて便利です． 

選択文法と選択オブジェクトに関する詳細は， 選択文については[分子選択文法のリファレンス](../../../Documents/MolSelSyntax)を参照してください．

## リボンのスタイルを変える

デフォルトの設定では，ヘリックスの先端にまで矢印がついて格好が悪いので，普通のスタイルに変更します．(blm-ribbon3.qs) 


![blm_ribbon3](../../../assets/images/Documents/QScriptのチュートリアル/Step3/blm_ribbon3.png){ .on-glb }


```
qsys.cleanUpAll();
$pwd = sys.getScriptPath();

$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");

sys.exec($pwd+"2ndry.qs");
$mol.select($helix & se/chain A,B/);
$mol.setProp("secondary", "helix");
$mol.select($sheet & se/chain A,B/);
$mol.setProp("secondary", "sheet");

$mol.select(se/chain A,B/);
$r_p = $mol.createRend("p", "ribbon");
$mol.select(se/chain A/);
molvis.paint($r_p, color.hsb(0, 0.3, 1.0));
$mol.select(se/chain B/);
molvis.paint($r_p, color.hsb(180, 0.3, 1.0));

$r_p.setProp("helix.width", 0.3);
$r_p.setProp("helix.tuber", 5.0);
$r_p.setProp("sheet.type", 1);

$r_p.setProp("helix_head.type", 0);
$r_p.setProp("helix_tail.type", 0);
$r_p.setProp("helix_tail.gamma", 2.2);
$r_p.setProp("sheet_tail.type", 0);
$r_p.setProp("sheet_tail.gamma", 4.0);
$r_p.setProp("sheet_head.type", 1);
$r_p.setProp("sheet_head.gamma", 1.5);

$mol.select(se/chain _/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
```

### 説明
```
qsys.cleanUpAll();
$pwd = sys.getScriptPath();
$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");
```
↑前回と同じ．

```
sys.exec($pwd+"2ndry.qs");
$mol.select($helix & se/chain A,B/);
$mol.setProp("secondary", "helix");
$mol.select($sheet & se/chain A,B/);
$mol.setProp("secondary", "sheet");
```
↑二次構造の割り当て．前節参照．

```
$mol.select(se/chain A,B/);
$r_p = $mol.createRend("p", "ribbon");
$mol.select(se/chain A/);
molvis.paint($r_p, color.hsb(0, 0.3, 1.0));
$mol.select(se/chain B/);
molvis.paint($r_p, color.hsb(180, 0.3, 1.0));
```
↑今度はなんとなく色も変えてみる． 

```
$r_p.setProp("helix.width", 0.3);
$r_p.setProp("helix.tuber", 5.0);
$r_p.setProp("sheet.type", 1);
```
↑ribbonレンダラーでは， "helix."，"sheet."，"coil." というプレフィクスを付けることで，それぞれの部分の断面形状 (section) に関するプロパティーを変更できる．プロパティーの種類はtubeレンダラーと同じ．[step2](../../../Documents/QScriptのチュートリアル/Step2)参照．<br/>
この例では，ヘリックスとシート部分のチューブ形状プロパティーを変更している． blm-ribbon1.qsよりヘリックスの幅が太めになり，シートの形状が角の取れた板状になっているが，拡大しないと分からないだろう．

```
$r_p.setProp("helix_head.type", 0);
$r_p.setProp("helix_tail.type", 0);
$r_p.setProp("helix_tail.gamma", 2.2);
$r_p.setProp("sheet_tail.type", 0);
$r_p.setProp("sheet_tail.gamma", 4.0);
$r_p.setProp("sheet_head.type", 1);
$r_p.setProp("sheet_head.gamma", 1.5);
```
2次構造の境目(junction)の形状プロパティーを設定している．プレフィクス"helix_head."はヘリックス→(ランダム)コイル(即ちへリックスの先頭)，"sheet_tail."は(ランダム)コイル→シート(即ちシートの末尾)の境界等々．さらに，"type"は境界の形状タイプ(0:滑らかな接続，1:矢印で接続)， "gamma"は滑らかさのパラメーターである．<br/>
この例では，ヘリックスの前後の形状を矢印ではなく，滑らか接続にしている．一方，シートの終わりの部分だけ形状を矢印型にしている．詳しくは[ribbonレンダラー](../../../Ref/molvis/RibbonRenderer)を参照．

↓以下同様．
```
$mol.select(se/chain _/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);
$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
```

**Queからの変更点**


>レンダラーのプロパティ名が変更されています．<br/>
"helix_", "sheet_", "coil_" → "helix.", "sheet.", "coil." ("_"から"."への変更)
但し，helix_smooth, coil_smooth, sheet_smoothプロパティは名前が変更されていない． 
"ch_", "hc_", "cs_", "sc_" → "helix_tail.", "helix_head.", "sheet_tail.", "sheet_head."
さらに，jcttypeが単にtypeとなっている． 

## 側鎖をはやしてみる
次の例では，ブレオマイシンと相互作用してそうな蛋白側の側鎖を表示します．(blm-ribbon4.qs) 


![blm_ribbon4](../../../assets/images/Documents/QScriptのチュートリアル/Step3/blm_ribbon4.png){ .on-glb }


```
qsys.cleanUpAll();
$pwd = sys.getScriptPath();

$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");

sys.exec($pwd+"2ndry.qs");
$mol.select($helix & se/chain A,B/);
$mol.setProp("secondary", "helix");
$mol.select($sheet & se/chain A,B/);
$mol.setProp("secondary", "sheet");

$a_col = color.hsb(0, 0.3, 1.0);
$b_col = color.hsb(180, 0.3, 1.0);

$mol.select(se/chain A,B/);
$r_p = $mol.createRend("p", "ribbon");
$mol.select(se/chain A/);
molvis.paint($r_p, $a_col);
$mol.select(se/chain B/);
molvis.paint($r_p, $b_col);

$r_p.setProp("helix.width", 0.3);
$r_p.setProp("helix.tuber", 5.0);
$r_p.setProp("sheet.type", 1);
$r_p.setProp("sheet_smooth", 0.0);
$r_p.setProp("helix_head.type", 0);
$r_p.setProp("helix_tail.type", 0);
$r_p.setProp("helix_tail.gamma", 2.2);
$r_p.setProp("sheet_tail.type", 0);
$r_p.setProp("sheet_tail.gamma", 4.0);
$r_p.setProp("sheet_head.type", 1);
$r_p.setProp("sheet_head.gamma", 1.5);

$mol.select(se/chain _/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.35);
$r_blm.setProp("bondw", 0.3);

$mol.select(se/(byres (chain _ around 3.5)) & chain A & !name C,N,O/);
$r_inta = $mol.createRend("inta", "ballstick");
$r_inta.setProp("sphr", 0.2);
$r_inta.setProp("bondw", 0.2);
$r_inta.setProp("coloring.col_C", $a_col);

$mol.select(se/(byres (chain _ around 3.5)) & chain B & !name C,N,O/);
$r_intb = $mol.createRend("intb", "ballstick");
$r_intb.setProp("sphr", 0.2);
$r_intb.setProp("bondw", 0.2);
$r_intb.setProp("coloring.col_C", $b_col);

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
```

### 説明

```
qsys.cleanUpAll();
$pwd = sys.getScriptPath();
$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");
sys.exec($pwd+"2ndry.qs");
$mol.select($helix & se/chain A,B/);
$mol.setProp("secondary", "helix");
$mol.select($sheet & se/chain A,B/);
$mol.setProp("secondary", "sheet");
```
↑以上は同様．

```
$a_col = color.hsb(0, 0.3, 1.0);
$b_col = color.hsb(180, 0.3, 1.0);
```
↑鎖ごとの色は使いまわすので，変数に代入して使用．こうしておけば，色の変更も簡単にできる．

```
$mol.select(se/chain A,B/);
$r_p = $mol.createRend("p", "ribbon");
$mol.select(se/chain A/);
molvis.paint($r_p, $a_col);
$mol.select(se/chain B/);
molvis.paint($r_p, $b_col);
$r_p.setProp("helix.width", 0.3);
$r_p.setProp("helix.tuber", 5.0);
$r_p.setProp("sheet.type", 1);
```
↑変更なし

```
$r_p.setProp("sheet_smooth", 0.0);
```
↑リボンモデル・シート部分のsmoothプロパティーを変更している．デフォルトではシート部分のsmooth値は0.5になっておりシートが平坦になっているが，この状態で側鎖をはやすと根元のCαが宙に浮いてしまい不恰好になる．それがいやなばあいは，smooth値を0に設定してリボンが必ずCαを通るようにする．

```
$r_p.setProp("helix_head.type", 0);
$r_p.setProp("helix_tail.type", 0);
$r_p.setProp("helix_tail.gamma", 2.2);
$r_p.setProp("sheet_tail.type", 0);
$r_p.setProp("sheet_tail.gamma", 4.0);
$r_p.setProp("sheet_head.type", 1);
$r_p.setProp("sheet_head.gamma", 1.5);
$mol.select(se/chain _/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.35);
$r_blm.setProp("bondw", 0.3);
```
↑変更なし

```
$mol.select(se/(byres (chain _ around 3.5)) & chain A & !name C,N,O/);
```
↑ここで，ブレオマイシンから3.5Åに位置する鎖Aの残基を選択している．少々複雑だが，"se/.../"内を分解すると，以下のようになる． 

chain _ around 3.5
:   鎖"_"(ブレオマイシン2分子)から，3.5Åに位置する原子を全て選択する．

byres (...)
:   上記の原子の選択を残基単位に拡張する．すなわち，ある残基中の原子が上記の選択式で一つでも選択されていれば，その残基中の原子が全て選択される．

... & chain A & ...
:   上記で選択された残基を，A鎖のみに制限している．(A側の側鎖とB側の側鎖で違う色をつけるために必要)

... & !name C,N,O
:   上記で選択された残基のうち，ペプチド結合のC,N,O原子を除くように制限している．

詳細は[こちら](../../../Documents/MolSelSyntax)を参照．

↓上述で選択した部分に対してスティックモデルを作成している．プロパティーの意味は[step1](../../../Documents/QScriptのチュートリアル/Step1)参照．
```
$r_inta = $mol.createRend("inta", "ballstick");
$r_inta.setProp("sphr", 0.2);
$r_inta.setProp("bondw", 0.2);
$r_inta.setProp("coloring.col_C", $a_col);
```

```
$mol.select(se/(byres (chain _ around 3.5)) & chain B & !name C,N,O/);
$r_intb = $mol.createRend("intb", "ballstick");
$r_intb.setProp("sphr", 0.2);
$r_intb.setProp("bondw", 0.2);
$r_intb.setProp("coloring.col_C", $b_col);
```
↑同様に，B側の相互作用している側鎖も表示している．

↓以下同様
```
$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
```
```
  
```

このように，around命令で相互作用している残基を決めてしまうと，主鎖の原子が相互作用しているのに側鎖だけ表示されてたりといろいろおかしい部分が出てきます．ちゃんと1残基づつ見て自分で判断し残基を指定して図を作るのが無難でしょう．

## 2次構造ごとに色を設定
最後に，2次構造ごとに色を設定してみましょう．(blm-ribbon5.qs)

![blm_ribbon5](../../../assets/images/Documents/QScriptのチュートリアル/Step3/blm_ribbon5.png){ .on-glb }


```
qsys.cleanUpAll();
$pwd = sys.getScriptPath();

$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");

sys.exec($pwd+"2ndry.qs");
$mol.select($helix & se/chain A,B/);
$mol.setProp("secondary", "helix");
$mol.select($sheet & se/chain A,B/);
$mol.setProp("secondary", "sheet");

$a_col = color.hsb(0, 0.5, 1.0);
$b_col = color.hsb(180, 0.5, 1.0);

$mol.select(se/chain A,B/);
$r_p = $mol.createRend("p", "ribbon");

$mol.select(se/chain A/);
molvis.paint($r_p, $a_col);
$mol.select(se/chain A/ & $helix);
molvis.paint($r_p, $a_col.addhue(30));
$mol.select(se/chain A/ & $sheet);
molvis.paint($r_p, $a_col.addhue(-30));

$mol.select(se/chain B/);
molvis.paint($r_p, $b_col);
$mol.select(se/chain B/ & $helix);
molvis.paint($r_p, $b_col.addhue(30));
$mol.select(se/chain B/ & $sheet);
molvis.paint($r_p, $b_col.addhue(-30));

$r_p.setProp("helix.width", 0.3);
$r_p.setProp("helix.tuber", 5.0);
$r_p.setProp("sheet.type", 1);
$r_p.setProp("helix_head.type", 0);
$r_p.setProp("helix_head.gamma", 2.2);
$r_p.setProp("helix_tail.type", 0);
$r_p.setProp("helix_tail.gamma", 2.2);
$r_p.setProp("sheet_tail.type", 0);
$r_p.setProp("sheet_tail.gamma", 4.0);
$r_p.setProp("sheet_head.type", 1);
$r_p.setProp("sheet_head.gamma", 1.5);

$mol.select(se/chain _/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.2);
$r_blm.setProp("bondw", 0.2);

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
```

molvis.paint()メソッドによる色の設定は，順々に上塗りしていくように行われます．この例では，ランダムコイル部分の色はchain A全体にまず塗っておき，後からhelixの部分，sheetの部分と，選択しつつ上塗りして色付けを完成させています．

この例でcolorオブジェクトに対して使用しているaddhue()メソッドは，色相を加減します．色相を変化させることで，同系等ながら微妙に違う色を作り出しています．

## 補足
他のレンダラーのプロパティについては，


>[Ribbonレンダラーのプロパティ](../../../Ref/molvis/RibbonRenderer)

を参照してください．

Ribbonレンダラーの主鎖の連続・不連続は，Tubeレンダラーと同様の方法で
決められています．[Tubeレンダラーのチュートリアル](../../../Documents/QScriptのチュートリアル/Step2)（最後の補足）の項を参照してください．