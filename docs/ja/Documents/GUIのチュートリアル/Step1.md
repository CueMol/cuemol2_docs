[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル/)|[次へ](../../../Documents/GUIのチュートリアル/Step2)



## CueMolの起動

CueMolのアイコン![gui_step1_ico](../../../assets/images/Documents/GUIのチュートリアル/Step1/gui_step1_ico.png){ .on-glb }をダブルクリックすると下図のような画面が表示されます.

![gui_step1_start](../../../assets/images/Documents/GUIのチュートリアル/Step1/gui_step1_start.png){ .on-glb }


## PDBファイルの読み込みと分子モデルの表示

standard tool barの![gui_step1_open_ico](../../../assets/images/Documents/GUIのチュートリアル/Step1/gui_step1_open_ico.png){ .on-glb }アイコンをクリックします．

あるいは，MenuからFile→Openを選択します．

「ファイルを開く」ダイアログボックスが表示されます． PDB形式の分子モデルファイルを開く場合は，ファイル形式の中から，"PDB coordinates"を選んでください． (CueMolでは，開くファイルによってメニューを分けるのではなく，「ファイルを開く」ダイアログの中で選択する方式を取っています)

ここでは例として1.2Å分解能のlysozymeの結晶構造を用います(PDBID:
[1QIO](http://pdbbeta.rcsb.org/pdb/explore.do?structureId=1qio)．
他の生体高分子の構造も[PDBのサイト](http://www.rcsb.org/pdb/)から
取得できます)．
「ファイルを開く」ダイアログでPDBファイルを選択し，OKボタンを押すと，次に分子座標ファイル読み込みのオプションダイアログが表示されます．

![gui_step1_creat_rend](../../../assets/images/Documents/GUIのチュートリアル/Step1/gui_step1_creat_rend.png){ .on-glb }

分子モデルを開くと，メモリー上に分子オブジェクトとして読込まれます．
オブジェクトには分子以外に，電子密度や静電ポテンシャルなどがあります．
オブジェクトには読込み時にそれぞれ名前を付けなければなりません．
**CueMol上ではその名前でオブジェクトが識別されます．**

といっても，いちいち名前を考えるのも面倒なので，
デフォルトでファイル名から拡張子を除いたものが，
オブジェクト名のテキストボックスに入っています．
「Name」テキストボックスに入力することで別の名前をつけることも可能です．（既に読み込まれているオブジェクトのなかに同じ名前のものが存在すると，読み込みに失敗しますので，そういう場合は別の名前を付けましょう．）
ここでは，”lysozyme”という名前にしています．


「Renderer」テキストボックスでは，分子モデルの表示方法を指定します．
現在の実装では以下のタイプがあります．



-  simple … 線画のstick model

-  trace … 線画のC-alpha (蛋白質の場合), phosphate backbone (核酸の場合) トレース

-  cpk … CPKモデル表示

-  ballstick … ball and stickモデル表示

-  ribbon … いわゆるリボンモデル表示

-  tube … 主鎖のチューブ状モデル表示．traceの発展版のようなもの

-  その他

ここでは，simple を選びます．


「Auto center」を選ぶと，viewの視点が読み込まれる分子の重心に自動的に移動します．現在の視点から移動したくない場合はこのチェックをはずします．


OKボタンを押すと分子モデルがview表示されます．

[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル/)|[次へ](../../../Documents/GUIのチュートリアル/Step2)
