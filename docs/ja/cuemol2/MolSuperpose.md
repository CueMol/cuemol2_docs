[Documents](../Documents)

## 分子の重ね合わせ
分子の重ね合わせは，メニュー「Edit」→「Mol superposition...」から行うことができます．
メニューを実行すると，以下のようなダイアログが表示されます．

![superpose_dlg1](../assets/images/cuemol2/MolSuperpose/superpose_dlg1.png){ style="zoom: 0.75" .on-glb }

Algorithmの部分に表示されている通り，
場合により二種類のアルゴリズムを選択して使用することができます．


### 最小二乗法重ね合わせ
Algorithmの部分で，Least Square Fitting(LSQ)を選択すると，最小に二乗法による2分子の重ね合わせを行うようになります．

LSQ重ね合わせは，

-  どのような分子の重ね合わせにも利用できる

-  重ね合わせるべき原子を正しく指定しないと機能しない

という特徴があります．
CueMol1で実装されていた重ね合わせ機能とほぼ同じなので[Documents/GUIのチュートリアル/StepA5](../Documents/GUIのチュートリアル/StepA5)も参考にしてください．

ダイアログの各項目の意味は，

- Reference

    -  Molecule<br />
Reference (動かない方)の分子オブジェクトを指定する．

    -  Selection<br />
Reference分子のどの部分を重ね合わせ対象にするかを指定する．

- Moving

    -  Molecule<br />
Moving (動く方)の分子オブジェクトを指定する．

    -  Selection<br />
Moving分子のどの部分を重ね合わせ対象にするかを指定する．

-  Auto recenter<br />
ONにすると，重ね合わせ実行後，重ね合わせた分子に視点が移動．

-  Write RMSD info file<br />
(未実装)

となります．

特に，Reference/MovingのSelectionの指定ですが，
CueMol1.1の場合と同様に，

-  各分子で選択されている原子数が同じになっているか

-  各分子の適切な部分が対応して指定されているか

に注意して指定する必要があります．詳しくは同じく[Documents/GUIのチュートリアル/StepA5](../Documents/GUIのチュートリアル/StepA5)を見てください．

重ね合わせに成功すると，Moving分子が移動し，Log windowに以下のようなメッセージが表示されます．
```
=== LSQ superpose result ===
```
```
 RMSD: 0.105598 angstrom
```
```
 Nfit: 46 atoms
```
```
======
```


#### 先にSelectionパネルなどで選択しておいて重ね合わせる
[Documents/GUIのチュートリアル/StepA5](../Documents/GUIのチュートリアル/StepA5)と同様に，先に選択しておいて，その部分について重ね合わせる，というやり方も可能です．
ただし，GUIが少々違ってきています．

具体的には以下の手順で行います．

1.  上記のMol superpose dialogを実行する前に，Selectionパネルなどを利用して，Reference, Moving両分子の重ね合わせ対象部分を選択する．
1.  Mol superpose dialogを実行
1.  Selectionの部分が，デフォルトで現在選択されている部分になっているはず．以下は，両分子ともCα原子を選択(選択文はname CA)した状態で実行した場合．

![superpose_cursel_dlg2](../assets/images/cuemol2/MolSuperpose/superpose_cursel_dlg2.png){ style="zoom: 0.75" .on-glb }

もしそうなっていなかったら，(右端の三角印をクリックして)ドロップダウンリストを開いて，中からCurrentという項目を選ぶ．それでもならないようなら，選択がちゃんとできていない可能性が大なので，1に戻って選択をやり直す．
1.  Movingの方に関しても同様に確認．
1.  OKを押すと重ね合わせ完了．



### Secondary Structure Matching
Secondary Structure Matching(SSM)アルゴリズムを利用して，自動的に二次構造から対応する部分を判断し，重ね合わせを行います．

SSMの特徴は，

-  自動的に構造が似ている部分を判断して重ね合わせるので，特に選択部分を気にせず簡単に重ね合わせができる．

-  タンパク質の二次構造（ヘリックス・シートなど）をもとに類似部分を判断するため，タンパク質しか重ね合わせることができない．

という点になります．

LSQの場合と同様に，Reference, Moving分子オブジェクトをそれぞれ指定してください．
Selectionについては，基本的に*（全原子を選択）でOKですが，下記も参考にしてください．
OKを押して重ね合わせが成功すると，Moving分子が移動し，Log windowに以下のようなメッセージが表示されます．
```
=== SSM superpose result ===
```
```
 RMSD: 0.105633 angstrom
```
```
 Nalgn: 46
```
```
 Ngaps: 0
```
```
======
```
RMSDは，重ね合わせ後のCα原子のRMSDを示しています．
SSMでは，選択が全体(*)であっても，側鎖は無視され，実際に重ね合わせされるのは主鎖Cα原子のみになります．
Nalgnは構造の類似性探索から，何残基対応する部分が見つかったか（すなわちアラインメントできたか）を示しています．
Ngapsは，そのアラインメント中に，どれだけギャップがあったかを示しています．

#### SSMにおけるSelection
SSMの場合のSelectionは，基本的に*(全てを選択)でOKです．

もし，Referenceの中のchain Aにたいしてのみ重ね合わせたい，
というような場合は，Selectionをchain Aのように指定してください．
（上記LSQの場合と同様に，先に選択しておいてcurrentを選んで対象を指定することも可能です）

一方で，選択部分を誤ると，エラーが出て重ね合わせができない場合もあります．
例えば，Selectionにname CAと入力して，主鎖のCαのみ選択してしまうと，
以下のようなエラーが出て重ね合わせできません．

![ssm_error3](../assets/images/cuemol2/MolSuperpose/ssm_error3.png){ .on-glb }

うえでCαのみ重ね合わせてますよと言っておきながら，
一見矛盾しているようにみえますが，これは以下のような理由によります．

SSMでは，主鎖（特に主鎖アミド窒素，主鎖カルボニル基）の原子から二次構造を判定して重ね合わせに使用しています．したがって，重ね合わせの対象をCα原子のみにしてしまうと，これらの情報が得られなくなってしまうため，重ね合わせができなくなってしまいます．
（なので，Cαのみ(name CA)ではなく，主鎖原子すべてを指定(name C,N,O,CA)すれば重ね合わせできます．）

同様な理由で，もともと分子中にCαしか座標がない場合や，DNA, RNAなどの核酸など非タンパク質ポリマーについても，重ね合わせができません．
