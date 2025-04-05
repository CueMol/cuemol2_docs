[Documents](../../Documents)



### ファイル読込み時のOptionについて

ファイルを開くときに，選択しているファイル形式に応じたオプションを（もしあれば）設定できるようにしました．


![open_option](../../assets/images/Documents/FileReaderOptions/open_option.png){ .on-glb }


上図のファイルを開くダイアログで，ファイルのタイプに対応したオプションがあれば
まるで囲った**Options**ボタンが有効になります．
（現在ＰＤＢのみにオプションがありますが，今後必要に応じて増やす予定です）

#### PDBファイル読込み時のOption

例えばＰＤＢ形式が選択されている状態でOptionsを押すと，以下のようなダイアログが表示されます．


![PDB_options](../../assets/images/Documents/FileReaderOptions/PDB_options.png){ .on-glb }


例えば，デフォルトではNMR等の複数モデル構造は，
最初のモデル(MODEL〜ENDMDLで囲まれていない部分)のATOMのみ読み込まれますが，
上記"Load NMR multiple models"check boxをONにすると，
全てのモデルが読み込まれます(但しチェインとして読込まれる)．

あと，二次構造をONにしていると，二次構造が構造から計算されます．
もしPDBファイルにHELIX/SHEETレコードが書かれていても，
それらは無視されて，構造から計算されるようになります．

### QScriptによる読込み時Option
QScriptからファイルを読み込む場合にも，
上記と同様のオプションを指定することができます．

```
$mol = qobj.readObj("PDBFileReader", "ファイル名", "オブジェクト名", {...});
```

qobj.readObj()メソッドは，ファイルを読み込む為の低レベルなメソッドです．
通常使うreadPDB等はこれを呼び出す関数として(startup.qsで)定義されています．
最後の{}内に，{オプション名=>値, オプション名=>値, ...}を記述すると，
オプションに対する値を指定した上で，ファイルが読み込まれます．

```
$mol = qobj.readObj("PDBFileReader", "ファイル名", "オブジェクト名", {build2ndry=>false});
```

よって，上記のようにしてPDBファイルを読み込むと，
二次構造が再計算されなくなります．

```
$mol = qobj.readObj("PDBFileReader", "ファイル名", "オブジェクト名", {build2ndry=>false, loadmodel=true});
```

さらに，上記のようにしてPDBファイルを読み込むと，
二次構造が再計算されなくなり，かつNMRの複数モデルが(chainとして)読み込まれます．

PDBFileReaderのオプションには以下のものがあります．
|オプション名|型|デフォルト値|説明|
|loadmodel|boolean|false|trueの時はMODEL/ENDMDLを読み込む|
|loadanisou|boolean|true|trueの時はANISOUを読み込む|
|loadaltconf|boolean|false|trueの時はaltenate conformationを読み込む|
|build2ndry|boolean|true|trueの時は二次構造計算を行なう|

ただし，二次構造を読み込まない場合は良くあると考えられるので，
関数readPDB_nosecも用意されています．
```
$mol = readPDB_nosec("ファイル名", "オブジェクト名")
```
これは，startup.qsで定義されており，readPDBマクロ等と使い方は同じです．
