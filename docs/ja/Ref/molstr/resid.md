[Ref/molstr](../../../Ref/molstr)



#### chainName
; get chain name
```
string chainName()
```

#### index
; get residue index
```
integer index()
```

#### name
; get residue name
```
string name()
```

#### atom
; get atom obj (atomname)
```
any atom(string)
```

#### atoms
; get atom objs (atomname)
```
any atoms()
```
#### atoms
```
any atoms(select)
```

#### forEachAtoms 
; iterate for each atoms (atomname)
```
void forEachAtoms (select, any)
```

#### setProp 
; set residue property (propname, value)
```
void setProp (string, string)
```

#### getProp 
; get residue property (propname)
```
string getProp (string)
```

#### setName 
; mutate residue
```
void setName (string)
```
