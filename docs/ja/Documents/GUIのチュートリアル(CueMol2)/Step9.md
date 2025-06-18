[ [GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/) |
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step8) |
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step10) ]

## Cameraの操作
### Cameraの追加
分子を見ているときに，
ある視点を保存しておいて，後で再度その視点で見てみたいことがあったりするかもしれません．
そういう場合は，Cameraとして視点の位置や向きなどを名前を付けてシーン中に保存しておくことができます．

![gui-step9-camera1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui-step9-camera1.png)

Sceneパネルの，Cameraと書かれた項目を選択し![gui_step4_newrnd](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui_step4_newrnd.png)ボタンを押すと，新規Cameraが作成され，現在の視点の位置や向き，ズーム，スラブなどすべての情報が保存されます．

![gui-step9-camera-name1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui-step9-camera-name1.png)

以上のように，名前を指定するダイアログが出てくるので，適当に名前を入力してOKボタンを押します（デフォルトの名前でもOK）．

すると，以下のようにCameraの下層に今作成したcamera_0という新しいCameraが作成されているのがわかると思います．


![gui-step9-camera-added1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui-step9-camera-added1.png)


この状態で，ビューの方を適当にドラッグしたりして視点を変えたり，ズームを変えたりしてみてください．
そしてその後，Sceneパネルのこのcamera_0という項目をダブルクリックしてみてください．保存した視点の状態に戻ってくることがわかると思います．

### Cameraのcontext menu

![gui-step9-camera-ctxtmenu1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui-step9-camera-ctxtmenu1.png)


Cameraの項目を右クリックすると，上図のようなコンテキストメニューが表示されますが，それぞれの機能は以下のようになっています．

New camera...
:   新規Cameraの作成．![gui_step4_newrnd](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui_step4_newrnd.png)ボタンと同じ機能．

Delete camera
:   Cameraの削除．マイナスボタンと同じ機能．（バージョン2.0.0.94以前では削除がundoできないので注意）

Save from view
:   現在のビューの状態を，対象のCameraに保存する．もとにあった情報は上書きされて消えてしまうので注意．

Apply to view
:   対象のCamera情報をビューに適用する．上記で説明しているダブルクリック操作と同じ効果．

Properties...
:   Cameraのプロパティー編集画面が出てくる．

バージョン2.0.0.94以前ではCameraに関する操作はすべてundo/redoできないので注意してください．

### __currentとうい名前の特殊なCamera
もし，一度保存したシーンを読み込んで操作している場合は，
上図のように，__currentという名前のCameraがはじめからできていると思います．

シーンを保存したときには，保存したときのViewの状態が，__currentという名前のCameraに格納され，保存されます．
そして，そのシーンを読み込んだときは，この__current CameraがViewに適用されるため，保存時のビューの状態が復元されるようになっています．

なので，この__currentというCameraをダブルクリックすると，シーンを保存したときのビューの状態に戻ることができます．

## 複数Viewの操作
CueMol2では，１つのシーンに複数のビューを接続することができます．
### 第２のViewを追加する
まず，新規タブ作成を行ってください．
ツールバーの![gui-step9-newtabbtn1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui-step9-newtabbtn1.png)あるいはメニューから「File」→「New Tab」を実行します．


![gui-step9-newtab1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui-step9-newtab1.png){ style="zoom: 0.5" .on-glb }


[前頁](../../../Documents/GUIのチュートリアル(CueMol2)/Step6)で新規シーンを作成した時と同じダイアログが表示されますが，
下図のように，New View forの方を選択し，OKを押します．
Viewの名前はデフォルトで適当なもの（この場合は数字の１）がつけられますが，
他のにしたかったら入力してください．

あと，下のInherit view propsにチェックが入っていますが，この状態でOKを押すと，現在のビューの状態が新しく作られたビューにコピーされます（すなわち同じ視点になる）．

図のように，tutorial1.qscに対して，0（はじめからあるビュー）と1（今新しく作ったやつ）２つのタブができていることがわかると思います．

![gui-step9-view-added1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step9/gui-step9-view-added1.png)

どちらのビューも同じシーンtutorial1.qscに接続しているため，
クリックや選択などをどちらから操作しても全てtutorial1.qscに影響します．
一方，視点の向きや位置などは，各々のビューに保持されているため，
違う見方などを，タブを使って素早く切り替えることが可能です．

#### Viewの必要性？
ここでお気づきかもしれませんが，複数視点を保存してその間を素早く行き来する，というのは別にViewを使わなくても，上記のCameraでもできるわけです．

さらに，Cameraはシーンとともにqscファイルに保存されますが，**Viewは保存されません**．Cameraを使った方がメリットがあります．

なので，作っておきながらこういう書き方をするのはなんですが，
複数View機能はそもそも要らないのかもしれません．

[ [&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step8) |
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step10) ]