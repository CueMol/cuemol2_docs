[Documents](../Documents)

**注意点**
:   CueMol2 ActiveX controlはversion 2.2.2以降では同梱されなくなりました．


## CueMol2 ActiveX control
このページでは，qscファイル表示に特化した，CueMol2 ActiveX controlについて説明します．

CueMol2 ActiveX controlは，
Word, PowerPointの文書中に埋め込んで使用でき，
例えばPowerPoint文書中に埋め込んで使用することで，
インタラクティブに分子を回転させたりできる，
静止画像やmovieとはまた違ったプレゼンテーションを行えます．

大まかな機能はCueMol1のcontrolと同じなので[CueMol1のページ](../Documents/ActiveX)も参考になりますが，
IEでの使用ができない（http経由でのファイル表示ができない）等，
不必要と思われる機能を省いた形になっています．

このページでは，主に
PowerPoint (Micorosoft Office 2010)
での使用法について説明しますが，
ほかのアプリでも（ActiveXに対応していれば）
大体同じような方法で使えるかもしれないです．

## PowerPointでCueMol2 controlを使う

### インストール
まずはActiveXコントロールのインストールについてです．
[Install](../Install)にも書かれているとおり，
CueMol2本体のインストーラーのウィザードの，
「Select Additional Task」のところで，
ActiveXコントロールのインストールを選択するとインストールされます．
一応，ActiveXコントロールは危ないのでいやだ，
と思っている人もいるかもしれないので，
意図せずにインストールしてしまうのを防ぐようデフォルトはoffになっています
（念のため，CueMol2コントロール自体は，別にインストールしたからといって
危険なものではありませんが）．


![activex-install-1](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-install-1.png)


ここで，「Register the CueMol2 ActiveX control」をチェックして
インストールを行うと，install先ディレクトリ(defaultはC:\Program Files\CueMol 2.0\)に，

-  CueMol2Ctl.ocx (ActiveX control本体)

が追加でインストールされ，以下の処理が行なわれます．


-  CueMol2 ActiveX Controlというコントロールが，
b3c22d9d-cb97-4692-8097-2a36ecd9970bというGUIDでレジストリに登録される

### 表示したいシーンの作成
まず，表示したいシーンを作成し，qscファイルとして保存します．
ともかくも，シーン（qscファイル）を読み込んだら，
分子の図が見せたい方向と大きさで出るようにしておくわけです．

### PowerPoint側での準備
次に，PowerPointのほうで，リボンのところに「開発」というのを表示させるようにします．
これはデフォルトでは出てないですが，
1.  「ファイル」リボンをクリックする
1.  「オプション」という項目をクリックするとオプションダイアログが表示される．
1.  ダイアログの左のカラムの下の方にある「リボンのユーザー設定」という項目をクリックする
1.  右側に「開発」という項目があるので，そのチェックボックスをonにする．


> ![activex-pptsetting-1](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-pptsetting-1.png){ style="zoom: 0.7" .on-glb } → ![activex-pptsetting-2](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-pptsetting-2.png){ .on-glb }  → ![activex-pptsetting-3](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-pptsetting-3.png){ style="zoom: 0.8" .on-glb } 

つぎに，以上の設定により新たに出てきた「開発」リボンをクリックし，
コントロールのグループにある「コントロールの選択」ボタンをクリックします．


![activex-insctrl-1](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-insctrl-1.png){ .on-glb }


すると，以下のようにインストールされているActiveXコントロールの一覧が
出てきますので，その中から「CueMol2 ActiveX Control」を選択します．


![activex-insctrl-2](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-insctrl-2.png){ .on-glb }


マウスカーソルが「＋」の形になるので，
四角形を描くのと同じ要領で，コントロールを配置したい場所で，
マウスを左ドラッグします．
すると，以下のようにコントロールが配置され，
CueMol2のアイコンやバージョン情報などが出てきます．


![activex-insctrl-3](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-insctrl-3.png){ .on-glb }


### 表示するqscファイルを指定する
コントロールの領域に，表示するデータがロードされていない旨が表示されていますが，これからデータのソース（qscファイル）を指定します．
コントロールの領域で右クリックをすると，以下のようなコンテキストメニューが
表示されるので，その中から「プロパティー」を選びます．


![activex-setprop-1](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-setprop-1.png)


つぎに，プロパティーページの「Source」項目（の右側）に文字が入ると思いますが，
そこにqscファイルのパス名(C:\foo\bar\baz.qscなど)を入力します．


![activex-setprop-2](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-setprop-2.png)


ここに入力するqscファイルのパス名は，ドライブ文字やUNCを含む絶対パスでも，
埋め込み先ppt (or pptx)ファイルに対する相対パスでもOKです．

### スライドショーの実行
プロパティーページの「OK」ボタンを押すと，
コントロール領域に設定したファイル名が表示されます．
スライドショーを実行すると，コントロール領域に分子が表示されます．
CueMol2でqscファイルを読み込んだときと同じ表示になっていると思います．


![activex-sample-1](../assets/images/cuemol2/CueMol2Ctl_ocx/activex-sample-1.png)


### CueMolコントロールの操作
スライドショーを実行している時に，
コントロール領域（上の図の黒い矩形部分）でマウスを左ドラッグすると，
分子の表示を回転させることができます．
また，右ドラッグで平行移動になります．
マウス操作は，アプリ版CueMolの分子ビューでの操作と同じです([Documents/GUIのチュートリアル/Step2](../Documents/GUIのチュートリアル/Step2)参照)．
ただし，クリックで原子情報を表示させたり，
コンテキストメニューを出したりは，できません．

あと，マウスでコントロールを操作（分子を回転させたり）した後は，
キーボードの入力フォーカスがコントロールに移った状態になっています．
なので，キーボードからspaceキーやback spaceキーを押しても，
CueMolコントロールにキー入力が取られてしまい，
スライドを進めたり戻したりすることができません．
**コントロール領域外をクリックする**ことで，
入力フォーカスがPowerPoint本体に戻り，
キー操作でスライドを進めたり戻したりすることができるようになります．

プレゼンテーションの時に，スライドを進めたり戻したりするのを
キーボードからやっている人は，このことを知らずに使うと
はまってしまう（次のスライドに行けない）かもしれませんので，
注意してください．

## アニメーションについて
CueMol 2.1以降(2.1.0.241)では，アニメーションを使用することができます．

### シーンにアニメーション設定がある場合
画面を右クリックすると非常に簡単なメニューが表示されます．

![ocx_anim_menu1](../assets/images/cuemol2/CueMol2Ctl_ocx/ocx_anim_menu1.png){ .on-glb }


文字通り，

-  start animationでアニメーション開始

-  stop animationで終了

-  pause animationで一時停止（再開はstart animation）

となっています．

### シーンにアニメーション設定がない場合
QSCファイル中にアニメーションの設定がない場合，あるいはPDBファイルを読み込んだ場合等は，
画面を中心に垂直軸方向に10秒で360度回転するアニメーションが自動的に作成されます．

上記のように右クリックでメニューを出し，
単にゆっくり回転するアニメーションを表示させることが可能です．

#### ## その他もろもろ

### PDBファイルの表示
上記のSourceプロパティーにはqsc以外にpdbファイルも指定できますが，
simple表示以外で表示することはできません．
複雑な表示が必要なときはqscファイルを作ってそちらを読み込ませるようにしてください．

### ラベル表示とフォントの設定
現バージョンでは，原子ラベルなど文字が含まれる表示が正しく表示されません．
今後修正していく予定です．

### QSLファイルの表示
2.0.1.188以降のバージョンでは，Light-weight sceneの表示にも対応しています．

Light-weight scene については，[Light-weight scene について](../cuemol2/LightWeightScene)をご覧ください．

プレゼンで使うときはrendererの編集などは基本やらないでしょうから，Light-weight sceneで十分間に合うことが多いと思います．（~~ただし，リンク先にも説明があるとおり現バージョン2.0.1.188では拡張子をqscに書き換えないと読み込んでくれないというバグがあるので注意してください~~）

QSLファイルにすれば，文字ラベルなども表示されるようになります（ただしプレゼン中にクリックしてラベル表示させたりとかはできない）
