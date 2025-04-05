[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



[
このページのサンプルファイル:
[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-elepot1.tar.gz?download) or
[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-elepot1.zip?download)
]<br />
＋[前のステップ](../../../Documents/QScriptのチュートリアル/StepA4)のサンプルファイルも必要です！！

## 表面電荷により分子表面を着色する

CueMol自身には表面電荷を計算する機能がありませんが，
[Grasp](http://honiglab.cpmc.columbia.edu/grasp/)
や
[DelPhi](http://trantor.bioc.columbia.edu/delphi/)
で計算した表面電荷ファイルを読み込んで表示することができます．

まず，IRIX上のGraspで表面電荷を計算します．そして，計算結果を"blm.pot"というファイルに保存してからFTP等でWindows上に持って来ます(上記ファイルにはすでに結果が含まれています)． 
DelPhiならLinux等他のOSでも動くようですが．


![elepot](../../../assets/images/Documents/QScriptのチュートリアル/StepA5/elepot.png){ .on-glb }


<pre>
01: $pwd = sys.getScriptPath();
02: 
03: qobj.readObj("PhiMapReader",$pwd+"blm.pot","blmpot");
04: $surf = readMSMS($pwd+"blm.face", "surf");
05: $r_sf = $surf.createRend("r_sf", "molsurf");
06: $r_sf.setProp("scalarobj", "blmpot");
07: $r_sf.setProp("colormode", 1);
08: $r_sf.setProp("lowpar", -10.0);
09: $r_sf.setProp("lowcol", color(1.0, 0.0, 0.0));
10: $r_sf.setProp("midpar", 0.0);
11: $r_sf.setProp("midcol", color(1.0, 1.0, 1.0));
12: $r_sf.setProp("highpar", 10.0);
13: $r_sf.setProp("highcol", color(0.0, 0.0, 1.0));
14: 
15: $mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");
16: 
17: $mol.select(%{resn blm%});
18: $r_blm = $mol.createRend("r_blm", "ballstick");
19: $r_blm.setProp("sphr", 0.5);
20: $r_blm.setProp("bondw", 0.4);
21: 
22: gfx.setCenter($r_blm.getCenter());
23: gfx.updateView();
</pre>

:行番号|
03
:   Readerを指定してDelPhi/Grasp形式のファイルを読み込んでいる．第一引数"PhiMapReader"がReader名，第２引数が読み込むファイルのパス名，第３引数が読み込まれた電荷マップオブジェクトにつけるQue上での名前． 

04-05
:   前のセクションと同様に，MSMS形式のサーフェスを読み込んでレンダラーを作っている． 

06-07
:   サーフェス・レンダラーのプロパティを設定．"colormode"プロパティを1（整数値）にすると，表面電荷で色付けするモードになる（0はデフォルトのべた塗りモード）． "scalarobj"プロパティは，色付けするときに参照するスカラー・オブジェクトを指定する．スカラー・オブジェクトは，静電ポテンシャルマップだけでなく，電子密度オブジェクトなどでもOK．（ただ，電子密度の濃さに応じて表面を塗る必要が出てくるとはあまり思えないが．．．）  

08-13
:   塗りに関するプロパティを設定．この例では，電荷が負（すなわち低い，酸性）の方に関しては，-10 kT/eの時に赤色，中性に関しては，0 kT/eの時に白色，電荷が正（すなわち高い，塩基性）の方に関しては，10 kT/eの時に青色に，なるように設定している．その結果，分子表面が負電荷の部分に関しては白から赤のグラデーションで塗られるようになり，正電荷の部分に関しては白から青のグラデーションになる．-10 kT/e以下の部分に関しては純色の赤に， 10 kT/eの部分に関しては純色の青に塗られるようになる． 

15-20
:   ブレオマイシンのボールアンドスティックモデルを表示している． 


**注意点**

>サーフェス・レンダラーの塗りに関する実装はad hocなものであり，将来のリリースでは仕様が変更される可能性があります．
