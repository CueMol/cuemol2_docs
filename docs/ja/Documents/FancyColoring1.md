[Documents](../../Documents)

## ballstick, CPK等で複雑な着色を行いたい場合

* simple
* trace
* ballstick
* cpk

以上の４種類のrendererに関しては，SimpleColoring（基本的な元素による色分け
或いは温度因子などによるgradient着色）しか行えません．

これらと同じタイプのrendererで，FancyColoring(選択による範囲指定で着色)を行うには，

* paint_simple
* paint_trace
* paint_ballstick
* paint_cpk

を使用します．

### 使用法
これらのレンダラーの色等の設定は，
現在(1.0.0 build 60)のところ．
QScriptからしか行えません．

まず$molに分子オブジェクトを格納し，
以下のようにレンダラーを作成します．
```
$mol = readPDB($pwd+"blm_ab.pdb","blm_ab");
```
```
$r_p = $mol.createRend("protein", "paint_ballstick");
```

さらに，色を設定する部分を選択し，molvis.paint()メソッドにより色を指定します．
```
$mol.select(%{resn ARG, LYS, HIS%});
```
```
molvis.paint($r_p, color.hsb(240, 0.4, 1.0));
```

paint_系rendererは色以外の形状に関するプロパティー(sphr等)は
originalのものと同じものが使用できます．
FancyColoring色設定は，tubeやribbonのものと同じですので，

* [Step2 Tubeモデル](../../Documents/QScriptのチュートリアル/Step2)
* [Step3 Ribbonモデル](../../Documents/QScriptのチュートリアル/Step3)

も参照してください．