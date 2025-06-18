[Documents](../../Documents)
## Ribbon表示について
タンパク質専用のレンダラーで，蛋白質，ポリペプチドの主鎖をスプライン曲線を用いてリボン状に表現します．

*  ヘリックスをリボン状
*  シートを板状
*  コイルをチューブ状

に表示する機能を持ちます．

さまざまなプロパティーがあり，表示を変更・調節することが可能です．

正しくリボン状に表示されるためには，タンパク質分子に対して二次構造が割り当てられている必要が有ります．
二次構造は通常ファイルの読み込み時に勝手に行われるので，特に気にする必要はないですが，
好きなように変更したりしたい場合や，再割り当てを手動で行いたい場合は，[cuemol2/Prot2ndryStr](../../cuemol2/Prot2ndryStr)を参照してください．

あと，RNA, DNAなどタンパク以外の鎖状ポリマーに対してribbon rendererを作成した場合は，
単に[tube renderer](../../cuemol2/TubeRenderer)と同様のチューブ状表示になります．

## 簡易スタイル指定による表示の変更
簡易スタイル指定により，良く使うribbon表示の設定を簡単に行うことが出来ます．

スタイルの概念については，[cuemol2/Style](../../cuemol2/Style)を参照してください．

Scene panelにて，ribbon rendererを右クリックしてcontext menuを表示させ，styleを選択すると，
簡易スタイルの一覧がメニューとして表示されます．
メニュー項目を選択すると，対応するribbon rendererにスタイルが適用され表示が変わります．


Default
:   Defaultのribbon表示の設定．コイルは太めのチューブで，ヘリックス，シートは断面が四角い板状のリボンになる．(下図左)

Fancy1
:   Molscript風のribbon表示の設定．ヘリックスの内側と，シートの側面は，白っぽい色で塗られる．ヘリックスの断面はダンベル状になる．(下図中央)

Round
:   コイルは細めのチューブで，ヘリックス，シートは断面が楕円状の丸っこいリボンになる．(下図右)


> ![01-style-default-1](../../assets/images/cuemol2/RibbonRenderer/01-style-default-1.png){ style="zoom: 0.5" .on-glb } ![02-style-fancy1-1](../../assets/images/cuemol2/RibbonRenderer/02-style-fancy1-1.png){ style="zoom: 0.5" .on-glb } ![03-style-round-1](../../assets/images/cuemol2/RibbonRenderer/03-style-round-1.png){ style="zoom: 0.5" .on-glb }


## プロパティーによる詳細な設定

以下では，主なプロパティーと，その設定GUIについて説明します．

<a id="common_settings"></a>
### 共通設定 (Commonタブ)

Section detail
:   断面方向のポリゴン分割数を指定する．大きい値を指定するほど細かく分割されて表示がきれいになるが，描画スピードは低下する．


Axial detail
:   鎖方向のポリゴン分割数を指定する．大きい値を指定するほど細かく分割されて表示がきれいになるが，描画スピードは低下する．


Smooth color
:   隣り合う残基間で色が異なる場合，ONだと残基間の着色がグラデーションになる(下図左)．OFFだと中央で色が変わるようになる(下図右)．


> ![05-prop-smoothcolor-2](../../assets/images/cuemol2/RibbonRenderer/05-prop-smoothcolor-2.png){ style="zoom: 0.5" .on-glb } ![04-prop-smoothcolor-1](../../assets/images/cuemol2/RibbonRenderer/04-prop-smoothcolor-1.png){ style="zoom: 0.5" .on-glb }


Pivot atom name
:   リボンやチューブが通るべき原子の名前を指定する．タンパクの場合defaultはCA（Cα炭素原子）になっており，通常変更する必要はない．


Start/End type
:   末端の形状を指定する．sphereを指定すると球状に(下図左)，flat指定すると平らになる(下図中央)．noneを指定すると，末端のポリゴンは生成されず，穴が開いたようになる(下図右)．


> ![06-prop-cap-sphere-2](../../assets/images/cuemol2/RibbonRenderer/06-prop-cap-sphere-2.png){ style="zoom: 0.7" .on-glb } ![07-prop-cap-flat-2](../../assets/images/cuemol2/RibbonRenderer/07-prop-cap-flat-2.png){ style="zoom: 0.7" .on-glb } ![08-prop-cap-none-2](../../assets/images/cuemol2/RibbonRenderer/08-prop-cap-none-2.png){ style="zoom: 0.7" .on-glb }

あと，Basic settingsとEdge linesは，他のrendererにもある共通の設定項目です．Edge linesについては[cuemol2/EdgeLines#rend_props](../../cuemol2/EdgeLines#rend_props)を参照してください．



### ヘリックスに関する設定 (Helixタブ)
<a id="helix_section"></a>
#### Helix Section
ヘリックス部分の断面等の形状に関する設定です．


Type
:   断面の形状の種類を指定する．<br/>
下図左から**Elliptical**（楕円形），**Rectangle**（四角），**Round rectangle**（角なし四角），**Fancy**（ダンベル型）<br/>
![10-prop-hsectype-oval-2](../../assets/images/cuemol2/RibbonRenderer/10-prop-hsectype-oval-2.png){ .on-glb }
![09-prop-hsectype-rect-2](../../assets/images/cuemol2/RibbonRenderer/09-prop-hsectype-rect-2.png){ .on-glb }
![11-prop-hsectype-rrect-2](../../assets/images/cuemol2/RibbonRenderer/11-prop-hsectype-rrect-2.png){ .on-glb }
![12-prop-hsectype-fancy-2](../../assets/images/cuemol2/RibbonRenderer/12-prop-hsectype-fancy-2.png){ .on-glb }

Back color
:   下図のようにヘリックスの内側の色を指定し変更できる．Offだと指定なしで内側も外側も同じ色になる．Defaultはoff．<br/>
![13-prop-hsecbackcol](../../assets/images/cuemol2/RibbonRenderer/13-prop-hsecbackcol.png){ .on-glb }

Width
:   ヘリックスの厚さを指定．単位はÅ．

Tuber
:   ヘリックスの幅を指定．Widthの何倍にするかで指定する．

Sharpness
:   Typeにより意味が違ってくる．<br/>
**Type=Round rectangle**の場合は，長方形の角の取れ具合を指定する．1にするとほぼ角張った形状になるが，0に近いとより丸みを帯びた形状に．<br/>
**Type=Fancy**の場合は，ダンベル型の両端の円の大きさを指定する．0に近い値にすると厚さが薄くなりより縁が際立った形状になるが（下図左;値=0），0.5に近づくとRound rectに近い形状になる（下図中央;値=0.5）．0.5以上にすると（説明は難しいが）下図右(値=0.75)のような形状になる．<br/>
![14-prop-hsecsha1](../../assets/images/cuemol2/RibbonRenderer/14-prop-hsecsha1.png){ .on-glb }
![15-prop-hsecsha2](../../assets/images/cuemol2/RibbonRenderer/15-prop-hsecsha2.png){ .on-glb }
![16-prop-hsecsha3](../../assets/images/cuemol2/RibbonRenderer/16-prop-hsecsha3.png){ .on-glb }

Smoothness
:   ０だとヘリックスがpivot atom（defaultはCα原子）の位置を通る曲線になるが，それ以下だとpivot atomを通らずによりなめらかな曲線になる．（この設定は厳密には断面の形状と関係ないが，便宜上ここに入っている）

#### Helix Head
ヘリックスの終了部分(head)の形状に関する設定です．


Type
:   形状の種類．<br/>
Round(滑らかに接続;下図左)，Flat(不連続;下図中央)，Arrow(矢型の形状;下図右)を指定する<br/>
![17-prop-hhead-type1](../../assets/images/cuemol2/RibbonRenderer/17-prop-hhead-type1.png){ .on-glb }
![18-prop-hhead-type2](../../assets/images/cuemol2/RibbonRenderer/18-prop-hhead-type2.png){ .on-glb }
![19-prop-hhead-type3](../../assets/images/cuemol2/RibbonRenderer/19-prop-hhead-type3.png){ .on-glb }<br/>
ヘリックスで末端をarrowにすることはほとんどないだろう．<br/>
Arrow関係の設定については，後述の「シートに関する設定 (Sheetタブ)」参照．

Power
:   接続の滑らかさを指定する．<br/>
下図はTypeがroundの場合に，値を1, 1.5, 3と変化させた場合(roundの場合は1以下の値を指定しても意味がない)．<br/>
![20-prop-hhead-pow1](../../assets/images/cuemol2/RibbonRenderer/20-prop-hhead-pow1.png){ .on-glb }
![21-prop-hhead-pow2](../../assets/images/cuemol2/RibbonRenderer/21-prop-hhead-pow2.png){ .on-glb }
![22-prop-hhead-pow3](../../assets/images/cuemol2/RibbonRenderer/22-prop-hhead-pow3.png){ .on-glb }

Arrow height
:   Typeがarrowの場合のみ有効．Arrowの高さを指定．後述の「シートに関する設定 (Sheetタブ)」参照．

Arrow width
:   Typeがarrowの場合のみ有効．Arrowの幅を指定．後述の「シートに関する設定 (Sheetタブ)」参照．

#### Helix Tail
ヘリックスの開始部分(tail)の形状に関する設定です．

内容は，Helix Headと全く同じですが，ヘリックスの開始部分について適用されます．



### シートに関する設定 (Sheetタブ)
ヘリックスに関する設定と同様の設定項目があります．
各設定の意味もヘリックスの場合とだいたい同じですので，前項「ヘリックスに関する設定」を参照ください．

以下では，シートで意味が異なってくる設定や，注意すべき設定についてのみ説明します．


Back color
:   シートの場合は，裏面の色ではなく，側面の色が指定色に変化します．<br/>
![29-prop-sheet-bkcol](../../assets/images/cuemol2/RibbonRenderer/29-prop-sheet-bkcol.png){ .on-glb }

Smoothness
:   シートの場合は，0にするとうねりすぎるのでdefaultは0.5になっています（伸びたβシートになる）．ただし，側鎖を表示する場合等は，0.5だと側鎖が浮いたようになってしまうので0に変更したほうが良い．<br/>
![23-prop-shead-smo1](../../assets/images/cuemol2/RibbonRenderer/23-prop-shead-smo1.png){ .on-glb }
![24-prop-shead-smo2](../../assets/images/cuemol2/RibbonRenderer/24-prop-shead-smo2.png){ .on-glb }
![25-prop-shead-smo3](../../assets/images/cuemol2/RibbonRenderer/25-prop-shead-smo3.png){ .on-glb }

Arrowの設定
:   SheetHead設定にあるTypeをArrowにすると，βシートの先端が矢状になります（SheetTail(末端)を矢状にすることはほぼ無いでしょう）．<br/>
この場合，SheetHead設定のPower値は矢の先端のとがり具合に影響します．下図右は0.5，中央は1，左は2の場合です．<br/>
![26-prop-shead-pow1](../../assets/images/cuemol2/RibbonRenderer/26-prop-shead-pow1.png){ .on-glb }
![27-prop-shead-pow2](../../assets/images/cuemol2/RibbonRenderer/27-prop-shead-pow2.png){ .on-glb }
![28-prop-shead-pow3](../../assets/images/cuemol2/RibbonRenderer/28-prop-shead-pow3.png){ .on-glb }

Arrow width
:   矢の先端部分の幅を指定します（下図参照）．100%にすると矢の幅はシート本体の幅の３倍になり，0%にすると幅はシート本体の幅と同じ（＝矢の先端部分なし）になります．

Arrow height
:   矢の先端部分の高さを指定します（下図参照）．値を減少させると矢の先端部の高さが減少します．<br/>
![30-prop-shead-arrow](../../assets/images/cuemol2/RibbonRenderer/30-prop-shead-arrow.png){ style="zoom: 0.5" .on-glb }

### コイルに関する設定 (Coilタブ)
コイル部分はHead/Tailの概念がないので，Section（断面形状）に関する設定項目しかありません．
各設定の意味はヘリックスの場合と同じです．
前項「ヘリックスに関する設定」のSectionについての部分を参照ください．