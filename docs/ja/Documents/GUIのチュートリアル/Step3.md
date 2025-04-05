[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル/)|
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル/Step2)|
[次へ--&gt;](../../../Documents/GUIのチュートリアル/Step4)



## 「選択(selection)」
CueMolでは，分子モデルの"一部分"のみに対して何か操作を行うとき，まずその"一部分"を選択してから操作を行います．そのため，選択操作は非常に重要です． 

### 分子モデルのクリックによる選択
原子の位置でマウスを左ダブルクリックすると，その原子の含まれる残基が選択された状態になります．選択されている部分はハイライト表示されます．

![gui_step3_resid_sel](../../../assets/images/Documents/GUIのチュートリアル/Step3/gui_step3_resid_sel.png){ .on-glb }

### 右クリックメニュー(context menu)による選択
前ページで説明したように右クリックで以下のようなコンテキスト・メニューが
表示されますが，

![gui_step2_ctxtmenu](../../../assets/images/Documents/GUIのチュートリアル/Step3/gui_step2_ctxtmenu.png){ .on-glb }

"Select"何とか，というメニューを選ぶと，

-  atomなら原子

-  residueなら残基

-  chainならチェイン

-  moleculeなら分子オブジェクト全体

がそれぞれ選択されます．
つまり，"Select residue"はダブルクリックしたときと同じ効果になるわけです．

## "MolSel"パレットで選択
"Mol property"パレットから，鎖名(chain name)，残基番号(residue number)等で分子を選択できます．Mol property パレットは通常表示されていますが，表示されていない場合はMenuのWindow→Sel1 paletteで表示させます．さらに"Sel1"タブをクリックすると図のようなダイアログが表示されます．

![gui_step3_sel1_pal1](../../../assets/images/Documents/GUIのチュートリアル/Step3/gui_step3_sel1_pal1.png){ .on-glb }


Molの右横のドロップダウン・リストには現在読み込まれている分子モデルの一覧があります．このドロップダウン・リストで選択されている分子モデルが，以下の選択の対象になっています．この時点では１つしか読み込んでいないので"lysozyme"しか表示されていません．

### ともかくも全部選択
ともかくも，分子全体を選択したい場合がよくあります．こういう場合は，上図のように，"chain"の左横にあるチェックボックスをOFFにして（OFFにすると右横のドロップダウン・リストが灰色表示になります）"Select"ボタンを押します

### 鎖(chain)による選択
蛋白質分子は水溶液中では，複数のポリペプチド鎖(chain)からなる複合体を作っている場合が多いものです．結晶構造では，そのような複合体の形で構造決定されているものが多数あります(ribosome等は最たる例)．そのポリペプチド（あるいはポリヌクレオチド）鎖ごとに，モデルの部分だけを選択したい場合もよくあることでしょう．

しかしリゾチームともなると複合体を作らないのでポリペプチド鎖は１つしかないですね．この例では"A"に相当します．一方，結晶構造では便宜上水分子等を１つの鎖としてモデル・ファイルに記述するためペプチド鎖以外の鎖がモデルに含まれていることがよくあります．このリゾチームの場合も，モデル内に水分子"_"というchainが含まれています．

![gui_step3_sel1_pal2](../../../assets/images/Documents/GUIのチュートリアル/Step3/gui_step3_sel1_pal2.png){ .on-glb }

ここでは，chain ドロップダウン・リストボックスから"a"を選択します(CueMolでは大文字・小文字は区別しないのでAもaも同じ鎖をあらわします). 
さらに，「Resid #」チェックボックスがOFFであることを確認します．
Selectボタンを押すと，分子中のA鎖が全て選択され，ハイライト表示されます． Centerボタンを押すと視点が現在の選択部分の重心に移動します．

### 残基範囲(residue range)による選択
「Resid #」チェックボックスをONにし,start residue 63, end residue 73を入力します

![gui_step3_sel1_pal3](../../../assets/images/Documents/GUIのチュートリアル/Step3/gui_step3_sel1_pal3.png){ .on-glb }

selectボタンを押すと，分子中のA鎖の残基63から73が選択され，ハイライト表示されます．

![molsel-resid-view](../../../assets/images/Documents/GUIのチュートリアル/Step3/molsel-resid-view.jpg){ .on-glb }



### 選択の解除
"Deselect"ボタンを押すと選択が解除されます

### 文法による選択
以上より,さらに複雑な選択を行いたい場合は，文による選択を使います．
文による選択はMol propertyパレット内のSel2タブをクリックすると表示される，Sel2ページで行います（下図）．
パレットが表示されていない場合は，メニューWindow-&gt;Sel2 paletteで表示されます．

![gui_step3_sel1_pal4](../../../assets/images/Documents/GUIのチュートリアル/Step3/gui_step3_sel1_pal4.png){ .on-glb }

上側にあるMolの右側のドロップダウン・リストは，Sel1と同じものです．

中央にあるテキストボックスに選択文を入力し，"Select"ボタンを押すと文に対応する部分が選択され画面にハイライト表示されます．"Center"ボタンもMolSel1のものと同じく，選択部分を画面の中心にします． "Clear"ボタンはテキストボックスの内容を消去します．

例えば，
```
name C,N,O,CA
```
といれて"Select"ボタンを押すと，主鎖原子が選択されます．
```
resn ARG, LYS
```
といれると，塩基性残基(アルギニン, リシン)が選択されます．

文法に関する詳しい説明は，マニュアルや
[分子選択文法のリファレンス](../../../Documents/MolSelSyntax)
等を参照してください．

[&lt;--前に戻る](../../../Documents/GUIのチュートリアル/Step2)|
[次へ--&gt;](../../../Documents/GUIのチュートリアル/Step4)
