[一覧へ戻る](../../Documents/CueMol2Tutorial2013)

## Step2: スタイルの作成

CueMol2の特徴の一つでもありますが，
1.  色や選択の定義を共通のファイルで定義(=スタイル)
1.  異なる各シーンファイルでその定義(=スタイル)を取り込み，使用する

ことで，複数ある論文の図を通して，容易に一貫した色遣いで図を作成することが出来ます．

### 色と選択の定義
スタイルファイルによる色と選択の定義は，
はじめにすべてに色等を完全に定義してしまってから図の作成に取りかかる，というやり方もあります．
しかしながら，実際は，どのような色が必要かはある程度図を作ってみないと分からない面もあるので，
ここでは，まずある程度図を作った後に（例えば全体構造の図とか）
そこから必要な定義を割り出してスタイルを作り，
残りの図でその定義を使って図を作っていく，という方法を取ることにします．

本チュートリアルでは，まず大まかに以下のようなドメインにタンパクを分けて，それぞれに対して異なった着色をすることにします．
|Name|color|selection|h
|Ndom|hsb(0,0.5,1)  |A.49:83.*|
|TMs |hsb(120,0.5,1)|A.84:317.*|
|Cdom|hsb(240,0.5,1)|A.318:342.*|
|ChainB| #CCC|c; B|





前節では，以上のような色分けを，個々の場面で選択文と色を直接指定して行っていましたが，
本節ではそれをスタイル定義をつかって行います．


#### 新規スタイルの作成

まず，新規スタイルを作成します．
Sceneパネルで，Styles項目が選択された状態にし，下方の![step1-9color-add1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step1-9color-add1.png)ボタンをクリックします．

![step2-1create-style1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-1create-style1.png)


すると以下のようなダイアログが出てくるので，
スタイルの名前をcommon_styleに変更し，OKを押します．

![step2-1create-style2](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-1create-style2.png){ style="zoom: 0.75" .on-glb }


すると，以下のようにStylesの中にcommon_styleというスタイルが作成されました．

![step2-1create-style3](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-1create-style3.png)



#### 色の定義
次に，色の定義を作成します．
上記で作成したScene panel中のcommon_style項目（上図参照）をdouble clickします．
すると，以下のようなスタイル編集ダイアログが表示されます．

![step2-4edit-style1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-4edit-style1.png){ style="zoom: 0.75" .on-glb }


スタイルは何も定義されていないので，すべて空の状態になっています．

まず，右の![step1-9color-add1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step1-9color-add1.png)ボタンを押して，新しい色定義を追加します．
すると，color_0という新しい色定義の項目ができます．

![step2-5edit-style2](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-5edit-style2.png){ style="zoom: 0.75" .on-glb }


次に，追加された項目をクリックし，下のNameと書かれたtextboxに，「Ndom」と入力します．

次に，Colorの左にある色設定ボタンで色をhsb(0,0.5,1)（ピンク色）に変更します．
色の変更方法は，テキストボックスにhsb(0,0.5,1)と入力する，
あるいは，左の▼ボタンを押してHSBパレットを表示させ，スライダーで各値を0,0.5,1に変更します．

![step2-6edit-colstyle3](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-6edit-colstyle3.png){ style="zoom: 0.75" .on-glb }


これでNdomという名前で，ピンク色が定義されました．

以上を繰り返して，上記の表にある色をすべて定義すると，以下のようになります．（項目の順番は違うかもしれませんが．．．）

![step2-7edit-colstyle4](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-7edit-colstyle4.png){ style="zoom: 0.75" .on-glb }


**補足**

> 色の名前については，大文字・小文字の違いは無視されます．さらに，style editorを閉じて名前が登録されると，すべての名前は小文字に変換されます．
#### 分子選択の定義
次に，分子選択の定義を作成します．

ダイアログの上の方にあるタブから，「Selection」というのをクリックすると，以下のように分子選択定義を編集するページが表示されます．

![step2-8edit-selstyle1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-8edit-selstyle1.png){ style="zoom: 0.75" .on-glb }


この状態では何も定義されていないので，すべて空の状態になっています．
まず，右の![step1-9color-add1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step1-9color-add1.png)ボタンを押して，新しい定義を追加します．
すると，sel_0という新しい定義の項目ができます．

次に，追加された項目をクリックし，「Name」の横にあるtextboxに，「Ndom」と入力します．

次に，Selectionの左にあるテキストボックスに，N末端ドメインの原子を選択する選択文「A.49:83.*」を入力します．
(その後タブキーを押すが，他のtextboxたとえばNameのtextbox等をクリックすると選択文が上のリストに反映される)

![step2-9edit-selstyle2](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-9edit-selstyle2.png){ style="zoom: 0.75" .on-glb }


これでNdomという名前の分子選択が新たに定義されました．

以上を繰り返して，上記の表にある選択をすべて定義すると，以下のようになります．

![step2-10edit-selstyle1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-10edit-selstyle1.png){ style="zoom: 0.75" .on-glb }


最後に，「OK」ボタンを押してダイアログを閉じると，以上で入力した定義が登録されます．

**補足**

> 分子選択の定義については，大文字・小文字が区別されます．（もちろん大文字・小文字は入力された文字通りに登録されます．）色の定義と異なっていますので，注意してください．
### 色と分子選択定義を使用するように変更する
次に，以上で作成した色と分子選択定義を使用するように変更します．

まず，coloring panelで3UG9_ABを選び，Paint coloringの設定を表示させます．

![step1-14paint-final1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step1-14paint-final1.png){ style="zoom: 0.8" .on-glb }


そして，一番下の項目(A.49:83.*, hsb(0,0.5,1))をダブルクリックすると，塗の変更ダイアログが表示されます．

ここで，分子選択をNdom (リストボックスの中にあるはず)にし，
色をndom (Named colorの中にあるはず)にします．下の図は色をNamed colorの中から選んでいるところを示しています．

![step2-12colorchg1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-12colorchg1.png)


これでOKを押すと，styleで定義されている色と選択の定義が使用されるようになりました．ただし，元の選択と色から変更はないため，図の方はまったく同じように表示され変化はないはずです．

上記を各ドメイン全てについて行うと，coloring panelは下図のようになります．

![step2-13colorpanel2](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-13colorpanel2.png){ style="zoom: 0.8" .on-glb }


このような変更を行った後も，同様に元の選択と色から変更はないため，図の方はまったく同じように表示され変化はないはずです．

### styleの外部ファイルへの保存とリンク化
このままでは定義したスタイルはfig1_overall.qscシーン内でしか使用できません．
スタイルだけ外部ファイルへ書き出し，他のシーンから共有できるようにする必要があります．

まず，シーンパネルで，書き出すスタイル項目を左クリックすると図のようなcontext menuが表示されます．


![step2-14stylesaveas1](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-14stylesaveas1.png){ style="zoom: 0.8" .on-glb }


そして，このメニューで，「File」→「Save as ...」をクリックします．
すると，スタイルの保存ダイアログが表示されます．
名前をデフォルトのまま（common_style.xml）で保存します．

すると，スタイルは外部ファイルへ書き出され，かつ，シーンからはリンクとして参照されるようになります．
そして，シーンパネルでは外部ファイルであるという事を示すアイコン(下図・マウスカーソルの上)が表示されます．

![step2-15stylesaveas2](../../assets/images/Documents/CueMol2Tutorial2013/Step2/step2-15stylesaveas2.png){ .on-glb }


以上の操作を行った後，シーンをfig1_overall_2.qscという名前で保存します．
メニュー「File」→「Save Scene As...」を実行し，fig1_overall_2.qscと入力して保存します．
Optionダイアログが表示されますが，保存設定はdefaultで保存します．


[Documents/CueMol2Tutorial2013](../../Documents/CueMol2Tutorial2013)
