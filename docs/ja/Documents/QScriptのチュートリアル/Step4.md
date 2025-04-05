[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)

このページのサンプルファイル:
[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-1.tar.gz?download) or
[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-1.zip?download)

## 相互作用の表示
論文の図とかで，水素結合などをよく点線で示したりしますが，ここでは抗生物質ブレオマイシンとブレオマイシン結合たんぱく質との相互作用を表示してみましょう．(blm_intr.qs)


![blm_intr1](../../../assets/images/Documents/QScriptのチュートリアル/Step4/blm_intr1.png){ .on-glb }


<pre>
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

$mol.select(se/chain A/);
$r_p = $mol.createRend("p", "ribbon");
molvis.paint($r_p, $a_col);

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

$mol.select(se/_.1001.*/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.35);
$r_blm.setProp("bondw", 0.3);

$mol.select(se/A.59,61,111,115.*/);
$r_inta = $mol.createRend("inta", "ballstick");
$r_inta.setProp("sphr", 0.2);
$r_inta.setProp("bondw", 0.2);
$r_inta.setProp("coloring.col_C", $a_col);

$g1 = qobj.createObj("GeomObj", "g1");
$r_g1 = $g1.createRend("line", "geomline");
drawBondSel($g1, $mol, se/_.1001.O4/, $mol, se/A.115.NH2/);
drawBondSel($g1, $mol, se/_.1001.ND/, $mol, se/A.61.OG/);
drawBondSel($g1, $mol, se/_.1001.ND/, $mol, se/A.59.O/);
drawBondSel($g1, $mol, se/_.1001.NF/, $mol, se/A.111.O/);

$r_g1.setProp("linew", 0.1);
$r_g1.setProp("stipple_0", 0.2);
$r_g1.setProp("stipple_1", 0.4);
$r_g1.setProp("color", color(1,0.75,0.5));

$mol.deselect();
gfx.setCenter($r_g1.getCenter());
gfx.updateView();
</pre>

### 説明
<pre>
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

$mol.select(se/chain A/);
$r_p = $mol.createRend("p", "ribbon");
molvis.paint($r_p, $a_col);

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
</pre>
↑以上まで同様．
<pre>
$mol.select(se/_.1001.*/);
$r_blm = $mol.createRend("blm", "ballstick");
$r_blm.setProp("sphr", 0.35);
$r_blm.setProp("bondw", 0.3);
</pre>
↑A分子側のブレオマイシンとの相互作用を表示するので，A分子側(残基番号1001)のみ表示．

<pre>
$mol.select(se/A.59,61,111,115.*/);
$r_inta = $mol.createRend("inta", "ballstick");
$r_inta.setProp("sphr", 0.2);
$r_inta.setProp("bondw", 0.2);
$r_inta.setProp("coloring.col_C", $a_col);
</pre>
↑A分子側ブレオマイシンとの相互作用に関わる一部のタンパク側残基を選択してボール&スティックで表示している． 

<pre>
$g1 = qobj.createObj("GeomObj", "g1");
</pre>
↑相互作用を示す点線を表示するために，"g1"という名前で幾何オブジェクト(GeomObj型のオブジェクト)を作成． 

<pre>
$r_g1 = $g1.createRend("line", "geomline");
</pre>
↑相互作用を示す点線を表示するために，幾何オブジェクトに対して線を描画するレンダラー(geomline型のレンダラー)を作成． 

<pre>
drawBondSel($g1, $mol, se/_.1001.O4/, $mol, se/A.115.NH2/);
drawBondSel($g1, $mol, se/_.1001.ND/, $mol, se/A.61.OG/);
drawBondSel($g1, $mol, se/_.1001.ND/, $mol, se/A.59.O/);
drawBondSel($g1, $mol, se/_.1001.NF/, $mol, se/A.111.O/);
</pre>
↑グローバル関数drawBondSel()により，2つの原子間の相互作用を定義している．例えば，42行では，第1引数に幾何オブジェクト($g1)を指定し，第2,第3引数で1つ目の原子($mol中の_.1001.O4)を，第4,第5引数で2つ目の原子($mol中のA.115.NH2)を指定している．これで，ブレオマイシンのO4原子から，タンパク分子のArg115のNη2に点線が表示される． drawBondSel()は起動時に自動的に実行されるスクリプト，startup.qsで定義されている． 

<pre>
$r_g1.setProp("linew", 0.1);
$r_g1.setProp("stipple_0", 0.2);
$r_g1.setProp("stipple_1", 0.4);
$r_g1.setProp("color", color(1,0.75,0.5));
</pre>
↑geomlineレンダラー($r_g2)は，上記(42-45行)で設定した幾何オブジェクトの情報を元に，原子間に線を表示するが，その表示方法を設定している．線の太さ(linewプロパティー) 0.1Åに設定し，点線になるようにstipple_0, stipple_1プロパティをそれぞれ0.2, 0.4Åに設定している．

↓以下同様
<pre>
$mol.deselect();
gfx.setCenter($r_g1.getCenter());
gfx.updateView();
</pre>


ここで，stipple_0は点線のうち始の線が引かれている部分の長さ，stipple_1は次の間隙の長さである．stipple_2以上(5まで)を指定することで，さらに複雑な点線を表示させることも可能であるが，興味のある方は試していただきたい．
