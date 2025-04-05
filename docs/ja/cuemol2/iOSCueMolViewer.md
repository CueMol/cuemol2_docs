[Documents](../../Documents)

## iOS版CueMol viewerについて

## これは何？
iOSで動作するCueMolのモバイルデバイス版です．
以下のことが可能です．


-  右クリックによる原子名等の情報表示と，View 中心への移動

-  Cameraに保存された視点，視方向への移動

-  各object, renderer毎の表示・非表示の変更

プレゼン・ディスカッション等のために，
構造を見る・見せることだけに特化しているため，上記以外の編集作業はできません．

基本的に，以下の流れで使用するものと考えていただければと思います．
1.  Desktop版CueMolでシーンを作成
1.  Mobile device用にpolygon数などを調節する([Light weight scene](../../cuemol2/LightWeightScene)を参照)
1.  QSLファイルに書き出す([Light weight scene](../../cuemol2/LightWeightScene)を参照)
1.  Deviceに転送
1.  iOS版CueMol viewerで表示

## Install
Apple storeから無料でダウンロード・インストール可能です．

http://itunes.apple.com/us/app/cuemol/id496236710?ls=1&mt=8

## 使用方法
主にユーザインタフェイスは以下の３つからなります．

-  File browser

-  Molecular viewer

-  Display panel

### File browser
CueMol viewerで利用可能なファイル一覧が表示されます．

ファイル名の部分をタップすると，そのファイルが開かれ，Molecular viewerに移行します．
（その際エラーが出ると，メッセージボックスが表示されFile browserに戻ってしまいます）

インストール時には，サンプルの[qslファイル](../../cuemol2/LightWeightScene)とPDBファイルが表示されていると思います．


![file-browser-2](../../assets/images/cuemol2/iOSCueMolViewer/file-browser-2.png){ style="zoom: 0.5" .on-glb }


#### Edit mode
右上のEditボタンを押すとedit modeになり，一覧からファイルを削除できるようになります．
ただし，元々入っているsample file 2つと下記のiTunesを利用して転送したファイルは削除できません．
（iTunesを利用して転送したファイルはiTunes側から削除できるとおもいます）

editが終了したら，再度右上のボタンを押してedit modeを終了させてください．

#### Settings
左上のギアアイコンをクリックすると設定画面が表示されます．
現在はバージョン情報などが表示されるだけであまり設定項目はないですが，
今後増えていくかもしれません．

### Molecular viewer
文字通り，分子が表示される画面です．


![mol-viewer-1](../../assets/images/cuemol2/iOSCueMolViewer/mol-viewer-1.png){ style="zoom: 0.5" .on-glb }


以下の操作が可能になっています．
Single finger scroll
:   画面が回転します（PC版のマウス左ボタンドラッグと同様）

Double finger scroll
:   画面が平行移動します（PC版のマウス右ボタンドラッグと同様）

Three finger scroll
:   Slab depthが変化します（iPad/iPhoneの設定により，Three finger swipeを別の操作例えば画面ズーム等に割り当てていると動作しないようです）

Pinch
:   画面のズームが変化

Rotate
:   画面がZ軸（画面に垂直な方向）を軸に回転

Double tap
:   タップした位置に原子があるとメニューが表示される

Long press
:   画面上方にメニューが表示される


#### Double tapメニュー
分子中の原子がある位置をダブルタップ（二回一本指で軽くタップする）すると，以下のようなメニューが表示されます
原子名
:   原子名が表示されます．選択しても何も起こりません

Center here
:   文字通り，画面の中心がこの原子の位置に移動します



![mol-viewer-menu-1](../../assets/images/cuemol2/iOSCueMolViewer/mol-viewer-menu-1.png){ style="zoom: 0.5" .on-glb }

#### Long pressメニュー
Molecular viewerの中のどの部分でもよいので，Long press（長押し）すると，画面上方にメニューバーが表示されます．
Back (iPhone)あるいはCueMol files (iPad)と書かれたボタンを押すと，File browserに戻ります．
Displayと書かれたボタンを押すと，下記のDisplay panelが表示されます．


![mol-viewer-menu-2](../../assets/images/cuemol2/iOSCueMolViewer/mol-viewer-menu-2.png){ style="zoom: 0.5" .on-glb }


### Display panel
CueMol PC版のSceneパネルに相当するものです．


![display-panel-2](../../assets/images/cuemol2/iOSCueMolViewer/display-panel-2.png){ style="zoom: 0.5" .on-glb }


Objects中の該当項目をクリックすると，
シーン中のObject/Rendererの表示・非表示がトグルされます．

Camera中の該当項目をクリックすると，そのカメラに保存された視点に，Molecular viewerの視点が移動します．
デフォルトでは__currentというカメラしかありませんが，これはqslシーンファイルがロードされたときに表示される設定になります（[qslファイル](../../cuemol2/LightWeightScene)参照）．
これを利用して複数の視点を切り替えて使用するには，前もってCueMol PC版でカメラに視点を保存しておく必要があります．

## PCなどからのファイル転送
iOS版CueMolはviewerに特化しているため，表示させるシーンは前もってPCで作成しておき，下記の方法でiPhone/iPadに転送する必要があります．
### iTunesを利用した方法
iTunesのファイル共有機能を使ってPCからデバイスにファイルを転送することができます．

http://support.apple.com/kb/HT4094?viewlocale=ja_JP

上記のリンク先のように，CueMolの書類としてqslあるいはpdbファイルを開き，
同期させるとデバイスにファイルが転送され，上記のFile browserに表示され開けるようになります．

### Dropboxなどのストレージサービスを利用した方法
DropboxやSugar syncにqslやpdbファイルを放り込んでおけば，iPhone/iPad版DropboxやSugar syncで該当ファイルを開くと（いったんファイルが開けない旨が表示されますが）アプリを選ぶメニューが出てくるので，
そこでCueMolを選択すれば，該当ファイルがCueMolでopenされます．

### その他
他にsafariなどのウェブブラウザでもPDBやqslファイルへのリンクをクリックすると
アプリを選ぶメニューが出てくるので，
そこでCueMolを選択すれば，該当ファイルがCueMolでopenされると思います（多分・動作未確認）

## QSLファイル以外の扱い
### PDBファイル
一応PDBファイルを開くことができます．

ただし，限バージョンではデフォルトで表示されるsimple表示（線描）以外で表示することができません．

今後余裕があれば表示を作成・変更できる簡易UIを実装したいと考えています．
