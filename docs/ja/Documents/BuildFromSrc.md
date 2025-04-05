[Documents](../Documents)



## Sourceからのbuild (Windows)
### 必要なソフトウェアのインストール

-  VisualStudio.Net2003

-  ActivePerl [ページ](http://www.activestate.com/Products/ActivePerl/)

-  InnoSetup (ver5.1.6) [ページ](http://www.jrsoftware.org/isdl.php)
### ライブラリ類のインストール

- c:\proj\bin<br />
再配布可能DLL：

    - libpng13.dll, libpng13d.dll(PNGライブラリ)

    - MFC71.dll, MFC71u.dll (MFC)

    - msvcp71.dll, msvcr71.dll (VCランタイム)

    - zlib1.dll (libz for PNG)

    - libfftw3f-3.dll (FFTW ver3.1.3)

- c:\proj\include<br />
インクルードファイ類:

    - db.h (BerkeleyDB)

    - png.h, pngconf.h, zconf.h, zlib.h (PNGライブラリ)

    - fftw3.h

    - freetype (FreeType ver.2.2.1)

- c:\proj\lib<br />
インポートライブラリ+staticライブラリ:

    - libdb40s.lib, libdb40sd.lib (BerkeleyDB ver 4.0, static library)

    - libpng13.lib, libpng13d.lib (PNGライブラリ version 1.3)

    - zdll.lib (libz for PNG)

    - libfftw3f-3.lib (FFTW ver3.1.3)

    - freetype221.lib (FreeType ver2.2.1, static library)

これらをまとめたものを、以下からダウンロード出来ます：<br />
http://prdownloads.sourceforge.net/cuemol/cuemol-buildsetwin-1.1.0.187.zip?download

#### 必要なライブラリ類もソースからビルドする場合
BerkeleyDBはversion 4.0系でないとコンパイルが通らない（最新版も×）．
[このページ](http://dev.sleepycat.com/downloads/releasehistorybdb.html)の真ん中辺から，4.0.14を落としてドキュメントにしたがってビルド．

libpngは1.3以外ではうまくいかなかった．（libzととのバージョン不整合？）

FFTWはhttp://www.fftw.org/からダウンロードできる。

FreeTypeはhttp://www.freetype.org/からダウンロードできる。

### 環境変数の設定

-  コントロールパネルのシステムから、PATH環境変数に<br />
**c:\proj\bin**<br />
を加える。（再起動かログオフが必要？）

### VS.NETの設定
1. ツール→オプション、ダイアログ左で「VC++ディレクトリ」を選ぶ
1. 右上の「ディレクトリを表示するプロジェクト」で「実行可能ファイル」を選び、

    - 「c:\proj\bin」と,

    -  InnoSetupのisccのあるディレクトリ

    -  ActivePerlのperl.exeのディレクトリ「c:\Perl\bin」を追加する
1. 「インクルードファイル」を選び、「c:\proj\include」を追加する
1. 「ライブラリファイル」を選び、「c:\proj\lib」を追加する

### CVSからチェックアウト
#### Cygwin等のコマンドライン版CVSを使用する場合

- Anonymous (pserver)
```
cvs -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/cuemol login 
```
```
cvs -z3 -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/cuemol co cuemol 
```


- 特定ユーザー (ssh)
```
setenv CVSROOT XXXXX@cvs.sourceforge.jp:/cvsroot/cuemol
```
```
setenv CVS_RSH ssh
```
```
cvs -z3 co cuemol 
```

setenvは.cshrcなどに書いておけばよい。

#### WinCVSを使用する場合

WinCVSを使う場合は、「WinCVS preferences」の、**「Checkout text files with the Unix LF」を「ON」にする**


- Anonymous (pserver)
  1.  メニューRemote→Checkout module
  1.  CVSROOTを設定。


- 特定ユーザー (ssh)
  1.  メニューRemote→Checkout module
  1.  CVSROOTを設定。以下のようにすればよい。
```
:ssh;username=XXXXX;hostname=cvs.sourceforge.jp;privatekey='秘密鍵へのパス';version=1:/cvsroot/cuemol
```

以下、c:\proj\cuemolにチェックアウトしたとして説明する。


### プロジェクトの設定とビルド
1. c:\proj\cuemol\winbuild\cuemol.slnを開く
1. ソリューションエクスプローラーのツリーから、cuemolプロジェクトを選択
1. ToolBarのソリューション構成からDebugかReleaseを選ぶ
1. 「ビルド」→「ソリューションのビルド」でビルド

### VS.NETのIDEからの実行
1. コンテキストメニューで、cuemolプロジェクトのプロパティーを開く
1. 左上の「構成」コンボボックスで「Debug」を選ぶ
1. デバッグ項目を選び、「コマンド引数」の項目に**「/cf $(ProjectDir)\sysconfig_debug.xml」**を設定
1. 左上の「構成」コンボボックスで「Release」を選ぶ
1. デバッグ項目を選び、「コマンド引数」の項目に**「/cf $(ProjectDir)\sysconfig.xml」**を設定
1. Menu 「デバッグ」→「開始」などから実行する．

### Version番号を自動増加させつつインストーラーも生成する
1.  マクロエクスプローラーを開く
1.  MyMacrosを開き，デフォルトで在るModule1をダブルクリックするとVBのIDEが起動
1.  VBのIDEのプロジェクトエクスプローラで，MyMacroのコンテキストメニューを出す
1.  コンテキストメニューの追加を選び，c:\proj\cuemol\winbuild\ReleaseBuild.vbを追加する
1. VBのIDEを閉じて，VS.NETのマクロエクスプローラーから，先ほど追加したReleaseBuild下のReleaseBuildを選択．コンテキストメニューから実行を選ぶ（ダブルクリックでもOK?）．
1. ビルドが開始され，完了後version番号が増加され，さらにビルドが行われる．最終的にcuemol\winbuild\output下にsetup.exeが生成される．

## Sourceからのbuild (UNIX)
今のところ、UNIX版ではGUI等が使用できない。

### 必要なソフトウェアのインストール
以下のライブラリーが必要ですが、なくてもビルドできます。
FedoraCoreやDebianなどLinuxでは、既にインストールされている場合もあります。

-  BerkeleyDB (version3以降)

-  readline

-  FreeType (http://www.freetype.org/)

-  FFTW (http://www.fftw.org/)

BerkeleyDBに関しては，バージョンが色々あり，バージョンによってコンパイルが
通らないことが多々ある．兎も角もビルドしたい場合は，いかにも示すように
**--with-db=no**オプションでconfigureスクリプトを実行しDBを
使わないようにすればよい．

あと、CVSからチェックアウトしたソースでビルドする場合や、
開発のためにautomake/autoconf関連ファイルを編集・ビルドする場合は

-  autoconf (version 2.59 以降)

-  automake (version 1.9.6 以降)

-  libtool (version1.5.22 以降で動作確認済み)

も必要となる（通常は不要）。

あと，QScriptの文法(yaccsrc.yxx, lexsrc.lxxで定義)を変更する場合は
bison (version 1.35以降)とflex (version 2.5.4)が必要．
特に，最近のlinuxのdistributionについてくるflexは2.5.3x等になっているが，
それだと生成したC++ファイルがWindowsでコンパイルが通らなくなるので注意．

### CVSからのチェックアウト
CVSの使用
```
cvs -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/cuemol login 
```
```
cvs -z3 -d:pserver:anonymous@cvs.sourceforge.jp:/cvsroot/cuemol co modulename 
```

CVSからチェックアウトしたソースでビルドする場合は、
configureスクリプト等がないので生成する必要がある。
正しいバージョンのlibtool, autoconf, automakeをインストールし、
cuemol/src以下で以下のコマンドを実行する必要がある。
<pre>
$ aclocal
$ libtoolize
$ aclocal
$ automake -a
$ autoconf
</pre>

### configureの実行
cuemol/src以下で以下のコマンドを実行する。
<pre>
./configure --with-icc[=options] --disable-debug --prefix=<install先指定> --with-modules=<moduleを列挙> [--with-db=no]
</pre>

    - with-icc
:   Intel C Compilerを使用する場合. optionsでicc/icpcへわたすoptionを指定できる。


    - disable-debug
:   デバッグ表示をしない（通常デバッグしない場合は指定する）


    - prefix
:   インストール先を指定する。指定しないと/usr/localになる。


    - with-modules
:   ビルドするモジュールをカンマで区切って指定する。以下が指定可能。指定しないと、molstrのみ指定したことになる。<br />


    -  molstr

    -  molvis

    -  denmap

    -  symm

    - with-db=no
:   BerkeleyDBを使用しない場合に指定する．


#### Intel compilerを使用する場合
例えば**--with-icc**に以下のオプションを指定する
```

    - with-icc="-ip -O3 -Ob2 -xW -tpp7 -static -cxxlib-icc"
```

- ip
:   Procedure間最適化


- O3
:   最大限の最適化


- xW
:   Pen4ファミリーでしか実行できないコード生成(他のプロセサで実行する場合は変更する必要あり)


- tpp7
:   Pen4ファミリーの命令セットを使用した最適化


- static
:   スタティックリンク


- cxxlib-icc
:   icc/icpc付属のC++ standard libraryを使用する



### ビルドとインストール
<pre>
$ make
$ make install
</pre>

### 実行
<pre>
$ cuetty
</pre>
引数に何も指定しないと、インタラクティブにスクリプトを実行するモードになる。

<pre>
$ cuetty [script]
</pre>
引数にQScriptファイル名を指定すると、そのスクリプトが実行される。
