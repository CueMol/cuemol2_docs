[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル/)



## 電子密度の読み込み

次に，電子密度を読み込んでみましょう．ここでは，1QIOの構造因子とモデルから計算した2Fo-Fc電子密度マップlysozyme_2fo-fc.brix（O brix形式）を例として使用しています．
(
サンプルファイルは以下から取得可:
[tar.gz format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-den1.tar.gz?download) or
[zip format](http://prdownloads.sourceforge.net/cuemol/qscript-tutorial-den1.zip?download)
)

ファイルを開くダイアログでBRIX Density Mapを選択し，lysozyme_2fo-fc.brixを選択して「開く」ボタンを押します．するとオプションダイアログが表示されます．


![density_option1](../../../assets/images/Documents/GUIのチュートリアル/StepC2/density_option1.png){ .on-glb }


「Name」で読み込む電子密度のオブジェクトを指定します．ここではデフォルト(lysozyme_2fo-fc)のままにしておきます．
CueMolでは，電子密度も分子モデルなどと同様にオブジェクトとしてメモリー上に格納されます．Rendererのcomboboxから**contour**を選択して，（他はdefaultのままで）
OKボタンを押すと電子密度が表示されます．


![density_mesh1](../../../assets/images/Documents/GUIのチュートリアル/StepC2/density_mesh1.png){ .on-glb }


これではいったい何が何だかよくわかりませんね．
わかりやすいように，モデルの分子構造も読み込んで重ねて表示してみます．
分解能が高い結晶構造の場合は分子のほうを**simple** rendererで表示すればわかりやすいでしょう([Step1参照](../../../Documents/GUIのチュートリアル/Step1))．


![density_mesh2](../../../assets/images/Documents/GUIのチュートリアル/StepC2/density_mesh2.png){ .on-glb }


この図のようにzoomしてslab ([Step2参照](../../../Documents/GUIのチュートリアル/Step2))を薄くしてやれば見やすくなります．
ところで，なぜcontourというのかというと，普通出てくる電子密度の表示は，
山の地図などでおなじみの２次元の等高線(contour)表示を
３次元に拡張したものだから，というわけです．

## 電子密度の表示・表示変更

GUIメニューの「Window」→「Density map palette」がチェックされている状態なら，
下図のようなパレットが表示されているはずです．
このパレットからは，density map objectにアタッチされたcontourレンダラー（ここでは緑色の網目表示と思ってください）のプロパティーを変更できます．


![density_map_palette](../../../assets/images/Documents/GUIのチュートリアル/StepC2/density_map_palette.png){ .on-glb }


ボタンなどには以下のような機能があります．
|GUI item|説明|h
|右上combobox|設定変更の対象となるcontourレンダラーを選ぶ|
|Color|文字通り色を設定する|
|Transp|メッシュ表示の透明度(transparency)を指定する．左に行くほど透明|
|Level(sigma)|電子密度のレベル（濃さ）がどれだけに相当する表面をメッシュとして表示するかを指定．Slide barでも指定できるが，横のテキストボックスに数値を入れて指定することもできる．単位は，1に指定した場合電子密度分布の分散に相当する値で表示されるようになっているが，1から1.5くらいで見るのがよいといわれている．|
|Extent(A)|表示される電子密度の範囲を指定．(A)はÅのつもりです．近頃のPCのビデオカードなら，広範囲にわたる電子密度を表示させてもあまり問題ないですが，昔はSGIのワークステーションでも電子密度表示は結構重たかったのです．というわけで，この設定はもう過去の遺物かも(?)|
|Redraw button|電子密度が再描画されます．プロパティー変更などの場合は勝手に再描画されるので押す必要はありません．Viewの視点を変更した時など，電子密度が描画される中心が移動してほしい場合があります．その場合はこのボタンを押しましょう．|

さらに，電子密度表示の設定は，Workspace paletteに表示されている
当該レンダラーをダブルクリックすることでも可能です．([Step5](../../../Documents/GUIのチュートリアル/Step5)も参照)


![density_option2](../../../assets/images/Documents/GUIのチュートリアル/StepC2/density_option2.png){ .on-glb }


このダイアログで設定できる値は，**Thickness**(線の太さ)以外は
パレットのものと同じです．

## 表面の陰影つき表示
電子密度のrendererとしては，あと**isosurf**というのがあります．
これは，contourがメッシュ表示なのに対し，表面を陰影付け表示します．
しかし，電子密度自体の表示が前面に出てしまって肝心の原子モデルのほうが
見にくくなってしまうので，こういう表示は論文とかではあまり使われていないようです．


![density_surf](../../../assets/images/Documents/GUIのチュートリアル/StepC2/density_surf.png){ .on-glb }


isosurfのプロパティーは**パレットからは変更できません**．
上記の(workspace paletteをダブルクリックして出てくる)ダイアログを使用して
設定変更が可能です．