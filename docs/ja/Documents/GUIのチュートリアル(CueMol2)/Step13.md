[ [Documents/GUIのチュートリアル(CueMol2)](../../../Documents/GUIのチュートリアル(CueMol2)) |
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step12) ]

## 相互作用の表示

### Atomintr rendererの指定
前節では，距離表示などがmeasureという名称のatomintrレンダラーが自動的に作成されることで行われていることを説明しました．
このmeasureという名称がどこで決まっているのか？というと，Measureタブの一番右側にあるドロップダウンリストに指定した名前になるようになっています．


![measure_ribbon1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/measure_ribbon1.png)


それでは，次にこのmeasureの値を**measure2**に変更し，DistanceがONになった状態で（上図の状態）
適当に2原子をpickして相互作用を表示させてみてください．
以下の図では，Lysozyme(1QIO)のGlu35とその付近の水分子との相互作用をpickした状態です．

![atomintr_rend2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_rend2.png) ![measure_glu35_1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/measure_glu35_1.png)

右図のように，Sceneパネルには，指定した通りにmeasure2というatomintr rendererが作成され，左図のような距離点線が表示されます．

ではさらに，次にこのmeasureの値を**measure3**に変更し，
同様にして，新たに別な2原子をpickして相互作用を表示させてみてください．
以下の図では，Lysozyme(1QIO)のAsp52とその付近の側鎖・水分子との相互作用をpickした状態です．

![atomintr_rend3](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_rend3.png) ![measure_asp52_1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/measure_asp52_1.png)

右図のように，Sceneパネルには，指定した通りにmeasure3というatomintr rendererが別に作成され，左図のような距離点線が表示されます．さらに，Sceneパネル中，左の目玉アイコンをクリックして表示を消してみると分かると思いますが，measure3に変更してから追加した相互作用は，すべてmeasure3 atomintr rendererに属しているようになっています．（上図の状態だと，measure3を非表示にするとAsp52相互作用のみが消える）

このようにして，

*  相互作用の種類に応じて別々のrendererを作成することで，相互作用のグループ分けが可能．

ということが，お分かりいただけたと思います．

### Atomintr rendererの操作
Atomintr rendererにも，今まで説明してきたほかのレンダラーと同様に表示方法を指定するプロパティーがいくつかあります．

Sceneパネルで，measure2 (atomintr)の項目をダブルクリックすると，プロパティー設定ダイアログが表示されますが，
そこで**Interaction**タブをクリックすると，以下のような表示になります．


![atomintr_rend_prop1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_rend_prop1.png)


これらの値を以下のように変更してください．

*  Mode: 3D tube<br />
表示が線ではなく立体的なチューブ状になる

*  Show label: off<br />
距離などの値が表示されなくなる

*  Width: 0.1 Å<br />
Simpleモードでは線幅はピクセル単位で指定されているが，3D tubeモードではチューブの半径をÅ単位で指定する．（このように小さな値にしなければ異様に太くなってしまう．）

*  Color: cyan (直接cyanと入力してもよいし，Named colorで出てくる一覧から選んでもよい）
*  Dashed line: dash 0.5, gap 0.7<br />
点線の，線分(dash)と間隙(gap)の長さをÅ単位で指定する．（この設定は3D tube modeのみ有効で，Simpleモードでは無視される）

ダイアログ表示としては以下のようになります．


> ![atomintr_rend_prop2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_rend_prop2.png){ style="zoom: 0.75" .on-glb } ![measure_tube1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/measure_tube1.png) 

これでOKを押すと，表示は上図右のように変化します．
はじめに作成したmeasure2に属する点線のみが影響を受けて変化します．

### Styleを用いた表示の変更
このように，より論文の図やプレゼンテーションに向いた表示になりましたが，
それぞれの相互作用表示を作成するたびに上の設定を一つずつ変えるのは結構面倒です．

Styleを用いることで，表示をいくつかのプリセット値に一括変更することができます．
Sceneパネルでmeasure3 (atomintr)を右クリックすると，以下のようなcontext menuが表示されます．


![atomintr_rend4](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_rend4.png)


以上のメニューから**Dashed stick1**を選択すると，以下のようにmeasure3に属する点線のみ表示が変化します．


![measure_tube2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/measure_tube2.png)


注意点としては，このstyleによる設定変更と，前項でのプロパティーダイアログでの個別の値の設定では，後者の方が優先してしまうということです．
なので，たとえば以上の状況で，measure2のstyleを変更しても個別値設定の方が優先してしまい，外見は変化しないでしょう．

Styleの機能の詳細については，「[Styleについて](../../../cuemol2/Style)」をご覧ください．

### 相互作用リストの編集
以上の方法で，

*  相互作用の種類に応じて別々のrendererを作成することで，グループ分けできる．
*  グループごとに外見を設定できる．

ということが，お分かりいただけたと思います．

一方で，間違ってクリックしてしまったなど，グループに属する相互作用を削除したいケースがあるかもしれません．
Sceneパネルでmeasure3 (atomintr)を右クリックすると，上述同様にcontext menuが表示されますが，
ここで**Edit interaction list...**をクリックすると，
以下のようにmeasure3に属する相互作用一覧が表示されます．

![atomintr_edit1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_edit1.png)

ここでは，不要な項目を選択して下の方にある「−」ボタンを押すことで，相互作用を削除することが可能です．
例えば水分子がかかわる相互作用をすべて削除するには，残基名HOHがある項目を選んで１つずつ削除します．すると，以下のようになります．


> ![atomintr_edit2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_edit2.png) ![atomintr_edit3](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step13/atomintr_edit3.png){ .on-glb }

このように「−」ボタンを押すたびにリアルタイムで削除が更新されます．
誤って消してしまった場合は，いったんOKボタンを押してダイアログを抜け，
メニューの「Edit」→「Undo」によりundoすれば削除を取り消すことができます．

**