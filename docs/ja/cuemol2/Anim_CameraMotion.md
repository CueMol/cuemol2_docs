[Documents](../../Documents)
## カメラの移動アニメーション
このセクションでは，カメラ（視点の位置・向き・拡大率等）を変化させるアニメーションについて，
例を挙げながら説明します．
（例で説明している作業は，[前セクション](../../cuemol2/Anim_Cmb)の続きの操作として説明しています）

サンプルのqscシーンファイルが以下からダウンロードできます．
*  [lyso_cammotion1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_cammotion1.qsc)：　Lysozymeのカメラ移動アニメーション

### 初期カメラ
アニメーションの開始時は，視点は決まった位置から開始してほしいものです．（単純に回転するだけ等の場合はそうでもないかもしれませんが）

アニメーションパネル中に，下図のように，**Start cam**という設定がありますが，
これにより，アニメーション開始時の画面をどのカメラ視点から見たものにするかが決まります．

> ![anim-panel-cmb1](../../assets/images/cuemol2/Anim_CameraMotion/anim-panel-cmb1.png) ⇒ ![anim-startcam-1](../../assets/images/cuemol2/Anim_CameraMotion/anim-startcam-1.png)

図のように(none)になっている場合は，開始時にカメラの変更が行われません（すなわち再生ボタンを押した状態から開始する）

アニメーションを開始する視点をシーンパネルにてカメラとして保存し，
このドロップダウン・リストから，対応するカメラ(上図ではcamera_0)を選択してください．

以上の設定をした後アニメーションを実行すると，再生ボタンを押したときの視点にかかわらず，
つねに指定したcamera_0からアニメーションが開始することが解ります．

### カメラアニメーションの追加と移動先の設定
カメラアニメーションの追加を行う前に，移動先カメラを追加しておきます．
適当に視点を変更して，シーンパネルにてカメラとして保存しておいてください（以下の説明ではcamera_1として保存したとします）

そして，アニメーションパネルの「＋」ボタンを押して，Camera motionメニューを選択してください．

![anim-cammot-1](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-1.png)



### CamMotionの設定
すると，以下のような設定ダイアログが現れます．


![anim-cammot-2](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-2.png){ style="zoom: 0.5" .on-glb }


Common settingsの部分は，SimpleSpin等他のアニメーションと共通の設定項目です．

CamMotion settingsの部分は，カメラアニメーションに特有の設定です．
Target camera
:   移動先のカメラ設定

Ignore XXX
:   チェックをonにすると，アニメーションの際，該当項目が無視される．たとえば視点中心のみtarget cameraに変更したい場合は，Ignore center以外すべてをチェックすればよい．


この例では，
*  Start timeは0:0:2.0 (defaultでそのようになっているはず．なっていない場合はそのように設定)
*  Durationは0:0:2.0にする（defaultは1秒で少々速すぎるので2秒に変更)
*  Quadricは0.25にする
*  Target cameraはcamera_1にする

以上の変更を行ったうえで，OKボタンを押してください．

## 作成したアニメーションの確認
以上のような作業を行うと，最終的にアニメーションパネルは以下のようになります．

![anim-cammot-3](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-3.png){ .on-glb }

このパネルの表示の意味するところは，
*  アニメーションは全長で４秒間 (Durationが0:0:4.0)
*  アニメーションはcamera_0から開始
*  0〜1秒間，SimpleSpin1により360度回転
*  1〜2秒間，SimpleSpin2により-360度回転
*  2〜4秒間，CamMotion1により，視点がcamera_1に移動する

ということです．
(以上で作成したシーンは，
[lyso_cammotion1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_cammotion1.qsc)からダウンロードできます)

## アニメーションの再生
Animation ribbonの再生ボタンを押すとアニメーションが再生されます．
以下のyoutube動画のようになるはずです．
#youtube(V-Vtkx0vnxw)