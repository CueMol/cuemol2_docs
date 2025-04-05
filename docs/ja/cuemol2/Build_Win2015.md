[../](../cuemol2/)

## Windows7でのbuild環境構築

CueMol2のバージョンに合った環境を用いる必要がある。
ここでは、

-  CueMol 2.2.2.X (git branch [vs2013test](../https://github.com/CueMol/cuemol2/tree/vs2013test))

-  Windows7 (VS2013)

-  boost 1_57/CGAL 4.6.1

を用いた32bit versionのbuild環境構築方法を説明する。

### Directory構成
基本、以下のようなdirectory構成を使用する

-  D:

    -  proj

        - cuemol2 (CueMolのsource treeを展開)

        - boost (この下さらにboost_1_57以下にBoostをinstall)

        - xulrunner/xulrunner-39.0-sdk (以下にxulrunner-sdkを展開)

        - CGAL-4.6.1 (以下にCGALをinstall)

        -  ...

### 環境変数の定義
Control panelからシステムのプロパティを開き，詳細設定の環境変数から変更する．
ユーザーの環境変数に以下を追加する．

-  PROJ D:\proj (上記のdirectory構成に合わせて変更)

### VisualStudio2013などのインストール
ここでは製品版を用いているが，フリー版でもできるかもしれない（ただし試していないが．．．）

さらに，以下のソフトウェアをインストールする．

-  ActivePerl [ページ](http://www.activestate.com/Products/ActivePerl/)

-  ActivePython （GeckoSDKのIDL compilerで必要．Python2.7が動けば他のdistributionでも良い．）

-  Inno Setup [ページ](http://www.jrsoftware.org/isdl.php)<br />
Inno Setupだけではなく、preprocessorというのも入れる必要がある。全てがセットになったQuickStart Pack（ispack-5.X.XX.exe等）をinstallする。下記の環境変数変更の方法と同様にしてPATHをInnoSetupをインストールしたdirectoryに通しておく必要がある．

-  Windows SDK v7.0というのもinstallしておく必要がある．

-  cygwin (command lineでgit等を使うが，他でinstallするのなら，あるいはgui版を入れるのなら不要かも)

### build toolsのinstall

cuemol1.1のbuildsetを、以下からダウンロード

http://prdownloads.sourceforge.net/cuemol/cuemol-buildsetwin-1.1.0.187.zip?download

D:\proj以下に展開すると，

-  D:\proj\bin

-  D:\proj\lib

-  D:\proj\include

にいくつかファイルが展開される．ただし実際必要なのは一部で，他のCueMol1.1用のファイルで不要．

### xulrunner
xulrunner-39.0b7 SDKを[ここ](http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/39.0b7/sdk/)から取ってくる

proj64以下に展開すると、xulrunner-sdk以下に展開されるので、xulrunner-39.0b7-sdkとrenameする。

ちなみに，将来64bit版もbuildすることを考慮して64bit版も配布されているb7 (beta 7)を使用しているが，
32bitだけでよいなら正式版でもOK (ただし以下で出てくるpathを一部変更する必要有り).


### BOOSTのinstall
boost_1_57_0を[ここ](http://sourceforge.net/projects/boost/files/boost-binaries/1.57.0/)からmsvc12 32bit版を取ってきて、
D:\proj\boostで展開。

D:\proj\boost\boost_1_57_0 以下にファイルができる．
特にlibraryはlib32-msvc12.0にあることを確認．ここにあるDLLファイルを，D:\proj\binにもコピーしておく．
（すべてコピーする必要はないが，選ぶのも面倒なのですべてコピーしている）

### FFTW
上記のcuemol1.1のbuildsetに含まれているものを使用．

### GLEW
[本家](http://glew.sourceforge.net/)からWin32 binary版をとってきて，D:\proj\glew-1.12.0以下に展開する

glew32.dllをD:\proj\binにコピー



### CGAL
Installer版CGAL-4.6.1.exeをダウンロード、D:\PROJ\CGAL-4.6.1以下にinstall。

CMakeをインストールし，GUIを起動．
where is source codと，where to build the binariesのところに
sourceをinstallしたD:\PROJ\CGAL-4.6.1を指定する．

GUIのdialogが現れる。以下のmacroを定義する。

-  BOOST_ROOT D:\boost\boost_1_57_0

-  BOOST_LIBRARYDIR D:\boost\boost_1_57_0\lib32-msvc-12.0

-  CGAL_DISABLE_GMP true<br />
(GMP/MPRFを使用しないように指定)

-  (CMAKE_INSTALL_PREFIXは指定しなくてもOK)

一旦Configureを実行→いろいろ出てくる
不要な物（CGAL_ImageIO, CGAL_Qt4, CGAL_Qt3）はbuildしないようにcheckを外す

native compiler用のVS2013 solution fileを生成

GUIを終了させ、出来たslnファイルをVS2013から開き，Debug, Release版をbuildする．

D:\PROJ\CGAL-4.6.1\binに，DLLファイルが出来るので，これをD:\PROJ\BINにもコピーしておく．

## CueMol2のbuild方法
以上でbuild環境は整ったはず。

### プロジェクトの設定とビルド
1. VS.NETでc:\proj\cuemol2\winbuild\cuemol.slnを開く

### VisualStudio2013のIDEからの実行

-  Build完了後に、xuldeployプロジェクトのみ再ビルドしたほうが良い。

-  stubプロジェクトを、スタートアッププロジェクトに設定する。

-  stubプロジェクトのプロパティーの、デバッグ項目で、コマンド引数に以下を追加する。
```

- greapp <xulrunnerのbinディレクトリ> $(XULDeployDir)
```

以上で、xulrunnerのbinディレクトリは、xulrunner SDKのものを用いるなら、
```

- greapp $(XULRunnerDir)\bin $(XULDeployDir)
```

を指定すればよい。xulrunnerやmozilla内部もdebugしたい場合は、debug buildのxulrunnerがあるbin directoryを指定する。

**★注意**

> 実行してもwindowも何も表示されずに停止してしまう場合がある（実際何度か遭遇して困ったこと有り）．その場合は，大概cuemol2.jarが出来ていなくて，main windowのxulがloadできないのが原因．jarが出来ないのは，pathが通ったところにzip.exeがない場合（新規システムでbuildする場合に陥ることが多いケース）で，jarを作るperl scriptがzip.exeを呼び出しているから．zip.exeをpathが通っているところに持って来ればjarが正常に作られるはず．


### Version番号を増加
srcディレクトリ下で，
```
> perl perl/incr_version.pl version.hpp xul_gui/application.ini
```

以上を実行．（Linux, Macでも同様）


-  master以外のbranchではやらないこと．（不要にconflictが起こる）
