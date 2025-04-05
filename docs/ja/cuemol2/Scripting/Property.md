[cuemol2/Scripting](../../../cuemol2/Scripting)
## プロパティーの取得
例えばScene, Object, Rendererはすべてnameというプロパティーがあり
名前が文字列で格納されているが，以下のように読み出すことができる．
```
var nm = scene.name;
```

## プロパティーの設定
また，プロパティーは以下のように設定できる．
```
scene.name = nm;
```

## プロパティーのデフォルト
プロパティーは通常デフォルトの値を持っており，
値を設定していないときはデフォルトの値になっている．
値を設定した後，デフォルトに戻したい場合は以下のようなコードを実行すれば良い．
（ただしデフォルト値を持たないプロパティーもある）
```
cuemol.resetProp(targetObj, propName);
```



## プロパティーの型
プロパティーの型には以下のものがある．
boolean
:   真偽値型

integer
:   整数型（32 bit signed integer）

real
:   実数型 (64 bit floating point)

string
:   文字列型 (非ASCII文字はUTF8で格納される)

enum
:   列挙型．文字列型と類似しているが，ある特定の文字列しか指定できない．

複合型
:   他のobjectへの参照．さらにこのobject内のプロパティーは

foo.bar.bazのようにアクセス可能．(ただしscript言語側の実装にもよるが．)

## プロパティーの一覧を得る
あるobjectが持つプロパティーに関する情報を得るには，以下のようなコードを実行する．

```
var json_str = cuemol.getPropsJSON(targetObj);
```
```
var data = JSON.parse(json_str);
```

dataには，プロパティー情報の一覧が配列として格納される．
すなわち，i番目のプロパティー情報には以下のようなデータが格納されている．
data[i].name
:   プロパティー名(string)

data[i].readonly
:   プロパティーがreadonlyかどうか(boolean)

data[i].hasdefault
:   プロパティーがdefault値を持つかどうか(boolean)

data[i].isdefault
:   現在のプロパティー値がdefault値から変更されていないかどうか(boolean)

data[i].type
:   プロパティーの型名(string)

data[i].value
:   プロパティーの値(型や内容はプロパティーの型に依存して異なる)


さらに，enum型のプロパティーに関しては以下の項目がある
data[i].enumdef
:   プロパティーが取りうる値がカンマ区切り文字列ではいる．


また，複合型の場合は，valueは値が入るのではなく，
その複合型の有するプロパティーに関する情報が格納される．
