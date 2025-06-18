[Ref/gfx](../../../Ref/gfx)



## renderer (QScript オブジェクト)
[QScriptオブジェクト](../../../Ref/QScriptObject)のひとつであるrendererは，CueMolのレンダラーをQScriptから扱いやすくするために設けられたラッパーである．
基本的に，[gfxモジュールのスタティックメソッド](../../../Ref/gfx/static_methods)から直接レンダラー識別名を指定して同等の操作を行なうことができる．
### Methods
#### destroy
; destroy renderer
```
void destroy()
```

#### invalidate 
; invalidate renderer's cache
```
void invalidate ()
```

#### getClient 
; get the client object of this renderer
any getClient ()

#### setProp 
; set renderer property (propname, value)
```
void setProp (string,any)
```

#### setProps 
; set renderer properties ( dict{prop->value} )
```
void setProps (dict)
```

#### getProp 
; get renderer property (obj, rend, propname)
```
any getProp (string)
```

#### getCenter 
; get the center position of renderer
```
vector getCenter ()
```

#### show 
; show/hide renderer (objname, rendname)
```
void show ()
```

#### hide 
```
void hide ()
```

#### isShown 
```
boolean isShown ()