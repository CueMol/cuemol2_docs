[../](../../cuemol2/)

## CueMol2のバージョンとxulrunner/geckoのバージョン
CueMol2のバージョンに合ったバージョンを用いる必要がある。
*  CueMol2-2.1.0では9.0.1を使用。
*  CueMol2-2.2.0では23.0.1を使用。

## Windowsでのbuild
### 必要なソフトウェアのインストール
*  VisualStudio2008
*  ActivePerl [ページ](http://www.activestate.com/Products/ActivePerl/)
*  ActivePython （GeckoSDKのIDL compilerで必要．Python2.7が動けば他のdistributionでも良い．）
*  Inno Setup [ページ](http://www.jrsoftware.org/isdl.php)<br />
Inno Setupだけではなく、preprocessorというのも入れる必要がある。全てがセットになったQuickStart Pack（ispack-5.X.XX.exe等）をinstallする。

### 必要なライブラリ類のインストール
*  xulrunner SDK ftp://ftp.mozilla.org/pub/xulrunner/ <br />
CueMol2のバージョンに合ったバージョンを用いる必要がある。<br />
c:\proj\xulrunner\xulrunner2-sdk
以下に展開する
*  BOOST C++ Library (http://www.boost.org/)<br />
以下では、コンパイル済みの配布(boostpro; http://www.boostpro.com/download/)を使用するが、ソースからコンパイルしてもよい。
*  FFTW<br />
cuemol1.1のbuildsetにlibfftwが付属しているのでそれを流用する。
*  glew
    *  展開する→glew32.dllをc:\proj\binにコピー
*  CGAL

cuemol1.1のbuildsetは、以下からダウンロード出来ます：<br />
http://prdownloads.sourceforge.net/cuemol/cuemol-buildsetwin-1.1.0.187.zip?download

xulrunnerは、異なるバージョンを切り替えて使用する場合は、
c:\proj\xulrunner\xulrunner-sdk-2.X.X
に展開しておいて、シンボリックリンクを作成してもよい（Vista以降のみ; 管理者権限のcmd.exe）
```
mklink /d xulrunner2-sdk xulrunner-sdk-2.X.X
```
リンクの削除はrdコマンドで行う（delをやると本当にファイルごと消えてしまうらしい）

#### BoostProのinstall
1.  Downloadしたinstallerを実行する。
1.  Install先は、C:\proj\boost\boost_X_XX (X_XXはバージョン番号、1_40など)にする。
1.  Installするcomponentを指定する。
    *  VS2008 (VC9)用のLibraryのみinstallすればよい。
    *  Single thread versionはinstallしなくてよい。
    *  Libraryは、以下のMacOSXの項目に記述があるもののみinstallすればよいが、downloadするだけなので、全部入れてもさほど時間はかからない。
1.  BoostのDLLがpathの通ったところに在る必要がある。<br />
以下では、PATH環境変数にC:\proj\binを追加するとして、<br />
C:\proj\boost\boost_X_XX\lib以下にあるDLLをすべてC:\proj\binにコピーする。

#### CGAL
*  CMakeをインストールする．
*  CGALのソースをインストールする(2.2.0では3.8を使用中)
*  cmake-guiでslnを生成<br />
    *  大概はBOOST_ROOTを指定する必要がある．C:\boost\boost_1.44など．
    *  [boost binaries](http://sourceforge.net/projects/boost/files/boost-binaries/)からとってきた場合はlibがcompiler toolkitごとの名前のdirに入っているので(lib32-msvc-9.0等)，それをBOOST_LIBRARYDIRに指定する．
*  VC9でslnを開いてbuild<br />
デフォルトでは，boostのstatic libraryをlinkしようとするが，これではclient側がboostを使っている場合に使えないlibraryになってしまう（シンボルの二重定義になる）．強制的にboostのDLL版とリンクさせるには， BOOST_ALL_DYN_LINKを定義しておく必要がある．


### VisualStudio 2008の設定
1. 環境変数PROJ_DIRを設定（以上の例に合わせるならc:\projに）<br />
やり方は、windows 環境変数などでググればよい。
1. 環境変数PATHにc:\proj\binを追加する．
1. ツール→オプション、ダイアログ左で「プロジェクトおよびソリューション」をクリックすると出てくる「VC++ディレクトリ」を選ぶ
1. 右上の「ディレクトリを表示するプロジェクト」で「実行可能ファイル」を選び、
    *  InnoSetupのisccのあるディレクトリ（例 C:\Program Files\Inno Setup 5）
    *  ActivePerlのperl.exeのディレクトリ（例 c:\Perl\bin）を追加する←これはActivePerlを先にインストールしていると勝手に入っている模様
    * xulrunnerのtoolsがある「$(PROJ_DIR)\xulrunner\xulrunner-sdk\bin」を追加
    * 「$(PROJ_DIR)\bin」を追加
1. 「インクルードファイル」を選び、
    * BOOSTのinclude fileがある「$(PROJ_DIR)\boost\boost_X_XX」を追加
    * CGALのinclude fileがある「$(PROJ_DIR)\CGAL-3.8\include」を追加
    * GLEWのinclude fileがある「$(PROJ_DIR)\glew-X.XX\include」を追加(X.XXはバージョン番号)
    * 「$(PROJ_DIR)\include」を追加する
1. 「ライブラリファイル」を選び、
    * BOOSTのlibrary fileがある「$(PROJ_DIR)\boost\boost_X_XX\lib」を追加
    * CGALのlibrary fileがある「$(PROJ_DIR)\CGAL-3.8\lib」を追加
    * GLELのlibrary fileがある「$(PROJ_DIR)\glew-X.XX\lib\Release\Win32」を追加(X.XXはバージョン番号, バージョンによってはlibファイルのある位置が違うので注意)
    * 「$(PROJ_DIR)\lib」を追加する

注意：xulrunner関連はvcprojの方で指定してあるので、ここに入れなくてもよい。

### Source codeのcheckout
以下、trunkをcheckoutすること前提に説明しているが、他のbranchをcheckoutするばあいは適宜置き換える。
#### Cygwin等のコマンドライン版gitを使用する場合
*  Anonymous (http)
```
git clone https://github.com/CueMol/cuemol2.git cuemol2
```
*  特定ユーザー (ssh)<br />
```
git clone git@github.com:CueMol/cuemol2.git cuemol2
```



以下、c:\proj\cuemol2にチェックアウトしたとして説明する。



### プロジェクトの設定とビルド
1. VS.NETでc:\proj\cuemol2\winbuild\cuemol.slnを開く

### VisualStudio2008のIDEからの実行
*  Build完了後に、xuldeployプロジェクトのみ再ビルドしたほうが良い。
*  stubプロジェクトを、スタートアッププロジェクトに設定する。
*  stubプロジェクトのプロパティーの、デバッグ項目で、コマンド引数に以下を追加する。
```
* greapp <xulrunnerのbinディレクトリ> $(XULDeployDir)
```

以上で、xulrunnerのbinディレクトリは、xulrunner SDKのものを用いるなら、
```
* greapp $(XULRunnerDir)\bin $(XULDeployDir)
```

を指定すればよい。xulrunnerやmozilla内部もdebugしたい場合は、debug buildのxulrunnerがあるbin directoryを指定する。

**★注意**

> 実行してもwindowも何も表示されずに停止してしまう場合がある（実際何度か遭遇して困ったこと有り）．その場合は，大概cuemol2.jarが出来ていなくて，main windowのxulがloadできないのが原因．jarが出来ないのは，pathが通ったところにzip.exeがない場合（新規システムでbuildする場合に陥ることが多いケース）で，jarを作るperl scriptがzip.exeを呼び出しているから．zip.exeをpathが通っているところに持って来ればjarが正常に作られるはず．


### Version番号を自動増加
srcディレクトリ下で，
```
> perl perl/incr_version.pl version.hpp xul_gui/application.ini
```

以上を実行．（Linux, Macでも同様）

*  master以外のbranchではやらないこと．（不要にconflictが起こる）

## POV-Rayのコンパイル
### Version 3.7
Visual Studio 10用のproject fileがdistributionに含まれているが，この中にconsole版をbuildするtargetがある．

winconsole.cppを多少修正する必要あり (#include "povray.h"が抜けている等）

それを利用してbuild→動作確認OK

★mingw32を使ったbuildはsourceを変更せずに行うことは無理だった．

### Version 3.6
mingw32を使ってbuild