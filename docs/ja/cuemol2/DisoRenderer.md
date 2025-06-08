[Documents](../../Documents)
## Disordered領域の表示
タンパク，核酸のdisorder領域の主鎖を表示するためのrendererです．

結晶構造でdisorderし見えていない部分を，Ribbon rendererなどの主鎖を滑らかに（Bezier曲線の）点線でつないだように表示できます．


![disorend-1](../../assets/images/cuemol2/DisoRenderer/disorend-1.png){ style="zoom: 0.5" .on-glb }


### 作成
Disorder rendererはRibbon renderer等の不連続部分を点線でつなぐものなので，それ単独では機能しません．
まずはじめにRibbon（あるいはCartoon, Nuclなど）rendererを作成し，
その次にDisorder rendererを作成してください．

### Disorder領域の判定
同じchainに含まれているのに，残基番号が連続していない（Ribbonなどで主鎖表示が分断される）ような場合に，その間がdisorderしていると判定され，disorder rendererによる点線表示の対象となります．
（前後でchainが違っていたりすると表示されない）

### 色の設定
色の設定は，他のrendererと同様にColorパネルで行います．
色は，Disorder領域の両端の残基の色で着色されます．
両端で色が異なる場合は，両方の色の間でgradientになります．


![disorend-color-1](../../assets/images/cuemol2/DisoRenderer/disorend-color-1.png){ style="zoom: 0.5" .on-glb }


## プロパティー設定
### Common tab
#### Selection
Disorder rendererも，他の分子（MolCoord）用rendererと同様に，selectionを指定して表示部分を指定（制限）できます．
Defaultではselectionは*になっており，分子中disorderしている領域全てが点線表示の対象となりますが，
これをたとえば「A.1:100.*」に変更すると，chain Aの残基番号1から100の範囲内にあるdisorder領域のみが点線表示対象となります．

この機能を使用して，１つの分子に複数のdisorder rendererをattachして，点線の形状を変えたりすることが可能です．
下図の例では右のdisorder領域と左のdisorder領域に対して別々のrendererを作成することで，ドットの大きさと間隔が異なるように表示しています．

![disorend-sel-1](../../assets/images/cuemol2/DisoRenderer/disorend-sel-1.png){ style="zoom: 0.5" .on-glb }



#### その他
他のrenderer同様に，Edge linesによる輪郭線や，materialを変更してべた塗にするなどが可能です．
下図は，edge線を設定しmaterialをnolighting（べた塗）に設定した例です．


![disorend-edge-1](../../assets/images/cuemol2/DisoRenderer/disorend-edge-1.png){ style="zoom: 0.5" .on-glb }


### Disorder tab

#### Target
Disorder領域の点線を表示するtargetのrendererを指定します．
作成時には，自動的に，その時点で存在するribbon, cartoon, nucl等のrendererから適当に選ばれるようになっています．
意図していないtargetが選ばれてしまっている場合は，この設定を変更してください．

#### Detail
点線の点（球）のポリゴン分割レベル．大きいほど細かく滑らかになる．

#### Dot size
点線の点（球）の大きさ．Defaultは0.3．
下図左は0.1，右は0.5にした場合の例．


> ![disorend-dotsz-1](../../assets/images/cuemol2/DisoRenderer/disorend-dotsz-1.png){ style="zoom: 0.25" .on-glb } ![disorend-dotsz-2](../../assets/images/cuemol2/DisoRenderer/disorend-dotsz-2.png){ style="zoom: 0.25" .on-glb }

#### Dot separation
点線の間の間隔．下図左は0.6，右は1.8にした場合の例．


>![disorend-dotsep-1](../../assets/images/cuemol2/DisoRenderer/disorend-dotsep-1.png){ style="zoom: 0.25" .on-glb } ![disorend-dotsep-2](../../assets/images/cuemol2/DisoRenderer/disorend-dotsep-2.png){ style="zoom: 0.25" .on-glb }

#### Loop size
Disorder部分と主鎖のつながり方を指定する．大きい値にするとよりなめらかに，飛び出した形になる．(具体的にはBezier曲線の制御点の位置に影響する) Default値は2.0．

下図左は1.0，右は6.0にした場合の例．


> ![disorend-loopsz-1](../../assets/images/cuemol2/DisoRenderer/disorend-loopsz-1.png){ style="zoom: 0.25" .on-glb } ![disorend-loopsz-2](../../assets/images/cuemol2/DisoRenderer/disorend-loopsz-2.png){ style="zoom: 0.3" .on-glb }

#### Loop size 2
Disorder部分とC末端側主鎖（タンパクの場合）のつながり方を指定する．
Defaultでは値は-1になっているが，その場合N, C末端ともに（上記の）Loop sizeの値が使われる．
0以上の値を指定すると，Loop sizeがN末端，Loop size 2がC末端側の接続の滑らかさになる．
大きい値にするとよりなめらかに，飛び出した形になる．
（具体的には，N末端，C末端側それぞれのBezier曲線の制御点の位置に影響する）

下図は，loop size = 0.5, loop size 2 = 4にした場合．loopsize(N末端側,手前のβシート側)は非常に小さいので，折れ曲がったように不連続になっているが，loopsize2(C末端側，奥のβシート側)は大きいので，滑らかに接続されている．


![disorend-loopsz-3](../../assets/images/cuemol2/DisoRenderer/disorend-loopsz-3.png){ style="zoom: 0.5" .on-glb }
