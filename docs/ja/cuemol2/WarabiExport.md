[Documents](../../Documents)

## Warabiを使用したアニメ調レンダリング(Toon rendering)
Warabiというソフトウェアを使用して，toon renderingを行うことができます．

WarabiはWindows版しかないようです．さらに，すでに開発は終了しており，開発元からはダウンロードできないようですが，
warabi downloadなどで[ググる](../../https://www.google.co.jp/search?q=warabi+download)とダウンロードできるようです．

## Wbp/Mqo形式での書き出し
Warabiで読み込んでレンダリングするための形式に書き出すことができます．
[PNGのケース](../../cuemol2/ImageExport)と同様に，メニューの「Render」→「Export scene...」を実行します．
すると下図のようなダイアログが出てくるので，書き出しファイル形式（ファイルの種類(T):）の部分をWarabi project file (*.wbp)を選択し，ファイル名を適切に変え（下図では1crn.wbpと変更）保存(S)ボタンをクリックします．


![warabi-1](../../assets/images/cuemol2/WarabiExport/warabi-1.png){ style="zoom: 0.5" .on-glb }


すると，wbpファイル以外に，同じディレクトリにmqoファイルも生成されます(例では1crn.wbpと1crn.mqo)．

## Warabiの起動とwbpファイルの読み込み
Warabiを起動すると，以下のような画面が出てきますので，メニューから「ファイル」→「開く」を選び，上記で書き出したファイルを選択して「開く(O)」ボタンを押します．


![warabi-2](../../assets/images/cuemol2/WarabiExport/warabi-2.png){ style="zoom: 0.5" .on-glb }


読み込んでも小さすぎて画面では何が出てきているのかわからないかもしれません．
左の「オブジェクトツリー」のカメラアイコンの「_current」という項目を右クリックし，「カメラから視点を復元」を実行します（下図）．


![warabi-3](../../assets/images/cuemol2/WarabiExport/warabi-3.png)


すると，CueMol側で開いていたカメラが現在の視点として読み込まれ，図のような表示になります．


![warabi-4](../../assets/images/cuemol2/WarabiExport/warabi-4.png){ style="zoom: 0.5" .on-glb }


## レンダリングの実行

さらに，メニューから「レンダリング(R)」→「実行(R)」を実行すると，レンダリングが開始され，
下図のような画像が出来上がります．


![warabi-5](../../assets/images/cuemol2/WarabiExport/warabi-5.png){ style="zoom: 0.25" .on-glb }


画像はレンダリングウィンドウの「ファイル」→「名前を付けて保存...」を実行してください．（誤ってウィンドウを閉じると警告もなく閉じられ，画像が失われるので注意）

レンダリング時に，メニューから「レンダリング(R)」→「レンダリングオプション」を実行すると，
画像のサイズや輪郭線の倍率などを変更することが可能です．
画像サイズを大きく（あるいは小さく）しても，輪郭線はピクセル単位で指定するため，
自動では拡大縮小されません（つまり画像を大きくすればするほど線は相対的に細くなる）
それを防ぐためには，画像を1000から2000にした場合は輪郭線の倍率を2にする等，倍率を変更する必要があります．

また，背景の「背景を描画する」というチェックをoffにすると，背景が透明なPNGファイルを作成することができます．
