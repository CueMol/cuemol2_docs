[Ref/qsys](../../../Ref/qsys)


## qobj

### Static Methods
#### createObj
; create & register object (factory/class_name, obj_name)
```
static any createObj(string,string)
```

#### readObj
; create & read & register object (reader_name, file_name, obj_name)
```
static any readObj(string,string,string)
```

#### readObj
```
static any readObj(string,string,string,dict)
```

#### destroy
; destroy object by name
```
static void destroy(string)
```

#### getObj
; get object by name
```
static any getObj(string)
```

### Methods
#### writeObj
; write object (writer_name, file_name)
```
void writeObj(string, string)
```

#### destroy
; destroy object
```
void destroy()
```

#### createRend 
; create renderer for this obj (rendname, rendtype)
```
any createRend(string,string)
```

#### getName 
```
string getName()
```
