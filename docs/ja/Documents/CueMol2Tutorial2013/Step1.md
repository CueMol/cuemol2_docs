[一覧へ戻る](../../../Documents/CueMol2Tutorial2013)

## Step1: 全体構造をRibbon modelで表示する
まず，通常Figure 1となる全体構造のリボンモデル図をスタイルを使用せずに作成します．
その後，共通で使われる色・選択の設定を抽出しスタイルファイルを作成し，スタイルを使用した全体構造図を作成します．

本チュートリアルで使用するPDBファイルと，最終的に完成するシーンは以下になります．


### PDBファイルを開く
メニューから「File」→「Open」を実行する，
あるいはツールバーの![step1-1fileopen-icon](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-1fileopen-icon.png){ .on-glb }アイコンをクリックすると，
ファイルを開くダイアログが現れます．
ファイルの種類は「PDB Coordinates」を選び，
次にファイル3UG9_AB.pdbを選択し，OKを押します．

![step1-1fileopen-setupdlg](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-1fileopen-setupdlg.png){ style="zoom: 0.5" .on-glb }

上図のようなファイルを開くオプションのダイアログが表示されます．
Object名はdefaultから変更（.pdbを除く）し，3UG9-ABとします．
さらにここではリボンモデルで表示させたいので，Renderer type:から，ribbonを選んでOKを押します．
selectionはチェックを外し，分子全体のリボンモデルを表示させます．


![step1-3fileopen-view](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-3fileopen-view.png){ style="zoom: 0.5" .on-glb }


**補足**

> PDBファイルの読み込みについては[Documents/GUIのチュートリアル(CueMol2)/Step1](../../../Documents/GUIのチュートリアル(CueMol2)/Step1)にも詳しい解説がありますので参照してください．



![step1-4fileopen-scenepanel](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-4fileopen-scenepanel.png)


Sceneパネルを見ると，3UG9_AB.pdbが表示され，それを表示するribbon rendererが作成されていることが分かります．

**補足**

> Scene, Objectの概念については[Documents/GUIのチュートリアル(CueMol2)/Step2-1](../../../Documents/GUIのチュートリアル(CueMol2)/Step2-1)にも詳しい解説がありますので参照してください．<br />

> GUIの基本構成については[Documents/GUIのチュートリアル(CueMol2)/Step1-2](../../../Documents/GUIのチュートリアル(CueMol2)/Step1-2)にも詳しい解説がありますので参照してください．

**注意**

> PDBファイル3UG9中には，1分子しか含まれていない．結晶学的対称で関係づけられる分子と二量体を形成している．このチュートリアルでは，PDBに登録されているモデルではなく，元々あるオリジナルの分子をchain A，結晶学的対称で関係づけられる分子をchain Bとして作成したPDBファイル(3UG9_AB.pdb)を使用している．


### 背景を白色にする
論文用あるいはプレゼン用に作成する図は通常背景を白色にします．
Sceneパネルの一番上の項目，Scene: Untitled 1という項目を右クリックするとcontext menuが表示されます．

![step1-5bgcolchg](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-5bgcolchg.png)

Background colorを選択し，さらにWhiteを選択すると背景色が白色に変更されます．

### 着色を変更する
細かい着色の変更は，Colorパネルから行います．

![step1-6coloring1](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-6coloring1.png)

上のdrop-down listboxから，3UG9_ABという項目を選ぶと，分子オブジェクト3UG9_ABに対する着色設定が表示されます．
デフォルトでは，Paint coloring(分子選択ごとに色を指定するモード)で，
helix, sheet, それ以外の部分(selectionとしては*と表記)に色（SteelBlue, khaki, FloralWhite）がそれぞれ指定されています．

#### 塗り項目の削除
ここでは二次構造ごとの色分けではなく，ドメイン，サブユニットごとの色分けにするため，全ての項目を削除します．

項目を選択して，![step1-7color-del1](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-7color-del1.png)ボタンを押すと対応する項目が削除されます．

あるいは![step1-7color-delall1](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-7color-delall1.png)ボタンを押すとすべての項目を一度に削除できます．

#### 塗り項目の追加
そして，+ボタンを押して新たな塗りの項目を追加します．
![step1-9color-add1](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-9color-add1.png)ボタンを押すと，図のようなダイアログが表示されます．

![UI画像](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/UI画像){ .on-glb }

まずA鎖のN terminal domain(残基番号49-83)の着色を指定します．

-  selectionにはA.49:83.*を，

-  colorには，hsb(0,0.5,1)を入力します．

色の変更方法は，

-  テキストボックスにhsb(0,0.5,1)と入力する，

-  あるいは，左の▼ボタンを押してHSBパレットを表示させ，スライダーで各値を0,0.5,1に変更します．

![step1-11paint-col1](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-11paint-col1.png)


OKを押すと，N terminal domainに対応する塗の項目が追加されます．

![step1-12paint-col2](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-12paint-col2.png)


分子viewの方もそれに応じて着色が変化します．

![step1-13paint-view](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-13paint-view.png)


#### 各ドメインの着色設定
上記と同様の操作を繰り返して，以下のように各ドメインごとに色を設定します．
|名前|色|選択|h
|Ndom|hsb(0,0.5,1)  |A.49:83.*|
|TMs |hsb(120,0.5,1)|A.84:317.*|
|Cdom|hsb(240,0.5,1)|A.318:342.*|
|ChainB| #CCC|c; B|



最終的には，Colorパネルは以下のようになり，リボンモデルの着色も，下図のようになります．

> ![step1-14paint-final1](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-14paint-final1.png)　　![step1-14paint-final2](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-14paint-final2.png){ style="zoom: 0.5" .on-glb }

### シーンを保存する
以上のようにして作成した図を，次回CueMolを起動したときにも読み込めるように保存するには，
メニュー「File」⇒「Save Scene」あるいはツールバーの![step1-16scene-saveicon](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-16scene-saveicon.png)ボタンアイコンをクリックします．
すると名前を付けて保存ダイアログが表示されますので，fig1_overall.qscという名前で保存します．

分子構造(PDB, etc)や電子密度(MTZ, etc)など各データファイルのopen/saveと，シーンのopen/saveが別メニューになっている点に注意してください．

すると，qscファイル保存のオプションダイアログが表示されます．

![step1-15scene-save](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-15scene-save.png)


基本的にdefaultのままでOKですが，

-  データファイルを出来る限りqscファイル中に埋め込みたい場合

-  ファイルを圧縮したい場合
等に設定を変更します．

ここでは，QSCファイルはPDBファイルと同じフォルダに常に保存して作業を行うので，埋め込みはoffにします．


**補足**

> Save sceneあるいは![step1-16scene-saveicon](../../../assets/images/Documents/CueMol2Tutorial2013/Step1/step1-16scene-saveicon.png)はシーンが一度も保存されていない状態ではSave Scene As...と同様の挙動をしますが，いったん保存されている場合（あるいはファイルを開いた場合）は，そのファイルに上書き保存します．
### データファイルのリンクと埋め込み

ここでは，Scene保存時のデータファイルの「リンク」と「埋め込み」について説明します．

Defaultでは，Scene保存時の埋め込みオプション（上図参照）はoffになっています．
この状態では，

-  ディスク等から開いたデータファイルは（CueMol中で変更されていなければ）リンクとしてqscファイルに保存される．

そのため，リンク先のファイルを削除，あるいは移動してしまうと，qscファイルを開けなくなってしまいます．

一方で，データファイルを更新して（例えばさらに構造精密化を進める等），その後qscファイルを開くと，CueMolはその更新された外部ファイルを
読みに行きますので，シーンも更新されたものになります．

一方，

-  PDBサイトからダウンロードしたも．ディスク上に対応するデータがないため，

-  重ね合わせやボンドの編集（後述）をしたもの．ディスク上のデータとCueMol上のデータが異なってきてしまっている．

以上のケースでは，
再読み込み時の再現性を保つため
データファイルは保存時に（ダイアログでのオプションに関係なく）自動的にqscファイルに埋め込まれます．

一方で，埋め込みオプションをonにすると，どこから開いたか等の状態にかかわらず，すべてのデータがqscファイルに埋め込まれるようになります．

埋め込んでしまうと，qscファイルのみ持ち出せば同じシーンを確実に再現することができるというメリットがあります．

しかし，その後元のデータファイルを変更しても，qscシーンの方には更新されない，というデメリットもあります．

[Documents/CueMol2Tutorial2013](../../../Documents/CueMol2Tutorial2013)
