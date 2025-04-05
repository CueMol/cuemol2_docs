[Ref/molvis](../../../Ref/molvis)

## TubeSection
[tubeレンダラー](../../../Ref/molvis/TubeRenderer)や[ribbonレンダラー](../../../Ref/molvis/RibbonRenderer)において，チューブの断面形状を表現するのに
用いられている共通クラス．

### プロパティー
|プロパティー名|型|説明|h
|detail|integer|チューブの断面方向の補間の精度を指定する．大きい値を指定すると精度が向上し滑らかな曲面になるが負荷が大きくなる．遅いコンピューターを使用している場合は，小さい値にすると良い．ただし，2が下限．|
|type|integer|チューブの断面の形状を指定する．デフォルトは楕円(0)．現在の実装では，他にround_square (1; 角がとれた長方形)， rectangle (2; 角がとがった長方形)がある．|
|width|real|チューブの太さをangstrom単位で設定．|
|tuber|real|チューブの扁平さを指定．具体的には，チューブの法線方向と陪法線方向の太さの比率を指定する．すなわち，この値を1以外にすることで楕円状の断面のチューブにすることができる．tuber<1を使用するケースはあまりないだろう．|
|sharp|real|type=1の場合のみ有効．角がとれた長方形の，角の取れ具合を指定する． 1にするとほぼsecttype=2の場合と同程度に角張った形状になるが，逆に0に近いとsecttype=0(楕円)の場合に近い形状になる．|

**例

|CENTER:![tube-tuber1](../../../assets/images/Ref/molvis/TubeSection/tube-tuber1.png){ .on-glb }|CENTER:![tube-tuber2](../../../assets/images/Ref/molvis/TubeSection/tube-tuber2.png){ .on-glb }|
|CENTER:type=0, tuber=3, width=0.35|CENTER:type=0, tuber=0.3, width=1.16|
|>|蛋白のへリックス部分のレンダリング例．tuberを1以外にすることで，扁平な断面のチューブにすることができる．Defaultのtype=0では楕円形の断面になる．図を見ても分かるように，tuber<1を使用するケースはあまりないだろう．|
|||
|CENTER:![tube-secttype1](../../../assets/images/Ref/molvis/TubeSection/tube-secttype1.png){ .on-glb }|CENTER:![tube-secttype2](../../../assets/images/Ref/molvis/TubeSection/tube-secttype2.png){ .on-glb }|
|CENTER:type=1|CENTER:type=2|
|>|typeはチューブの断面の形状を指定する．デフォルトは楕円(0)．現在の実装では，他にround_square (1; 角がとれた長方形)， rectangle (2; 角がとがった長方形)がある．|
|||
|CENTER:![tube-sharp1](../../../assets/images/Ref/molvis/TubeSection/tube-sharp1.png){ .on-glb }|CENTER:![tube-sharp2](../../../assets/images/Ref/molvis/TubeSection/tube-sharp2.png){ .on-glb }|
|CENTER:sharp=0.1|CENTER:sharp=0.9|
|>|sharpは角がとれた長方形の，角の取れ具合を指定する．1にするとほぼsecttype=2の場合と同程度に角張った形状になるが，逆に0に近いとsecttype=0(楕円)の場合に近い形状になる． section.type=1の場合のみ有効．|
