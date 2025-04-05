[QScriptのチュートリアルへ戻る](../../Documents/QScriptのチュートリアル/)



[
このページのサンプルファイル:
[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-den1.tar.gz?download) or
[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-den1.zip?download)
]

## 電子密度の表示
CueMolは， 


-  CNS（とXplor）が出力したテキスト形式の電子密度ファイル 

-  CCP4のFFTなどが出力したバイナリ形式の電子密度ファイル 

-  MAPMANやOでよく使用されるBRIX形式の電子密度ファイル

を読み込むことが出来ます．
しかし，図を作る用途の場合，CNS形式，CCP4形式は
ファイルの大きさ等を考えると，前もってBRIX形式にMAPMAN等で変換しておくのが
望ましいでしょう． 

リゾチームの電子密度を表示します．(lyso.qs)

![lyso_dens1](../../assets/images/Documents/QScriptのチュートリアル/StepA2/lyso_dens1.png){ .on-glb }


<pre>
01: $pwd = sys.getScriptPath();
02: 
03: $mol = readPDB($pwd+"lysozyme-1qio.pdb","lyso");
04: 
05: # protein tube
06: $mol.select(se/c; A,B/);
07: $r_ca = $mol.createRend("r_ca", "tube");
08: 
09: # Trp stick model
10: $mol.select(se/A.108.* & !name C,N,O/);
11: $r_trp = $mol.createRend("r_trp", "ballstick");
12: $r_trp.setProp("sphr", 0.2);
13: $r_trp.setProp("bondw", 0.2);
14: 
15: # Waters
16: $mol.select(se/c; _ & ((A.108.CE2) around 6.0)/);
17: $r_wat = $mol.createRend("r_wat", "ballstick");
18: $r_wat.setProp("sphr", 0.2);
19: $r_wat.setProp("bondw", 0.2);
20: $cen = $r_trp.getCenter();
21: 
22: # 2Fo-Fc map
23: $map = readBrixMap($pwd+"lysozyme_2fo-fc.brix", "2fo-fc");
24: $r_map = $map.createRend("r_map", "contour");
25: $r_map.setProp("siglevel", 1.1);
26: $r_map.setProp("extent", 5.0);
27: $r_map.setProp("center", $cen);
28: $r_map.setProp("color", color(0.0,0.7,1.0));
29: 
30: gfx.setCenter($cen);
31: gfx.updateView();
</pre>

:行番号|
03-19
:   リゾチームの主鎖をチューブモデルで表示し，Trp108の側鎖をスティックモデルで表示している．さらに，Trp108のCE2原子から半径6Å以内にある水分子も表示している． 

20
:   後で使用するために，トリプトファン部分のレンダラー$r_trpの中心位置を取得し， $cenに格納している． 

23
:   関数readBrixMap()を使用してBRIX形式の電子密度を読み込んでいる．読み込んだ電子密度オブジェクトの名前を"2fo-fc"にし，オブジェクトへの参照を$mapに格納． 

24
:   電子密度$mapに対して"contour"レンダラーを作成し, それへの参照を$r_mapに格納している．電子密度にアタッチできるレンダラーとしては他にisosurfがある． 

25-28
:   上記で作成したレンダラー$r_mapのプロパティーを設定．

siglevelで等高線の高さをσ（標準偏差）単位で指定している．
rangeでマップが描画される範囲を指定している． 5.0にすると，一辺が10Åの立方体の範囲が描画される．
centerでマップが描画される中心を指定している．この例では，Trp残基のレンダラーの中心位置$cenが，マップの描画される中心になるようにしている．
最後にcolorでマップの色を指定している． 

電子密度が表示される範囲は，立方体にしか設定できません．
これは画面で回しながら見る分にはそれほど気にはなりませんが，
図にしてしまうと（この例でも分かるように）関係ない部分の電子密度が
一部表示されてしまい，それが手前に来たりすると非常に見難くなります． 

見せたい部分（この例だとトリプトファン残基）のFo-Fcオミットマップを
作成して表示すれば，オミットした部分の電子密度のみの電子密度ファイルが
出来るため， CueMolでの表示範囲に関わらず目的の原子の周りだけの
電子密度図を作ることが出来ます． 

さらに見やすい電子密度図を作りたい場合は，
後述するようにPOV-Rayでのレンダリングが推奨されます． 

**Queからの変更点**

>contourレンダラーのrangeプロパティがextentに変更されました．

## 電子密度をPOV-Rayでレンダリングする

電子密度をPOV-Rayでレンダリングする場合， Queの出力をそのまま使用するより，場合に応じてパラメーターを変えてやればより見やすい画像を作成することが出来ます．

以下は.povファイルの中の，電子密度に関する設定の部分です．

<pre>

#declare _2fo_fc_r_map_tex = texture {
```
 pigment {color rgbft <0,0,0,1,1>}
```
```
 normal {granite 0.0 scale 1.0}
```
```
 finish {
```
```
  ambient 0.3
```
```
  diffuse 1.0
```
```
  specular 0.0
```
```
 }
```
```
}
```
</pre>
上記のマテリアルの設定はデフォルトでもそれほど悪くは無いが，ambientを1近くに，diffuseを逆に0近くに（specularは0）にすればさらにベタ塗りの線ぽくなる．

<pre>
#declare _2fo_fc_r_map_lw = 0.05;
</pre>
上記は線の太さを指定している．色との兼ね合いで細すぎて見にくかったりするので，図を見ながら調整．（デフォルトは太すぎるかも）

<pre>

#declare _2fo_fc_r_map_col0 = <0.000000,0.698039,1.000000,0.000000>;
</pre>
色を指定する．4番目の数値を増やせば透明度が上がる（0は不透明，1は完全な透明）．
半透明にしたほうが電子密度のメッシュがしつこくならずに見やすい．


![lyso_dens2](../../assets/images/Documents/QScriptのチュートリアル/StepA2/lyso_dens2.png){ .on-glb }


上のデフォルトの出力から，materialのambientを0.75に，
diffuseを0.1に，さらに線の太さを0.01に，
透明度を0.5に変更してレンダリングしたもの．
これでも結構見難いので， 


-  図の向きや電子密度を出す範囲を工夫する 

-  立体視の図にする 

-  オミットマップにする 

等の工夫が必要だろう．
