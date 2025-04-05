[一覧へ戻る](../../Documents/CueMol2Tutorial2013)

## Step3: リガンドの表示と全体構造図の完成
ChRには，リガンドとしてAll-trans retinalが結合していますが，本節ではこれを表示させ，図の完成とします．
（厳密には共有結合でタンパクに結合しているのでリガンドとは違うかもしれませんが，
便宜上このように説明しています）

全体図ではリガンドは小さすぎて見えにくいため，CPK (空間充填) modelで表示することにします．

### リガンドの選択表示
まず，retinalを選択する必要がありますが，それには何通りか方法があります．
以下それぞれ説明します．

#### 構造モデルをクリックして選択する
「構造モデルをクリックすることによる選択」は，
分子の構造中に目的とする分子や残基がどこにあるか，
ある程度分かっている場合に便利です．

まず，リボンモデルは分子中の主鎖しか表示されていないため，分子をクリックして選択するには不向きです．クリック用にsimple rendererを作成しましょう．

まず，Sceneパネルで3UG9_AB.pdbをクリックして選択し，パネル下方の＋ボタンを押すと，3UG9_AB.pdbへのrendererを追加するdialogが表示されます．


> ![step3-1createrend1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-1createrend1.png){ style="zoom: 0.75" .on-glb } → ![step3-1createrend2](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-1createrend2.png){ style="zoom: 0.5" .on-glb }

そして，Rendererからsimpleを選び，Selectionはチェックを外しておき，OKを押します．
すると，分子全体に対してsimple rendererの表示が追加されます．

現時点でsimple1の炭素原子の色はdefaultである$molcol（3UG9-AB object側の着色を参照）になっています．
このままではsimple1 rendererの炭素原子の色が白っぽいため，背景の白色に溶け込んで非常に見づらくなってしまいます．
そこで，Coloring panelでsimple1の炭素原子の色を黒っぽい灰色（#404040）に変更します（見易ければ何でもよいのでblackとかでもOK）．

![step3-2simplerend1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-2simplerend1.png){ style="zoom: 0.75" .on-glb }


色の変更後は以下のような表示になります．

![step3-3createrend3](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-3createrend3.png){ style="zoom: 0.25" .on-glb }


**補足**

> selectionを指定せずにrendererを作成すると分子全体を表示するrendererが作成されます（*やallを指定したのと同じ効果）

**補足**

> このようにSimple rendererは何かと使う場面が多いので，最終的な図には不要な場合でも作成しておいたほうが何かと便利です．

次に，viewを操作してTMの中心付近を見ると，retinalがあることが分かります．

A分子のretinalの原子のいずれかをdouble clickすると，retinal残基が選択されます．


![step3-4retinal1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-4retinal1.png){ style="zoom: 0.5" .on-glb }


**補足**

> 誤ってretinal以外をdouble clickしてしまって選択された場合は，
その残基を再度double clickすることで選択を解除できます．
また，ともかくも何も選択されていない状態にするには，
分子中の任意の原子を右クリックし，
表示されるcontext menuから「Unselect」を実行すればOK．
Double clickによる残基選択は現在の選択に追加されるように働く．
意図せず前の選択が残っている心配がある場合は，これを実行しておけば安心．


#### MolStructパネルを使用して選択する
MolStructパネルを使用した選択は，
目的分子等の残基名が分かっている場合に便利です．
分子中でretinalはRETという残基名になっており，
残基番号はタンパク質残基より後になっています．

MolStructパネル
（詳しい使用方法等は [GUI tutorial](../../Documents/GUIのチュートリアル(CueMol2)/Step3)を参照）
には，以下のようにchain A, Bがあります．


![step3-5molstrpanel1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-5molstrpanel1.png){ .on-glb }


ここでは，chain Aのretinal分子を選択したいので，
Aを開いて，スクロールしてその中からRETという残基名の項目を探します．
はじめの方はタンパク質残基なので，下の方までスクロールして探すとすぐに見つかります．


![step3-6molstrpanel2](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-6molstrpanel2.png){ .on-glb }


見つかったら，「401 RET」という項目をクリックして，
パネル下方の矢印ボタン![step3-25arrowbtn1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-25arrowbtn1.png)を押すと，retinalが選択されます．
さらに，![step3-7centerat1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-7centerat1.png){ .on-glb }ボタンを押すと，retinalが分子view中心に移動します．
また，![step3-8zoomat1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-8zoomat1.png){ .on-glb }ボタンを押すと中心が移動するだけでなく，zoom(拡大率)やslabも選択対象にフィットするように自動調節されます．

また，MolStructパネルでは，単一残基だけでなく，複数残基を選択することも可能です．

#### Selectionパネルから選択文を入力して選択する
選択しようとする目的の残基やリガンドの，
残基名，残基番号などがあらかじめ分かっている場合は，
Selectionパネルから選択文を入力して選択するのが便利です．
（選択文自体は既にSTEP1,2で着色の指定などに使用しました）

Selectionパネルを開き，タブ「![step3-10selpanelicon1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-10selpanelicon1.png){ .on-glb }」が選択されていると，
下図のような状態になっているはずです．


![step3-9selpanel1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-9selpanel1.png){ .on-glb }


この状態で，"Input selection command"の部分に選択文を入力し，
下方の矢印ボタンを押すと，入力した選択文に対応する部分が選択されます．

ChRのretinalはA鎖, B差ともに401番目の残基になっているので，選択文に
```
A.401.*
```

と入力し，矢印ボタンを押すとA鎖のretinalが選択されます．

選択文を使用すると，様々に複雑な方法で選択することが可能です．
選択文の詳細は[cuemol2/SelSyntax](../../cuemol2/SelSyntax)を参照してください．

### Styleへの登録
Retinalに関する操作は今後よく行う可能性があるので，retinalの色と選択をstyleへ登録しておきます．

|Name|color|selection|h
|ARetinal|hsb(300,0.5,1)|A.401.*|
|BRetinal| #808080|B.401.*|


#### Retinalの色を定義
[Step2](../../Documents/CueMol2Tutorial2013/Step2)の操作と同様にして，上記の表の色(ARetinal, BRetinal)を定義します．
操作方法の詳細は[Step2](../../Documents/CueMol2Tutorial2013/Step2)を参照してください．

定義後は，dialogは以下のようになります．

![step3-11colstyle1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-11colstyle1.png){ style="zoom: 0.75" .on-glb }


#### Retinalの選択を定義
[Step2](../../Documents/CueMol2Tutorial2013/Step2)の操作と同様にして，上記の表の選択(ARetinal, BRetinal)を定義します．
操作方法の詳細は[Step2](../../Documents/CueMol2Tutorial2013/Step2)を参照してください．

定義後は，dialogは以下のようになります．

![step3-12selstyle1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-12selstyle1.png){ style="zoom: 0.75" .on-glb }


（本来なら，B分子のretinalの選択もクリックしたりして調べておいてから定義するものだが詳細は省略）

定義が完了したら，OKボタンを押してstyleを登録します．

### CPKモデルの表示
次に，上記で選択したretinalに対応するCPK rendererを作成します．

Sceneパネルで3UG9_ABをクリックして選択し，パネル下方の＋ボタンを押すと，3UG9_ABへのrendererを追加するdialogが表示されます．


>![step3-1createrend1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-1createrend1.png){ style="zoom: 0.75" .on-glb } → ![step3-14createretinalrend1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-14createretinalrend1.png){ style="zoom: 0.5" .on-glb }

そして，

-  RendererからCPKを選び，

-  NameをA Retinalに変更し，

-  Selectionをチェック

-  Selectionの選択文ボックスの▼ボタンを押すと，
styleで定義したARetinalがDropdown listbox中にあるので，それを指定します．（直接ARetinalとtext boxに入力しても構いません）

すると，下図のように，retinalがCPK modelで表示されます．


![step3-15createretinalrend2](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-15createretinalrend2.png){ style="zoom: 0.25" .on-glb }



### 色の変更
上記の操作でretinalをCPK表示することが出来ましたが，
retinalの（炭素原子の）色が白色になってしまっています．
これは，前Step2では蛋白質に相当する部分の着色は指定しましたが，
A401番残基（retinalに相当）の色がまだ指定されていないためです．

そこで次に，A401番残基retinalの色を指定します．














Coloring panelで「3UG9-AB」を選択し，「＋」ボタンを押して塗りを追加します．
するとDialogが出てきますので，色をARetinalに，選択もARetinalにし，OKを押します．

> ![step3-16retinalpaint1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-16retinalpaint1.png){ style="zoom: 0.5" .on-glb } → ![step3-17retinalpaint2](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-17retinalpaint2.png){ style="zoom: 0.75" .on-glb }

以上の設定変更を行うと，下図のような表示になります．

![step3-18retinalpaint_fin1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-18retinalpaint_fin1.png){ style="zoom: 0.25" .on-glb }


### B鎖のretinalのCPKモデルを表示する
前項のA鎖retinalの場合と同様にして，B鎖のretinalのCPK rendererを作成します．
Sceneパネルで3UG9-ABを選択した状態で下方の「＋」ボタンを押してrendererを追加します．
Renderer option dialogでは，

-  NameをB Retinalに

-  SelectionをBRetinal (or B.401.*)

に変更しOKボタンをおします．

この状態では，B Retinalの色がChainB (うすい灰色)になっています．
この色を，前項で定義したBRetinal色(濃い灰色)に変更します．

前項同様に，まずColoring panelで「3UG9-AB」を選択し，「＋」ボタンを押して塗りを追加します．
するとDialogが出てきますので，色をBRetinalに，選択もBRetinalにし，OKを押します．

以上の操作を行うと，B鎖のretinalが下図のような表示にまります．

![step3-19retinalpaint_fin2](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-19retinalpaint_fin2.png){ style="zoom: 0.5" .on-glb }


### リガンドが見やすいように，helixを細くする
次に，ヘリックスのリボン表示にretinalが隠れてしまって見づらいので，リボンを細くします．
まず，Sceneパネルのribbon1 (ribbon)という項目（蛋白質主鎖全体のリボン表示renderer）をダブルクリックします．
すると設定ダイアログが表示されます．

![step3-20ribbonprop1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-20ribbonprop1.png){ style="zoom: 0.25" .on-glb }


次に，ダイアログ中にあるHelixタブをクリックし，Helixに関する設定を表示させます（上図は既にhelixタブが選択された状態）．

そして，Tuberの値を6→4に減少させます．

![step3-21ribbonprop2](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-21ribbonprop2.png)


OKボタンを押してdialogを閉じると，ヘリックスの表示が細くなります．
さらに，Sceneパネルを操作しsimple1 rendererを非表示にし，
さらにViewをタンパクの正面から見るように調整すると，
以下のような表示になります．

![step3-22ribbonprop_fin1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-22ribbonprop_fin1.png){ style="zoom: 0.4" .on-glb }


**※Tuber値の意味**

> RibbonやTubeには全てWidthとTuberという値があります．
Widthはチューブやリボンの厚さ方向の寸法であり，Å単位で指定します．
一方Tuberはチューブやリボンの幅で，Widthの何倍にするかを指定します．
このケースでは，HelixのTuberは6だったので，厚さの6倍の幅を持つリボン状の表示でしたが，
これを4に減少させたことで，幅が細いリボン状の表示になったわけです．

### 保存とRendering
以上でシーンが完成したので，シーンをfig1_overall_3.qscという名前で保存します．
（実際の作業では，操作ミスやクラッシュも有り得るのでもっと頻繁に保存しておいた方が良い．）

次に，画像ファイルへの最終的なrenderingを行います．
メニュー「Render」→「POV-Ray Rendering」を実行すると，
POV-Ray Renderingダイアログが表示されます．

このダイアログでは，以下の設定を変更（あるいは正しく設定されているか確認）します．

-  Width, Heightを1200に設定

-  DPIを600に設定<br />
→図の印刷後サイズは2x2 inch (約5cm x 5cm)になる

-  Stereoをnoneに設定

-  Projectionをperspectiveに設定

-  Clipping planeのcheckを外す<br />
（現在のシーンではslabでカットされている部分がないので）

-  Post-render...のcheckを外す<br />
（現在のシーンでは半透明の部分がないので）


![step3-23renderdlg1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-23renderdlg1.png){ style="zoom: 0.5" .on-glb }


Renderボタンを押すとrenderingが始まります．

完了すると，Save image...ボタンが押せるようになるので，
押して完成した画像を保存します．


![step3-24render_fin1](../../assets/images/Documents/CueMol2Tutorial2013/Step3/step3-24render_fin1.png){ style="zoom: 0.5" .on-glb }


※完成した画像は，ほかのソフトウェア（イラレやパワポなど）に取り込んで使用する．

[Documents/CueMol2Tutorial2013](../../Documents/CueMol2Tutorial2013)
