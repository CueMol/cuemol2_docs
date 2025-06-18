[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



[
このページのサンプルファイル:
[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-molsurf1.tar.gz?download) or
[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-molsurf1.zip?download)
]

現在のところ，CueMolには分子表面を計算する機能はありませんが，
分子表面生成ソフト[MSMS](http://www.scripps.edu/pub/olson-web/people/sanner/html/msms_home.html)が出力した分子表面データを読み込み
表示することが可能です．

## MSMSによる分子表面の計算

MSMSの入力には，PDBファイルではなくXYZRという形式の座標ファイルが必要です．

MSMSに付属のpdb2xyzrで変換することもできますが，
CueMol自体で変換することができます．
メニューの"File"→"Save as ..."で"名前を付けて保存"ダイアログを表示し，
形式選択コンボボックスで"XYZR coordinates (*.xyzr)"を選択し保存すると，
XYZR形式で座標が書き出されます．

ここでは，step1〜4で使用したのと同じブレオマイシン結合たんぱく質の座標から，
ブレオマイシンを除いたものを使用します．
まずブレオマイシンを除いた座標を作る必要がありますが，
UNIX版の場合はPDBファイル"blm_ab_nosec.pdb"を
エディタなどで開いて該当行を削除してやります．

Windows版のCueMolでは，GUIを使用して以下のように読み込んだ座標から
ブレオマイシンを削除できます． 

1.  "blm_ab_nosec.pdb"ファイルを読み込む．Read Objectダイアログではsimpleレンダラーを選ぶ． 
1.  "Mol property"パレットの"MolSel2"タブをクリックし，文法選択ページを表示させる． 
1.  読み込んである分子をMolコンボボックスから選ぶ． 
1.  下のテキストエリアに
resn blm
と入力し，Selectボタンを押すとブレオマイシンが選択される． 

1.  メニュー"Edit"→"Delete selection"（あるいはツールバーの×ボタン）を選択すると選択部分が削除される 
1.  "File"→"Save as..."でXYZR形式で保存． 


次に，変換した座標ファイルを使用して実際に分子表面データを生成します．
MSMSの起動時に"-h"オプションを指定するとコマンドラインオプションの
説明が表示されます．
そのうち主に使用するのは，

-probe_radius 数値
:   プローブの半径を指定する

-density 数値
:   生成される分子表面データの細かさ

-if ファイル名
:   入力ファイル名

-of ファイル名
:   出力ファイル名

でしょう． 

```
C:\molsurf>msms253.exe -density 3 -if blm.xyzr -of blm
MSMS  started on Local PC
Copyright M.F. Sanner (1994)
Compilation flags
INPUT  blm.xyzr 1884 spheres 0 collision only, radii  1.600 to  1.980
PARAM  Probe_radius  1.500 density  3.000
REDUCED SURFACE ...
... (略) ...
MSMS terminated normally
```

上記の例では，-densityオプションを使用してデフォルト値1.0より細かさを上げています．
densityは小さい分子だと３以上にしても問題ないですが，
リボソームなど大きい分子でデフォルト以上にするのは（マシンスペックによりますが）やめといたほうがいいでしょう．

あと，遠くから見た図を作るのであればデフォルト値で十分ですが，
クローズアップした図を作る場合は3以上にしたほうがポリゴンが目立たなくなります．

上記の実行の結果，"blm.face"と"blm.vert"，2つのファイルが出来上がります．
表示にはファイル両方とも必要です． 


## MSMS形式の読込と分子表面の表示

以下のスクリプトでMSMSのファイルを読み込んで表示します．(blmsurf_1.qs)


![blmsurf_1](../../../assets/images/Documents/QScriptのチュートリアル/StepA4/blmsurf_1.png){ .on-glb }


```
01: $pwd = sys.getScriptPath();
02: 
03: $surf = readMSMS($pwd+"blm.face", "surf");
04: $r_sf = $surf.createRend("r_sf", "molsurf");
05: 
06: $mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");
07: 
08: $mol.select(%{resn blm%});
09: $r_blm = $mol.createRend("r_blm", "ballstick");
10: $r_blm.setProp("sphr", 0.5);
11: $r_blm.setProp("bondw", 0.4);
12: 
13: gfx.setCenter($r_blm.getCenter());
14: gfx.updateView();
```

:行番号|

03
:   readMSMS()関数でMSMS形式のファイルを読み込む． (この関数を使用するにはデータファイルのリリースが20030401以降のものが必要)． *.faceファイルのみ指定しているが，読み込み時には同じディレクトリから*.vertファイルも読み込まれるので必ず両ファイルとも同じ位置にある必要がある．さらに，オブジェクト名を"surf"にし，それへの参照を$surfに格納．

04
:   分子表面のレンダラー"molsurf"を作成している．ここではレンダラーに対しては何も設定していないのでデフォルトの白色で表示されているが，"defcol"プロパティーでデフォルト色を設定できる． molsurfは，デフォルト色でのベタ塗り以外に，表面電荷による着色も可能だが，それ以外の塗り方は現在のところ実装されていない．

08-11
:   ブレオマイシンのボールアンドスティックモデルを表示している．

### 色の変更など
単純なべた塗り色の変更は，
レンダラー(molsurf)のdefault色プロパティーdefcolを変更することで行えます．
```
$r_sf.setProp("defcol", color(1,0,0));
```
molsurfレンダラーには，複雑な着色を行うために
様々なプロパティーがありますが，それらについては，

* [QScriptのチュートリアル/StepA5](../../../Documents/QScriptのチュートリアル/StepA5)
* [molsurfの複雑な着色](../../../SASPaint)

で説明しています．