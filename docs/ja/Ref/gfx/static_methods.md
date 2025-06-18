[Ref/gfx](../../../Ref/gfx)


## gfxモジュールのスタティックメソッド

### Static Methods
#### createRend
```
any createRend(string rendname, string rendtype, string attachto)
```

新しくレンダラーを作成する．

*  rendnameに作成するレンダラーの識別名，
*  rendtypeに作成するレンダラーのタイプ名，
*  attachtoに作成するレンダラーがアタッチされるオブジェクト名を

指定する．
[Ref/qsys/qobj](../../../Ref/qsys/qobj)のcreateRendメソッドと同機能であるが，
こちらは全引数を名前で指定するバージョン．
[Ref/qsys/qobj](../../../Ref/qsys/qobj)のcreateRendメソッドを使用した方が簡便であるため
そちらの使用が推奨される．

Return valueとして，作成した[renderer](../../../Ref/gfx/renderer)オブジェクトが返される．

**例**
```
$rend = gfx.createRend("mainchain", "trace", "mol1");
```
データオブジェクト"mol1"に，mainchainという識別名の
[traceレンダラー](../../../Ref/molstr/TraceRenderer)を作成する．

#### destroyRend 
```
void destroyRend(string objname, string rendname)
```
指定したオブジェクトobjectにアタッチされた，名前rendnameを持つ
レンダラーを破棄する．

#### invalidateRend 
```
void invalidateRend(string objname, string rendname)
```
指定したオブジェクトobjectにアタッチされた，名前rendnameを持つ
レンダラーを無効化する．
無効化されたレンダラーは，次回ビューの再描画が要求された場合
キャッシュから描画するのではなく，アタッチしているオブジェクトのデータから
レンダリングを再構築する．

#### getRendNames 
```
array getRendNames(string objname, string rendtype)
```
指定したオブジェクトobjectにアタッチされた，タイプrendtypeを持つ
レンダラー一覧を得る．
Return valueは，レンダラー識別名が格納された文字列からなる配列になる．

#### getRend 
; get renderer object by name
```
any getRend(string,string)
```

データオブジェクト名とレンダラー識別名を指定して，
[rendererオブジェクト](../../../Ref/gfx/renderer)を取得する．

#### updateView 
```
void updateView()
```

メイン・ビューの再描画を要求する．
レンダラーのプロパティー変更等は，変更時に即座にビューには反映されない．
gfx.updateView()を実行してはじめてビューに反映される．

**例**
```
gfx.updateView()
```


#### getCenter 
```
vector getCenter()
```

#### setCenter 
```
void setCenter(vector)
```

#### setRotQuat 
```
void setRotQuat(vector)
```

#### getRotQuat 
```
static vector getRotQuat ()
```

#### rotate 
```
static void rotate (vector)
```

#### setSlab 
```
static void setSlab (real)
```

#### getSlab 
```
static real getSlab ()
```

#### setZoom 
```
static void setZoom (real)
```

#### getZoom 
```
static real getZoom ()
```

#### setStereo 
```
static void setStereo (integer)
```

#### getStereo 
```
static integer getStereo ()
```

#### setBg 
```
static void setBg (vector)
```

#### getBg 
```
static vector getBg ()
```

#### setRendProp 
; set renderer property (obj, rend, propname, value)
```
static void setRendProp (string,string,string,any)
```

#### setRendProps 
; set renderer property (obj, rend, dict(propname=>value) )
```
static void setRendProps (string,string,dict)
```

#### getRendProp 
; get renderer property (obj, rend, propname)
```
static any getRendProp (string,string,string)
```

#### getRendCenter 
```
static void getRendCenter (string,string)
```

#### showRend 
; show/hide renderer (objname, rendname)
```
static void showRend (string,string)
```

#### hideRend 
```
static void hideRend (string,string)
```

#### isRendShown 
```
static boolean isRendShown (string,string)
```

#### showAllSel 
```
static void showAllSel (boolean)
```

#### showAllLabel 
```
static void showAllLabel (boolean)
```

#### showAllDist 
```
static void showAllDist (boolean)
```

#### writeScene 
; write current scene to file (filename, format)
```
static void writeScene (string,string)
```

#### writeScene
; write current scene to file (filename, format, options)
```
static void writeScene(string, string, dict)
```

#### saveView 
; write the current view settings to file (filename)
```
static void saveView (string)