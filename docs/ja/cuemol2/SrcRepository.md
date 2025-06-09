[../](../../cuemol2/)

## gitとgithub
### 開発サイクル

*  細かい修正やbugfixなどは，master branchで行う（fixとか専用branch要検討？）
*  ある程度手間がかかりそうな新機能を追加するときは，それに対応する開発branchを作り，それ上で作業する
*  ある程度動作チェックまで完了して来たら，masterをmerge
*  conflictがあれば修正しそのうえで動作チェックとbugfixをする
*  動作OKになったらmasterにmergeし，要らないようならbranchを削除する
*  Build番号などはmasterでbuildしたときにのみ増加させるようにする．<br />
(不要なconflictを防ぐため，開発branchではbuild numberはいじらない)

### Branchに対してmasterをmerge
```
> git checkout XXX #(branch XXXに移動．すでに移動している場合は不要)
```
```
> git pull origin XXX #(remoteのXXXの更新分を取得)
```
```
> git merge origin/master　#(remote repository origin/masterの更新をmerge)
```


### 新たにbranchを新規作成し作業を始める場合
```
> git clone git@github.com:CueMol/cuemol2.git cuemol2_XXX
```
```
> git branch XXX
```
```
> git checkout XXX
```

### 新たに特定のbranchを取ってきて作業を始める場合
特定のbranchをXXXとすると，
```
> git clone git@github.com:CueMol/cuemol2.git cuemol2_XXX
```
```
> git checkout -b XXX origin/XXX
```

あるいは，最後のコマンドは，
```
> cd cuemol2_XXX; git checkout XXX
```

の方が良いのか？

### 既にあるlocal repで新たなbranchを取ってきて作業を始める場合
特定のbranchをXXXとすると，
```
> git fetch
```

→branchの情報が更新される（後は同様）
```
> git checkout -b XXX origin/XXX
```

### Permissionの変更を無視させる
Winでは全て7xxになってしまうので無視させた方が良い．
```
> git config core.filemode false
```

### 他のforkしたrepositoryを統合する
fork先を登録＆内容取得
```
> git remote add XXXX git://github.com/XXXX/cuemol2.git
```
```
> git fetch XXXX
```
```
> git branch -a
```

Merge
```
> git merge  XXXX/master
```

→local source treeに反映されるので，必要に応じてこの後pushを行う

### Releaseを作成する

*  Releaseするversionのsource code snapshotをarchiveする
```
> git archive --format=zip HEAD --prefix=cuemol2-2.X.Y.ZZZ/ -o cuemol2-2.X.Y.ZZZ-src.zip
```

*  archiveを展開するとcuemol2-2.X.Y.ZZZができるので，それ以下でbuild
*  debug symbol file (pdb fileなど)がそのbuildしたdirectoryに対して出来るので，crashdumpを解析する事を考えてbuildしたdirectoryは残しておく

## 古い情報
### svnの使い方 (obsolete)
#### text fileにする
```
svn propdel svn:mime-type [ファイル名]
```

#### diffの取り方と
Working copyと，他のrevisionとの差分を見る場合．すでに対象ファイルのあるディレクトリにcdしているとすると，
```
svn diff --new=svn+ssh://XXXXX@svn.sourceforge.jp/svnroot/cuemol/cuemol2/branches/X.X.X/src/aaa/bbb.cpp --old=./bbb.cpp
```

以上で，単純に指定branchとworking copyの差分が表示される．

#### mergeのやり方
Working copy（ex. trunc）に，他のrevisionで行った変更を適用して統合したい場合．すでに対象ファイルのあるディレクトリにcdしているとすると，
```
svn merge svn+ssh://XXXXX@svn.sourceforge.jp/svnroot/cuemol/cuemol2/branches/X.X.X/src/aaa/bbb.cpp ./bbb.cpp
```

以上で，祖先関係を考慮したうえで，指定branchとworking copyの差がworkinc copyに適用される．祖先関係の考慮というのは，working copyと指定branchが分岐した地点からのbranchとの差分が，working copyに適用される，という事らしい．（なので，working copyにbranch後に行われた変更は保持されるらしい．多分）

あと，--dry-runというのをつけて実行すると，実際にファイルの変更は行われない（テスト用）．

Conflictを起こしたら，ともかくもp (postpone)にしておいて，
編集してconflictを解決（<<<<や>>>>や====がある部分を修正），
後からsvn resolve --accept working [filename]を実行．

あるいは，svn resolve --accept mine-fullにするとmergeする前のものを使用して解決される．（theirs-fullだとmergeで取得したバージョンの方が使用され解決される）

#### ssh
ssh-agentを使った方が便利な場合がある．
```
eval `ssh-agent`
```
```
ssh-add [ssh secret key]
```

ssh-agentの引数-c/-sは指定しなくても勝手に認識して適当なshellの方が選択されるらしい．