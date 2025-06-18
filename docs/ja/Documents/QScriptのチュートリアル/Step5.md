[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



## 現在の視点を保存する
スクリプトで表示後，マウス操作で見やすい向きに試行錯誤でビューを回転・移動した場合，その情報も保存して，次回のスクリプト実行からはすぐにそのビュー設定で表示されれば便利です． 

そのためには，以下のコマンドを実行して現在のビュー情報をファイル(blm_intr.view)に書き出します． 

Que> gfx.saveView("blm_intr.view");

Windows版の場合，同等の操作は，メニュー"File"→"Save view setting..."でも行うことができます． 

書き出されたファイルの内容は，現在のビューを保存したときの状態に復元するQScriptのコマンドになっています． 

```
gfx.setCenter(vector(36.850,10.573,21.716));
gfx.setZoom(13.817);
gfx.setSlab(35.976);
gfx.setRotQuat(vector(0.47033,0.05464,-0.87909,0.05477));
```

次に，ビューの状態を復元するには，このスクリプトファイルをsys.exec()メソッドで実行します．すなわち，スクリプトの最後のビューを設定する部分

> gfx.setCenter($r_g1.getCenter());

という行を，

> sys.exec($pwd+"blm_intr.view");
で置き換えます．（ファイル：blm_intr2.qs）

ところで，これでは誤ってblm_intr.viewファイルを消してしまった場合や
viewファイル以外を他の場所に移してしまった場合にいちいちエラーが出て
うっとおしいわけです．
以下のようにすれば，エラーが出ればレンダラーの重心に画面が合うようになります．

```
try {
  sys.exec($pwd+"blm_intr.view");
}
catch {
  gfx.setCenter($r_g1.getCenter());
}
```


## 画像の保存
メニュー"File"→"Export scene..."で現在のビューの内容を画像ファイルとして
書き出すことが出来ます．

「名前をつけて保存」ダイアログで，ファイルの種類を"Portable Network Graphics"にし，ファイル名をつけて保存してください．

次に，"Image options"ダイアログが表示されますが，defaultだと
現在のビューの大きさと同じサイズになっていますが，
"Width", "Height"を変えることも出来ます．
"Retain aspecto ratio"をONにしておくと，たとえばwidthのみを変更すれば，
現在のビューの縦横比が保持されて勝手にheightも変わります．
"Anti-aliasing"をOFF以外にすると画像がアンチエイリアシング処理され，
よりぎざぎざの少ないきれいな画像になりますが，結構時間がかかります．
8以上などにすると，途方も無い時間がかかったりします．


![imgoption](../../../assets/images/Documents/QScriptのチュートリアル/Step5/imgoption.png){ .on-glb }


同じことをQScriptからやるには，以下のようにします．
```
gfx.writeScene("test.png", "png");
```

上記では画像の大きさは1000x1000のデフォルトになりますが，
以下のように3番目の引数としてハッシュ変数でオプションを与えてやると
上述と同じような変更が効きます．aaoptが，anti-aliasingの値に対応しています．0でOFFになります．
```
gfx.writeScene("test.png", "png", {width=>2000, height=>2000, aaopt=>8});
```

## 立体視の図を作る 
平行視などで立体視できる図を作成するには，図を画面に表示させた状態で，コマンドラインから以下の命令を実行し，画面のスナップショットを取ります． 
```
Que> gfx.rotate(vector(0, 3, 0));
Que> gfx.updateView();
(左眼用の画像をキャプチャする)
Que> gfx.rotate(vector(0, -6, 0));
Que> gfx.updateView();
(右眼用の画像をキャプチャする)
```

これで，下のような平行視の図ができました． 


![blm_intr_stereo](../../../assets/images/Documents/QScriptのチュートリアル/Step5/blm_intr_stereo.png){ .on-glb }


Windows版であれば,GUIのView palette(メニュー"Window"→"ViewRot Palette"で表示)の "RotY"のところのテキストボックスに回転したい角度を入力しEnterを押すことで，指定量だけビューを回転させることができます．この機能を利用して立体視の図を作成することもできます． 

![viewrotwnd](../../../assets/images/Documents/QScriptのチュートリアル/Step5/viewrotwnd.png){ .on-glb }
