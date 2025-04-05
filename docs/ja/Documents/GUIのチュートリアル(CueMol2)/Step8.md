[ [GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/) |
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step7) |
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step9) ]

## Paint Coloring
Paint coloringは，
選択と色を組み合わせて
複雑な着色ができるcoloringです．

Ribbonやtubeレンダラーはデフォルトでpaint coloringになっています．

まず，coloringパネルで，図のようにlysozyme/ribbon1を選択してください．
すると下図のようなリストが出てきます．


![gui-step8-paintpanel1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paintpanel1.png)


左側のSelectionが選択を，右のColorがその選択部分に対する色を表しています．
この場合，

-  rprop secondary=sheet（一部隠れていて見えませんが，二次構造がシートの部分）に対してSteelBlue色，

-  rprop secondary=helix（一部隠れていて見えませんが，二次構造がヘリックスの部分）に対してkhaki色

-  * (全体）に対してFloralWhite色

で，着色するようになっています．
この着色リストは**下から上に向かって順に塗っていく**ように解釈され，最終的な色が決まります．
すなわち，全体に対してFloralWhite色に塗ったうえで，
その上からhelix, sheet部分にそれぞれ別の色を塗っている感じになります．
その結果，FloralWhite色になるのはhelixでもsheetでもない，coilの部分のみになるわけです．

### 色や選択部分の変更
リストの部分をダブルクリックすると，その項目を変更するダイアログが出てきます．
まず，一番上のSteelBlue色の項目をダブルクリックしてください．

![gui-step8-paint-change1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-change1.png){ style="zoom: 0.5" .on-glb }

ここでは，色を変更してみます．色のメニューからHSBを選び，BとHスライダーを動かして，暗いSteelBlueを明るい緑色に変更しました．（色の変更については，[../Step7](../../../Documents/GUIのチュートリアル(CueMol2)/Step7)も参照）

![gui-step8-paint-chgcol2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-chgcol2.png)

OKボタンを押してダイアログを閉じると，リボンのベータシート部分の色が変化したことがわかります．

![gui-step8-paint-after1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-after1.png)

個々では例は示していませんが，同じようにしてselectionを変更することで色が塗られる対象も変えることができます．

### 塗りの追加
Paint coloringパネルの＋ボタンをクリックすることで，paint listの項目を新たに作成し，塗りを追加することができます．

ここで，塗りを追加する前に，塗りの対象となる部分をMolSelectパネルを使用して選択しておきましょう．lysozymeのC末端部分，Asp119〜Leu129までを選択します．

次に，Paint coloringパネルで，何も項目を選択していない状態，あるいは一番上の項目が選択されている状態で＋ボタンをクリックすると，最上位に項目が追加され，上記の変更の場合と同じダイアログが表示されます．

![gui-step8-paint-append1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-append1.png){ style="zoom: 0.5" .on-glb }

Selectionの部分には，current selection（先ほど選択したAsp119〜Leu129に対応するselection)が自動的に入っているので，特に変更する必要はありません．
色の部分は，Paletteから赤を選択します．完了したらOKを押してください．

図のように，リストに項目が追加され，C末端のヘリックスのあたりが赤い色に変化しました．

![gui-step8-paint-appended1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-appended1.png){ style="zoom: 0.5" .on-glb }


さらに，塗りを追加してみましょう．
次は，特に分子の選択状態（current selection）を変更せずに，
いきなりPaint coloringパネルで＋ボタンをクリックして項目を追加します．
ただし，塗りの項目は何も選択していない状態（あるいは一番上が選択されている状態）にしてください．

同じように，トップに項目が追加され，その項目の変更ダイアログが表示されます．
このままだと先ほどと同じselectionに対して塗りが追加されてしまいますので，
selectionのところを開いて，**helix**を選択します（あるいは直接helixと文字を入力しても構いません）．
一方で，Colorの方では，PaletteからBlue, 50% Sat（うすい青色）を選択し，OKを押します．

そうすると，下図のようにヘリックスの部分がうすい青色に変化します．

![gui-step8-paint-after2-1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-after2-1.png){ style="zoom: 0.3" .on-glb }

特にC末端のヘリックス（図では上の方）に注目してください．
前はすべて赤色に塗られていましたが，ヘリックスの部分に関してはその上から薄青色で塗ったため，図のような着色になったわけです．

このように，選択と塗りの追加の繰り返しにより，一番上から塗り重ねていく感じでどんどん着色していくことができます．
（もちろん，リストの下の方の項目を選択した後で追加すれば，下に塗りを追加することもできます．わかりにくいですが．）

### 塗りの削除

次に，塗りの項目を削除してみます．
特に，今の状態では，塗りのリストの下から二番目（rprop secondary=helix, khaki色）の項目は，
先ほど追加したhelix, 薄青色の塗りによりすべて塗りつぶされてしまい，隠れてしまっているため，別になくても構わないわけです．
この項目を選択し，![gui-step8-paint-delbtn1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-delbtn1.png)ボタンを押すと，項目が削除され，Paint coloringパネルは以下のようになります．

![gui-step8-paint-delafter1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step8/gui-step8-paint-delafter1.png)

一方で，実際のリボンの着色の方は，全く変化していないことがわかると思います．

[ [&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step7) |
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step9) ]
