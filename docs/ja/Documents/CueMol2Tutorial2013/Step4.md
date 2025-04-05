[一覧へ戻る](../../../Documents/CueMol2Tutorial2013)

## Step4: 類似蛋白質との重ね合わせの図を作成

論文などで類似構造を持つタンパク質と構造比較を行い，議論することがよくありますが，
このstepでは，ChRとバクテリオロドプシン(bR, PDB ID=1IW6)との重ね合わせ図を作成します．
(Fig. 2, fig2_superpose.qscとします)

### 新規シーンの作成など
まず，前ステップとは別の図を作るので，新しいシーンを作成します．

メニュー「File」→「New Tab」を実行すると，New Tab/Window dialogが表示されますが，「New Scene」を選択してOKを押すと新規シーンが作成されます．（GUIのチュートリアル[Step6](../../../Documents/GUIのチュートリアル(CueMol2)/Step6)参照）



そして，先に「名前を付けて保存」を実行し，fig2_superpose.qscという名前でシーンを保存します．
（あと，特に指定はしていませんが，適宜シーンを保存するのを忘れないようにしてください．）

複数の図を1つのsceneで作ってしまうことも可能ですが，
図として違う場合は別のsceneにするのがお勧めです．

### PDB IDを指定してネットサイトから分子を読み込む
次に，bacteriorhodopsin (BR)のファイルをPDBから取得します．
PDB IDは1IW6です．（GUIのチュートリアル[Step1](../../../Documents/GUIのチュートリアル(CueMol2)/Step1)も参照）

メニューから，「File」→「Get PDB using accession code ...」を実行すると，
Enter PDB IDとかかれたdialogが現れるので，1IW6と入力します．

ファイルがダウンロードされた後，Renderer option dialogが表示されます．

ここでは，まず重ね合わせがちゃんとできているか確認しやすいように，trace rendererを指定してください．
さらに，Recenter viewもチェックされていることを確認してください（自動的に読み込まれたBRに視点が移動する）

以上の操作を行うと，以下の図のようにBRの主鎖構造が表示されます．

![step4-1loadbr-trace1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step4-1loadbr-trace1.png){ style="zoom: 0.25" .on-glb }


さらに，ChRのPDBファイル(3UG9_AB.pdb)を開きます．([Step1](../../../Documents/CueMol2Tutorial2013/Step1)参照)

Renderer option dialogでは，BRと同様に，重ね合わせがちゃんとできているか確認しやすいように，
trace rendererを指定してください．
また，Object名は，前stepと同様に3UG9-ABに変更します（defaultでは3UG9-AB.pdbと拡張子がついている）

以上の操作を行うと，以下の図のようにChRの主鎖構造が表示されます．

![step4-2loadchr-trace1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step4-2loadchr-trace1.png){ style="zoom: 0.25" .on-glb }



### SSM superposeによる重ね合わせ
このままではBRとChRがそれぞれ別の位置・向きにあるため比較が困難です．
そのため，ChRとBRの重ね合わせを行います．

重ね合わせには，対応する原子を手動で指定して重ね合わせる方法と，
タンパク質の二次構造の立体配置に基づいて自動的に重ね合わせるSSM superposeの２つの方法があります．

ここではSSM superposeを用いた自動的な重ね合わせの方法を説明します．

まず，メニュー「Tools」→「Molecular superposition...」を実行すると，
Molecular superposition dialogが現れます．


![step4-3ssmsuper1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step4-3ssmsuper1.png){ style="zoom: 0.5" .on-glb }


次に，dialogの設定を以下の通り変更（あるいはそうなっているか確認）します．

-  AlgorithmをSecondary Structure Matchingに．

-  Referenceの方のMoleculeを3UG9-AB.pdb (ChR)に

-  Referenceの方のSelectionをc; A (A鎖のみ)にする．<br />
ChRにはchain A, Bの２分子含まれていますが，こうすることでchain Aのみが重ね合わせの対象になります．

-  Movingの方のMoleculeを1IW6 (bR)に．

-  Movingの方のSelectionは"*"のまま

以上を指定後，OKボタンを押すと重ね合わせが実行されます．

何らかのエラーがおき重ね合わせができなかった場合はエラーが表示されますので，
エラーを修正後再度OKを押してください．

問題なく重ね合わせができた場合はdialogが閉じ，分子ビューの表示が更新され，
log windowに結果(rmsd, alignment等)が表示されます：
```
===== SSM superpose result =====
```
```
 Ref: 3UG9-AB, Mov: 1IW6
```
```
 RMSD: 2.139394 angstrom
```
```
 Nalgn: 200
```
```
 Ngaps: 6
```
```
 Rotation: 154.039064 degree
```
```
 Alignment:
```
```
 (以下alignment表示が続く)
```
```
 ...
```

Molecular superpositionが行われると，分子ビューの方は以下の図のように変化し，ChRのA鎖にBRが重ね合わさったことが分かります．

![step4-4ssmsuper_fin1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step4-4ssmsuper_fin1.png){ style="zoom: 0.25" .on-glb }


### 図の作成への準備
重ね合わせができたことが確認できたので，以降は表示を作図用に作っていきます．

まず，背景を白にします（[Step1](../../../Documents/CueMol2Tutorial2013/Step1)背景を白色にする参照）．

次に，styleをimportします．Sceneパネルで，Stylesを選択し，右クリックでcontext menuを表示させ，
「Style file」→「Load ...」を実行します．

![step5-6importstyle1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-6importstyle1.png){ style="zoom: 0.75" .on-glb }

すると，Open style file dialogが表示されるので，そこから前節([Step2](../../../Documents/CueMol2Tutorial2013/Step2))で書き出したcommon_style.xmlを選択します．
OKを押してdialogを閉じるとcommon_style.xmlがimportされます．

![step5-7importstyle2](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-7importstyle2.png)


あと，BR, ChRそれぞれにsimple rendererを作成しておきます．
前節のシーンファイル（もし開いていないなら別タブに開く）から，
simple rendererをコピー・ペーストすれば簡単です（[cuemol2/ObjRendCopyPaste](../../../cuemol2/ObjRendCopyPaste)を参照）．

Simple rendererをコピーしてきたのち，表示をONにすると以下のような表示になります．

![step4-5simplerend1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step4-5simplerend1.png){ style="zoom: 0.25" .on-glb }


### Cartoon表示
重ね合わせ図はごちゃごちゃしやすいので，
ribbonではなくcartoon表示（helixがcylinder状に表示される）が適しています．

まず，BRの方のcartoon表示を作成します．
Sceneパネルで1IW6を選択し，「＋」ボタンを押してrendererを作成します．
Setup renderer dialogでは，

-  Renderer typeはcartoonを選び，

-  Selectionをcheckし

-  Selectionのtext boxに*（あるいはproteinでもOK）を入力します．

次に，ChRの方のcartoon表示も作成します．
Sceneパネルで3UG9-ABを選択し「＋」ボタンを押してrendererを作成します．
Setup renderer dialogでは，

-  Renderer typeはcartoonを選び，

-  Selectionをcheckし

-  Selectionのtext boxにc; Aと入力し，A鎖に対するcartoon rendererのみ作成されるようにします．

（[Step1](../../../Documents/CueMol2Tutorial2013/Step3)・RetinalのCPK renderer作成の項目を参照）

以上の操作を行うと，分子ビューは下図のようになります．

![step5-5cartoonrend1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-5cartoonrend1.png){ style="zoom: 0.25" .on-glb }


### Cartoonの着色
#### ChRの設定
ChRのCartoon表示の着色については，全体構造図のribbonと同じにします（[Step3](../../../Documents/CueMol2Tutorial2013/Step3)参照）．
まず，Colorパネルで3UG9-ABを選ぶと，defaultの着色が入っているので，それらをすべて削除します（![step5-8clearpaint1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-8clearpaint1.png)ボタンで一括削除できます）．
その後，Step3のribbonと同じ着色を一つ一つ追加してやると同じ着色になります．

あるいは，Step3 (fig1_overall_3.qsc)からコピー・ペーストしてやると非常に簡単に同じ着色に設定することができます．

-  **fig1の着色設定をコピーする**<br />
まず，fig1_overall_3.qscのタブをクリックし（開いていないようならFile→Open sceneで開いておく），Colorパネルで3UG9-ABの着色設定を表示させます．<br />
下のlistboxで全ての項目を選択し（一番上の項目をクリック→一番下の項目をshiftを押しながらclick），listboxの中で右ボタンをクリックするとcontext menuが表示されます．<br />
メニュー中からCopyを選ぶと設定がコピーされます．

-  **fig2へ設定をペーストする**<br />
fig2_superpose_1.qscのタブをクリックし，Colorパネルで3UG9-ABの着色設定を表示させます．<br />
この状態ではlistboxは空になっているはずです．<br />
listboxの中で右ボタンをクリックするとcontext menuが表示されます．<br />
メニュー中からPasteを選ぶと設定がペーストされます．

最終的には，Colorパネルは以下のようになります．

![step5-9chrpaint1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-9chrpaint1.png){ style="zoom: 0.5" .on-glb }


#### BRの設定
次に，BRのcartoon rendererの着色を指定します．

まず，styleにBRの選択文と色を定義します．
BRはほぼTMしかないので，色分けせずに単色で塗ることにします．

|Name|color|selection|h
|BR|hsb(40,0.5,1)|*|

選択はBR分子全体(*)なので，定義するほどでもないですが，一応定義します．

SceneパネルでStylesを展開しcommon_styleの項目をdouble clickすると，Style editor dialogが表示されます．<br />
Colorタブで新規項目を追加し，上記のBRの色定義を追加します．<br />
さらに，Selectionタブで新規項目を追加し，上記のBRの選択定義を追加します．<br />
（詳しい方法は，[Step2 色と選択の定義](../../../Documents/CueMol2Tutorial2013/Step2)を参照してください）

次に，定義された色と選択を使用して，paint coloringを設定します．
（詳しい方法は，[Step2 色と分子選択定義を使用するように変更する](../../../Documents/CueMol2Tutorial2013/Step2)を参照してください）
Color panelで1IW6を選び，
まず，![step5-8clearpaint1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-8clearpaint1.png)ボタンでdefaultの塗り設定をすべて削除します．
次に，「＋」ボタンで塗り項目を追加して，
分子選択をBR（リストボックスの中にあるはず）に
色もbr（Named color中にあるはず）に変更し，
OKを押すと着色項目が追加されます．


> ![step5-10brpaint1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-10brpaint1.png) → ![step5-11brpaint_fin1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-11brpaint_fin1.png){ style="zoom: 0.25" .on-glb }

**注意**

>外部ファイル中にあるスタイルは変更後保存しておいた方がよい．
シーン全体を保存すると，外部ファイルにリンクされているスタイルについても書き出される．
保存をすると，common_styles.xmlにスタイルの変更が書き出される．


> ※あるいは，明示的に保存することでcommon_styles.xmlを更新することも可能．
シーンパネルで，保存するスタイル項目を左クリックするとcontext menuが表示されます．
そして，このメニューで，「File」→「Save」をクリックします．
すると，外部ファイル（common_style.xml）に変更後のスタイルの内容が書き出されます．

**注意**

>スタイルを編集したシーンとは異なる別シーンも同時に開いている場合，
上記の書き出しを行うと，それらの別シーンでのスタイル定義とファイル中の定義が異なったものとなり不整合が生じる．
別シーンではReloadを行うことでファイル中のスタイル定義が読み込まれ，不整合が解消される．
（この場合は，fig2_superpose.qscからstyleを変更したので，
もしfig1_overall.qscを別タブで開いているようなら，そちら側でstyle再読み込みを行っておく）

### RetinalのCPK modelを作成する
#### ChR
[Step3](../../../Documents/CueMol2Tutorial2013/Step3)と同様にしてretinalのCPK modelを作成します．
ChRの方は操作はStep3とほぼ同じなので，Step3を参照してください．

あるいは，fig1_overall_3.qscのシーンの方からコピー・ペーストしてくると簡単にできます．

-  **fig1からコピー**<br />
fig1_overall_3.qscのタブをクリックし，fig1のシーンを表示させます．Sceneパネルで分子3UG9-ABを展開して
A鎖retinal（A Retinal(cpk)という項目）を右クリックし，context menuからcopyを選ぶ．

-  **fig2へペースト**<br />
fig2_superpose_1.qscのタブをクリックし，fig2のシーンを表示させます．
Sceneパネルで分子3UG9-ABを右クリックし，context menuからpasteを選ぶと，A RetinalのCPK rendererがペーストされる．
分子ビューにもretinalがピンク色で表示される．

（詳しくは[cuemol2/ObjRendCopyPaste](../../../cuemol2/ObjRendCopyPaste)を参照．）




#### BR
次に，BRの方もretinalをCPK表示させます．

まず，BRのretinalを選択します．MolStructパネルで1IW6を選択し，A鎖を展開してスクロールさせていくと「250 RET」という項目があることが分かります．


![step5-12brretinalsel1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-12brretinalsel1.png){ .on-glb }


この項目をクリックし，下のツールボタンの矢印ボタン![step3-25arrowbtn1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step3-25arrowbtn1.png)をクリックすると，BRのretinalが選択されます．
この状態でrendererを作成し，Setup renderer dialogでは，

-  Renderer typeはcpkに，

-  Renderer nameをBR Retinalに，

-  SelectionはA.250.* (上記で選択したものが自動的に入っている筈)

以上のように入力し，OKを押します．

**補足**

> BRのretinalに対する選択と色については，本チュートリアルではこの図以降出てくることがないので定義していない．本来ならば再度出てくることも考えられるので（BRRetinal等として）定義しておいた方が良いかもしれない．

最終的に作業用に作成したsimpleとtraceを非表示にすると，以下のような表示になります．

![step5-13cpkretinal_fin1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-13cpkretinal_fin1.png){ style="zoom: 0.25" .on-glb }


### Rendering
#### cameraとして視点を保存
以上の操作で表示は完成したので，上図のようにviewの向きを調整し，cameraとして念のため保存しておきます．

SceneパネルのCameraを選択し，「＋」ボタンを押すと新規camera名を入力するdialogが出てきます．
名前はdefaultのcamera_0のままでもよいので，OKを押すと（もちろん適当な名前に変更しても可）
現在のViewの状態がcamera_0として保存されます．

このように適宜重要なviewの状態をcameraとして保存しておくと，誤ってviewを動かしてしまったりしたときに，
camera_0をダブルクリックすることでその状態に戻る事ができるので便利です．

（詳しくは[Documents/GUIのチュートリアル(CueMol2)/Step9](../../../Documents/GUIのチュートリアル(CueMol2)/Step9)や[cuemol2/Camera](../../../cuemol2/Camera)を参照）

#### POV-Rayによるrendering
以上でシーンが完成しました．

画像にrenderingするには，
Viewを調整し図のような向きにして，
メニュー「Render」→「POV-Ray Rendering」を実行してください．
[Step3 保存とRendering](../../../Documents/CueMol2Tutorial2013/Step3)と同様に設定を行い，
Renderボタンを押すと画像が生成されます．
Save image...ボタンを押せば，完成した画像をpng形式で保存できます．


![step5-14povrender_fin1](../../../assets/images/Documents/CueMol2Tutorial2013/Step4/step5-14povrender_fin1.png){ style="zoom: 0.5" .on-glb }

