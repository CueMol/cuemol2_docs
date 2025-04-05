[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



[
このページのサンプルファイル:
[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-tRNA1.tar.gz?download) or
[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-tRNA1.zip?download)
]

## リボンによる核酸分子の表示

tRNA(Phe)をリボンモデルで表示します．(trf-ribbon.qs) 


![trf_ribbon1](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon1.png){ .on-glb }


<pre>
01: $pwd = sys.getScriptPath();
02: $se_det = 12;
03: $ax_det = 8;
04: 
05: $mol = readPDB($pwd+"trf-nomod.pdb","trf");
06: 
07: $mol.select(se/c; A and resi 1:74/);
08: $r_bp = $mol.createRend("bp", "nucl");
09: $r_bp.setProp("pivotatom", "p");
10: $r_bp.setProp("bondw", 0.5);
11: 
12: # set details
13: $r_bp.setProp("axialdetail", $ax_det);
14: $r_bp.setProp("section.detail", $se_det);
15: 
16: gfx.setCenter($r_bp.getCenter());
17: gfx.updateView();
</pre>

:行番号|
07
:   tRNAのCCA末端を除いた部分を選択している．PDBファイル中でtRNAの鎖はAである．"c;"は"chain"の略表記．

08
:   核酸のレンダリングに特化した"nucl"レンダラーを作成している．デフォルトでは図のようにバックボーンをチューブで接続した上に，各核酸残基に対応するスティックが表示される．チューブの部分に関しては，tubeレンダラーと同じプロパティ−を設定できる．[step2](../../../Documents/QScriptのチュートリアル/Step2)参照．すなわち，tuberプロパティーなどを変更して，チューブ部分をもっと「きし麺」っぽくすることも可能． 

09
:   "pivotatom"プロパティは，tubeレンダラーの場合と同じく，チューブが補間する原子を指定する．ここではリン酸のPにしているが，C3'等にすることもできる．C3'等の方がメジャーグルーブとマイナーグルーブの差が際立つ． 


![trf_ribbon2](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon2.png){ .on-glb }

10
:   "bondw"プロパティは，核酸残基に対応するスティック部分の太さ半径Å単位で指定する． 


nuclレンダラーには，上記のデフォルトのモード以外に，リボースの部分と塩基の部分をさらに際立たせて表示するモードがあります．以下の行を11行目に追加してみてください． 

```
$r_bp.setProp("natype", 1);
```

以下のようになります．
(このモードでは"pivotatom"を"p" (リン酸)以外にすると，表示がおかしくなります．)

![trf_ribbon3](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon3.png){ .on-glb }


**Queからの変更点**

>sectdetailプロパティーが，section.detailに変更されています．また，この例の7行目では選択文を'se/'と'/'で囲んで記述するperl風の記法を使っています．(もちろん
'%{'と'%}'で囲んで記述する以前の記法も使えます)

## 塩基対を割り当てる

どの残基とどの残基が塩基対を作っているかを指定することで，塩基対を一本のスティックとして表示させることができます．(trf-ribbon2.qs) 


![trf_ribbon4](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon4.png){ .on-glb }


<pre>
01: $pwd = sys.getScriptPath();
02: $se_det = 12;
03: $ax_det = 8;
04: 
05: $mol = readPDB($pwd+"trf-nomod.pdb","trf");
06: 
07: # setup tRNA base pairs
08: # acc-stem
09: makebp("trf", "A.1", "A.72");
... (省略) ...
35: makebp("trf", "A.13", "A.22");
36: 
37: $mol.select(se/c; A and i; 1:74/);
38: $r_bp = $mol.createRend("bp", "nucl");
39: $r_bp.setProp("pivotatom", "p");
40: $r_bp.setProp("bondw", 0.5);
41: 
42: # set details
43: $r_bp.setProp("axialdetail", $ax_det);
44: $r_bp.setProp("section.detail", $se_det);
45: 
46: gfx.setCenter($r_bp.getCenter());
47: gfx.updateView();
</pre>

:行番号|
09-35
:   関数（グローバルメソッド）makebp()で塩基対を定義している．

makebp()は他の関数とは異なり，引数が文字列である点に注意．すなわち，第1引数としてオブジェクト名(readPDB()で指定)を，第2,3引数として塩基対を形成している2つの残基をそれぞれ "<chain名>.<残基番号>"の形式で指定する．
makebp()関数は起動時にロードされるstartup.qsで定義されている．


## 色を付ける

上のリボンモデルのtRNAに，2次構造上のアーム毎に色を変えてみます．(trf-ribbon3.qs) 


![trf_ribbon5](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon5.png){ .on-glb }


<pre>
01: $pwd = sys.getScriptPath();
02: $se_det = 12;
03: $ax_det = 8;
04: 
05: $mol = readPDB($pwd+"trf-nomod.pdb","trf");
06: 
07: # setup tRNA base pairs
... (省略) ...
36: 
37: $mol.select(se/c; A and resi 1:74/);
38: $r_bp = $mol.createRend("bp", "nucl");
39: $r_bp.setProp("pivotatom", "p");
40: $r_bp.setProp("bondw", 0.5);
41: 
42: # colors
43: $mol.select(se/A.1:8,66:77.*/);
44: molvis.paint($r_bp, color.hsb(60,0.3,1.0));
45: $mol.select(se/A.9:26.*/);
46: molvis.paint($r_bp, color.hsb(120,0.3,1.0));
47: $mol.select(se/A.27:43.*/);
48: molvis.paint($r_bp, color.hsb(180,0.3,1.0));
49: $mol.select(se/A.44:48.*/);
50: molvis.paint($r_bp, color.hsb(240,0.3,1.0));
51: $mol.select(se/A.49:65.*/);
52: molvis.paint($r_bp, color.hsb(299.9,0.3,1.0));
53: 
54: 
55: # set details
56: $r_bp.setProp("axialdetail", $ax_det);
57: $r_bp.setProp("section.detail", $se_det);
58: 
59: gfx.setCenter($r_bp.getCenter());
60: gfx.updateView();
</pre>

:行番号|
43-52
:   tRNAの構造上の5つの要素（アクセプター，T，D，アンチコドンアームとバリアブルループ）をそれぞれ選択し，異なる色を設定している．

この例では，選択に「三つ組(triplet)式」を使用している．
三つ組式は，<chain>.<residue>.<atom>の形式で，
この例では，<chain>=A，<residue>=1:8,66:77等，<atom>=*である．
"*"は全てを意味し，原子名のみならず，残基番号，鎖名などとしても使用できる．

この例から分かるように，nuclレンダラーのチューブ部分とスティック部分は，同じ色しか設定できない．違う色を設定するには，nuclレンダラーにはスティックのみを表示させ，チューブ部分は独立のtubeレンダラーを作成して色を指定すればよい．nuclレンダラーにスティックのみを表示させるには，レンダラーのプロパティー"tube"にブール値falseを設定する．

## さらに別のタイプの表示

nuclレンダラーのもうひとつのモードを紹介します．(trf-ribbon4.qs)

![trf_ribbon6](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon6.png){ .on-glb } ![trf_ribbon7](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon7.png){ .on-glb }

<pre>
01: $pwd = sys.getScriptPath();
02: $se_det = 12;
03: $ax_det = 8;
04: 
05: $mol = readPDB($pwd+"trf-nomod.pdb","trf");
06: 
07: $na_ring = se/!(name P,O1P,O2P,O3P,O5',C5',O2',O3',O4,O2,N4,N6,CM5,N2,O6)/;
08: $col = color(1,1,0.8);
09: 
10: # RNA ribbons
11: $mol.select(se/c; A/);
12: $r_pho = $mol.createRend("pho", "tube");
13: $r_pho.setProp("section.width", 0.5);
14: $r_pho.setProp("section.tuber", 2.5);
15: $r_pho.setProp("pivotatom", "c3'");
16: $r_pho.setProp("coloring.default", $col);
17: 
18: $mol.select(se/c; A/ & $na_ring);
19: $r_res = $mol.createRend("res", "ballstick");
20: $r_res.setProp("sphr", 0.3);
21: $r_res.setProp("bondw", 0.3);
22: $r_res.setProp("ring", true);
23: $r_res.setProp("tickness", 0.3);
24: $r_res.setProp("coloring.col_C", $col);
25: $r_res.setProp("coloring.col_N", $col);
26: $r_res.setProp("coloring.col_O", $col);
27: $r_res.setProp("ringcolor", $col);
28: 
29: # set details
30: $r_pho.setProp("axialdetail", $ax_det);
31: $r_pho.setProp("section.detail", $se_det);
32: 
33: gfx.setCenter($r_pho.getCenter());
34: gfx.updateView();
</pre>

:行番号|
07
:   核酸残基のうち，リングを構成してる骨格部分の選択オブジェクトを作成し，$na_ringに格納している． 

08
:   共通の色を指定． 

11-16
:   チューブ部分を作成．C3'原子を通るようにしている． 

18-27
:   残基の表示をballstickレンダラーで作成．まず，核酸のリング骨格（リボースと塩基）の部分だけを選択し，レンダラーを作成している．次にballstickレンダラーの"ring"プロパティーにtrueを設定することで，リング部分を板状に表示させている．この板の厚さは，"tickness"プロパティーで指定する．この例のように，"tickness"を"bondw"や"sphr"プロパティーと同じ大きさにすと，縁の丸い板のようになる．

一方，"bondw"や"sphr"を"tickness"より若干大きめにすると，縁のある板状にすることもできる.<br />
![trf_ribbon8](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon8.png){ .on-glb }

この例は単色で表示しましたが，step1やstep2の例を参考にすれば，更に複雑な着色もできます．


![trf_ribbon](../../../assets/images/Documents/QScriptのチュートリアル/StepA1/trf_ribbon.jpg){ .on-glb }

