[Documents](../../Documents)

## 核酸用レンダラーnucl
RNA, DNA等の核酸専用のレンダラーです．Tube rendererと同様の主鎖のチューブ状に表示に加え，塩基残基をスティック状などの様々な形状で表示できます．


![fig1-2](../../assets/images/cuemol2/NARenderer/fig1-2.png){ style="zoom: 0.75" .on-glb }


## プロパティーによる設定

### Nucleic acidタブ

#### Show Tube
主鎖チューブを表示するかどうかを指定します．チューブ表示をoffにし，他のtube rendererで主鎖を表示することで，より複雑な表示を行うこともできます．下図左はShow tubeをoffにした状態，右は他のtube rendererで2種類の異なる主鎖表示を組み合わせた例です．

> ![nucl-showtube1-2](../../assets/images/cuemol2/NARenderer/nucl-showtube1-2.png){ style="zoom: 0.75" .on-glb } ![nucl-showtube2-2](../../assets/images/cuemol2/NARenderer/nucl-showtube2-2.png){ style="zoom: 0.75" .on-glb }

#### Connect base pair
残基がbase pairを形成している場合，２つの残基を1本のstickで表示するか(on)，2本の別々のstickで表示するか(off)を指定します．下図はoffにした場合です．

![nucl-connbp1-2](../../assets/images/cuemol2/NARenderer/nucl-connbp1-2.png){ style="zoom: 0.75" .on-glb }


#### Base type

basepair
:   上図のような残基をstick状に表示するモード．(default)

simple1
:   basepair同様にstick状に表示されるが，baseとsugarのN-glycosyl bondのところで折れ曲がった形状になるモード．下図左がConnect base pair=on, 右がoffの状態での表示．~

>![nucl-basetype-simple1-1](../../assets/images/cuemol2/NARenderer/nucl-basetype-simple1-1.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-simple1-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-simple1-2.png){ style="zoom: 0.75" .on-glb }


detail1
:   Baseの部分が板状に表示されるモード．（Base pair形成による表示変化はない）~

>![nucl-basetype-detail1](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail1.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-detail1-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail1-2.png){ style="zoom: 0.85" .on-glb }


detail2
:   detail1に加えて，riboseの部分も板状に表示されるモード．（Base pair形成による表示変化はない）~

>![nucl-basetype-detail2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail2.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-detail2-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail2-2.png){ style="zoom: 0.85" .on-glb }

#### Detail
Ballstick rendererのdetail値と同様に，残基の表示の緻密さを表す．大きいほど滑らかな表示になるがポリゴン数が増え処理が重くなる．POV-Rayでのrendering時には，[Edge rendering](../../cuemol2/EdgeLines)を使用する場合を除き，無視される．

#### Base size
残基表示の大きさを指定する．Stick状の部分のcylinderの半径をangstrom単位で指定する．

#### Base thick
Base type=detail1, detail2の表示において，板状に表示されたbase等の厚さを指定する．
100%だと板の厚さとstickの太さが同じになり上図のような表示になるが，たとえば50%にすると板の厚さは半分になり，下図のような表示になる(detail2の場合)．

>![nucl-basethick-1](../../assets/images/cuemol2/NARenderer/nucl-basethick-1.png){ style="zoom: 0.85" .on-glb }

### Tubeタブ
Nucl rendererの主鎖表示はtube rendererと同じであるため，
プロパティーのTubeタブはtube rendererの設定と同じになっています．
ここではnuclで変更する必要がありそうな項目についてのみ説明します．
詳しくはTube rendererの設定を参照してください．


Pivot atom name
:   チューブが通るべき原子の名前を指定する．DefaultはP（主鎖リン酸のリン原子）になっているが，これだとチューブが実際の残基よりも大回りをしすぎる傾向がある．
場合によっては，pivot atom nameをC5'（リボース基の5'位炭素）などに変更した方がみばえが良くなることもある（特に上述のBase typeに依存する）．

> ![nucl-tube-pivot-1](../../assets/images/cuemol2/NARenderer/nucl-tube-pivot-1.png){ style="zoom: 0.85" .on-glb }
## 塩基対の判定
現在のCueMol (ver 2.2)では，PDBファイル読み込み時に構造がチェックされ，
ある２残基がワトソンクリック塩基対を形成していると判定されると，自動的に塩基対を形成しているとマークされます．
塩基対の判定は，水素結合距離と２塩基同士の平面性が考慮されています．

Nucl rendererはPDB読み込み時に塩基対を作成していると判定されたものについてのみ塩基対表示を行います．
現バージョン(ver 2.2)では，
手動により指定残基について強制的に塩基対を作らせたり，あるいは塩基対を削除させたり等を行うことはできません．