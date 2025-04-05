[Ref/molstr](../../../Ref/molstr)

## SimpleColoring
単純な着色をサポートするColoring(着色) classのひとつ．

-  mode 0: 元素の種類（H,C,N,O,P,S,それ以外）で着色

-  mode 1: 温度因子でグラジエント着色

-  mode 2: Occupancyでグラジエント着色

の３つのモードがある．

### プロパティー
|プロパティ名|型|初期値|説明|h
|colormode|integer|0|上記の着色モードを指定する．|
|col_C|color|color(1.0, 1.0, 0.75)|炭素の色．モード0で有効|
|col_N|color|color(0.0, 0.0, 1.0)|窒素の色．モード0で有効|
|col_O|color|color(1.0, 0.0, 0.0)|酸素の色．モード0で有効|
|col_H|color|color(0.0, 1.0, 1.0)|水素の色．モード0で有効|
|col_S|color|color(0.0, 1.0, 0.0)|硫黄の色．モード0で有効|
|col_P|color|color(1.0, 1.0, 0.0)|リンの色．モード0で有効|
|col_others|color|color(0.7, 0.7, 0.7)|その他の元素の色．モード0で有効|
|lowcol|color|color(0.0, 0.0, 1.0)|低い値側の色．モード1, 2で有効|
|hicol|color|color(1.0, 0.0, 0.0)|高い値側の色．モード1, 2で有効|
|lowpar|real|20.0|温度因子・Occupancyで着色する場合の低い側のパラメータ値を指定する．モード1, 2で有効|
|hipar|real|80.0|温度因子・Occupancyで着色する場合の高い側のパラメータ値を指定する．モード1, 2で有効|


** 例
[Documents/QScriptのチュートリアル/Step1](../../../Documents/QScriptのチュートリアル/Step1)に使用例があります．
