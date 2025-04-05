[Documents](../../Documents)
## Light-weight sceneファイル
CueMol 2.0.1.188以降では，新たにLight-weight sceneファイル形式というscene fileの一種が実装されました．
ActiveX controlによるプレゼンテーションや，mobile deviceによる可視化に使用するのが主な目的です．

拡張子は，通常のシーンファイル(qsc)と異なり，**qsl**となっています．

Sample scene fileが以下からダウンロードできます．
[lyso_denmap1.qsl](http://downloads.sourceforge.net/project/cuemol/sample-files/2.0.1.188/lyso_denmap1.qsl)
:   　Light-weight sceneファイルのサンプル


### これは何？
Light-weight sceneファイルは，文字通り，軽い（サイズが小さい・読み込みが速い）シーンを格納するためのファイル形式です．

Light-weight sceneに変換後は，以下の操作を行うことが可能です

-  右クリックによる原子名等の情報表示と，View 中心への移動

-  Cameraに保存された視点，視方向への移動

-  各object, renderer毎の表示・非表示の変更


ただし，軽い分のトレードオフとして，通常のシーンファイル(qsc)と比べて以下のような操作は出来なくなっています．

-  新たな表示(renderer)作成・rendererの編集(色の変更・表示範囲変更)

-  分子の場合，分子としての完全な情報は持っていない（→分子重ね合せ，分子表面作成などができない）<br />

-  電子密度の場合，Light-weight sceneに変換した時点で表示していた表示範囲変更

-  などなど


### 作成方法
普通のシーンファイル(qsc)読み込むなどして，Light-weight sceneに変換したいシーンを開く・あるいは作成します．
そして，
メニュー「Renderer」→「Export scene...」を実行します．
ファイルを保存するダイアログが出てきますが，そこで，ファイルの種類から，

> CueMol light-weight scene (*qsl)

というのを選び，拡張子を.qslにします（場合によっては勝手にqslに初めからなっています）．

次に，以下のような保存オプションを指定するダイアログが表示されます．

![qsl-option-1](../../assets/images/cuemol2/LightWeightScene/qsl-option-1.png){ .on-glb }

ここで，

-  **Change detail**をチェックしてDetail値を指定すると，書き出されるメッシュの細かさが変更できる（後述；ポリゴン数など）

-  **Use compression**のチェックを外すと，非圧縮フォーマットで書き出されます．ファイルサイズは大きくなる．（Mobile deviceで展開に時間がかかるようなら，offにすると読み込み速度は速くなる場合があるかもしれません．）

-  **Open the resulting qsl file**をチェックすると，書き出したqslファイルが別の新しいタブに読み込まれる．

その後OKをおすと，指定したファイル名でqslファイルができます．

### 読み込み
qslファイルは形式的には普通のシーンファイル(qscファイル)と同じなため，
メニュー「File」→「Open scene...」から開くことができます．
（Version 2.0.1.188以降では，Open sceneから開ける拡張子にqslが加わっています）

開いた後，Sceneパネルを見ると，例えば以下のようになっています．(冒頭のサンプルファイルを開けば同じシーンを見ることができます)

![qsl-scene-1](../../assets/images/cuemol2/LightWeightScene/qsl-scene-1.png){ .on-glb }

このように，名前は全て元のシーンと同じものになっていますが，

-  MolCoord(分子)や電子密度(Denmap)などobjectは全てLWObjectというobjectに，

-  simpleやballstick, contourなどrendererは全てlwrendというrendererに

変換されます．
一方，Cameraはもともとあったものが全て引き継がれています（この場合はもともと__currentしかありませんが．）

Qslファイルは，以上のようにすべてのobjectとrendererがLWObject/lwrendになっている以外は
形式的には通常のシーンファイルと同じものです．

### ActiveX controlでの使用
Version 2.0.1.188に付属しているActiveX controlにはバグがあるためファイル名が*.qslという拡張子だと読み込めません．
ファイル名を*.qscに書き換えた後，通常のシーンqscファイルとして読み込めば一応OKです．
（次のreleaseまでには修正します）

### iOS版CueMolでの使用

作成したqslファイルを，iPad/iPhoneで表示させることができます．

[cuemol2/iOSCueMolViewer](../../cuemol2/iOSCueMolViewer)を参照してください．

## 変換時の注意点
### メッシュの細かさ（ポリゴン数など）

Version 2.0.1.192以降では，頂点数が多く複雑なメッシュは自動的に分割して書き出されるため，
原理上は表示できる頂点数（≒ポリゴン数）に制限はありません．
ただしかし，mobile deviceの性能上の制限を考えるとメッシュのポリゴン数を減らしておいた方が良いに越したことはありません（読み込み・表示速度が速くなる）．

#### 手動設定

上記のqsl書き出しオプションの，**Change detail**設定をoffにして書き出すと，
現在の各rendererのdetail設定値でqslファイルが書き出されます．

各renderer等の設定を以下を参考に変更して，頂点数が少ないqslファイルを作成できます．


-  ballstick, cpk<br />
Detail値（ただしデフォルトは3で小さ目の設定のため変更しなくてもOKの場合が多い）

-  ribbon<br />
Renderer設定ダイアログCommonタブのところにある，Section detail, Axial detail値．デフォルト値が大きめのため２〜３に減らした方が良い．

-  cartoon<br />
Renderer設定ダイアログGenericタブのところにある，axialdetail, coil.detail, helix.detail, sheet.detail値．これもデフォルト値が大きめのため２〜３に減らした方が良い．

-  tube<br />
Renderer設定ダイアログTubeタブのところにある，Detail値と，Axial detail値．これもデフォルト値が大きめのため２〜３に減らした方が良い．

-  atomintr<br />
Renderer設定ダイアログInteractionタブのところにある，Detail値．ただしこれはModeが3D tubeになっているときのみ．（単なる線描の場合は問題なし）

-  molsurf<br />
分子表面のポリゴン数は，分子から分子表面を生成したときに決まってしまうため後から簡単に変更することは少々困難です．再度Mol surface generationをやり直し，その時のDensity(/Å)値を１など小さい値に設定して再生成してやる必要があります．

-  density map (contour)<br />
表示範囲を狭くするか，mtzファイルから開くときのFFTの設定でgrid spacingをcoarseにする

#### 自動設定
上記のqsl書き出しオプションの，**Change detail**設定をonにして，右に数値を設定することで，メッシュの頂点数を調節することができます．
１〜５の数値で指定しますが，数値が大きいほどメッシュ数が多くなりファイルサイズが増加します．

ただし，density mapやmolsurfは生成（あるいは読み込み）時に頂点数が決まってしまっているため，書き出しオプションで頂点数を調節することはできません．





#### ポリゴン数が多すぎるときに出る警告
ポリゴン数がmobile deviceで表示するのには多すぎる(2^16に収まっていない)場合には，output windowに以下のような警告が表示されます．
```
QSLWriter> Mesh(1OX1.pdb:dsurface1) nverts=103884, nfaces=207766
```
```
QSLWriter> Warning: Mesh(1OX1.pdb:dsurface1) vertex size 103884 exceeds limit(65535)
```
```
QSLWriter> Mesh divided into 2 vbos
```

上記の例では，object 1OX1.pdbのrenderer dsurface1の頂点数が10万を超えており，2^16の制限を回避するために2つのメッシュに分割されたことが分かります．
これでもiPad等で読み込むことができるにはできますが，上記の方法で頂点数を減らした方が良いでしょう．
#### desktop版
CueMol2デスクトップ版やActiveX版は原理上2^32まで（まあほぼ無限）の頂点を持つrendererまで読み込むことができるため，この点について特に気にする必要はありません．（ただしパフォーマンスを考えるとポリゴン数は減らすに越したことはありませんが）
