[ [Documents/GUIのチュートリアル(CueMol2)](../../../Documents/GUIのチュートリアル(CueMol2)) |
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step10) |
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step13) ]

## 原子間の距離などを測る
CueMol2では，GUIから原子を選択して
原子間の距離，角度，二面角を測定することができます．

### 2原子間の距離
まず，リゾチームの分子をsimpleレンダラーで表示してください．
次に，ウィンドウ上部のリボン（デフォルトではHomeになっている）を，
Measureにすると距離測定モードになります．

![distsel_mesuretab1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step12/distsel_mesuretab1.png)

Measureリボンが選択された状態では，リボン中に「Distance」，「Angle」，「Torsion」３つのボタンが表示されています．
デフォルトでは，２原子間の距離を測定するDistanceが選択されています．

この状態で，距離を測定したい２つの原子のうち，
まず１つめの原子をクリックすると，白色のマークが表示されます．


![distsel_1atom1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step12/distsel_1atom1.png)


次に，２原子のうち２原子目をクリックすると，
図のように原子間に点線が引かれ，その間の距離が線付近に表示されます．


![distsel_defined1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step12/distsel_defined1.png)


さらに，Log windowの方に，選択した各２原子の原子名と距離が出力されます．


![distsel_logwnd1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step12/distsel_logwnd1.png)


#### Atom pickのキャンセル
上記のように，１つめの原子をクリックすると白色のマークが表示されますが，
誤ってクリックしてしまった場合など，pickをキャンセルしたい場合があるかも知れません．

その場合は，Homeタブをクリックして，Measureモードを抜けると，
白色マークが削除され，Atom pickもキャンセルされます．

### 3原子で作られる角の角度
距離の場合と同様にして，３原子で作られる角の角度を測定し表示することが出来ます．

Measureリボン中の「Angle」ボタンを選択してください．

![distsel_mesuretab2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step12/distsel_mesuretab2.png)

そして次に，まず１つめの原子をクリックすると，白色のマークが表示されます．

同様に２つの原子をクリックすると，白色のマークが表示されます．

次に，３原子目をクリックすると，
図のように原子間に点線が引かれ，その間の角度が線付近に表示されます．


![anglsel_defined1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step12/anglsel_defined1.png)


上図では，Ser72 OG(側鎖OHの酸素)と，Na130と，Ser60 O(主鎖カルボニルの酸素)の３原子を順に選択しNa+イオンの配位子間の角度を測定した例です．

### 4原子で作られる二面角の角度
距離の場合と同様にして，４原子で作られる二面角の角度を測定し表示することが出来ます．

Measureリボン中の「Torsion」ボタンを選択してください．

そして，二面角を構成する４原子を順々にクリックしていってください．
４原子目をクリックすると４原子間に点線が引かれ，二面角の角度が線付近に表示されます．

## 距離・相互作用表示レンダラー
以上のように原子をクリックして距離などを表示できたと思いますが，
これらの表示を行っているのが**atomintr**レンダラーです．
Sceneパネルの方を見ると，measureという名称のatomintrレンダラーが勝手に作られているのがわかると思います．


![atomintr_rend1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step12/atomintr_rend1.png)


そのため，左方にある目玉アイコンをクリックすると，この相互作用表示を一時的に消すことができます．また，measure (atomintr)を選択した状態で，下方の「−」ボタンを押せば相互作用表示を削除することができます．

次節では，このatomintrレンダラーについてさらに詳しく見ていくことにします．

[ [&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step10) |
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step13) ]
