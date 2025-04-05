[Ref/molstr](../../../Ref/molstr)

## MainChainRenderer
主鎖のみを表示するレンダラー，[traceレンダラー(TraceRenderer)](../../../Ref/molstr/TraceRenderer)等のsuper classです．

### プロパティー
|プロパティ名|型|説明|h
|autobreak|real|主鎖がsplineでつながって補間される限界の距離をangstromで指定する．負の値を設定すると主鎖の自動切断は行われない．|
|pivotatom|string|主鎖が通るべき原子の原子名を指定する．もし，その原子名を持つ原子が残基内に無い場合はその残基については何も表示されず，その部分で主鎖が切断される．|

**例

|CENTER:![tube-pivatom1](../../../assets/images/Ref/molstr/MainChainRenderer/tube-pivatom1.png){ .on-glb }|
|肌色はデフォルトのCαトレース．赤はペプチド結合の酸素原子ををpivotatomとして設定した場合（$r.setProp("pivotatom", "o");を実行した場合に相当）．青は窒素原子をpivotatomとして設定した場合（$r.setProp("pivotatom", "n");を実行した場合に相当）．蛋白質の場合はCα以外は使用することはないだろうが，核酸の場合はリン酸のリン以外に，C1'やC3'に設定する用途が考えられる．|
