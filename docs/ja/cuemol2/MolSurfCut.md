[Documents](../../Documents)

## 分子表面オブジェクトの平面による切断
CueMol2ではCueMol1と同様に分子表面の断面を生成することができます．

特に，以前のバージョンと比べて，より強化されたアルゴリズムによる断面ポリゴンメッシュの生成が可能になりました．


### 分子表面の作成
まず，適当な分子ファイルを読み込みます．
（ここでは，PDBサイトから取得した1CRNファイルを使用しています．
取得方法は[Documents/GUIのチュートリアル(CueMol2)/Step1](../../Documents/GUIのチュートリアル(CueMol2)/Step1)参照．）

次に，メニュー「Tools」→「Mol surface generation...」を実行し，分子表面を作成します．
1CRNは小さい分子なので，densityは3にしています．

詳しくは，[cuemol2/MsmsMolSurface](../../cuemol2/MsmsMolSurface)を参照してください．


![cbp_surf1](../../assets/images/cuemol2/MolSurfCut/cbp_surf1.jpg){ style="zoom: 0.5" .on-glb }


### 切断面の指定
まず，
視線の方向，視点の位置のZ方向並進，スラブを調節して（[GUIチュートリアル](../../Documents/GUIのチュートリアル(CueMol2)/Step2)参照），
下図の様にスラブで分子表面が切断されて中が見えるような状態にします．


![cbp_surf2](../../assets/images/cuemol2/MolSurfCut/cbp_surf2.jpg){ style="zoom: 0.5" .on-glb }


以上の図では，CueMol1では正しく計算できないような複雑な形状の断面になるようにわざとスラブを設定してみました．

### 切断の実行
次に，メニュー「Tools」→「Mol surface cutter...」を実行します．


![cbp_surf_dlg2](../../assets/images/cuemol2/MolSurfCut/cbp_surf_dlg2.png)


各設定の意味は以下のとおりです．

Target surface
:   切断される対象の分子表面オブジェクトを指定します．

ここでは上記で作成した1CRNの分子表面オブジェクトであるsf_1CRNを選びます．

Cross section type
:   切断面を生成するかどうか，あるいは切断面だけ生成するかどうか等のオプションを指定します．

以下のオプションがあります．

    * **Complete** 切断されたsurface objectと断面を同じMolSurfObjとして生成
    * **Separately** 切断されたsurface objectと断面を別個のMolSurfObjとして生成（断面とそれ以外で着色を変えたい場合はこれを指定すればよい）
    * **Section only** 断面のみを生成
    * **No section** 切断されたsurface objectのみを生成（断面がない穴が開いた表面ができる）

Section mesh density
:   断面に生成する三角メッシュの密度を指定します．

デフォルトは5.0ですが，これは細かすぎるので1.0にしてください．
大概の場合1.0で十分ですが，細かいメッシュを生成したい場合は大きくしてください．
（大きくすると計算量が増え時間がかかるようになります）

OKを押すと，現在のスラブによる断面で，実際にMolSurfオブジェクトが切断されます．
ただし，OKを押した直後はスラブによる切断と重なって，画面上では
何も起こっていないかのように見えることがあります．
ともかくも，回転させたり，スラブを最大にしてみると，上図のように切断されているのが確認できます．

![cbp_surf3](../../assets/images/cuemol2/MolSurfCut/cbp_surf3.jpg){ style="zoom: 0.5" .on-glb }
![cbp_surf4](../../assets/images/cuemol2/MolSurfCut/cbp_surf4.jpg){ style="zoom: 0.6" .on-glb }

左が切断後の状態で，右がメッシュをwireframe表示にしたものです．
このように，前バージョンでは正常な断面が生成できないようなケースでも，
正しく断面が生成されています．
また，断面の三角メッシュが均等になるため，断面の着色もよりスムーズになるようになりました．

### 切断したMolSurfオブジェクトの保存
Sceneの保存を行うと，切断された状態の分子表面オブジェクトがqscファイル中に埋め込まれて保存されます．


### 注意点
依然，一度切断した面と干渉するような面で切断するとエラーが起こり，断面生成が行われません（切断面が直線を含むとエラーになります）．

場合によってはCueMolがクラッシュすることもあるので（申し訳ありません．．．），断面生成を行う前にはsceneを保存しておいたほうが良いです．