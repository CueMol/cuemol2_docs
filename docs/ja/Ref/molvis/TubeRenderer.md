## tube レンダラー
ポリマー（主に蛋白，核酸など）の主鎖をスプライン曲線でチューブ状に表現します．
分子の各残基に主鎖が定義されている必要があります．

### プロパティー
|プロパティ名|型|説明|h
|axialdetail|integer|チューブの軸方向，断面方向の補間の精度を指定する．大きい値を指定すると精度が向上し滑らかな曲面になるが負荷が大きくなる．遅いコンピューターを使用している場合は，小さい値にすると良い．ただし，axialdetailは1が下限．|
|section|[TubeSection](../../../Ref/molvis/TubeSection)|チューブの断面を定義している．断面の形状に関する多くの[サブプロパティ](../../../Ref/Property)がある．[TubeSection](../../../Ref/molvis/TubeSection)を参照．|

さらに，[SplineRenderer](../../../Ref/molvis/SplineRenderer)のプロパティーが指定可能です．
