[cuemol2memo](../../cuemol2memo)

## CueMol2開発メモ

### 2007/5/20
* jsbr/ObjWrapper<br />
エラー処理をするようにした．(throwErrorを呼び出す)
* JS bridgeのthrowErrorの実装<br />
単にJS_ReportError()を呼び出せばよいようだ．
* qlib/TestClass.hpp JSから呼び出すテスト / qlib/testclass.js <br />
objectが関係ないmethod: OK<br />
objectを渡すmethod: OK<br />
objectを返すmethod: OK
### 2008/3/8

XML関連

System中では、Objectとそれに対応するXMLNodeObjが存在。
XMLNodeObjはDOM Treeの簡略化版みたいなもの。

1. デシリアライズ時、
XML parserがXMLNodeObjを作る。XMLNodeObjからObjectが作られる。

1. Object編集時は、XMLNodeObjに直ちには反映しない。XMLNodeObjは、どちらかというと、ファイル中のXML文書を反映した状態を保っている。

1. シリアライズ時、Objectの内容をXMLNodeObjに反映。
更新されたXMLNodeObjがXML streamに書き出される。(ObjToXML更新)

上記３パターンのみをサポートする。
XML文書から、既にあるオブジェクトをアップデート(XMLToObj更新)はサポートしない。
Serialize時には、上記ではアップデートをサポートするように書いているが、まずは非アップデート型（毎回全生成）で実装すればよいのでは。ただし、そうすると、手書きのXMLのコメントやフォーマットなどがすべて失われるという問題点がある。


Nodeタイプには、２種類存在。

* Tableタイプ：あるインタフェイスを持つオブジェクトを（多数）保持。保持されているオブジェクトに対応するタグが一定ではなく、ランタイムに決まる。オブジェクトはunique ID (数値)でindexされている、かつ、リストのように順序を持つ。
* Propタイプ：プロパティのみを持つ場合。
プロパティの型はコンパイル時に決まっている。


XMLNodeObjとObjectの対応付け

非アップデート型実装では、不要（毎回破棄／生成するだけだから）

アップデート型実装では、
*  XML→Obj では、XMLから対応するobjectを知る必要がある。<br />
対応するObjectがある（可能性のある）XMLNodeObjはUIDを持っている。
UIDから、objectを検索できる（getXMLPeer() method）。既に削除されているかどうかもUIDから判断可能。<br />
今の実装では、ObjToXML更新をgetXMLPeer()を使っておこなている。すべてのXMLNodeに対して、UIDを得てから対応するObjがあるか検査し、ある場合はUpdate、ない場合はCreationを行っている。<br />
上述の分析から、この実装は不要ではないのか？<br />
*  Obj→XML では、Objectから対応するNodeObjを知る必要がある。<br />
Serializableなobjectは、XMLObjNodeへのSmartPtrを保持している。
対応するXMLNodeがない場合は、このポインタはヌルになっている。<br />
上述のような理由により、現実装では使用されていない。

### 2008/3/8

Object階層の構成

ObjTable
:   uid→ObjectのHashテーブル．uidはobjectが出来た順にグローバルに付けられるので，実質的にはリストになる．<br />

基本的にSceneを構成するcollection objectはこれを用いる．Sceneなどでは，object nameはユーザに見えるヒントでしかないので，同一名前が存在することを許す．<br />
派生クラスの実装で，名前でソートしたり，同一名を排除したり，別の基準でobjectの順序・存在を制御出来るようにする．<br />
ObjTableはinterfaceで，insert(データの追加)，get(uidからobjectの取得), getAllUIDs(全UIDの集合を取得)の３つからなる．
それ以外
:   全てPropertyは保持出来るようにする．ObjTableもPropertyをもてたほうが良い．


XMLによるPropertyの表現
Attributeによる表現
:   XMLのattrによってあらわすため，文字列になる．<br />

数値・文字列の場合は自明．<br />
色，shadingなど，さらに構造を持つ記述は独自のMarkupが必要になる．（色以外は対応する必要が無いだろう）<br />
HTMLのように，JSで記述することも必要．（ただ，HTMLのonXXXプロパティでは，JSの評価値がattrとして設定されるのではなく，文字列をJSとしてcompileしたcodeletが設定される仕様である．この違いをどうするか？）<br />
文字列への変換はLScrConvCapインタフェイス，void fromString(string value)と，
string toString() constでサポートする．個別実装はこの下に隠蔽．<br />
ただし，同じ値に対して複数表記がある場合(0.0と0.00等)，文字列としての表現がfrom/toを減ることで変化してしまうと言う問題が起り，Update型実装では何らかの対処が必要．

Children tagによる表現
:   そのelementの子element(tag)に記述する．<br />

数値・文字列の場合は冗長になる．<br />
色，shadingなどの構造もXMLによりMarkupできる．<br />

Children tagによる記述の方が（冗長になる面もあるが）汎用性が高い．

LScriptableはLScrConvCapを含んでいる（全てのscriptableなclassは実装しなければならない．）

**問題**:結局XMLNodeObjは2種類しかないので，XMLNodeFactoryは不要なのではないか．
getXMLElemName()のみあればNodeObjは作成できるのではないか．

### 2008/4/12

DOM-likeな一時オブジェクトツリーを作るのなら、全バージョンのserialization機構と類似の方式でも良いのではないか？

Matrix4Dの実装

LRegExprの実装
PCREを使用。
jsで使用する場合、パターンの\をいちいちエスケープしなければならない、という問題がある。


#### mcwrapgen3のデバッグ
QIF型が決まると、流通している型（SetterだとSRC, GetterだとDEST）がPTRかSPかは決まる。当たり前だが、流通型はポインタしかありえない。

JS・XPCOMともに、SetterとArgument処理のコードがおかしかったので、以下のよう修正。

Setterの場合、

* DEST=値/const referenceの場合、
    * SRC=<PTR>→*でアクセス
    * SRC=<SP>→*でアクセス
* DEST=PTRの場合、
    * SRC=<PTR>→p->copy()でアクセス、必要に応じてコピーが作られる
    * SRC=<SP>→p->copy()でアクセス、（必要に応じて）SPではなく、本体のコピーが作られる
* DEST=SPの場合、
    * SRC=<PTR>→単純コピー
    * SRC=<SP>→単純コピー

上記のように実装。
Argument処理も基本的に同様。

#### Variant型(LVariant)の参照セマンティクス
通常は、LVariantは一時的な値の保管に使われるだけ。
生存期間はローカル変数あるいは関数への引数レベル。（メンバーとして参照されるようなことは無い）

一方で、LVariantにptrを格納して返すmethodは、必ずcopy()したptrを格納して返す。
しかし、これはLVariantがそのptrの指すobjectを**所有していることを意味するのではない**。呼び出した側（のコード）が所有していると考える。

そのため、LVariantから取り出したptrを格納するに当たってcopy()を呼び出す必要はないし、LVariantのデストラクタはclientのdestruct()を呼び出さない。

**正しい使用方法**：呼び出した側が、使用後に明示的にcleanupPersistentReference()を呼び出す、あるいは、ほかの所有(persistent)的なobjectにcopy()することなく渡してしまう。