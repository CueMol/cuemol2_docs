[Documents](../../Documents)
## 分子選択文のリファレンス



QScript中では，se★と★((★は空白文字， 数字，アルファベット以外の任意の文字))
で挟まれた文字列は分子の選択式であるとして解釈されます（ただし左側と右側の★は同じ文字）．

また，GUIの中にも，分子の選択文を入力する場面があります．
この場合は，se★と★等は不要で，選択文の内容自体を入力します．

<pre>
se/chain A and resn ALA/
se/B.100:120.C,N,O,CA/
</pre>

選択文は**選択式**からなっており，
**選択式**は**選択リテラル**と**選択演算子**から構成されています．

一方，選択リテラルの一部のものは
**名前リスト**と**数値リスト**等を含んでいます．
ここでは，これら個々の要素について説明します．

### 名前リスト
<pre>
"name" [, "name", ...]
</pre>
名前リストは"name"あるいは"name"をカンマで区切ったリストからなる．
"name"は，アルファベット，数字，アンダースコア(_)からなる文字列である．

### 数値リスト
<pre>
"range" [, "range", ...]
"range" := "number" | "number1":"number2"
</pre>
数値リストは"range"あるいは"range"をカンマで区切ったリストからなる．
さらに，"range"は単独の整数値("number")あるいは
二つの整数値"number1":"number2"からなる．
後者は，"number1"以上"number2"以下の整数の範囲を表している．

<pre>
1, 3:10, 51
</pre>
上記は1,3,4,...,9,10,51の整数値の集合をあらわす．

----
### 選択リテラル
選択リテラルには，
いろいろある．
#### 全選択
<pre>
all
```
## ```
</pre>
分子中の原子すべての選択を表す．

#### 空選択
<pre>
none
</pre>
空の選択集合を表す．

#### 元素による選択
<pre>
elem [名前リスト]
e; [名前リスト]
</pre>
[名前リスト]で示される元素名を持つ原子すべてが選択される．

<pre>
e; C,N,O
</pre>
分子中の炭素，窒素，酸素原子が選択される．

#### 原子名による選択
<pre>
name [名前リスト]
n; [名前リスト]
</pre>
[名前リスト]で示される**原子名**を持つ原子すべてが選択される．

<pre>
n; CA,N,O
</pre>
分子中の，CA, N, Oという原子名を持つ原子すべてが選択される．
通常は，蛋白の主鎖α位炭素，アミド窒素，カルボニル酸素原子である．

#### 残基名による選択
<pre>
resn [名前リスト]
r; [名前リスト]
</pre>
[名前リスト]で示される残基名を持つ残基中の原子すべてが選択される．

<pre>
r; ARG,LYS
</pre>
分子中のARG（アルギニン）とLYS（リジン）残基が選択される．

#### 残基番号による選択
<pre>
resn [数値リスト]
i; [数値リスト]
</pre>
[数値リスト]で示される残基番号を持つ残基中の原子すべてが選択される．

<pre>
i; 3,5,10:20
</pre>
残基番号3,5,10〜20をもつ残基がすべて選択される．

#### 残基プロパティーによる選択
<pre>
rprop [名前１]=[名前２]
</pre>
[名前１]で示される残基プロパティーが，
[名前２]で示される値である残基中の原子すべてが選択される．

<pre>
rprop secondary=helix
</pre>
残基プロパティー「secondary」が「helix」である残基中の
全原子が選択される．


#### チェイン名による選択
<pre>
chain [名前リスト]
c; [名前リスト]
</pre>
[名前リスト]で示される名前を持つチェイン中の全原子が選択される．

<pre>
c; A,B
</pre>
チェインAとBが選択される．

#### 温度因子による選択
<pre>
bfac "comp_op" "number"
"comp_op" := "<"|">"|"="
</pre>
"comp_op"と"number"で指定した値の温度因子を持つ原子が選択される．
"number"は実数値である．

<pre>
bfac>50.0
</pre>
温度因子が50より大きい原子が選択される．

#### 占有率による選択
<pre>
occ "comp_op" "number"
"comp_op" := "<"|">"|"="
</pre>
"comp_op"と"number"で指定した値の占有率を持つ原子が選択される．
"number"は実数値である．

<pre>
occ>0.5
</pre>
占有率が0.5より大きい原子が選択される．

#### 階層表記(hierarchcal notation)
<pre>
"chain_names"."resid_nums"."atom_names"
"chain_names" := [名前リスト1] | "*"
"resid_nums" := [数値リスト] | "*"
"atom_names" := [名前リスト2] | "*"
</pre>
[名前リスト1]で示される名前を持つチェイン中の，
[数値リスト]の範囲の残基の，
[名前リスト2]の原子名を持つ原子が選択される．
"*"を指定した場合は，すべてのチェイン／残基／原子が選択対象になる．

この表記法は
<pre>
chain "chain_names" and resid "resid_nums" and name "atom_names"
</pre>
と等価である．

<pre>
A.1:100.CA,CB
</pre>
チェインAの残基番号1〜100の，α・β位炭素が選択される．

```
## .5,6,7.*
```

全チェインの残基番号5,6,7の残基中の全原子が選択される．
すなわち，

> resid 5,6,7

と等価である．
----
### 選択演算子
選択演算子には，AND演算子，OR演算子，NOT演算子，AROUND演算子，BYRES演算子があります．
#### AND演算子
<pre>
[式1] and [式2]
[式1] & [式2]
</pre>
式1と式2であらわされる選択集合の積集合からなる選択集合を作成する．

<pre>
chain A and resn ALA
</pre>
分子中の，チェインAに属するALA残基のみが選択される．

#### OR演算子
<pre>
[式1] or [式2]
[式1] | [式2]
</pre>
式1と式2であらわされる選択集合の和集合からなる選択集合を作成する．

<pre>
chain A or resn ALA
</pre>
分子中のチェインA全体と，すべてのALA残基が選択される．

#### NOT演算子
<pre>
not [式1]
! [式1]
</pre>
式1であらわされる選択集合の補集合からなる選択集合を作成する．

<pre>
not resn ALA
</pre>
分子中のALA残基以外すべてが選択される．

#### AROUND演算子
<pre>
[式1] around [実数値]
</pre>
[式1]であらわされる選択集合から[実数値]Å以内にある原子の集合からなる
選択集合を返す．
[式1]自体の選択集合は含まれない点に注意．

<pre>
chain A around 3.5
</pre>
チェインAから3.5Å以内にある原子の集合が選択される．
チェインA自体は選択されない．

#### BYRES演算子
<pre>
byres [式1]
</pre>
[式1]の選択集合が残基単位に拡張される．

<pre>
byres name SD
</pre>
原子名SDを持つ原子の集合が，残基単位の選択に拡張される．
蛋白の場合，結果として，メチオニン(Met)残基がすべて選択されることになる．