[cuemol2/Scripting](../../../cuemol2/Scripting)

## 新規Rendererの作成
objに格納されたObjectに対するRendererを作成する．
Rendererの型はrend_typeに格納された文字列で指定する．
```
 var rend = obj.createRenderer(rend_type);
```

Rendererの型(rend_type)は，"ribbon"や"cpk"など，文字列で指定する．

## あるObjectが対応しているRendererの一覧を得る
GUIでリストから選んでRendererを作成する場合等に，
予め標的のObjectに対応しているRendererの一覧を得る必要がある．
そのような場合に以下のようなコードが使用できる．

```
var rend_types = obj.searchCompatibleRendererNames();
var rend_list = rend_types.split(",");
```

searchCompatibleRendererNames()は，
対応しているRendererの型名("ribbon"や"cpk"など)をカンマ区切りの文字列として返す．
配列として使用したい場合は，上記の様にsplit()を使用して配列にする．

## Rendererの削除
```
var rend_id = rend.uid;
obj.destroyRenderer(rend_id);
```

## すでにあるRendererの取得
Object objにattachされているRendererから，ID (rend_id)を指定してRendererを取得
```
var rend = obj.getRenderer(rend_id);
```

あるいは，以下でも可
(Renderer IDはCueMol内部で一意なのでSceneを指定しなくても意図するRendererが取得できる)
```
var SceMgr = cuemol.getService("SceneManager");
var rend = SceMgr.getRenderer(rend_id);
```

Renderer name (rend_name)を指定してRendererを得る
ただし，同名のRendererが複数存在する場合は，
IDが最も小さいものが返される．（それ以外のRendererを直接取得する方法は無い）
```
var rend = scene.getRendererByName(rend_name);