[ [GUIのチュートリアル indexへ戻る](../../Documents/GUIのチュートリアル(CueMol2)/) |
[&lt;--前に戻る](../../Documents/GUIのチュートリアル(CueMol2)/Step3) |
[次へ--&gt;](../../Documents/GUIのチュートリアル(CueMol2)/Step5) ]

## レンダラーの追加と削除

### 選択部分に対してレンダラーを追加

オブジェクトには，好きなだけレンダラーを接続することが出来ます．
現在，オブジェクト"lysozyme"に接続されているレンダラーは
"simple1"（タイプはsimple）だけです．
現在，lysozymeの残基Val2からPhe3までが選択されていますが（されて無い場合は
[Step3](../../Documents/GUIのチュートリアル(CueMol2)/Step3)を見て選択してください），
ここで新たなレンダラーを追加してこの部分をballstickモデルで表示してみましょう．


![gui_step4_wspal1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_wspal1.png)


ターゲットの分子オブジェクトを選択し，
下にある![gui_step4_newrnd](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_newrnd.png)
**レンダラー作成**ボタンを押すと，
下図のようなダイアログが表示されます((別にオブジェクトでなくレンダラーが選択されていても，その選択されているレンダラーがアタッチしているオブジェクトにレンダラーが追加されるようになっています))．


![gui_step4_newrdlg](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_newrdlg.png){ style="zoom: 0.5" .on-glb }


ファイルを読込んだ時に出てくるダイアログと似ていますが，Object:のところが
変更できなくなっています((CueMolでは読込むときに付けた名前は変更ができない))．

図のようにDropdown listboxからballstickを選びます．

さらに，Selection:という項目に，初めからチェックが入っており，
その横のDropdown listboxにはA.2:3.*という文字が入っています．
これは，先ほどMolStructパネルで選んだ部分に対応した選択文（後述）です．
このまま変更せずにOKをおすと，残基Val2からPhe3までに対して新規レンダラーが作成されます．

Recenter viewという項目にもチェックが入っていますが，このままOKを押すと，
新規作成されたレンダラーが画面中央にくるように，分子ビューの視点が移動されます．
現在の視点を変更したくない場合は，チェックを外します．

最後に，"Renderer name:"という項目がありますが，
ここには新規作成されるレンダラーの名前を入れますが，
CueMolが現在使われていない名前を勝手に判断して，適当な名前が最初から入っています．
（先ほどファイルを読込んだときにはスルーしましたが，何も入れなかったのでsimple1という名前がついてしまってたわけです．）
この状態では名前はballstick1となっていると思いますが，
何か分かりやすい名前を付けたい場合は，Renderer name:を入力してください．

OKを押すと新たなレンダラーが作られ，lysozymeのレンダラーとして追加されます．


![gui_step4_ballstk](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_ballstk.png){ style="zoom: 0.5" .on-glb }


Sceneパネルのほうも，追加が反映されています．
simple1以外に新しくballstick1が追加されています．


![gui_step4_wspal2](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_wspal2.png){ .on-glb }


### 分子全体に対してレンダラーを作成
現在の選択状態にかかわらず，ともかくも分子全体に対してレンダラーを作りたい場合があるかもしれません．
そういう場合は上述のSetup rendererダイアログボックスのSelection項目左横のチェックを外してOKを押せば，選択が無視され，全体に対してレンダラーが作成されます．


![gui_step4_newrenddlg2](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_newrenddlg2.png){ style="zoom: 0.5" .on-glb }


ここでは，上図のような状態にして選択を無視させ，ribbonレンダラーを全体に対して作成しましょう．


![gui_step4_newrend_ribbon1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_newrend_ribbon1.png){ style="zoom: 0.5" .on-glb }


最終的には，上図のような状態になるはずです．
### その他
上の例ではselectionを無効にして全体に対するribbonレンダラーを作成しましたが，他に，

-  Context menuやMolStructパネルで全体を選択した上で，レンダラーを作成する

-  Selection dropdown boxに表示されるall(*)という項目を選ぶと，選択文は*になり，この状態でOKを押すと，分子全体に対してレンダラーが作成される．

などいくつか他の方法でも可能です．
また，２つ目の方法を応用すると，現在選択されている部分とは別の任意の部分に対してレンダラーを追加することが可能です．

### レンダラーを削除

"ballstick1"を選択して下方の**削除ボタン**(![scene_delbtn1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/scene_delbtn1.png){ .on-glb })を押せば，
このballstickモデルを削除することができます．<br />
ただし，ここではまだ削除しないでください（あるいは削除してもundoで復活させてください）．

## あとから表示部分を変更する
レンダラーを作って後述のプロパティーなどを設定してしまった後で，
表示部分を変更したい場合が出てくるかもしれません．
現在，lysozyme/ballstick1レンダラーは，残基Val2, Phe3の２残基に対してのみ表示するように作られていますが，これを途中で残基Val2〜Glu7まで表示するように変更しなければならなくなったとしましょう．

まず，MolStructパネルから，下図のように，A2Val〜A7Gluを選択して，矢印ボタンを押し，対象部分を選択します．(MolStructパネルについては，[前ページ](../../Documents/GUIのチュートリアル(CueMol2)/Step3)も参照)

![gui_step4_molstr1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_molstr1.png){ style="zoom: 0.5" .on-glb }


次に，Sceneパネルでlysozyme/ballstick1レンダラーに対応する項目を右クリックするとcontext menuが表示されますが，そこで「Selection」→「Current」を選択します．


![gui_step4_ctxtmenu1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_ctxtmenu1.png){ style="zoom: 0.5" .on-glb }


すると，以下のようにballstick1の表示が，Glu7残基まで拡張されたことが分かります．(図では，見やすくするためにballstick1以外のレンダラーを非表示にしています．表示非表示の切り替え方法は[../Step2-1](../../Documents/GUIのチュートリアル(CueMol2)/Step2-1)を参照してください)

![gui_step4_before1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_before1.png){ style="zoom: 0.5" .on-glb } → ![gui_step4_changed1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step4/gui_step4_changed1.png){ style="zoom: 0.5" .on-glb }

それでは，次に進む前に，ballstick1の表示部分をもとに戻しておいてください（単にUndoしてもよいが，Val2, Phe3をMolStructパネルで選択して，上記同様にSceneパネルのcontext menuから変更してもよい）．

[&lt;--前に戻る](../../Documents/GUIのチュートリアル(CueMol2)/Step3)|
[次へ--&gt;](../../Documents/GUIのチュートリアル(CueMol2)/Step5)
