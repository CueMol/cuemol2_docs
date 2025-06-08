[Documents](../../Documents)

## タンパク質の二次構造の割り当て
CueMolのribbon renderer, [cartoon renderer](../../cuemol2/CartoonRenderer)では，
タンパク質の二次構造に基づいて表示を行っていますが，
このセクションではタンパク質の二次構造をどのようにして割り当てるかを説明しています．

### PDBファイル読み込み時の割り当て
タンパク質の二次構造は，PDBファイル読み込み時に自動的に行うことができます．

#### 自動割り当て
PDBファイル読み込み時に表示されるFile open optionsダイアログの，PDB optionsタブにて
PDB読み込み時のオプションを指定できますが，
そのうち，**Calculate protein secondary structure**という項目がonになっていると，
ファイル読み込み後に自動的にタンパク質の二次構造が座標から計算されます．

計算は，DSSPアルゴリズムで行われます．


![pdb_option_dlg1](../../assets/images/cuemol2/Prot2ndryStr/pdb_option_dlg1.png)


#### PDBファイル中の記述を読み込む
一方で，**Calculate protein secondary structure**がoffになっていると，
PDBファイル中のHELIX/SHEETレコードを読み込んで，それにしたがって二次構造を設定します．
RCSBのサイトなどでダウンロードしてきたPDBファイルには，これらのレコードが含まれていますが，
独自に作成したPDBファイル等では含まれていない場合もあります．含まれていない場合は何も二次構造は割り当てられません．

### 手動で二次構造を割り当てる
PDBファイル読み込み後に，手動で二次構造を割り当てることができます．

メニューの，「Tools」→「Reassign secondary str...」を実行すると，
以下のようなProtein secondary str toolダイアログが表示されます．

![prot2ndry-dlg1](../../assets/images/cuemol2/Prot2ndryStr/prot2ndry-dlg1.png)


ラジオボタンで**Assign by selection**を選ぶと，手動割り当てモードになります．
その状態で
*  Selectionに割り当てを変更する部分の選択を入力．
（ダイアログを開く前に[他のGUIで選択](../../Documents/GUIのチュートリアル(CueMol2)/Step3)しておけば，
defaultでその値が入り便利でしょう）
*  Typeに割り当てる二次構造のタイプを選択する．

以上のような設定を行ったうえでOKボタンを押すと，二次構造が変更されます．

二次構造のタイプには以下に挙げるものが選択可能です．
Coil
:   二次構造がない状態を指定

β strand
:   βstrandになるよう指定する

α helix
:   α helixになるよう指定する

3-10 helix
:   3-10 helixになるよう指定する

π helix
:   π helixになるよう指定する


ただし，現在実装されているrenderer(ribbon, cartoon)では，α，3-10，πヘリックスいずれも同様のrepresentationで表示されます．（そのため，わざわざ分けて指定してもあまり意味はないです．）

たとえば上図のようにSelectionを"*"，Typeを"Coil"にするとすべての二次構造情報がクリアされます．

自動割り当てが気に入らない場合は，以上の方法で強制的にβstrandやαhelixに変更してしまうことが可能です．
手動で二次構造割り当てを変更した分子は，シーンをqscファイルとして保存した場合，シーンに埋め込まれて保存されます．
そのため，次回qscファイルを読み込んだ場合も，変更した二次構造割り当ては保持されたままになります．


**注意点**

> 二次構造割り当てを変更すると，幾何的にβstrandでない領域をβstrandに無理やり変更し，ribbonやcartoon表示をさせることが可能ですが，場合によっては異常な形状が表示されたり，最悪クラッシュする可能性があります．
極端な変更（たとえば全領域βstrandにしてしまう等）はやめた方が良いでしょう．
二次構造割り当てを変更する場合は，前もってqscファイルなどに状態を保存することをお勧めします．


![prot2ndry-beta1](../../assets/images/cuemol2/Prot2ndryStr/prot2ndry-beta1.png){ style="zoom: 0.5" .on-glb }


> 上図：crambin(1CRN)をすべてβstrandにしてcartoon表示を行った例．元の分子とは似ても似つかぬ形状になるためこのような表示を行うこと自体無意味である．

### 自動割り当ての再実行
以上のダイアログで，**Recalc secondry str**を選んでOKを押すと，二次構造の自動割り当てを再実行することが可能です．

PDBファイル読み込み時と同じDSSPアルゴリズムで二次構造計算が行われます．

主鎖水素結合として認識するエネルギーの閾値を，**Max hbond eneryg**で指定できますが，defaultの500から変更してもあまり変化はないです．あまりいじる意味はないでしょう．

### 割り当て変更などのundo/redo
上記のProtein secondary str toolダイアログで行った二次構造割り当ての変更は，すべてundo/redoが可能です．

誤って割り当てたり，再計算してしまった場合はundoで元に戻しましょう．