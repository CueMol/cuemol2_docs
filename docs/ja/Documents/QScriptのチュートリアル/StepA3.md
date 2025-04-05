[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



[
このページのサンプルファイル:
[tar.gz format](http://prdownloads.sourceforge.net/cuemol/ssbonds.tar.gz?download) or
[zip format](http://prdownloads.sourceforge.net/cuemol/ssbonds.zip?download)
]

## ジスルフィド結合

リゾチームにはジスルフィド結合があるようなので，
ここでジスルフィド結合をCueMolに認識させる方法を説明しておきます(ssbonds.qs)


![ssbonds1](../../../assets/images/Documents/QScriptのチュートリアル/StepA3/ssbonds1.png){ .on-glb }


<pre>
01: $pwd = sys.getScriptPath();
02: 
03: $mol = readPDB($pwd+"lysozyme-1qio.pdb","lyso");
04: 
05: # make S-S bonds
06: makeBond($mol, se/A.6.SG/, se/A.127.SG/);
07: makeBond($mol, se/A.30.SG/,se/A.115.SG/);
08: makeBond($mol, se/A.64.SG/,se/A.80.SG/);
09: makeBond($mol, se/A.76.SG/,se/A.94.SG/);
10: 
11: # protein tube
12: $mol.select(se/c; A,B/);
13: $r_ca = $mol.createRend("r_ca", "tube");
14: 
15: # Trp stick model
16: $mol.select(se/c; A & resn CYS & !name C,N,O/);
17: $r_cys = $mol.createRend("r_cys", "ballstick");
18: $r_cys.setProp("sphr", 0.35);
19: $r_cys.setProp("bondw", 0.25);
20: $r_cys.setProp("coloring.col_C", color.hsb(60,0.5,1.0));
21: 
22: gfx.setCenter($r_ca.getCenter());
23: gfx.updateView();
</pre>

:行番号|
06-09
:   リゾチーム分子を読み込んだ後に，ジスルフィド結合を設定している．

関数makeBond()は，分子オブジェクトと2つの選択オブジェクトを引数に取り，
分子内の任意の2原子間に強制的に共有結合を形成させる．
makeBond()に渡す選択オブジェクトは，
1原子のみを選択するように注意する必要がある．

同様の手順を使用して，アスパラギンやスレオニンに共有結合した糖鎖の共有結合なども表示することが可能です．
