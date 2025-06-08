## trace レンダラー
ポリマー（主に蛋白，核酸など）の主鎖を直線で表現します．
分子の各残基に主鎖（pivot atom）が定義されている必要があります．

### プロパティー
|プロパティ名|型|初期値|説明|h
|linew|real|1.2|線の太さ（ピクセル単位）|
|coloring|[SimpleColoring](../../../Ref/molstr/SimpleColoring)|-|着色方法を指定する[サブプロパティ](../../../Ref/Property)．[SimpleColoring](../../../Ref/molstr/SimpleColoring)を参照．|

さらに，[MainChainRenderer](../../../Ref/molstr/MainChainRenderer)のプロパティーが指定可能です．