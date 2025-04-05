[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/)



## 電子密度の読み込み

次に，電子密度を読み込んでみましょう．ここでは，1QIOの構造因子とモデルから計算した2Fo-Fc電子密度マップ1qio_map_coeffs.mtz（CCP4 MTZ形式）を例として使用しています．
(サンプルファイルは以下から取得可:
[zip format](http://downloads.sourceforge.net/project/cuemol/sample-files/2.0.0/1qio_map_coeffs.zip)
ただし圧縮されているので適当なソフトウェアで解凍して使用して下さい)

メニュー「File」→「Open」で表示されるファイルを開くダイアログで，
ファイル形式をMTZ Structure Factor (*.mtz)を選択します．
1qio_map_coeffs.mtz (あるいは1qio_001_map_coeffs.mtz)を選択して「開く」ボタンを押します．
するとオプションダイアログが表示されます．


![c2_mtz_option1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC2/c2_mtz_option1.png)


まず，Rendererタブで共通オプションを設定します．<br />
「Name」で読み込む電子密度のオブジェクトを指定します．ここではデフォルト(1qio_001_map_coeffs.mtz)のままにしておきます．
CueMolでは，電子密度も分子モデルなどと同様にオブジェクトとしてメモリー上に格納されます．Rendererは**contour**のままでOKです．

**Recenter view**をonにすると，現在の視点を中心に電子密度マップが表示されます（offにすると座標系の原点あたりに領域が表示され何も出てこないかもしれないので注意）．

### MTZファイル特有のオプション

![c2_mtz_option2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC2/c2_mtz_option2.png)


次に，MTZ optionsタブで，MTZファイル読み込みに関したオプションを設定します．<br />
基本的にデフォルトのままでOKですが，場合によっては変更が必要です．

分解能のデフォルト値（図では1.2）は，MTZファイルにある最大の分解能になっています．基本的にはデフォルトのままでＯＫですが，必要に応じて下げることも可能です．

Grid spacingというのは，FFTを行うgridの細かさです．Fineにすると分解能/4，Coarseにすると分解能/3になります．Coarseは表示が荒くなりますが，表示が遅い場合や広範囲のマップを表示したい場合はCoarseにした方が良いかもしれません（Coot等のdefaultはCoarse相当に見えます）．

#### FFTするcolumnの設定
さらに，上の３つ（Amplitude, Phase, Weight）のDrop-down listbox では，FFTに使用する(MTZファイル中の)カラム名を指定します．
Column名は，mtzファイルを生成したソフトウェアによって異なっていますが（サンプルではphenix.refineから作成したもの），CueMol2が2Fo-Fcマップを作成する設定になるように，デフォルトを適当に判断しています．

以下に，典型的なマップの係数の組み合わせを挙げました．（ただし，各ソフト側の設定でカラム名は変えられるので注意）
|Software|Map type|Amplitude|Phase|Weight|h
|phenix.refine|2Fo-Fc|2FOFCWT|PH2FOFCWT|-|
|phenix.refine|Fo-Fc|FOFCWT|PHFOFCWT|-|
|REFMAC5|2Fo-Fc|FWT|PHWT|-|
|REFMAC5|Fo-Fc|DELFWT|PHDELWT|-|
|SIGMAA|2Fo-Fc|FWT|PHIC|-|
|RESOLVE||FM|PHIM|FOMM|
|DM||FDM|PHIDM|FOMDM|

### 分子の表示

OKボタンを押すと電子密度が表示されます．


![c2_density_mesh1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC2/c2_density_mesh1.png){ style="zoom: 0.5" .on-glb }


これではいったい何が何だかよくわかりませんね．
わかりやすいように，モデルの分子構造も読み込んで重ねて表示してみます．
分解能が高い結晶構造の場合は分子のほうを**simple** rendererで表示すればわかりやすいでしょう([Step1参照](../../../Documents/GUIのチュートリアル(CueMol2)/Step1))．


![c2_density_mesh2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC2/c2_density_mesh2.png){ style="zoom: 0.5" .on-glb }


この図のようにzoomしてslab ([Step2参照](../../../Documents/GUIのチュートリアル(CueMol2)/Step2))を薄くしてやれば見やすくなります．
ところで，なぜcontourというのかというと，普通出てくる電子密度の表示は，
山の地図などでおなじみの２次元の等高線(contour)表示を
３次元に拡張したものだから，というわけです．

## 電子密度の表示・表示変更

GUIメニューの「Window」→「Density map palette」がチェックされている状態なら，
下図のようなパレットが表示されているはずです．
このパレットからは，density map objectにアタッチされたcontourレンダラー（ここでは青色の網目表示と思ってください）のプロパティーを変更できます．


![c2_density_map_palette](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC2/c2_density_map_palette.png)


ボタンなどには以下のような機能があります．
|GUI item|説明|h
|右上combobox|設定変更の対象となるcontourレンダラーを選ぶ|
|Color|文字通り色を設定する|
|Transp|メッシュ表示の透明度(transparency)を指定する．左に行くほど透明|
|Level|電子密度のレベル（濃さ）がどれだけに相当する表面をメッシュとして表示するかを指定．Slide barでも指定できるが，横のテキストボックスに数値を入れて指定することもできる．単位は，1に指定した場合電子密度分布の分散に相当する値で表示されるようになっているが，1から1.5くらいで見るのがよいといわれている．|
|Extent|表示される電子密度の範囲を指定．近頃のPCのビデオカードなら，広範囲にわたる電子密度を表示させてもあまり問題ないですが，昔はSGIのワークステーションでも電子密度表示は結構重たかったのです．というわけで，この設定はもう過去の遺物かも(?)|
|Redraw button|電子密度が再描画されます．基本的に視点の移動に従ってマップの中心も勝手に移動するようになっているので，このボタンを押す必要はあまりありませんが，場合によっては更新されない場合があります．その場合はこのボタンを押しましょう．|

### Contourレンダラーの他のプロパティ

さらに，電子密度表示の設定は，Workspace paletteに表示されている
当該レンダラーをダブルクリックすることでも可能です．([Step5](../../../Documents/GUIのチュートリアル(CueMol2)/Step5)も参照)
これらのプロパティーのうち使用頻度が低いと思われるものは，
Object propertyダイアログからしか設定できないものもあります．

|Property|説明|h
|alpha|描画の透明度を指定．上記パネルでのTransp値に相当|
|autoupdate|視点の中央にあわせてマップ表示の中心も自動的に更新する|
|bufsize|contour計算に使用する領域の大きさを指定する．この値を増やすと，Extentの上限値が増えるが計算に時間がかかるようになる|
|extent|上記パネルでのExtent値に相当|
|siglevel|上記パネルでのLevel値に相当|
|width|描画の線の太さをピクセル単位で指定|
