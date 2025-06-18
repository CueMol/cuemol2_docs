[../](../../cuemol2/)

## CueMol2に関するメモ書き

### 概要

*  アプリ形式
    *  standalone型のCLIアプリ<br/>
デフォルトでビルドされる。<br/>
scriptingはinternal JS（と，可能なら互換性のためのQS等）

    *  libXULを使用したGUIアプリ<br/>
GeckoSDKが在る場合にビルドされる<br/>
XPConnect経由でexternal JSから呼び出す<br/>
OpenGLのviewはダミーのプラグインを作成してHWNDを得る．

*  スクリプティング
    *  Internal JS<br/>
内部にSpiderMonkeyを持つ→JSAPIを使用してcuemol objectをjsから使用できる

    *  External JS<br/>
Mozillaの場合XPConnect経由でブラウザのスクリプト言語から呼び出す
JSAPIは使用できないので、独自のwrapper objectによりcuemol objectをjsから使用
→最終的には全てのobjectに対してjsで記述されたwrapper classを作成し、シームレスに使用できるようにする（internal/externalの一致を目指す）

npruntimeインタフェイス経由でブラウザのスクリプト言語から呼び出すことも視野に入れる．（Firefox, Opera等からの制御）同じinterfaceでActiveXを実装すれば、IEからも使用可能に出来るが．．．


### Scripting interface
#### jsbrサブシステム

内部スクリプティング用インターフェイス，
内部に独自のSpiderMonkeyのコピーを持つ。($(srcdir)/js)

JSAPIを使用してwrapper objectを記述


#### xpcomサブシステム
外部スクリプティング用(XPConnect側)インターフェイス

主に、

*  setProp
*  getProp
*  invoke

のインタフェイスを持つqIObjWrapper interfaceからなり、
全ての呼び出しを上記経由で行わなければならない。


#### npサブシステム

外部(npruntime側)インターフェイス

configure引数

    * with-gecko-sdk=<Gecko-SDKのあるディレクトリ>
### Scene description
XML+(内部)JSで記述。

内部JS: 自前で持つSpiderMonkyで実行するjavascript

## 新しいMetaClass wrapper generator
mcwrapgen3.pl

C++のテンプレートを用いたプロパティーは、複雑になりすぎるので廃止。
インターフェイス定義ファイルXxxClass.qifから、以下のものが生成される。


XxxClass_wrap.hpp
:   ラッパークラスXxxClass_wrapのクラス定義ファイル。

XxxClass_wrap.cpp
:   ラッパークラスXxxClass_wrapのクラス実装ファイル。~
主に、dispatch intefaceとnative呼び出しの変換機構。<br/>
XxxClass自体のメタクラスや、(cloneableの場合は)clone()の実装なども含まれる。


モジュール定義ファイルから、モジュールローダー・ファクトリを生成する。

**XPCOM用のtypelib形式呼び出しの実装は複雑になるため中止**


外部JS記述簡素化のため、QIFファイルからjavascriptのwrapper codeを自動生成するようにした方が良い。

内部JSに関しても、外部同様の簡素な記述を可能にするライブラリを必要ならば自動生成を含めて整備する必要がある。


### qlibのvariant型
qlib専用のvariant型がある(qlib::LVariant)。<br/>
variant型は，以下の6種類の値を持ちうる．

* void
* boolean
* integer (32bit signed)
* real (64bit)
* string (LString with utf8 format)
* object

Objectに関しては、コピー時の振る舞いにより3+1種類存在

SimpleCopy (LSimpleCopyScrObject)
:   コピー時には必ずコピーが起こる。ポインターの共有は絶対に起こらない。LCloneableObjectから派生~
ただし、内部REPでポインター共有・Ref countingは可能。<br/>
String, Vector系, Color系など汎用型は内部REP共有型で実装すべき。<br/>
Scriptableスマートポインタqlib::LScrSp<_Type>も見かけ上はSimpleCopyになる。ただし、わかりにくくなるが、copy()やclone()で実体のdeepコピーは行われない。

RefCount (LRefCountScrObject)
:   **これは現時点では使用しない予定。**~
SimpleCopyインターフェイスを実装した、SmartPtrを作成したので不要となったため。
コピー時にはポインターのみコピーされ、参照カウントされる。LRcObjectから派生。<br/>
LRcObjectは生成時参照数0だが、LRefCountScrObjectでは１である。これは、copy()メソッドの他ポリシー型との整合性のため。生成時にはnew呼び出し側により自動的に参照されると考える。

Sinleton (LSingletonScrObject)
:   システム起動時に生成され、コピー時にはポインターのみコピーされる。システム終了時に明示的に削除されるまで存在。インスタンスはシステム中１つのみ存在するようにする。

???
:   オブジェクトの生成自体は他のインターフェイスにより行い、明示的にnew等で作成することは出来ない。他はSimpleCopyと同じ。

### property
typelibから呼び出す形式と，automationの形式がある．以下，プロパティー名をXXXとすると，

dispatch形式
:   bool getPropImpl(const LString &propname, LVariant &res) const~
bool setPropImpl(const LString &propname, const LVariant &res)<br/>
というシグネチャを持つ．全プロパティーで共通のインターフェイス．(XPConnectなしの)JSやNPRuntime, 他のinterpreter言語から呼び出すのに適している．パフォーマンスが悪い．<br/>
デフォルトでは，superclassのプロパティも検索する．一致するプロパティが見つからない場合はfalseを返す．型が一致しない場合（setter）も，falseを返す．例外は，エラー時以外は私用しない．

typelib形式
:   void getXXXPropImpl(LVariant &) const~
bool setXXXPropImpl(const LVariant &)<br/>
というシグネチャを持つ．各プロパティーごとにメソッドがある．XPCOMやCOMなどから呼び出すのに適している．パフォーマンスは前者より良い筈．<br/>
getterについては，型にかかわらずLVariantに格納されるので，（例外発生以外の）失敗は無いと考える（だから返却値がvoid）．<br/>
一方，setterについては，LVariant側の型とプロパティの型が一致しない場合は，(例外ではなく)，何もせずにfalseを返す．

get/setPropImpl()では，if文の羅列でget/setXXXImpl()のうちいずれを呼び出すか決め，呼び出す．
get/setXXXImpl()では引数のLVariantからnativeへの変換を行い，プロパティーのアクセスを行う．

以上のほかに，getPropNames(), getPropTypeName(), hasProperty()がある(dispatch形式用)． 

primitive typeについては単純にコピー。
文字列だけ特別扱い、基本的にはSimpleCopy(with REP).

Object型には、compositeとaggrigateタイプがある。


composite
:   外側オブジェクトと寿命が絶対同じになる。
よって、getアクセスすると必ずコピーを返す。(そうしないと外側オブジェクトが破棄された後も，内部への参照を他のオブジェクトが保持することになってしまう．)
よってSimpleCopyポリシーでないと×。<br/>
普通のSimpleCopyだと、内部プロパティーを変更できなくなる。たとえば，<br/>
X.Y.Z = 1;<br/>
というコードの場合，X.Yが先に評価されて，XのGetY()が呼ばれる．GetY()がYのこぴーを返して，コピーYのSetZ(1)が呼ばれる．コピーYのプロパティーのみ書き換わり，元のYのプロパティーは変化しない．
コピーYは文が実行された後は破棄されるので，結局，X.Y.Zは1に書き換わらず，プロパティーの変更が不可能になってしまう．<br/>
よって、内部プロパティをもつオブジェクトの場合はREPの寿命がwrapper/親プロパティより長く出来るSimpleCopy(with REP)が**必須**。<br/>
非ポインターで実装

aggrigate
:   プロパティ親と寿命が異なってもＯＫ。コピーポリシーは何でもよい。ただし、singletonは他オブジェクトのプロパティーとして不適だろう~
ポインターで実装


### method
基本的にpropertyに準ずる。

typelibから呼び出す形式と，automationの形式がある．以下，メソッド名をXXXとすると，

automation形式
:   invokeMethod(const LString &name, LVarArgs &res)~
というシグネチャを持つ．全methodで共通のインターフェイス．(XPConnectなしの)JSやNPRuntime, 他のinterpreter言語から呼び出すのに適している．パフォーマンスが悪い．

typelib形式
:   invokeXXXImpl(LVarArgs &)~
というシグネチャを持つ．各methodごとにメソッドがある．XPCOMやCOMなどから呼び出すのに適している．パフォーマンスは前者より良い筈．<br/>
現在，まだ実装されていない．

invokeMethod()では，if文の羅列でinvokeXXXImpl()のうちいずれを呼び出すか決め，invokeXXXImpl()を呼び出す．
invokeXXXImpl()では引数のLVariantからnativeへの変換を行い，対応するnative methodを呼び出す．

以上のほかに，hasMethod()がある(automation形式用)． 



引数
:   setPropertyと同様と考えられる。~
mcwrapgenのMCINFO:表記は、primitive型の場合は普通に型を記述する。
Object型の場合は、LScriptableからの**型キャスト式を記述**する。

返却値
:   getPropertyと同様と考えられる。~
ポインタタイプの場合は、コピーポリシーに関わらず、常にcopy()した値を返すようにする。<br/>
非ポインタタイプの場合も、コピーしたものを返す？？

### IDL生成とwrapperの実装
Propertyはattributeに変換される．<br/>
IDLの生成については，


primitive
:   IDLのprimitive typeに変換される．e.g. LReal <-> doubleなど．

object (composite,aggrigateとも)
:   XPCOM interfaceに変換される．

そのほかに，

*  Wrapper interface (qI_XXX)
*  Wrapper impl class (qW_XXX)

が生成される．特に，qI_XXXの方は，xpidlが生成するものである．

qW_XXXは，qI_XXXの純粋仮想関数を全て実装する．

qI_XXXは全てqIObjWrapperインターフェイスをもつ．
それを簡易に実装するために，qW_XXXはqWObjWrapperを継承する．
qIObjWrapperはNative型ptrを返すmethod getObject()を持つが，scriptableでなくてもよい．このinterfaceはscriptから呼ばれることはないから．

qW_XXXの引数には，primitive or object typeが渡される．

引数 - primitiveの場合
:   単純にLVariantに変換可能．LVariantに変換後，get_XXX_Impl()等に渡される．

引数 - objectの場合
:   XPCOM interface qI_XXX*（あるいはそれへの参照ポインタ）が渡される．まずqIObjWrapperにQIする．qIObjWrapperは，getObject()というメソッドがあり，LScriptableのptrを取得できる．LScriptableからLVariantに変換する．LVariantに変換後，get_XXX_Impl()等に渡す．

thisの変換
:   thisをqWObjWrapperにup castし，getObject()を呼ぶ．LScriptableを，C++型にdynamic_castする．得られたptrに対して，get_XXX_Impl(), set_XXX_Impl(), invoke_XXX_Impl()を呼び出すことが出来る．

Methodについても，get(), set()と同様と考えられる．

### persistence
検討中