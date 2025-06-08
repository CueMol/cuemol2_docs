[Ref/molstr](../../../Ref/molstr)

#### merge 
; merge mol2 into this (mol2)
```
void merge (string)
```

#### merge 
; merge mol2 into mol1 (mol1, mol2)
```
static void merge (string,string)
```

#### erase
; erase selected atoms
```
void erase()
```

#### shift 
; translate selection (dv)
```
void shift(vector)
```

#### shift
; move selection of mol1 (mol1, dv)
```
static void shift(string,vector)
```

#### rotate
; rotate selection (quat, vcen)
```
void rotate(vector,vector)
```

#### rotate
; rotate selection of mol1 (mol1, quat, vcen)
```
static void rotate(string,vector,vector)
```

#### bond 
; make covalent bond between two atoms (in this mol)
```
void bond(any, any)
```

#### lsqfit
; lsq fitting
```
real lsqfit(object)
```
#### calcRMSD
```
real calcRMSD(object)
```

#### popSel 
void popSel ()
#### popSel 
```
static void popSel (string)
```
#### pushSel 
```
void pushSel ()
```
#### pushSel 
```
static void pushSel (string)
```

#### select 
```
static void select (string)
```
#### select 
```
void select ()
```

#### deselect 
```
static void deselect (string)
```
#### deselect 
```
void deselect ()
```

#### selectChain 
```
static void selectChain (string,string)
```
#### selectChain 
```
void selectChain (string)
```

#### selectResid 
```
static void selectResid (string,string,integer,integer)
```
#### selectResid 
```
void selectResid (string,integer,integer)
```

#### selectResidAppend 
```
static void selectResidAppend (string,string,integer,integer)
```
#### selectResidAppend 
```
void selectResidAppend (string,integer,integer)
```

#### selectResidRemove 
```
static void selectResidRemove (string,string,integer,integer)
```
#### selectResidRemove 
```
void selectResidRemove (string,integer,integer)
```

#### select 
```
static void select (string,select)
```
#### select 
```
void select (select)
```

#### getChainNames 
```
array getChainNames ()
```
#### getStartResid 
```
integer getStartResid (string)
```
#### getStartResid 
```
static integer getStartResid (string,string)
```
#### getEndResid 
```
integer getEndResid (string)
```
#### getEndResid 
```
static integer getEndResid (string,string)
```

#### getCenter 
```
vector getCenter ()
```
#### getCenter 
```
static vector getCenter (string)
```

#### setProp 
; set property to the selected residues (molname, propname, propvalue)
```
void setProp (string, string)
```
#### setProp 
```
static void setProp (string, string, string)
```

#### forEachResid 
; residue iteration (affected by current selection)
```
void forEachResid (any)
```

#### forEachAtom 
; atom iteration (affected by current selection)
```
void forEachAtom (any)
```

#### getResids
; get a list of selected residues
```
any getResids()
```

#### getAtoms 
; get a list of selected atoms
```
any getAtoms ()
```

#### distMin 
; get the minimum distance
```
real distMin(vector)
```

#### showAtomLabel
; show simple atom labels for selected atoms
```
void showAtomLabel(select, string)
```