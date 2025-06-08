[Documents](../../Documents)
## 分子の構造変化(morphing)
異なる構造をもつ２つの同一分子間の変化（変形=morphing）をアニメーションとして表示する場合に使用します．

CueMol2.2では，線形補間によるmorphingが使用できます．
線形補間によるmorphingでは，localなconformation changeをアニメーションすることが可能です．

本項目で説明するSample scene fileが以下からダウンロードできます．
*  [mol_morph1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/mol_morph1.qsc)：　transducin-alphaの構造変化morphing

## 前準備
ここでは，transducin-alphaのGTP bound form ([1TND](http://www.rcsb.org/pdb/explore.do?structureId=1tnd)) とGDP bound form ([1TAG](http://www.rcsb.org/pdb/explore.do?structureId=1tag)) 間の構造変化を例に説明します．

この2つの構造は分子としてはほとんど同じですが，各々PDBファイルに含まれる分子の位置が違ってしまっているため，
まず両者を重ね合わせたPDBファイルを作成する必要があります．

この例では，1TAGを1TNDに重ね合わせることとします．

### ファイルの読み込みと重ね合わせ
まず，1TAG, 1TND両者のファイルを読み込みます．PDBのサイトからダウンロード後「Open File...」から読み込んでも良いですし，「Get PDB using accession code...」を使用して直接PDBのサイトから読み込んでも構いません．（[Documents/GUIのチュートリアル(CueMol2)/Step1](../../Documents/GUIのチュートリアル(CueMol2)/Step1)参照）

1TAGは１つのchain(A)のみですが，1TNDは３つのchain (A,B,C)を含んでいます．1TAGは分子全体を，1TNDはchain Aに対してのみtrace rendererで表示させます．


![morphmol-1](../../assets/images/cuemol2/Anim_MolMorph/morphmol-1.png){ style="zoom: 0.5" .on-glb }


次に，[cuemol2/MolSuperpose](../../cuemol2/MolSuperpose)の「Secondary Structure Matching」に従って，2つの分子を重ね合わせます．
1TAGをmovingに，1TNDをreferenceに設定し，1TNDのselectionに「c;A」を指定して，
重ね合わせを実行すると以下の図のようになります．


![morphmol-2](../../assets/images/cuemol2/Anim_MolMorph/morphmol-2.png){ style="zoom: 0.5" .on-glb }


以上が完了したら，動かした方の1TAGをPDBファイルとして保存しておきます．メニュー「File」→「Save File As...」を実行し，1TAGを選択してOKを押し，その後表示されるファイル選択dialogでfile nameを1TAG-fit.pdbとして保存します．


## MorphMol objectの作成
### 変化の始点となる構造の読み込み
まず，変化の始点となる構造を読み込みます．
ここでは，すでに読み込まれている1TNDを変化の始点としますので特に操作は必要ありませんが，
ディスク上にあるPDBファイルなどを始点とする場合は，先に読み込んでおきます．

### MolCoordからMolMorph objectへの変換
Morphingを行うには，まず，PDBファイルを読み込んで作成されるMolCoord objectを，
線形補間morphingに対応したMolMorph objectに変換する必要があります．

メニュー「Tools」→「Mol morhping animation...」を実行すると，以下のようなdialogが表示されますので，MolMorphに変換したいMolCoord objectを選択します．

![morphmol-3](../../assets/images/cuemol2/Anim_MolMorph/morphmol-3.png){ .on-glb }

この例では，1TAGと1TNDがリストに表示されていますが，始点の構造の1TNDを選択し，OKボタンを押します．

以上の通り実行すると，以下のようなdialogが表示されます．

![morphmol-4](../../assets/images/cuemol2/Anim_MolMorph/morphmol-4.png){ style="zoom: 0.75" .on-glb }


### MolMorph objectへの構造座標の追加
以上の操作で，1TNDがMolMorph objectへ変換されました．
上記のdialogでは，MolMorph objectが保持している座標データの一覧が表示されています．
現在1つの座標データから変換して作成した直後なので，項目は１つ(this)しかありません．

次に，構造変化の終点に対応する座標1TAG-fitを追加します．
上記のdialogの「+」ボタンを押すと，ファイル選択dialogが表示されますので，
上記で重ね合わせ後保存しておいた，1TAG-fit.pdbを指定し読み込ませます．
すると，以下のように終点に対応する座標の項目が追加されます．

![morphmol-5](../../assets/images/cuemol2/Anim_MolMorph/morphmol-5.png){ style="zoom: 0.75" .on-glb }


終点の追加が完了したら，OKボタンを押してdialogを閉じます．

### MorphMol objectの編集
MorphMol objectに保持されている座標データの編集をさらに行う場合は，
メニュー「Tools」→「Mol morhping animation...」を実行すると，再び上記と同様のdialogが表示されます．

さらに座標を追加する場合は「+」を，不要な座標を削除する場合は項目を選択して「−」ボタンを押せば削除することが出来ます．

## アニメーションの作成
### アニメーションの追加
以上でmorphingを行う準備ができました．
次は実際にどのタイミングでどの程度の時間をかけてmorphingを行うかを，Animation panelから指定します．


![morphmol-6](../../assets/images/cuemol2/Anim_MolMorph/morphmol-6.png){ .on-glb }


上図のAnimation panelの「＋」ボタンを押し，「Mol Morphing」を選択すると，
以下のような設定dialogが表示されます．


![morphmol-7](../../assets/images/cuemol2/Anim_MolMorph/morphmol-7.png){ style="zoom: 0.5" .on-glb }


この例では，0秒から1秒かけて始点から終点へと変形させるアニメーションを作成します．

まずStart timeが0:0:0.0に，Durationが0:0:1.0になっていることを確認し，
Target MorphMolの項目で，上記で変換・作成した1TNDを選択します．

MolAnim settingsにある他の設定項目の意味は以下の通りになります．
Start value
:   Morphing開始点の構造を指定する．0はMorphMolが有する構造リスト中の最初の構造になる．逆に，1は最後の構造になる．

End value
:   Morphing終了点の構造を指定する．1はMorphMolが有する構造リスト中の最後の構造になる．逆に，0は最初の構造になる．


すなわち，Start value=1, End value=0にすると，逆方向の構造変化が起こることになります．

OKボタンを押すとanimation itemが追加され，Animation panelは下図のようになります．


![morphmol-8](../../assets/images/cuemol2/Anim_MolMorph/morphmol-8.png){ .on-glb }


### アニメーションの実行
以上でmorphing animationの作成は完了しました．
[cuemol2/Anim_Basic](../../cuemol2/Anim_Basic)の「アニメーションの実行」にある方法に従ってアニメーションを再生すると，構造の変形がアニメーションとして表示されます．

Chain Aについてリボン表示にし，さらに戻る構造変化（startValue=1→endValue=0）も追加すると，
以下のようなアニメーションになります．

#youtube(4RKA3VUVcPo,loop)
### 注意点など
#### 始点，終点等の分子構造の不一致
変化の始点や終点，あるいは中間点の分子座標について，それぞれすべて対応する残基・原子が存在していない場合は，それらの原子はmorhping計算から除外されます．

すなわち，(this)で表されるメイン座標に対応する原子が，他のサブ座標に存在しない場合はmorphing animation中その原子は静止したままとなります．
一方，メイン座標に無い原子がサブ座標にあった場合，それらは読み込み時に無視されます．

以上のような実装になっているため，全く同じ分子について異なる状態で決定された構造間のmorphingは簡単にできますが，似ているが異なるホモログ間の変形等は，そのままではうまく行きません．
各分子についてホモロジ―モデリング等でモデル構造を作成し，残基番号などをそろえることで，
正しくmorphingさせることが可能となります．


#### 大きな構造変化
線形補間のmorphingでは，非常に大きなドメインレベルでの変化を表現するのは困難ですが，
他のソフトウェアで構造変化の中間構造を何個か作成し，
それらを線形補間morphingでつなぎ合わせることでアニメーションを作成することができます．