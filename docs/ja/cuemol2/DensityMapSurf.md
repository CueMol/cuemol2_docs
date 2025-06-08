[Documents](../../Documents)

## ボリュームデータの表面表示
この項では，電子密度マップなどのボリュームデータの面表示について解説します． 
以下ではX線結晶構造解析で扱う電子密度マップを例として挙げていますが，電子顕微鏡解析の結果得られる密度マップや静電ポテンシャルマップなどでも同様の表示が可能です．

メッシュ表示については，[Documents/GUIのチュートリアル(CueMol2)/StepC2](../../Documents/GUIのチュートリアル(CueMol2)/StepC2)と[cuemol2/DensityMap](../../cuemol2/DensityMap)を参照してください．

### 面表示(isosurf) rendererの作成

ファイルを開いた後に出てくるRenderer option dialogで，Renderer typeからisosurfを選択すると，
面表示(isosurf) rendererが作成されます．

(図)

あるいは，Scene panelで電子密度などのボリュームデータを選択し，panel下方にある「＋」ボタンを押して新規rendererを作成する際に，同様にRenderer typeからisosurfを選択すると，
面表示(isosurf) rendererが作成されます．

(図)

### isosurf rendererの設定
メッシュ表示(contour renderer)と同様の設定が可能です。

### isosurf rendererのsurface化
isosurface rendererで表示される表面表示を、MolSurf objectに変換することが可能です。変換すると、断面の生成などが可能になります。

### Multi-gradient coloring
[Multi-gradient coloring](../../cuemol2/MultiGradColoring)による着色が可能です。よくある電顕マップの分解能に応じた着色などが可能になります。