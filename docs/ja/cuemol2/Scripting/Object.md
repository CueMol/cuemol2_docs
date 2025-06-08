[cuemol2/Scripting](../../../cuemol2/Scripting)

## Objectのファイルからの読み込み
reader_nameで指定されるreaderを使用して，pathからファイルを読み込んでObjectを作成する．
読み込んだObjectのnameはobj_nameに設定する．最終的に読み込んだObjectをsceneで指定されるSceneに追加する．

```
var StrMgr = cuemol.getService("StreamManager");
```
```
let reader = StrMgr.createHandler(reader_name, 0);
```
```
reader.setPath(path);
```
 
```
let newobj = reader.createDefaultObj();
```
```
reader.attach(newobj);
```
```
reader.read();
```
```
reader.detach();
```
 
```
newobj.name = obj_name;
```
```
scene.addObject(newobj);
```

GUIで読み込みを行うには，以下で説明するreaderの一覧のほか，attach可能なrendererの一覧なども出してユーザーに選ばせる必要があるがそれは後述．

### Readerの一覧を得る
File open dialogなどではファイル形式を選んでファイルを開くことが出来る場合が多い．
そのようなリストを作成するために，現在CueMolがもっているreaderの一覧を得ることが可能．
以下で，nCatIDにI/O handerのカテゴリー0を指定しているが，
0はObjectの読み込みを行うI/O hander(すなわちObjectのreader)を意味している．

```
var StrMgr = cuemol.getService("StreamManager");
```
 
```
var nCatID = 0;
```
```
var info = JSON.parse(StrMgr.getInfoJSON2());
```
```
var names = [];
```
 
```
for (var i=0; i<info.length; ++i) {
```
```
   let elem = info[i];
```
```
   if (elem.category!==nCatID)
```
```
     continue;
```
```
   
```
```
   // skip QDF format in the obj-reader mode (cat==0)
```
```
   if (nCatID==0 && elem.name.indexOf("qdf")==0) {
```
```
     continue;
```
```
   }
```
```
   
```
```
   names.push(elem);
```
```
}
```

以上のコードにより，namesにはObject reader infoのリストが格納される．
Reader infoの各要素には，以下の情報が入っている．

descr
:   Readerがsupportするファイル形式の簡単な説明

fext
:   Readerがsupportするファイル形式の拡張子

name
:   Readerの名前(createHandler()の引数に指定してreaderを作成する時に使用)

category
:   Readerのカテゴリー



## Objectのファイルへの保存
targetObjをwriter_nameで指定されるwriterを使用して，pathで指定されるファイルに書き出す．

```
var StrMgr = cuemol.getService("StreamManager");
```
 
```
let writer = StrMgr.createHandler(writer_name, 1);
```
```
writer.setPath(path);
```
```
writer.convToLink = true;
```
```
writer.attach(targetObj);
```
```
writer.write();
```
```
writer.detach();
```

GUIで保存を行うには，対応ファイル形式一覧を出したりする必要があるが，これも上記の「Object readerの一覧を得る」に記した方法と類似の方法でリストを取得することが可能である．
ただ，書き出しの場合は指定object (targetObj)が対応しているwriterのみリストアップする必要があるが，
これについては後述．

### convToLinkについて
convToLinkをtrueにすると，保存実行後，対象Objectは(Objectを含む)Scene中で書き出したファイルへのlinkに変換される．
なので，それ以降，Sceneを保存したときには，QSCファイル中にはObjectは埋め込まれずにリンクとして書き出されることになる．

この動作が嫌な場合は，convToLink=falseに指定すればよい．

## Objectの取得
Object ID (obj_id)を指定してObjectを得る
```
var obj = scene.getObject(obj_id);
```

あるいは，以下でも可(Object IDはCueMol内部で一意なのでSceneを指定しなくても意図するObjectが取得できる)
```
var SceMgr = cuemol.getService("SceneManager");
```
```
var obj = SceMgr.getObject(obj_id);
```

Object name (obj_name)を指定してObjectを得る
ただし，同名のObjectが複数存在する場合は，
IDが最も小さいものが返される．（それ以外のObjectを直接取得する方法は無い）
```
var obj = scene.getObjectByName(obj_name);
```