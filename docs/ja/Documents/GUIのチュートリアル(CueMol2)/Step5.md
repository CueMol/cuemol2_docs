[ [GUIのチュートリアル indexへ戻る](../../../Documents/GUIのチュートリアル(CueMol2)/) |
[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step4) |
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step6) ]

## レンダラーのプロパティーを変更する

レンダラーには様々な**プロパティー**（設定値みたいなもの）があり，
それを変更することで外見を変えることが出来ます．

### Ballstickレンダラーのプロパティー
Sceneパレットで，レンダラー名（今回の場合は先ほど作成した"ballstick1"）をダブルクリック，
あるいは選択して，下方の![gui_step5_propchgbtn2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step5/gui_step5_propchgbtn2.png)**プロパティー変更ボタン**を押してください．
以下のようなダイアログが出てきます．


![gui_step5_bschgprop](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step5/gui_step5_bschgprop.png){ style="zoom: 0.5" .on-glb }


上図のように，

-  Detail（描画の精度）を**8**に

-  Bond width (共有結合を表す棒の太さ；Å単位)を**0.4**に

-  Atom radius (原子を表す球の大きさ；Å単位)を**0.4**に

-  Show ringにチェックを入れる

-  Thickness (リングに表示される板の厚さ；Å単位)を**0.3**に

に変更してみてください．


![gui_step5_bs2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step5/gui_step5_bs2.png){ style="zoom: 0.5" .on-glb }


なんかずんぐりしたスティックモデルになってしまいましたが，
それ以外にも，フェニルアラニンの芳香環に板が表示されているのが分かると思います．板の厚さはボンドの太さよりも0.1Å薄いため，図のように，へこんだ感じになっています．同じにすると，一つの６角形の板のような表示になります．

### Ribbonレンダラーのプロパティー

次は，先ほど作成した，Lysozyme全体に対するribbonレンダラーのプロパティーを変更してみましょう．

Ballstickの場合と同様に，
Sceneパネルでribbon1という項目をダブルクリック，あるいは選択してからプロパティー変更ボタンを押すと，ballstickの場合とは異なる以下のようなダイアログが現れます．


![gui_step5_ribbon_chgprop](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step5/gui_step5_ribbon_chgprop.png){ style="zoom: 0.5" .on-glb }


Ballstickの例のところでは触れませんでしたが，ダイアログ上方にタブがあり，
プロパティーはカテゴリごとに分けられています．
Ribbonレンダラーは設定が多いため，図のようにCommon, Helix, Sheet, Coil計４項目に分かれています．
ここでは，まずHelixタブを選択して，リボンのうちヘリックス部分の設定を変えてみることにします．

まずHelixタブを選択して，上図のように，

-  Helix SectionのType（ヘリックス断面の形状）を**Elliptical**(楕円状)に

-  Helix HeadのType (ヘリックス部分の先端の形状)を**Arrow**（矢状）に

-  Helix TailのType (ヘリックス部分の先端の形状)を**Flat**（平坦）

に変更してみてください．


![gui_step5_ribbon2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step5/gui_step5_ribbon2.png){ style="zoom: 0.5" .on-glb }


ヘリックスが，矢印状の表示に変わったと思います．
設定の組み合わせで非常に多様な表示が可能です．
ただ，シートの部分はこういう表示にする場合が多いですが（というがデフォルトでそうなっている），
ヘリックスはあまりこういう表示にはしないですね．

### Genericタブについて
このように，多くの場合レンダラー固有の設定ダイアログでプロパティー変更が可能ですが，
あまりいじる必要がないプロパティーや
まだ開発途上のものなどは，
Genericタブでしか変更できないものがあります．((逆に，Genericタブからは，一応すべてのプロパティーが変更可能です．))

![gui_step5_generic2](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step5/gui_step5_generic2.png){ style="zoom: 0.5" .on-glb }

上図は，ribbonレンダラーのGenericタブを表示したものです．
各項目は，以下のようになっています．

-  Nameはプロパティ名

-  RのところにRという文字がある項目は，read onlyで変更できないプロパティ

-  Typeは型（数値とか文字列とか）

-  Valueは現在の値．

項目を選択すると，下のエディットボックスの部分に同じ内容が表示され，
編集できるようになります．図では，一番先頭にあるalphaというプロパティーを選択した状態になっています．
（alphaは透明度の設定値で，1の場合は不透明，0の場合は完全に透明になります．）
設定をいじっていなければ，たいていのプロパティ値はデフォルト状態になっています．
デフォルト状態だと，Valueの横のdefaultチェックがONになった状態になっています．
デフォルトから変更したい場合は，このチェックをOFFにし，右のエディットボックスに値を入力してください．
逆に，デフォルトに戻したい場合は，defaultチェックをONに戻せばOKです．


![gui_step5_ribbon_alpha1](../../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step5/gui_step5_ribbon_alpha1.png){ style="zoom: 0.5" .on-glb }

上図は，Ribbonレンダラーのalphaプロパティーをデフォルトから0.5に変更した後の状態を表しています．

他のレンダラーにも各々のプロパティーがあります．

[&lt;--前に戻る](../../../Documents/GUIのチュートリアル(CueMol2)/Step4)|
[次へ--&gt;](../../../Documents/GUIのチュートリアル(CueMol2)/Step6)
