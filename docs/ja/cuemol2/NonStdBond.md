[Documents](../Documents)

## 新たな共有結合の作成方法

CueMolはデフォルトで天然アミノ酸とAT/UGCの核酸のトポロジー
（どの原子と原子が共有結合しているか）情報を持っており，
そのデータに基づいてsimpleレンダラー等は化学結合のボンドを描画しています．
また，残基間の結合（ペプチド結合，ホスホジエステル結合など）のデータに基づいて，
残基間の化学結合のボンドを描画しています．

さらに，PDBファイルから座標を読み込んだ場合は，LINKレコードやSSBONDレコードの情報も参照され，
追加の共有結合が描画されるようになっています．（たとえばdisulfide結合や，Asn結合型糖鎖など）

一方で，LINKやSSBONDレコードがないPDBファイルから分子を読み込んだ場合，
disulfide結合や，Asn結合型糖鎖のAsnと糖間の共有結合などが正しく描画されないという問題が起こってしまいます．

このページでは，このような場合に新たな共有結合をどのようにして作成するかについて解説します
例として，[3OGR](http://www.rcsb.org/pdb/explore/explore.do?structureId=3OGR) (βガラクトシダーゼ)を加工したものを使用しています．(PDBサイトから落としてきたファイルを使用するとLINKやSSBONDレコードが入っているのでここで説明する作業をやらなくても残基間結合は正しく描画される．)

Sample scene fileが以下からダウンロードできます．

-  [bondedit_3OGR_1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.0.1.183/bondedit_3OGR_1.qsc)：　ボンド作成前の状態（NAG1025付近を拡大表示）

-  [bondedit_3OGR_2.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.0.1.183/bondedit_3OGR_2.qsc)：　ボンド作成後の状態（NAG1025だけでなく他の糖鎖やマンノース間の結合も追加・糖とAsnをballstick表示）


### Mol bond editor
対象とするPDBファイルを読み込み，メニュー「Tools」→「Mol bond editor」を選ぶと，図のようなダイアログが表示されます．

![mol_bond_editor1](../assets/images/cuemol2/NonStdBond/mol_bond_editor1.png){ .on-glb }


このダイアログは（他のと異なり）開いていてもメインウィンドウを操作できます．
ダイアログを出した状態で，分子ビューで残基A1025 NAGのあたりに移動します（MolStructパネルで）

>![mol_bond_editor2](../assets/images/cuemol2/NonStdBond/mol_bond_editor2.png){ .on-glb } ⇒![mol_bond_editor3](../assets/images/cuemol2/NonStdBond/mol_bond_editor3.png){ .on-glb }
上図のように，Asn627のND2原子と，NAG1025のC1原子はNグリコシド結合を形成しているはずですが，
ボンドが表示されていません．

#### 共有結合を作る原子の指定
次に，以下の手順でMol bond editorに原子IDを入力します．
1.  Mol bond editorのAtom1:の横のtext box内をクリックしfocusする．（意味が分り難いですが要するに文字を入力するとtextboxに文字が入る状態にする）
1.  分子ビューでAsn627のND2原子をクリックする
1.  するとテキストボックスにAsn627のND2原子のIDが入力される


>![mol_bond_input1](../assets/images/cuemol2/NonStdBond/mol_bond_input1.png){ .on-glb }　⇒　![mol_bond_input2](../assets/images/cuemol2/NonStdBond/mol_bond_input2.png){ .on-glb }　⇒　![mol_bond_input3](../assets/images/cuemol2/NonStdBond/mol_bond_input3.png){ .on-glb }

同様にして，Atom2の横のtext box内に相手側のNAGのC1原子を指定します．

1.  Mol bond editorのAtom2:の横のtext box内をクリックしfocusする．
1.  分子ビューでNAG1025のC1原子をクリックする
1.  するとテキストボックスにNAG1025のC1原子のIDが入力される


>![mol_bond_input4](../assets/images/cuemol2/NonStdBond/mol_bond_input4.png){ .on-glb }　⇒　![mol_bond_input5](../assets/images/cuemol2/NonStdBond/mol_bond_input5.png){ .on-glb }　⇒　![mol_bond_input6](../assets/images/cuemol2/NonStdBond/mol_bond_input6.png){ .on-glb }

#### 指定原子間にボンドを追加
各原子IDが入力された後に右横の「＋」Addボタンをクリックすると，
上のリストに新しいボンドが登録され，
分子ビューのsimpleレンダラーの表示も更新されます．


>![mol_bond_add1](../assets/images/cuemol2/NonStdBond/mol_bond_add1.png){ .on-glb }　⇒　![mol_bond_add2](../assets/images/cuemol2/NonStdBond/mol_bond_add2.png){ .on-glb }

#### 原子間ボンドの削除
さらに，リスト中から追加されたボンドを選択し，下の「−」Deleteボタンをクリックすると，
そのボンドは削除され，
分子ビューのsimpleレンダラーの表示も更新されます．

なお，この**ボンドの追加・削除操作はUndo/Redoが可能**です．

### その他注意事項など

-  Mol bond editorで作成したボンドの情報は，PDBファイルとして保存した場合はLINK/SSBONDレコードとして書き出されます．そのため，再度読み込んだ場合も追加ボンドの情報は保持されます．

-  Mol bond editorで変更した分子を含むシーンを保存した場合，変更した分子はシーンファイルに埋め込まれます．（⇒再度シーンを読み込んだときも追加ボンドは正しく表示される）

-  異なる分子オブジェクト間にボンドを作成することはできません．

-  MacOS XではMol bond editorのwindowがmain window（のmol view）をクリックすると後ろに行ってしまいます．Mol bond editorのwindowを重ならないように横に並べて作業してください．
