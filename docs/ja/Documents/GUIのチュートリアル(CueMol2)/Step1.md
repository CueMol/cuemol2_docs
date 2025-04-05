[ [GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/)|[次へ](../../../Documents/GUIのチュートリアル(CueMol2)/Step1-2) ]



## CueMolの起動

CueMol2のアイコン![gui_step1_ico](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step1/gui_step1_ico.png){ .on-glb }をダブルクリックすると下図のような画面が表示されます.


![gui_step1_start](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step1/gui_step1_start.png){ style="zoom: 0.5" .on-glb }


**注意：**初めて起動したときは，上図のように小さめのウィンドウサイズで表示されるため，一部のGUI（下方のステータスバーやログ表示など）が押しつぶされて見えなくなってしまっています．
とりあえずウィンドウを広げてやってください．


## PDBファイルの読み込みと分子モデルの表示

### ディスクなどに保存されているPDBファイルを読み込む
ツールバーの![gui_step1_open_ico](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step1/gui_step1_open_ico.png){ .on-glb }アイコンをクリックします．

あるいは，MenuからFile→Openを選択します．

「ファイルを開く」ダイアログボックスが表示されます． PDB形式の分子モデルファイルを開く場合は，ファイル形式の中から，"PDB coordinates"を選んでください． (CueMolでは，開くファイルによってメニューを分けるのではなく，「ファイルを開く」ダイアログの中で選択する方式を取っています)

ここでは例として1.2Å分解能のlysozymeの結晶構造を用います(PDBID:
[1QIO](http://www.rcsb.org/pdb/explore.do?structureId=1qio)．
他の生体高分子の構造も[PDBのサイト](http://www.rcsb.org/pdb/)から
取得できます)．
「ファイルを開く」ダイアログでPDBファイルを選択し，OKボタンを押すと，次に分子座標ファイル読み込みのオプションダイアログが表示されます．


![gui_step1_creat_rend](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step1/gui_step1_creat_rend.png){ .on-glb }


分子モデルを開くと，メモリー上に分子オブジェクトとして読込まれます．
オブジェクトには分子以外に，電子密度や静電ポテンシャルなどがあります．
オブジェクトには読込み時にそれぞれ名前を付けなければなりません．
**CueMol上ではその名前でオブジェクトが識別されます．**

といっても，いちいち名前を考えるのも面倒なので，
デフォルトでファイル名から拡張子を除いたものが，
オブジェクト名のテキストボックスに入っています．(上図の場合だと，デフォルトとして，PDBのサイトからdownloadしてきた1QIO.pdbという名前が入っている)
この「Object:」テキストボックスに入力することで別の名前をつけることも可能です．ここでは，”lysozyme”という名前に変更してください．

「Renderer type」ボックスでは，分子モデルの表示方法を指定します．
現在の実装では以下のタイプがあります．
simple
:   線画のstick model．パフォーマンス的にはtraceに次いで高速．細かく見るだけの場合に適している．

trace
:   線画のC-alpha (蛋白質の場合), phosphate backbone (核酸の場合) トレース．パフォーマンス的には最も高速．大まかに見るだけの場合に適している．

cpk
:   言わずと知れた[CPKモデル](http://en.wikipedia.org/wiki/CPK_model)表示．空間充填モデルともいう．

ballstick
:   ball and stickモデル表示

ribbon
:   いわゆるリボンモデル表示

tube
:   主鎖のチューブ状モデル表示．traceの発展版のようなもの

nucl
:   tubeのDNA, RNA向け発展版．塩基が棒状に表示される．

:その他|

ここでは，**simple** を選びます．

「Recenter view」を選ぶと，viewの視点が読み込まれる分子の重心に自動的に移動します．現在の視点から移動したくない場合はこのチェックをはずします．

「Selection」をチェックすると，その隣の分子選択ボックスが有効になります．
分子選択を指定することで，選択した部分のみ表示されるようになります．
ただし，読み込みは，分子全体がちゃんと読み込まれます．（詳しくは後述）

OKボタンを押すと分子モデルが画面中央に表示されます．

### ネットからPDB IDを指定してダウンロード
ツールバーの![gui_step1_pdb_ico](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step1/gui_step1_pdb_ico.png){ .on-glb }アイコンをクリックします．

あるいは，MenuからFile→Get PDB using accession codeを選択します．

すると，PDB IDを入力するシンプルなダイアログが出てくるので，
ここでは1QIOと入力しOKを押します．
（誤って存在しないIDを入力すると，存在しない旨のエラーが表示されます）

次に，上記のFile open optionsと同様のダイアログが出てきます．
上述を参考に，設定を変更の上，OKボタンを押してください．

すると，Progress meterが表示され，ダウンロードが終わったら
分子モデルが画面中央に表示されます．


![gui_step1_loaded](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step1/gui_step1_loaded.png){ style="zoom: 0.5" .on-glb }


[ [GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/)|[次へ](../../../Documents/GUIのチュートリアル(CueMol2)/Step1-2) ]
