[cuemol2](../../cuemol2)
## MacOS X Yosemite 10.10でのbuild環境構築

CueMol2のバージョンに合った環境を用いる必要がある。
ここでは、

-  CueMol 2.2.2.X (git branch [vs2013test](../../https://github.com/CueMol/cuemol2/tree/vs2013test))

-  MacOS X 10.10 (Xcode 6.4)

-  boost 1_57/CGAL 4.6.1

を用いた64bit versionのbuild環境構築方法を説明する。

### Directory構成
基本、以下のようなdirectory構成を使用する

-  Home

    -  proj64

        - cuemol2 (CueMolのsource treeを展開)

        - boost_1_57 (以下にBoostをinstall)

        - xulrunner/xulrunner-39.0-sdk (以下にxulrunner-sdkを展開)

        - CGAL-4.6.1 (以下にCGALをinstall)

        -  ...

    -  src

        -  ... (各々のsource)

### Xcodeのinstall
xcode-selectをやると芋づる式に？command line toolsがinstallされる。
基本ネットでググった通りにやった.

### Homebrewのinstall
[Homebrewのサイト](http://brew.sh/)の通りにインストール。

インストール後、一応mozillaのbuildに必要な物一通りも入れた。
```
> brew install yasm gawk libidl ccache python
```

さらに、autoconf (mozillaで入れるのは古いやつなので、一応最新版を入れる)、automake、libtoolを入れる
```
> brew autoconf automake libtool
```

### xulrunner
xulrunner-39.0 SDKを[ここ](http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/39.0/sdk/)から取ってくる

proj64以下に展開すると、xulrunner-sdk以下に展開されるので、xulrunner-39.0-sdkとrenameする。

### BOOSTのinstall
boost_1_57_0を[ここ](http://sourceforge.net/projects/boost/files/boost/1.57.0/)から取ってきて、$HOME/src/以下に展開。

bootstrap.shを実行→bjamができる。
以下のbuild scriptを作成＆実行
```
#!/bin/sh
```
```
instpath=$HOME/proj64/boost_1_57
```
```
./bjam \
```
```

    - prefix=$instpath \
```
```

    - exec-prefix=$instpath \
```
```

    - libdir=$instpath \
```
```

    - includedir=$instpath \
```
```

    - with-date_time \
```
```

    - with-filesystem \
```
```

    - with-iostreams \
```
```

    - with-program_options \
```
```

    - with-regex \
```
```

    - with-system \
```
```

    - with-thread \
```
```
architecture=x86 address-model=64 link=shared,static threading=multi install
```

ただし、期待通りのpathにinstallされないので、dylib類をlibに、header file類のフォルダをinclude以下に移動した。
```
> cd $HOME/proj64/boost_1_57
```
```
> mkdir include lib
```
```
> mv boost include
```
```
> mv libboost_* lib
```

### FFTW
fftw-3.3.4.tar.gzを取得、~/src/以下に展開後、以下を実行する。

```
> env CFLAGS="-m64 -fast" ./configure --enable-float --prefix=$HOME/proj64/fftw --disable-fortran --enable-sse
```

(-m64はいらないかも。)

make&make installで完了

### GLEW
glew-1.12.0.tgzを取得、~/src/以下に展開後、以下を実行
```
> env GLEW_DEST=$HOME/proj64/glew make
```
```
> env GLEW_DEST=$HOME/proj64/glew make install
```

### CGAL
CGAL-4.6.1.tar.bz2をダウンロード、~/src/以下に展開。

CMakeをインストール（単にdmgからインストールするだけ）
cmake-guiへのpathが通らないが。。。
上記で展開したCGALのsrc directoryに移動し、CMake.appから適当に探してフルパス指定で実行
```
> /Application/CMake.app/Contents/MacOS/cmake-gui .
```

GUIのdialogが現れる。以下のmacroを定義する。

-  BOOST_ROOT $HOME/proj64/boost_1_57<br />
(ただし、$HOMEはつかえなかったので手動で展開し入力)

-  CMAKE_INSTALL_PREFIX $HOME/proj64/CGAL-4.6.1<br />
(ただし、$HOMEはつかえなかったので手動で展開し入力)

-  CGAL_DISABLE_GMP true<br />
(GMP/MPRFを使用しないように指定)

一旦Configureを実行→いろいろ出てくる
不要な物（CGAL_ImageIO, CGAL_Qt4, CGAL_Qt3）はbuildしないようにcheckを外す

native compiler用のMakefileを生成

GUIを終了させ、make&make installすると、~/proj64/CGAL-4.6.1以下にinstallされる。

## CueMol2のbuild方法
以上でbuild環境は整ったはず。

### Source codeのcheckout
詳しくは[cuemol2/SrcRepository](../../cuemol2/SrcRepository)参照。

-  Anonymous (http)
```
> git clone https://github.com/CueMol/cuemol2.git cuemol2
```

-  特定ユーザー (ssh)
```
> git clone git@github.com:CueMol/cuemol2.git cuemol2
```

あとはvs2013testのbranchに切り替える。
```
> cd cuemol2
```
```
> git checkout vs2013test
```
```
> git branch (--> vs2013testと表示される)
```

以下では~/proj64/cuemol2以下にcheckoutしたとする．

### configureスクリプトの実行とbuild
以下buildは，~/proj/cuemol2/uxbuildにて行うのでcdで移動．

configureを走らせるためのスクリプト[run_config_osx.sh](../../https://github.com/CueMol/cuemol2/blob/vs2013test/uxbuild/run_config_osx.sh)が，~/proj/cuemol2/uxbuildにあるので，必要に応じて編集．
（これを使わなくても出来なくもないが，いちいちキーボードから入力するのは面倒なので）

library等のインストール位置を上述から変更していない場合は，
CVS repositoryにあるrun_config_osx.shそのままで動くはず．
インストール位置を変えている場合は，gecko_sdk_dirやboost_dirを変更する．

エラー無くconfigureスクリプトが生成され，さらにMakefileが生成されたら，makeコマンドを実行．buildが行われる．

Xcodeが6.4でない場合などにconfigureが失敗する、あるいはbuildが最後までいかないことがある。

### お試し実行など
MacOS Xでは，適切な位置にxulやxpcom関連のファイルが配置されていないとアプリとしてちゃんと動かない．

make installを実行すると，~/proj/cuemol2/uxbuild/osxbuild以下にCueMol2.appが作成される．
jsやxul関連のファイルはjarファイルにまとめられる．
他の必要なXULのファイルなどはsymbolic linkが作成される．
~/proj64/cuemol2以下にsourceを展開している場合は，
```
arch -64 ~/proj64/cuemol2/uxbuild/osxbuild/CueMol2.app/Content/MacOS/cuemol
```
でterminalから起動可．

debugと開発に使用可能．

"component not loaded"というerror等が出て起動しない場合は、dyldがこけている可能性大。
```
setenv NSPR_LOG_MODULES linker:5
```
と環境変数を設定して起動するとprlink.cでのエラーがterminalに出るようになるので、
何が原因で起動しないか検証することが可能になる（linkerをallにするとすべてのモジュールでのログが表示されるようになる）

ただし、xulrunner39では上記の設定でもdlerrorの返すmessageはすべて表示されないので何のsymbolが見つからずにこけているのかわからなかった。結局sourceにprintfを埋め込んでdebug版xulrunnerを作り、調べる必要があった。

#### 配布パッケージの生成
src/osxbuild下でmake builddmgを実行すると，CueMol2-<version番号>-MacOSX-Intelというフォルダが作成され，その中にもCueMol2.appというのが出来ているが，これはsymbolic linkではなくすべてコピーになっているので，コピーすることで他のMacでも実行できるはず．あとさらに，同じ内容が入ったdmgファイルも作成される．

Finderなどから起動する場合は，Dynamic link library (dylib)のパスを適切に書き換えとかないと，見つからなくて正常に起動できなくなる．dylibファイルに書き込まれているパスをあとで書き換えるためには，ファイル中にある程度スペースが確保されていないと書き換えに失敗する(make builddmgが中断する)．

これを防ぐには，configure時にLDFLAGS=-Wl,-headerpad_max_install_namesを指定して十分なスペースを確保しておけばよい．（一応現バージョンを上記の方法・位置でbuildする限りはこのようなerrorは起きていない。）

### その他注意点
run_config_osx.shは，src/configureが存在する場合はautoconf/automake系のconfigure生成コマンドを実行しないので，強制的に再実行したい場合はsrc/configureを削除する．

`%'-style pattern rules are a GNU make extension
という警告が出るが，gnu makeを使用しているので，気にする必要はない（これはlinuxも同様）

Mozilla build用にHomebrewでautoconfをinstallした場合，
Mozillaのサイトにversion 2.13を入れるように指示があるが，
それだとautomake系のコマンドがちゃんと動かなくなってしまうので，
最新版を入れておく必要がある．（単にbrew install autoconfとしておけばOK）
