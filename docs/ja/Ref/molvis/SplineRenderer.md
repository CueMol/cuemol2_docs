## SplineRenderer
たんぱく質・核酸などの主鎖をスプライン曲線で結んだ表示をするレンダラーのsuper classです．
主鎖として扱われる原子は，[pivotatom](../../../Ref/molstr/MainChainRenderer)プロパティーで指定できますが，たんぱく質の場合のdefaultはCA (Cα炭素原子)，核酸の場合はP (燐酸の燐原子)になります．


### プロパティー
|プロパティ名|型|説明|h
|smoothcolor|boolean|色を補間する(true)かしない(false)かを指定する．|
|start_captype|integer|Chainの始まりの部分の形状を指定する．(0=平面, 1=球状(default), 2=なし)|
|end_captype|integer|Chainの終わりの部分の形状を指定する(0=平面, 1=球状(default), 2=なし)|
|coloring|[FancyColoring](../../../Ref/molvis/FancyColoring)|色を指定します．[FancyColoring](../../../Ref/molvis/FancyColoring)は内部に様々な[サブプロパティ](../../../Ref/Property)があるので，そちらの項を参照．|
|smooth|real|スプライン補間のスムースさの度合いを指定する（defaultは0）． 0だと，完全にpivotatomを通過しあまり滑らかではない． 0.5はpivotatomを通らずに最も滑らかになる．（0.5より大きい値も設定できるが，あまり用途がないだろう．）|

さらに，[MainChainRenderer](../../../Ref/molstr/MainChainRenderer)のプロパティーが指定可能です．