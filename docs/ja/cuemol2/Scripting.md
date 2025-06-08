## CueMol2 scripting interface

ここでは，CueMol2のscripting interfaceをjavascriptを例として解説します．
Pythonなど他の言語でも基本的に同じなので，予約語や文法を適宜読み替えて参照してください．

CueMol2のscripting interfaceは，cuemolモジュールに定義された基本的に以下の2つのmethodを基本としています．

### getService
```
cuemol.getService(name)
```

nameで指定されるサービスオブジェクトを取得します．

### createObj
```
cuemol.createObj(name)
```

nameで指定されるクラスのインスタンスを新規作成します．


以上の方法で取得或いは作成したobjectに対してさまざまな操作を行うことでCueMolの内部データを制御することが可能です．

(ただし，インスタンスの生成に関しては，script言語にbindingによっては，より簡単にconstructorによって行うことが出来るような実装も可能かも．．．)


## 目次
*  CueMol system levelの事項
    *  [Scene and View](../../cuemol2/Scripting/SceneAndView)
    *  [Objectの操作など](../../cuemol2/Scripting/Object)
    *  [Rendererの操作など](../../cuemol2/Scripting/Renderer)
    *  [Propertyの操作等](../../cuemol2/Scripting/Property)


Return to [Documents](../../Documents)