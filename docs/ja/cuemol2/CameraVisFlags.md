[Documents](../../Documents)

## Cameraにrenderer等の表示・非表示状態を保存する
Cameraには，現在の視点等の情報以外に，objects/renderersの表示・非表示状態を保存することが可能です．

*  多くのMolCoord(分子構造) objectを読み込む，あるいは多くのrendererを作成している状態で，
各objects/renderersの表示・非表示状態の管理が面倒

*  1つのsceneで複数のFigureに対応する画像を作成したい

などの場合に使用すると便利です．

### 表示状態の保存
Cameraに表示・非表示状態(vis flags)を保存したい場合は，対象cameraを右クリックし，表示されるcontext menuで「Save from scene (with vis flags)」を実行します．


![camvis-ctxtmenu1](../../assets/images/cuemol2/CameraVisFlags/camvis-ctxtmenu1.png){ style="zoom: 0.5" .on-glb }


「Save from scene (with vis flags)」を実行すると，現在のsceneの全てのobjects/renderersの表示・非表示状態が対象とするcameraに保存されます．

Cameraに表示・非表示状態(vis flags)が保存されている場合は，そのcameraの項目の横に目のアイコンが表示されます（ただし現バージョンではバグで表示されないことがあります）


![camvis-visset1](../../assets/images/cuemol2/CameraVisFlags/camvis-visset1.png){ .on-glb }


### 保存した表示・非表示状態の復元

Cameraに保存されている表示・非表示状態(vis flags)を復元したい場合は，
対象cameraを右クリックし，表示されるcontext menuで「Load to scene (with vis flags)」を実行します．

あるいは，cameraをdouble clickしても同様の効果があります．

このとき，保存されている表示・非表示状態以外にも，context menuの「Apply to view」同様に，
視点情報なども現在のviewに適用されます．

### 表示・非表示状態を編集する
上記のcontext menuから「Edit vis flags...」を実行すると，該当cameraに保存されている表示・非表示状態(vis flags)を編集することができます．以下のようなdialogが表示されます．

![camvis-editdlg1](../../assets/images/cuemol2/CameraVisFlags/camvis-editdlg1.png){ .on-glb }


中央のObj/Rendカラム
:   現在のSceneにあるobjects/renderersがscene panel同様に表示されています．

左のIncカラム
:   チェックマークが表示されていたりされていなかったりしますが，

表示されているものに関しては，（現在編集中の）cameraに表示・非表示状態の情報(vis flag)が保存されていることを示しています．<br />
すなわち，context menuの「Load to scene (with vis flags)」を実行すると，このobject(あるいはrenderer)の表示・非表示状態は表示か非表示いずれかに変化します．<br />
逆に，何も表示されていない項目に関しては，対応するobject(あるいはrenderer)はグレー表示されており，vis flagは保存されていません．ですので，「Load to scene (with vis flags)」を実行しても，scene中の該当object(あるいはrenderer)の表示・非表示状態は変化しません．
右のVisカラム
:   目のアイコンが表示されていたりされていなかったりしますが，表示されているものに関しては，（現在編集中の）cameraには表示状態でvis flagが保存されています．なので，このcameraをdouble clickする(あるいはcontext menuの「Load to scene (with vis flags)」を実行する）と，この項目に対応するobject(あるいはrenderer)は表示状態になります．<br />

逆に，何も表示されていない項目に関しては，非表示状態でvis flagが保存されています．したがって「Load to scene (with vis flags)」を実行すると，対応するobject(あるいはrenderer)は非表示状態になります．

### 表示・非表示状態をすべて削除する
上記のcontext menuから「Clear vis flags」を実行すると，対象とするcameraに保存されている表示・非表示状態(vis flags)が全て削除されます．

さらに，表示・非表示状態が削除されると，そのcameraの項目の横に表示されていた目のアイコンが消えます（ただし現バージョンではバグで消えないことがあります）．


### その他
従来からある

*  Save from view
*  Apply to view

メニューについては，cameraの視点設定などのみが現在のviewに適用され，表示・非表示状態は無視され，scene中のobject, rendererの表示非表示状態には影響しません．

これを利用して(ややトリッキーですが)，あるcamera (A)から別のcamera (B)に表示・非表示状態(vis flags)のみをコピーすることが出来ます．

1.  camera (A)をコピーし，camera (copy1_A)を作成．
1.  camera (B)を選択し，「Apply to view」を実行
1.  camera (copy1_A)を選択し，「Save from view」を実行
1.  camera (B)を削除し，camera (copy1_A)をcamera (B)にrenameする．（ただしBを残して問題ないならこの段階は不要）

**注意点**:camera context menuの他の項目については，[Documents/GUIのチュートリアル(CueMol2)/Step9](../../Documents/GUIのチュートリアル(CueMol2)/Step9)と[cuemol2/CameraFile](../../cuemol2/CameraFile)を参照してください．