[Documents](../Documents)



## 分子表面(溶媒接触表面)の断面生成

Version 1.1.0.127から分子表面(MolSurf)オブジェクトを平面で切断し，
断面を生成する機能が追加されました．

### GUIによる断面生成
#### データの読み込み
GUIあるいはスクリプトを使用して，MSMSで生成した分子表面を読み込みます．
ここでは，[チュートリアル](../Documents/QScriptのチュートリアル/StepA4)
と同じデータ（blm.face/blm.vert）を使用しています．


![cbp_surf1](../assets/images/Documents/SASCut/cbp_surf1.png){ .on-glb }


#### 切断面の指定
まず，
視線の方向，視点の位置のZ方向並進，スラブを調節して（GUIチュートリアル[参照](../Documents/GUIのチュートリアル/Step2)），
下図の様にスラブで分子表面が切断されて中が見えるような状態にします．


![cbp_surf2](../assets/images/Documents/SASCut/cbp_surf2.png){ .on-glb }


#### 切断の実行
次に，メニュー「Tools」→「Cut surface object」を実行します．


![cbp_surf_dlg1](../assets/images/Documents/SASCut/cbp_surf_dlg1.png){ .on-glb }


Combo boxからblmを選び（この場合は一つしかないので始めから選ばれている），
triangulation densityを設定します．
triangulation densityの値は，MSMSの-density optionで指定した値と
同じか少々大きめにするのが良いでしょう．
大きすぎるあるいは小さすぎる値を指定すると，フリーズしたり落ちたりする
かも知れませんので注意してください．

MSMSのデフォルトで-density値は3くらいになっていますが，
それより少々細かめということで，ここでは5を指定しています．


![cbp_surf3](../assets/images/Documents/SASCut/cbp_surf3.png){ .on-glb }


OKを押すと，現在のスラブによる断面で，実際にMolSurfオブジェクトが切断されます．
ただし，OKを押した直後はスラブによる切断と重なって，画面上では
何も起こっていないかのように見えることがあります．
ともかくも，回転させたり，スラブを最大にしてみると，上図のように切断されているのが確認できます．

#### 注意点
特に，「切断面の指定」を注意深くやる必要があります．
今のところ，図のような切断面に穴が開いたようなケースも
適切に処理されるようになっていますが，
場合によって，おかしなポリゴンが生成される可能性もあります．

あと，下図のように切断面の形状が「めがね状」あるいはくびれた部分（赤で囲んだ部分）があると，うまくポリゴン生成がいかなくなります．


![cbp_surf4](../assets/images/Documents/SASCut/cbp_surf4.png){ .on-glb }


この場合，断面生成を行うと，下図のような誤ったポリゴンが生成されてしまいます．


![cbp_surf5](../assets/images/Documents/SASCut/cbp_surf5.png){ .on-glb }


こういうおかしな断面が生成されてしまった場合はUndoをすると切断前に戻りますので，
切断面がめがね状にならないようにスラブ等を調整したうえで，
再トライしてください．

さらに，一度切断した面をさらに切断した場合も，おかしくなります．

まあこれらはいわばバグなわけですが，今後改善していきたいと思っております．

### 切断したMolSurfオブジェクトの保存
今のところ保存が出来ません．今後のバージョンアップで対応予定です．

### スクリプトによる切断

QScriptを使用して切断する場合は，
```
molvis.cutSurfByPlane(MolSurf obj，density, plane_dir, plane_pos)
```
methodを使用します．

チュートリアルの[静電ポテンシャル表示](../Documents/QScriptのチュートリアル/StepA5)と組み合わせて使用すると，以下のようになります．

<pre>
$pwd = sys.getScriptPath();
# 静電ポテンシャル読込み
qobj.readObj("PhiMapReader",$pwd+"blm.pot","blmpot");
# MSMSファイル読込み
$surf = readMSMS($pwd+"blm.face", "surf");
# $surfを切断
molvis.cutSurfByPlane($surf, 5, vector(0,1,0), vector(35.31, 0.07, 31.33));
# molsurfレンダラーを作成
$r_sf = $surf.createRend("r_sf", "molsurf");
# molsurfレンダラーのペイント設定
$r_sf.setProp("scalarobj", "blmpot");
$r_sf.setProp("colormode", 1);
$r_sf.setProp("lowpar", -10.0);
$r_sf.setProp("lowcol", color(1.0, 0.0, 0.0));
$r_sf.setProp("midpar", 0.0);
$r_sf.setProp("midcol", color(1.0, 1.0, 1.0));
$r_sf.setProp("highpar", 10.0);
$r_sf.setProp("highcol", color(0.0, 0.0, 1.0));
# リガンドのスティックモデル
$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");
$mol.select(se/resn blm/);
$r_blm = $mol.createRend("r_blm", "ballstick");
$r_blm.setProp("sphr", 0.5);
$r_blm.setProp("bondw", 0.4);
$mol.deselect();
# 視点の設定等
gfx.setCenter($r_blm.getCenter());
gfx.updateView();
</pre>

少々分かりにくいですが，上記スクリプト中の以下の部分で切断を行っています．
```
molvis.cutSurfByPlane($surf, 5, vector(0,1,0), vector(35.31, 0.07, 31.33));
```
以下でcutSurfByPlane()の引数を説明します．
第1引数 $surf
:   MolSurfオブジェクトを指定します．ここでは前行で$surfに読み込んだオブジェクトを代入していますので，それを指定しています．

第2引数 5
:   Triangulation densityを指定．これはGUIで指定しているものと同じ．

第3引数 vector(0,1,0)
:   切断面の法線を指定．法線は正規化されていなくても良い．MolSurfオブジェクトのうち**法線方向は残り，法線と逆方向が削除される**．よって，できる切断面の法線は，ここで指定した法線と逆向きを向いていることになる．

第4引数 vector(35.31, 0.07, 31.33)
:   切断面中の任意の一点を指定．この点を通り，第3引数を法線として持つような平面で切断される．


上記のスクリプトを実行すると，以下のような図が生成されます．


![cbp_surf_qs1](../assets/images/Documents/SASCut/cbp_surf_qs1.png){ .on-glb }


#### カット面の指定方法の工夫
カット面を点と法線で指定するのはなかなか難しいので，
例えば原子の位置を利用して指定するようにプログラムすることも出来ます
（少々面倒ですが）．

<pre>
$pwd = sys.getScriptPath();

# リガンドのスティックモデル
$mol = readPDB("$pwd/blm_ab_nosec.pdb","blm_ab");
$mol.select(se/resn blm/);
$r_blm = $mol.createRend("r_blm", "ballstick");
$r_blm.setProp("sphr", 0.1);
$r_blm.setProp("bondw", 0.1);
$mol.deselect();

# MSMSファイル読込み
$surf = readMSMS($pwd+"blm.face", "surf");

# 3点を指定
$atom1_sel = se/_.1002.C47/;
$atom2_sel = se/_.1002.S46/;
$atom3_sel = se/_.1002.C46/;

$mol.select($atom1_sel);
$atom1_pos = $mol.getCenter();
$mol.select($atom2_sel);
$atom2_pos = $mol.getCenter();
$mol.select($atom3_sel);
$atom3_pos = $mol.getCenter();

# 法線を計算
$normal = ($atom1_pos-$atom2_pos)**($atom3_pos-$atom2_pos);
# カット実行
molvis.cutSurfByPlane($surf, 5, $normal, $atom2_pos);

# molsurfレンダラーを作成
$r_sf = $surf.createRend("r_sf", "molsurf");

# 視点の設定等
gfx.setCenter($r_blm.getCenter());
gfx.updateView();
</pre>


![cbp_qs2](../assets/images/Documents/SASCut/cbp_qs2.png){ .on-glb }


このスクリプトでは，
$atom1_pos
:   残基1002の原子C47の位置(_.1002.C47)

$atom2_pos
:   残基1002の原子S46の位置(_.1002.S46)

$atom3_pos
:   残基1002の原子C46の位置(_.1002.C46)


となっています．
そして，二つのベクトル

-  ($atom1_pos-$atom2_pos); S46→C47ベクトル

-  ($atom3_pos-$atom2_pos); S46→C46ベクトル

の外積(QScriptでは**であらわす)を計算して法線としています．
二つのベクトルの外積は，それぞれに垂直なベクトルになります．
向きは，S46→C47を右手の親指，S46→C46を右手の人差し指とすると，
中指の方向になります．（高校の物理とかで習ったと思いますが，フレミング右手の法則とかを思い出してください）

![righthand](../assets/images/Documents/SASCut/righthand.png){ .on-glb }

図の手の絵は向きがちょっと違いますが，青矢印がS46→C47ベクトル，赤矢印がS46→C46ベクトルとすると，法線は黒矢印の向きになります．
それで，molvis.cutByPlane()の引数の説明にもあるとおり，この法線の方向の
表面が残るので，図のような断面が出来るわけです．

面の出来方をひっくり返したい場合は，外積(**)の前後を入れ替えればよいわけです．
