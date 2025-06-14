[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/) | [次へ](../../../Documents/GUIのチュートリアル(CueMol2)/StepC2)

まず，[基本編](../../../Documents/GUIのチュートリアル(CueMol2)/Step1)を参考に，PDBサイトからダウンロードしてきたLysozymeのPDBファイルを読み込んで，traceレンダラーで表示してください．
あるいは直接(Get PDB by accession code...)で読み込んでも構いません．

## 結晶学的情報

読み込んだ分子が結晶構造解析により構造決定されている場合，
Symmetryパネルに結晶に関する情報が表示されます．（Symmetryパネルが表示されていない場合は，メニュー「Window」→「Panels」から表示させてください）


![c1-symm-panel1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC1/c1-symm-panel1.png)


読込んだPDBファイルによっては，
ここの値が意図したものと違っていることがあります
（PDBのフォーマットに準拠してないのが原因でしょう）．
~~今のバージョン(2.0.0.94)ではまだ実装されていませんが，将来的には，"Change ..."ボタンを押して正しい値に変更できるようになる予定です．~~

その場合は，"Change ..."ボタンを押して正しい値に変更できます．

### 単位胞(unit cell)の表示

まず，unit cellを表示させてみましょう．
Symmetryパネルから"Unit cell"ボタンを押します．


![c1-unitcell1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC1/c1-unitcell1.png){ style="zoom: 0.5" .on-glb }


図のように，unit cellと座標軸が表示されます．

#### Unit cellとレンダラー
シーンパネルの方を見ると，unitcellというレンダラーが追加されていると思いますが，
Unit cellは，このunitcellレンダラーで表示されています．
なので，これを非表示にすると一時的にunitcellを隠すことができます．
また，これを削除すると表示が削除されます．
削除後，再度SymmetryパネルのUnit cellボタンを押すと
unitcellレンダラーが再び作られ，表示されるようになります．


### 結晶学的対称分子の表示

次に，結晶学的対称分子を表示させてみましょう．

#### 単位胞内に表示
Symmetryパネルの，"Symm mol"ボタンを押すと，以下のようなメニューが表示されます．

![c1-symmol-bycell1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC1/c1-symmol-bycell1.png)

ここで，一番下のUnit cellを押すと，単位胞内の対称分子のみが表示されます．

![c1-symmol-bycell-shown1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC1/c1-symmol-bycell-shown1.png){ style="zoom: 0.5" .on-glb }

リゾチームでは，P4(3)2(1)2なので，対称操作は８つあり，
すなわち８つの対称分子が表示されるわけです．

#### ある距離内にある分子を表示
上記のメニューで，距離の値が表示されている項目を選択すると，
視点の中心から指定した距離内にある対称分子が表示されるようになります．
表示は，視点を移動させるごとに自動更新されます．

ただ，おはずかしいことに，現在のバージョン(2.0.0.94)では
対称分子を探すアルゴリズムが若干おかしいため本来距離内にあるはずの対称分子がちゃんと出てこなかったりします（距離を十分に大きくとると出てくるようになるのですが）．
ご注意ください．

### Symm renderer
この対称分子表示の正体は，symm rendererです．
Sceneパネルを見るとsymmという名前のsymm rendererが出来ているのが分かると思います．
上述のunitcell rendererのケースと同様に，
一時的に対称分子を消したい場合は，Sceneパネルの該当項目の目玉アイコンをクリックすると表示・非表示を切り替えることができます．また，削除してしまうこともできます．

このsymm rendererはそれ自身は特に何を表示するわけでもなく，
他のレンダラーのコピーを対称操作し，表示しています．
要するに，symmレンダラーの表示は鏡に映った鏡像のようなもの((蛋白質の結晶の場合は対称操作に鏡像反転は出てこないのでちょっと違いますが．．．))で，
実体がありません．
対称分子を表示しても，分子オブジェクトの方は何ら変化していないわけです．

#### 結晶学的対称分子のコンテキスト・メニュー
対称分子表示は実体は無いものの，
マウスでクリックして情報を表示することは可能です．
クリックで作成される原子名ラベルは，
クリックした原子以外に，すべての対称分子について表示されます．

さらに，ステータスバーのところに，対称操作を含めた情報が表示されます．

![c1-symmol-statusbar1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC1/c1-symmol-statusbar1.png)


#### 結晶学的対称分子のコンテキスト・メニュー
同様に，マウスで右クリックするとコンテキストメニューが表示されます．

![c1-symmol-ctxtmenu1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC1/c1-symmol-ctxtmenu1.png)

通常の場合と違うのは，メニューのうち以下にあげる３点になります．
(symop: 1/2+Y,1/2-X,1/4+Z)
:   クリックした原子が，実際の原子をどういう対称操作をしてこの位置に来ているかを示している．ただし，並進操作は表示されていない．

Center at SYMM atom
:   クリックしている対称分子表示の方に現在の視点の中心を移動する．（上にある"Center at this atom"を選ぶと，視点が実体（対称操作する前の原子）の位置に飛んでいってしまう．）

Create this SYMM object...
:   クリックしている対称分子表示を実体化する．

この場合，元のリゾチーム分子に対称操作 **1/2+Y,1/2-X,1/4+Z**(+並進)を施して
新しい分子オブジェクトを作成する．

### 対称分子の作成
それでは，上記のコンテキストメニューから，対称分子を作成してみましょう．
Symm rendererで表示されている対称分子を右クリックし（ぱっとみわからない場合は，シーンパネルでsymm rendererを非表示にしたら消える部分が対称分子です），
コンテキストメニューを表示させ，上記の**Create this SYMM object...**メニューをクリックしてみてください．

すると，以下のようなダイアログが出てきます．

![c1-symmol-create1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/StepC1/c1-symmol-create1.png)

Object名は変えることができますが，このままでもOKです．
OKボタンを押すと新たに分子が作られます．

作られた分子は，ファイルへの保存等，通常の分子オブジェクトと同様に操作できます．

~~ただし，現バージョン(2.0.0.94)では二次構造の情報などが計算されないため，~~

CueMol2.1からは，Create symm objectで作成したsymm分子に対しては
自動的に二次構造が割り当てられるようになっています．
（大体はこれで問題ないと思いますが，
もし作成元の分子の二次構造を手動編集していた場合や，PDBのHELIX/SHEETレコードから読み込んでいた場合は，
それらが反映されずDSSPによる割り当てが行われるため，
意図した二次構造と違ったものになってしまいます）


[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/) | [次へ](../../../Documents/GUIのチュートリアル(CueMol2)/StepC2)