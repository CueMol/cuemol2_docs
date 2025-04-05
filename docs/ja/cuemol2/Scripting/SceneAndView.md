Return to [Scripting interface](../../../cuemol2/Scripting/)

SceneとViewに関連する操作

## 新規Sceneの作成
```
var SceMgr = cuemol.getService("SceneManager");
```
```
var scene = SceMgr.createScene();
```
```
scene.setName(scene_name);
```

## 新規Viewの作成
以下で新しいViewが作成できる．
ただし，実際に画面上に表示するためには，
現在のGUI実装のMolView objectに対してbindしなければならない（これはGUI実装に依存してやり方が異なってくる）．

```
var view = scene.createView();
```
```
view.name = view_name;
```

## Scene fileを開く
既存のScene，sceneに，pathで指定されるfileからqscファイルを読み込む．
通常，sceneは何も含まれていないemptyの状態が望ましい．（すでに何か読み込まれていても動作することはすると思うが．）

```
var StrMgr = cuemol.getService("StreamManager");
```
```
var reader = StrMgr.createHandler("qsc_xml", 3);
```
```
reader.attach(scene);
```
```
reader.setPath(path);
```
```
reader.read();
```
```
reader.detach();
```

StrMgr.createHandler("qsc_xml", 3)という文の3という数字はI/O handlerのcategoryを示しており，
3はSceneに対する読み込みを行うカテゴリーのハンドラー（すなわちSceneのreader）を意味している．

## Default cameraをloadする
変数viewに格納されたビュー（あるいはview_idで指定されるビュー）に対して，
sceneのdefault camera (__current)をロードする．
Default cameraには，qsc fileを保存したときのviewの状態が格納されている．
Qsc fileを読み込んだときにこれを行うことで，保存時のviewの状態を復元できる．
```
var view_id = view.uid;
```
```
scene.loadViewFromCam(view_id, "__current");
```

## 現在のviewの状態をdefault cameraにsaveする
現在のmain viewの状態は，自動的にSceneのdefault camera (__current)へ保存されるわけではない．
スクリプト側で，シーンの保存時などに適宜default cameraへ保存を行ってやる必要がある．
通常，シーンの保存前に以下のコードが実行されるべき．

```
if (!scene.saveViewToCam(view_id, "__current")) {
```
```
  // error handling
```
```
}
```

## Sceneをfileに保存する

```
var StrMgr = cuemol.getService("StreamManager");
```
```
var writer = StrMgr.createHandler("qsc_xml", 4);
```
 
```
writer.setDefaultOpts(scene);
```
 
```
writer.attach(scene);
```
```
writer.setPath(path);
```
```
writer.write();
```
```
writer.detach();
```

writer.setDefaultOpts() methodは，
もしsceneがqsc fileから読み込んで作成されたものであった場合に，
元となるqsc fileで使用されているファイル形式options (file version, 圧縮の有り無しなど)を引き継いで，
上記で作成されたwriterでも使用するようにする．

StrMgr.createHandler("qsc_xml", 4)という文の4という数字はI/O handlerのcategoryを示しており，
4はSceneに対する書き込みを行うカテゴリーのハンドラー（すなわちSceneのwriter）を意味している．

## Sceneの取得
scene_nameで指定されるSceneを取得する．
```
var SceMgr = cuemol.getService("SceneManager");
```
```
var scene = getSceneByName(scene_name);
```

Scene name (sc_name)を指定してSceneを得る．
ただし，同名のSceneが複数存在する場合は，
IDが最も小さいものが返される．（それ以外のSceneを直接取得する方法は無い）
```
var scene = scene.getSceneByName(sc_name);
```

## Sceneの状態一覧の取得
変数sceneに格納されたSceneの現在の状態
（含んでいるObjectの一覧と，各ObjectにattachされているRendererの一覧）
を取得する．

```
let json_str = scene.getSceneDataJSON();
```
```
let data = JSON.parse(json_str);
```
```
let i, nlen = data.length;
```
```
for (i=1; i<nlen; ++i) {
```
```
  let obj = data[i];
```
```
  
```
```
  // operations for obj
```
```
  
```
```
  if (obj.rends && obj.rends.length>0) {
```
```
    var j, njlen = obj.rends.length;
```
```
    for (j=0; j<njlen; ++j) {
```
```
      let rend = obj.rends[j];
```
```
      
```
```
      // operations for rend
```
```
      
```
```
    }
```
```
  }
```
```
}
```

以上のように，query系の複合データを返すmethodの返却値は（現実装では）基本的にJSON文字列になっているので，script側にJSONをparseしてobjectを組み立てる仕組みが必要．（javascriptの場合のJSON.parse()に相当するもの）
