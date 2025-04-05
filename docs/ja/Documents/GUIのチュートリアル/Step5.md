[GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル/)|
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル/Step4)



## モデルの表示を追加・削除

オブジェクトには，好きなだけレンダラーをアタッチすることが出来ます．
現在，オブジェクト"lysozyme"に接続されているレンダラーは
"0"（タイプはsimple）だけです．
現在，lysozymeの残基63から73までが選択されていますが（されて無い場合は
[Step3](../../../Documents/GUIのチュートリアル/Step3)を見て選択してください），
ここで新たなレンダラーを追加してこの部分をballstickモデルで表示してみましょう．


![gui_step5_wspal1](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_wspal1.png){ .on-glb }


ターゲットの分子オブジェクトを選択し（といってもこの場合lysozymeしかないが），下の![gui_step5_newrnd](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_newrnd.png){ .on-glb }**Renederer作成**ボタンを押すと，
下図のようなダイアログが表示されます((別にオブジェクトでなくレンダラーが選択されていても，その選択されているレンダラーがアタッチしているオブジェクトにレンダラーが追加されるようになっています))．


![gui_step5_newrdlg](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_newrdlg.png){ .on-glb }


ファイルを読込んだ時に出てくるダイアログと似ていますが，Nameのところが
変更できなくなっています((CueMolでは読込むときに付けた名前は変更ができない))．
あと，上の図では隠れて見えなくなっていますが，"Renderer name:"という項目があります．
ここには本来レンダラーの名前を入れるわけですが，
入れなかった場合はCueMolが現在使われていない名前を勝手に判断して
適当な数字の名前を付けてしまいます．
（先ほどファイルを読込んだときにはスルーしましたが，
何も入れなかったので数字の0という名前がついてしまってたわけです．）
何か分かりやすい名前を付けたい場合は，
Renderer name:を入力してください．

dropdown listboxからballstickを選び，OKを押すと新たなレンダラーが作られ，lysozymeのレンダラーとして追加されます．


![gui_step5_ballstk](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_ballstk.png){ .on-glb }


Workspaceパレットのほうも，追加が反映されています．
階層を展開して（田ボタンを押す）レンダラーを表示すると，
0(simple)以外に新しく"1"(ballstick)が追加されています．


![gui_step5_wspal2](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_wspal2.png){ .on-glb }


"1"を選択して下方の**削除ボタン**(×)を押せば，
このballstickモデルを削除することができます．

## レンダラーのプロパティーを変更する

レンダラーには様々な**プロパティー**（設定値みたいなもの）があり，
それを変更することで外見を変えることが出来ます．

Workspaceパレットで，レンダラー名（今回の場合はballstickレンダラーである"1"）を選択して，下方の![gui_step5_propchgbtn](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_propchgbtn.png){ .on-glb }**プロパティー変更ボタン**を押してください．以下のようなダイアログが出てきます．（上方Tree view中の該当rendererのエントリーをダブルクリックでもOK）


![gui_step5_bschgprop](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_bschgprop.png){ .on-glb }


上図がデフォルトの設定ですが，
ラジオボタンを"Color by B-factor"(温度因子に従って着色)
にして，

-  Bond width (共有結合を表す棒の太さ；Å単位)を**0.4**に

-  Sphere radius (原子を表す球の大きさ；Å単位)を**0.4**に

-  Detail（描画の精度）を**8**に

-  下のほうの**High**を**30**に

-  下のほうの**Low**を**1**に
に変更してみてください．


![gui_step5_bsbfac1](../../../assets/images/Documents/GUIのチュートリアル/Step5/gui_step5_bsbfac1.png){ .on-glb }


なんかずんぐりしたスティックモデルになってしまいましたが，
温度因子にしたがって，高いほう(30Å^2)が赤に，
低いほう(1Å^2)が青になるよう表示されていることが分かると思います．
さすがに分解能が高いだけあって温度因子も低いですね．

他のレンダラーにも各々のプロパティーがあります．
ただ，一部GUIからの変更機能が実装されていないrendererもあります．

[&lt;--前に戻る](../../../Documents/GUIのチュートリアル/Step4)
