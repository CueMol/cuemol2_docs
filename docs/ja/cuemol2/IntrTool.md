[Documents](../../Documents)

## 相互作用の自動抽出
2.0.2.310以降では，分子の相互作用自動抽出機能が実装されました．
メニュー「Tools」→「Interaction...」で実行できます．

### Interactionダイアログ
何らかの分子が読み込まれている状態で
メニュー「Tools」→「Interaction...」を実行すると，以下のようなダイアログが表示されます．

![intrtool_dlg2](../../assets/images/cuemol2/IntrTool/intrtool_dlg2.png){ style="zoom: 0.5" .on-glb }

ダイアログの設定値の説明は，以下の通りです．

Molecule
:   相互作用を抽出する対象の分子を指定します．

Selection 1
:   上記moleculeのうち，ここで指定した選択部分についてのみ相互作用を抽出する．（デフォルトの*にすると，全相互作用が抽出されます）

Selection 2
:   上記moleculeのうち，Selection 1で指定した選択部分と，ここで指定した選択部分(Selection 2)にまたがった相互作用を抽出する．
Defaultではcheck boxがoffになっていますが，onにすると，Selection2が有効になります．

Min, Max distance
:   相互作用を形成していると見做す最大・最小距離を指定する．

Max labels
:   最大何個まで相互作用を抽出するかを指定する．ともかくも全部抽出したかったら，1000や10000など大きな値にしておく（ただし重くなる可能性がある）

Hydrogen bond only
:   相互作用のうち，炭素原子が関わるものは無視する（タンパクだとN, O, Sから成る相互作用ペアのみが抽出される）

Renderer
:   相互作用を追加するatomintr rendererを指定する．デフォルトではmeasureになっている．(measureが無い場合は勝手に作られる)

100個までの水素結合を抽出したいなら，デフォルトの設定でだいたいOKです．
ただし，水素結合といっても相互作用の向きなどはまったく考慮されていないので注意．

設定値を適宜変更してOKボタンを押します．

### 例：２つの分子等の間の相互作用を抽出したい場合
例えば，PDB entry 1OX1 (Tripsin)には，A鎖にtripsin，B鎖に基質アナログが入っています．
このA鎖とB鎖の間の相互作用を抽出したい場合は以下のようにします．

*  Selection 1に **c; A** を指定する
*  Selection 2のcheck boxをonにして，**c; B** を指定する
*  Min, Max distanceはdefault (1.5, 3.5)のまま
*  Max labelsもdefault (100)のまま
*  Hydrogen bond onlyもdefault (checked)のまま
*  Rendererもdefault (measure)のまま

以上を実行すると，A鎖とB鎖の間の水素結合（の可能性がある相互作用）がAtomintrレンダラーmeasureに追加されます．


![intrtool_result2](../../assets/images/cuemol2/IntrTool/intrtool_result2.png){ style="zoom: 0.5" .on-glb }


さらに，Log windowに相互作用している可能性のある原子と距離の一覧が出力されます．
```
Mol[1OX1.pdb] Atom contacts in 1.50 -- 3.50 Angstroms:
B HOH 423 O <==> A TYR 39 OH : 3.35
B ILE 6 N <==> A PHE 41 O : 3.24
B GLN 9 NE2 <==> A HIS 57 O : 3.05
...
```

あと，log windowに，以下のような表示が出ている場合は，上記ダイアログのmax labels値によりラベル数が制限されて，いくつかの相互作用が無視されていることになります．
```
131 Labels are limited by max_labels(100)
```

これでまずい場合は，undoした後，再度「Interaction...」からmax labels値を増加させて再実行してください．


### 例：分子内のすべての相互作用を抽出したい場合
例えば，PDB entry 1CRN (Crambin)分子にあるすべての相互作用（分子内相互作用も含む）を抽出したい場合は以下のようにします．

*  Selection 1に ***** を指定する
*  Selection 2のcheck boxをoffにする
*  Min, Max distanceはdefault (1.5, 3.5)のまま
*  Max labelsもdefault (100)のまま
*  Hydrogen bond onlyもdefault (checked)のまま
*  Rendererもdefault (measure)のまま

以上を実行すると，分子内，分子間に関わらず選択(*)に含まれる水素結合（の可能性がある相互作用）がAtomintrレンダラーmeasureに追加されます．
以下の図のように，measure rendererが（なければ）作られ，相互作用が点線で表示されます．デフォルトの設定では，さらに各相互作用の距離も表示されています．

![intrtool_result1](../../assets/images/cuemol2/IntrTool/intrtool_result1.png){ style="zoom: 0.5" .on-glb }


さらに，Log windowに相互作用している可能性のある原子と距離の一覧が出力されます．

このSelection 2をoffにするモードでは，このようにヘリックス内の水素結合などもすべて抽出されますので，あまり実用的ではないでしょう．


## その他注意点など
### 相互作用表示の設定
Interaction toolで抽出した相互作用は，Measureの距離測定機能（[Documents/GUIのチュートリアル(CueMol2)/Step12](../../Documents/GUIのチュートリアル(CueMol2)/Step12)）を使って作成した相互作用と実体はまったく同じです．（要は一つ一つクリックして選ぶのを自動化しただけと考えればよい）．
そのため，相互作用表示の設定などは，[Documents/GUIのチュートリアル(CueMol2)/Step13](../../Documents/GUIのチュートリアル(CueMol2)/Step13)と同様の方法で変更可能です．