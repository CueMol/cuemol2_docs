[Documents](../../Documents)
## 分子選択文のリファレンス (CueMol2版)

CueMol2での選択文法は，CueMol1.1のものと大体同じですが，一部拡張されている部分もあります．
ここではCueMol1.1と同じ部分も含めて，すべての機能を紹介しています．

選択文は**選択式**からなっており，
**選択式**は**選択リテラル**と**選択演算子**から構成されています．

一方，選択リテラルの一部は後述の
**[名前リスト](../../#name_list)**と**[数値リスト](../../#num_list)**等を引数としてとるものがあります．
ここでは，これら個々の要素について説明します．

### 選択リテラル
選択リテラルは，それ単独で選択命令として機能します．
後述の演算子で組み合わせたり，修飾したりすることができます．

#### 全選択
<pre>
all
```
## ```
</pre>
文字通り分子中の原子すべてを選択する．

#### 空選択
<pre>
none
</pre>
何も選択しないことを表す．（あまり使い道はない）

#### 元素による選択
<pre>
elem [名前リスト]
e; [名前リスト]
</pre>
後述の[名前リスト]で示される**元素名**を持つ原子が選択される．e;はelemの省略形．省略形の場合は;の後の空白文字は省略できる．（以下の他の省略形でも同様）

**例:**
<pre>
e; C,N,O
</pre>
分子中の炭素，窒素，酸素原子が選択される．

#### 原子名による選択
<pre>
name [名前リスト]
n; [名前リスト]
</pre>
後述の[名前リスト]で示される**原子名**を持つ原子すべてが選択される．

**例:**
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
後述の[名前リスト]で示される残基名を持つ残基中の原子すべてが選択される．

**例:**
<pre>
r; ARG,LYS
</pre>
分子中のARG（アルギニン）とLYS（リジン）残基が選択される．

ちなみに，名前リストには正規表現も使用可能である（後述の**名前リスト**の項目参照）
<pre>
r; /^A/
</pre>
残基名がAから始まるARG, ALA, ASNなどが選択されることになる．

#### 残基番号による選択
<pre>
resi [数値リスト]
resid [数値リスト]
i; [数値リスト]
</pre>
[数値リスト]で示される残基番号を持つ残基中の原子すべてが選択される．

**例:**
<pre>
i; 3,5,10:20
</pre>
残基番号3,5,10〜20をもつ残基がすべて選択される．

#### チェイン名による選択
<pre>
chain [名前リスト]
c; [名前リスト]
</pre>
[名前リスト]で示される名前を持つチェイン中の全原子が選択される．

**例:**
<pre>
c; A,B
</pre>
チェインAとBが選択される．

#### 階層表記(hierarchcal notation)
以下のようなドットで区切られた表記からなる．
<pre>
チェイン名.残基番号.原子名
</pre>
**チェイン名**(名前リスト形式で複数指定可)で示される名前を持つチェイン中の，
**残基番号**(数値リスト形式で複数指定可)の範囲の残基の，
**原子名**(名前リスト形式で複数指定可)の原子名を持つ原子が選択される．
"*"を指定した場合は，すべてのチェイン／残基／原子が選択対象になる．

この表記法は
<pre>
chain "チェイン名" and resid "残基番号" and name "原子名"
</pre>
と全く同じ意味になる．

**例:**
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

#### 残基プロパティーによる選択
<pre>
rprop [名前１]=[名前２]
</pre>
[名前１]で示される残基プロパティーが，
[名前２]で示される値である残基中の原子すべてが選択される．

**例:**
<pre>
rprop secondary=helix
</pre>
残基プロパティー「secondary」が「helix」である残基中の
全原子が選択される．

#### 温度因子による選択
<pre>
bfac "comp_op" "number"
"comp_op" := "<"|">"|"="
</pre>
"comp_op"と"number"で指定した値の温度因子を持つ原子が選択される．
"number"は整数値である．
（小数点がある数値を指定するとエラーになります）

**例:**
<pre>
bfac>50
</pre>
温度因子が50より大きい原子が選択される．


#### Alternate conformationによる選択
<pre>
alt [名前リスト]
</pre>
[名前リスト]で示されるalternate conformation IDを持つ原子が選択される．

**例:**
<pre>
alt A,null
</pre>
alternate conformationがAの原子と，alternate conformationを持たない（PDBファイル中では空白文字になっている）
原子が選択される．（残基の側鎖のみalternate conformationがある場合等はこのようにしないと側鎖しか選択されなかったりするので注意）

<pre>
A.7.* & alt B, null
</pre>
チェインAの残基番号7の残基中で，alternate conformationがBの原子と，alternate conformationを持たない原子が選択される．

----
### 選択演算子
選択演算子には，AND演算子，OR演算子，NOT演算子，AROUND演算子，BYRES演算子などがあります．
#### AND演算子
<pre>
[式1] and [式2]
[式1] & [式2]
</pre>
式1と式2であらわされる選択集合の積集合からなる選択集合を作成する．&で表記した場合は前後の空白はなくてもよい．

**例:**
<pre>
chain A and resn ALA
c;A&r;ALA
</pre>
分子中の，チェインAに属するALA残基のみが選択される．

#### OR演算子
<pre>
[式1] or [式2]
[式1] | [式2]
</pre>
式1と式2であらわされる選択集合の和集合からなる選択集合を作成する．

**例:**
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

**例:**
<pre>
not resn ALA
</pre>
分子中のALA残基以外すべてが選択される．

#### AROUND演算子
<pre>
<式1> around <実数値>
<式1> around ["<分子名>"] <実数値>
</pre>
&lt;式1>であらわされる選択集合から<実数値>Å以内にある原子が選択される．
&lt;式1>自体の選択集合は含まれない点に注意．

第2の書式では，<分子名>で示される他の分子中で<式1>であらわされる選択集合から
&lt;実数値>Å以内にある原子が選択される．

**例:**
<pre>
chain A around 3
</pre>
チェインAから3Å以内にある原子の集合が選択される．
チェインA自体は選択されない．

<pre>
chain A around ["1CRN.pdb"] 3
</pre>
分子名が1CRN.pdbで示される分子中のchain Aから3Å以内にある原子の集合が選択される．
（同じシーン中に1CRN.pdbという名前の分子オブジェクトがないと選択は空になるので注意）


#### EXPAND演算子
<pre>
[式1] expand [実数値]
</pre>
[式1]であらわされる選択集合から[実数値]Å以内にある原子のが選択される．
AROUNDと異なり，[式1]自体の選択集合も含まれる点に注意．

**例:**
<pre>
chain A expand 3.5
</pre>
チェインA自身と，それから3.5Å以内にある原子の集合が選択される．
チェインA自体も選択されるところがAROUNDと異なる．

#### BYRES演算子
<pre>
byres [式1]
</pre>
[式1]の選択集合が残基単位に拡張される．

**例:**
<pre>
byres name SD
</pre>
原子名SDを持つ原子の集合が，残基単位の選択に拡張される．
蛋白の場合，結果として，メチオニン(Met)残基がすべて選択されることになる．

#### BYSIDECH演算子
<pre>
bysidech [式1]
</pre>
[式1]の選択集合が側鎖のみに限定される．
タンパク質の場合，表示が見やすいようにbysidechで選択される領域にはCαも含まれるようになっている．

**例:**
<pre>
bysidech A.10:100.*
</pre>
チェインAの残基番号10〜100の側鎖(とCα)のみが選択される．

#### BYMAINCH演算子
<pre>
bymainch [式1]
</pre>
[式1]の選択集合が主鎖のみに限定される．
(あまり使い道はない)

#### NEIGHBOR演算子
未実装

#### EXTEND演算子
未実装

----

### 名前リスト&aname(name_list);
<pre>
name [, name, ...]
</pre>
名前リストはnameあるいはnameをカンマで区切ったリストからなる．
カンマの前後の空白は複数あっても，なくてもよい．

nameは，アルファベット，数字，アンダースコア(_)からなる文字列である．
アルファベットに関しては，大文字・小文字は区別されない．

nameにこれら以外の文字（ドットなど）を含む場合は，**"**(ダブルクォーテーション文字）で囲む必要が有る．
また，ダブルクォーテーション文字で囲んだ場合は，アルファベットの大文字小文字は区別される点に注意．

#### 正規表現
名前リストとして正規表現を使用することができる．
<pre>
/^A[0-9][0-9]$/
</pre>
以上だと，はじめの1文字がA, 残りの2文字が数字の3文字，A01などが選択される．
全体にマッチさせるには，この例のように初めに行頭にマッチする^, 最後に行末にマッチする$をつける必要がある．

上記の普通の名前リストのカンマ区切り表記と正規表現を混ぜることも可能．
<pre>
ABC,/^A[0-9][0-9]$/ ←ABCと，A(2桁数値)が選択される
</pre>

正規表現中のアルファベット文字に関しては，大文字・小文字が区別されるので注意．

### 数値リスト&aname(num_list);
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

#### 残基番号の場合の特例 (insertion code)
残基番号を指定する場合には，insertion codeを含むことが可能です．
例えば，残基番号20Aと20Bを選択したい場合は，
<pre>
i; 20A, 20B
</pre>
と表記可能です．上記のような範囲表記(20A:20Zなど)も可能です．
ただし，insertion codeを含む残基番号の大小関係が微妙なので思いがけない部分が選択されてしまう場合があります．