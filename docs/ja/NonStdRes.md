[Documents](./Documents)

Update (2007/4/24)
:   topファイルをQScript上で読み込めるようにしたので加筆．

Update (2004/12/04)
:   topファイルのPropResidに関する記述を加筆．

Update (2004/10/21)
:   topファイルの記述に一部誤りがあったので訂正しました．




### CueMolがデフォルトで扱える残基と非標準の残基
CueMolはデフォルトで，天然アミノ酸とAT/UGCの核酸のトポロジー（どの原子と原子が共有結合しているか）を知っており，
そのデータに基づいてsimpleレンダラー等は化学結合のボンドを描画しています．
また，残基間の結合（ペプチド結合とホスホジエステル結合）のデータに基づいて，
残基間の化学結合のボンドを描画しています．

さらに，CueMolが知らない残基（薬剤分子や修飾されたアミノ酸・核酸）が入っている場合は，どの原子と原子が共有結合しているかという情報が得られないため，
原子間の距離により共有結合しているかどうかを勝手に判断して
ボンドを作っています．((具体的には，各原子のファンデルワールス半径の和よりも極端に近い場合は共有結合していると判断している))

そのため，どうしても誤った共有結合が勝手に作られる場合があります．また，非標準の残基が修飾アミノ酸であっても，ペプチド結合が描画されません．

これらの問題を解決するには，CueMolに非標準の残基に対するデータを与えてやればよいわけです．
ここでは，燐酸化チロシン（Phosphotyrosine)を例にとって説明します．

### トポロジーの定義 (queptl.top等)
分子・残基のトポロジーはcuemol.exeがあるディレクトリの下の
dataディレクトリにある，**queptl.top**に記述されています．
これは，XPLOR/CNSのトポロジー定義と同じ書式になっています．

例えばアラニンの場合は，
<pre>
RESIdue ALA
```
GROUp
```
```
 ATOM N    TYPE=NH1   CHARge=-0.35   END
```
```
 ATOM H    TYPE=H     CHARge= 0.25   END
```
```
 ATOM CA   TYPE=CH1E  CHARge= 0.10   END
```
```
 ATOM CB   TYPE=CH3E  CHARge= 0.00   END
```
```
 ATOM C    TYPE=C     CHARge= 0.55   END  
```
```
 ATOM O    TYPE=O     CHARge=-0.55   END  
```

```
BOND N    CA
```
```
BOND CA   C
```
```
BOND C    O
```
```
BOND N    H
```
```
BOND CA   CB
```

```
IMPRoper  CA     N    C  CB  !tetrahedral CA
```


END {ALA}
</pre>
となっていますが，実際に重要なのは
**RESIdue ALA** ... **END**というのと，
**ATOM**, **BOND**のところだけです．((それ以外のデータはエネルギー最小化やMDで必要になってくるが，今のところCueMolでは未実装．))
{}内と先頭に!のある行はコメントになります．

さらに，残基のプロパティーが最後のほうで定義されています．（これはCueMolでの勝手な拡張ですが．）
<pre>
!------------------------------------------------------------------
! Que's extension commands

PropResid ALA
```
 Pivot CA
```
END
...
</pre>
これで，traceやtubeレンダラーで
原子CAが既定の主鎖原子として扱われるようになります．
逆に，この記述がなければtraceなどでその部分が切れて表示されてしまいます．


あと，**大文字・小文字は同じ**としてあつかわれます．RESIdueもresidueも同じ．

### 燐酸化チロシンを作ってみる
例として燐酸化チロシンを作ってみます．
燐酸化チロシンは，PDBでの残基名は**PTR**のようなので，それにあわせます．

#### PropResidセクションの作成
まずPropResidセクションを作成します．
主鎖原子などはTYRと同じなので，
queptl.top内の**PropResid TYR**の部分をコピーして，
残基名を**PTR**に変えるだけでＯＫです．
<pre>
PropResid PTR
```
 Pivot CA
```
```
 Ring CG CD1 CE1 CZ CE2 CD2 END
```
END
</pre>
Ringの部分は環状構造の原子を指定していますが，
これも変わらないのでそのままでＯＫです．

以上でtraceやtubeでPTRがアミノ酸残基として認識され，
連続して描画されるようになります．
さらに，simpleなど原子レベルでの表示でも正しく共有結合が
描画されるようにするためには，以下のステップが必要です．


#### Residセクションの作成
次に，
queptl.top内の**RESIdue TYR**の部分をコピーして，ATOM, BOND定義のみを残した上で
残基名を**PTR**にします．

さらに，ATOMに関しては水酸基の水素原子**HH**の定義を除き，
変わりに燐酸基**P**, **O1P**, **O2P**, **O3P**の定義を入れます．
ここで，**charge**は（1.0.0系の実装では）使われていないので，
適当な数値を入れてください．
**type**も厳密には使われてないのですが，
定義されていないatom typeを指定するとエラーになるので，
他の行で使われているのを適当に真似して入れておけばOKです（以下の例ではHHのをそのままコピーしています）．

次に，BONDに関しては，先端の水酸基の水素**HH**を取って，
燐酸基**P**, **O1P**, **O2P**, **O3P**に関する結合を追加します．

<pre>
RESIdue PTR
```
 ATOM N    TYPE=NH1   CHARge=-0.35   END
```
```
 ATOM H    TYPE=H     CHARge= 0.25   END
```
```
 ATOM CA   TYPE=CH1E  CHARge= 0.10   END
```
```
 ATOM CB   TYPE=CH2E  CHARge= 0.00   END
```
```
 ATOM CG   TYPE=CY    CHARge= 0.00   END
```
```
 ATOM CD1  TYPE=CR1E  CHARge= 0.00   END
```
```
 ATOM CE1  TYPE=CR1E  CHARge= 0.00   END
```
```
 ATOM CD2  TYPE=CR1E  CHARge= 0.00   END
```
```
 ATOM CE2  TYPE=CR1E  CHARge= 0.00   END
```
```
 ATOM CZ   TYPE=CY2   CHARge= 0.25   END
```
```
 ATOM OH   TYPE=OH1   CHARge=-0.65   END
```
```
 ATOM P    TYPE=H     CHARge= 0.40   END
```
```
 ATOM O1P    TYPE=H     CHARge= 0.40   END
```
```
 ATOM O2P    TYPE=H     CHARge= 0.40   END
```
```
 ATOM O3P    TYPE=H     CHARge= 0.40   END
```
```
 ATOM C    TYPE=C     CHARge= 0.55   END
```
```
 ATOM O    TYPE=O     CHARge=-0.55   END
```
```
BOND N    CA
```
```
BOND CA   C
```
```
BOND C    O
```
```
BOND N    H
```
```
BOND CA   CB
```
```
BOND CB   CG
```
```
BOND CG   CD1
```
```
BOND CG   CD2
```
```
BOND CD1  CE1
```
```
BOND CD2  CE2
```
```
BOND CE1  CZ 
```
```
BOND CE2  CZ
```
```
BOND CZ   OH
```
```
BOND OH   P
```
```
BOND P    O1P
```
```
BOND P    O2P
```
```
BOND P    O3P
```
END
</pre>
追加する位置はどこでも良いですが，アミノ酸の最後(バリン)のあとにしておきます．

これでCueMolを再起動すると燐酸化チロシンPTRが認識されます．

1BF5など，PTRがあるPDBファイルを読み込んで見てください．
この時点では残基は認識されているものの，ペプチド結合しうるというのが
認識できていないので，隣の残基との結合は表示されません．

#### 残基間のリンケージ(queptl.lin)を編集
残基間のリンケージ情報は**queptl.lin**ファイルで定義されています．
<pre>
link pept    head - ala   tail + *     end
...
link pept    head - val   tail + *     end
</pre>
**link**のある行が残基間のリンクの定義です．

次の**pept**というのはペプチド結合を示しています((peptやnucはtopファイルに記述されているPRESidue定義に対応している．))．
(ホスホジエステル結合は**nuc**)
一番上の行は大雑把に言うと，「前(head)がalaで後(tail)が*(任意の残基)の場合はペプチド結合でつなげ」ということです．プラスとマイナスも意味があるのですが，ここでは省略．

残基PTRをペプチド結合する残基と認識させるには，
```
link pept    head - ptr   tail + *     end
```
という行を追加してやればよいわけです．
上記の行を追加して，CueMolを再起動して1BF5のＮ末端をsimpleで表示すれば
正しく認識されているのが分かります．

![ptr](./assets/images/NonStdRes/ptr.png){ .on-glb }

### 注意点
topやlinファイルを変更した状態で新しいバージョンのCueMolを
**上書きインストール**すると，
パッケージ付属のデフォルトのファイルに**上書きされてしまいます**．
バックアップを忘れずに．

また，QScriptを使用する場合は，
スクリプトから指定したファイルをトポロジー・リンケージ定義ファイルとして
読み込ませることができます（後述）．
システムディレクトリのqueptl.top等を変更するのではなく，
独自の残基定義を記述したファイルをスクリプトと同じ
ディレクトリ等に作成しておき，
それをスクリプト中から読み込むようにした方が良いでしょう．

### ネット上のリソースの利用
ここで紹介したホスホチロシンと同じ方法で原理的にどんな化合物にも対応できるわけですが，
手動でトポロジーを作るのは結構面倒です．
CueMolのトポロジー定義はCNS/XPLORと同じですので，
ネット上にあるCNS/XPLOR用のツールを使って作る方法があります．

[PRODRG server](http://davapc1.bioch.dundee.ac.uk/programs/prodrg/)
は，PDB形式の座標を入力すると
CNS/XPLOR用のパラメータ・トポロジーファイルを作ってくれます．
このトポロジーのところをコピーしてやればよいわけです．
この場合，上記でやったようにBOND以外の部分は除いてしまったほうが無難でしょう．

[HIC-Up server](http://alpha2.bmc.uu.se/hicup/)は，
PDBから非標準の残基を集めて公開しているサーバーです．
使い方がいまいち分かりにくいですが，
[Trivial name](http://alpha2.bmc.uu.se/hicup/xtriv.html)では一般名で探すことができます．

### 任意のディレクトリーにあるトポロジーファイル等を読み込む
システムディレクトリにあるqueptl.topは起動時に自動的に読み込まれますが，
独自に定義したトポロジーは他のファイルから読み込めたほうが便利です．
QScriptから，mol.loadTopparFile()メソッドを呼び出すことで，
任意のXPLOR/CNSのトポロジー(*.top)・パラメタ(*.par)・リンケージファイル(*.lin)
を読み込めます．
```
mol.loadTopparFile("ファイル名", "cns");
```

ただし，トポロジーは読込・定義以降から有効になります．
そのため，分子ファイルをロードする前に読み込んでおく必要があります．
