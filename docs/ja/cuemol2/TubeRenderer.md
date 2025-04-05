[Documents](../../Documents)

## Tube renderer
Tubbe rendererは蛋白質や核酸の主鎖を滑らかなチューブでつないで表示するrendererです．


![tube-sample1](../../assets/images/cuemol2/TubeRenderer/tube-sample1.png){ style="zoom: 0.5" .on-glb }


Tubeには以下のような設定項目があります．

### Tube断面形状の設定
Sectionは，tubeの断面の形状に関する設定項目です．

![tube-section1](../../assets/images/cuemol2/TubeRenderer/tube-section1.png){ .on-glb }


Type
:   断面の形状を指定する．設定内容はribbonと同じなので，[cuemol2/RibbonRenderer#helix_section](../../cuemol2/RibbonRenderer#helix_section)を参照してください．

Detail
:   断面のポリゴン分割数を指定する．大きい値を指定するほど細かく分割されて表示がきれいになるが，描画スピードは低下する．Rendering後の画像で角ばったように見える場合は，後述Axial detailとともに増加させると解消される．

Width1, Width2
:   Tubeの太さをÅ単位で指定する．Width1で横方向，Width2で縦方向の長さ(半径)を指定する．<br />

左はWidth1 (0.5 Å)>Width2 (0.1 Å)，右はWidth1 (0.1 Å)<Width2 (0.5 Å)の場合．(Typeはelliptical)<br />
![tube-width-sample1](../../assets/images/cuemol2/TubeRenderer/tube-width-sample1.png){ style="zoom: 0.5" .on-glb }　![tube-width-sample2](../../assets/images/cuemol2/TubeRenderer/tube-width-sample2.png){ style="zoom: 0.5" .on-glb }
Sharpness
:   設定内容はribbonと同じなので，[cuemol2/RibbonRenderer#helix_section](../../cuemol2/RibbonRenderer#helix_section)を参照してください．


### Puttyの設定
PuttyはB-factorなどのパラメータに応じてtubeの太さを変える表示設定です．
パラメータの最大値で太さがHigh scale倍に太くなり，最小値で太さがLow scale分の１に細くなります．その間の値を持つ部分については連続的（線形補間）に変化します．

![tube-putty-sample1](../../assets/images/cuemol2/TubeRenderer/tube-putty-sample1.png){ style="zoom: 0.5" .on-glb }

以下のような設定項目があります．

![tube-putty1](../../assets/images/cuemol2/TubeRenderer/tube-putty1.png){ .on-glb }


Mode
:   Offはputtyを使用しない(太さ一定に)．Linear, Scalingはtargetに指定したパラメータに応じて太さを変化させるputty modeになる．

Target
:   太さを変化させるターゲットを指定する．B-factorかOccupancyを選べる．

Low scale
:   パラメータの最小値における太さのscaling値．最小のパラメータを持つ残基の部分でtubeの太さがLow scale分の１に細くなる．defaultだと1/3に細くなるようになっている．

High scale
:   パラメータの最大値における太さのscaling値．最大のパラメータを持つ残基の部分でtubeの太さがHigh scale倍に太くなる．defaultだと3倍に太くなるようになっている．



### その他の設定
そのほか，以下のような設定があります．

-  Axial detail

- Smoothness

- Smooth color

- Pivot atom name

- Start/End type

いずれもribbon rendererの類似の設定と同じ意味を持ちますので，詳しくは[cuemol2/RibbonRenderer#common_settings](../../cuemol2/RibbonRenderer#common_settings)を参照してください．
