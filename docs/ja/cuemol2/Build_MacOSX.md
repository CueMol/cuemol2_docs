[../](../../cuemol2/)

## CueMol2のバージョンとxulrunner/geckoのバージョン
CueMol2のバージョンに合ったバージョンを用いる必要がある。

*  2.1系列では9.0.1を使用。(2.1.0.270)
*  2.2系列では23.0.1を使用。(2.2.0.321)

## MacOS Xでのbuild
Mac OSX 10.6 (Snow Leopard)あるいは10.7(Lion)での場合．(Leopardではなぜか動かない)

### 必要なソフトウェア・ライブラリ類のインストール

*  Xcode (OS付属，version 3)
*  MacPorts (下記参照)
*  xulrunner SDK 
*  BOOST C++ Libraries
*  FFTW
*  libpng (2.0.1では不要)
*  CGAL
*  glew

#### MacPortsのインストール
CueMol2自体のbuildには直接必要ではないが，xulrunner SDKについているxpidlなどのコマンドが，
MacPortsのライブラリーに対してlinkされているので，インストールしないと動かない．
基本的には，
[Mac OS X Build Prerequisites](../../https://developer.mozilla.org/en/Mac_OS_X_Build_Prerequisites)
の通りにMacPortsをインストールすればよいが，
そのままでやると64bit版のbinaryしかinstallされないので（SDK付属のbinaryは32bitらしい）
Universal binaryになるようにMacPortsを設定する必要がある．

すべてのコマンドの引数に，+universalというのを追加して実行すればよいが，
/opt/local/etc/macports/variants.conf
ファイルに，
```

1. universal
```
という行を追加すれば，自動的に追加したようになるらしい．

★Homebrewでも可能（むしろ現時点では推奨？）

#### xulrunner SDKのインストール
ftp://ftp.mozilla.org/pub/xulrunner/releases/ からdownloadできる．
CueMol2のバージョンに合ったバージョンのSDKを用いる必要がある。~/proj以下に展開すると，xulrunner-sdkというdirectoryができてその下に展開される．（複数バージョンを切り替えて使用する必要があるときはxulrunner-sdkを適宜renameする）

**Frameworkのインストール問題**

MacOS版のsdkにはbuildに必要なFrameworkがなぜかはいっていない。runtimeの方のみに入っているのでそちらもinstallする必要がある。SDKを使用する場合は，xulrunner-sdk直下に/Library/Frameworks/XUL.Frameworkへのsymlinkを張ればよい．

一方、sourceからbuildすると、objdirのdistディレクトリー内にXUL.Frameworkがちゃんとできるので、
これをdebug versionとして使用できる。


#### BOOSTのインストール
[http](../..///www.boost.org/)から取得できる．

まずソースを展開後、bjamをbuildする。
```
./bootstrap.sh
```

buildはそのままで行うと64bitになってしまうので適切なオプション設定が必要．
また，すべてのlibraryのbuildを行う必要はない．以下のscriptで，~/proj/boost以下にインストールされるべくbuildされるはず．

```
#!/bin/sh
instpath=$HOME/proj/boost
./bjam \

    * prefix=$instpath \
    * exec-prefix=$instpath \
    * libdir=$instpath \
    * includedir=$instpath \
    * with-date_time \
    * with-filesystem \
    * with-iostreams \
    * with-program_options \
    * with-regex \
    * with-system \
    * with-thread \
architecture=x86 address-model=32 link=shared,static threading=multi install
```

(最後の引数がstageだとlibraryのbuildのみを行い、installだとheader fileのcopyまで行う．64bitをbuildするには，address-model=64にすればよい)

ただ，実際にはinstallしても，うまくいかない。autoconfのscriptが期待するdirectory構成と違うようにinstallされてしまうため。

*  1.44では、$instpathに直にインストールされていたので、$instpath/libを作って、そこに移動。
*  include filesも、$instpathに直にインストールされてしまうので、$instpath/includeを作って、boostをそこに移動
```
> cd $HOME/proj/boost
> mkdir include lib
> mv boost include
> mv libboost_* lib
```


#### FFTWのインストール
http://www.fftw.org/download.htmlから取得可能。

基本的に、configure/makeでいけるが、configure時に以下のように、32bit, float版をbuildするように注意。あと、defaultでstatic libraryがbuildされるが、それでOK.

```
env CFLAGS=-m32 ./configure --enable-float --prefix=$HOME/proj --disable-fortran
```

以下のように最適化した方が、若干速い気がする。
```
env CFLAGS="-m32 -fast" ./configure --enable-float --prefix=$HOME/proj --disable-fortran --enable-sse
```


#### glewのインストール

*  version 1.7.0を使用
*  32bitでコンパイルする必要があるがコマンドラインからはそういう指定はどうやるか分からなかったのでconfig/Makefile.darwinのCC, LDを変更した．
```
CC=cc -m32
LD=cc -m32
```

*  Sourceを展開して単にmake．configureとかはない．GLEW_DESTを指定してinstall先を変更($HOME/proj/glew)．
```
env GLEW_DEST=$HOME/proj/glew make
env GLEW_DEST=$HOME/proj/glew make install
```

#### CGALのインストール方法

*  CMakeを普通にインストールする(公式サイトにdmgファイルがある)
*  CGALのdocumentation通りにcmake-guiを実行
```
cmake-gui .
```

*  Macroとして、BOOST_ROOTを指定する(listboxに追加すればよい)<br/>
指定dir以下に、lib/*.dylib, include/boost があればよい。
例えば$HOME/proj/boostなど。

*  一旦Configureボタンを押す。Dialogが出てくるので、Makefileを生成するoptionを選択する。
（→他のMacroも現れてくる）

*  CMAKE_INSTALL_PREFIXをインストール先($HOME/proj/CGAL等)に変更する。
*  32bit: CGAL_CXX_FLAGSというのも出てくるので、そこに-m32というのを追加→32bitでcompileされる
*  再度Configureボタンを押す
*  Generateを押すと、Makefileができる
*  terminalからmake, make installを実行
```
make
make install
```

**CGALとclangでの問題点**

XCode4.5では、clangの対応していないstd::forwardやstd::moveを使ってしまいcompileが通らなくなる場合があった。
CMakeのconfigが正しく行われないのが問題らしい（原因は不明）
ともかくも、手動で
```
include/CGAL/compiler_config.h
```

を書き換えて
```
#define CGAL_CFG_NO_CPP0X_VARIADIC_TEMPLATES 1
#define CGAL_CFG_NO_CPP0X_RVALUE_REFERENCE 1
```

を定義されるようにして、makeするとうまくいった。（本来は自動で定義されて然るべきの筈）


### Source codeのcheckout

*  Anonymous (http)
```
git clone https://github.com/CueMol/cuemol2.git cuemol2
```

*  特定ユーザー (ssh)<br/>
```
git clone git@github.com:CueMol/cuemol2.git cuemol2
```

以下では~/proj/cuemol2以下にcheckoutしたとする．


### configureスクリプトの実行とbuild
以下buildは，~/proj/cuemol2/uxbuildにて行うのでcdで移動．

configureを走らせるためのスクリプトrun_config_osx.shが，~/proj/cuemol2/uxbuildにあるので，必要に応じて編集．（これを使わなくても出来なくもないが，いちいちキーボードから入力するのは面倒なので）

library等のインストール位置を上述から変更していない場合は，
CVS repositoryにあるrun_config_osx.shそのままで動くはず．
インストール位置を変えている場合は，gecko_sdk_dirやboost_dirを変更する．

エラー無くconfigureスクリプトが生成され，さらにMakefileが生成されたら，makeコマンドを実行．buildが行われる．

### お試し実行など
MacOS Xでは，適切な位置にxulやxpcom関連のファイルが配置されていないとアプリとしてちゃんと動かない．

make installを実行すると，~/proj/cuemol2/uxbuild/osxbuild以下にCueMol2.appが作成される．
jsやxul関連のファイルはjarファイルにまとめられる．
他の必要なXULのファイルなどはsymbolic linkが作成される．
~/proj/cuemol2以下にsourceを展開している場合は，
```
arch -i386 ~/proj/cuemol2/uxbuild/osxbuild/CueMol2.app/Content/MacOS/xulrunner
```
でterminalから起動可．（arch commandは，runtime版を使用している場合は必須．そうしないと64bitのxulrunnerが起動して32bitのcuemol componentをdynlink使用としたところでこける）

debugと開発に使用可能．

"component not loaded"というmessage boxが出て起動しない場合は、dyldがこけている可能性大。
```
setenv NSPR_LOG_MODULES linker:5
```
と環境変数を設定して起動するとLoadMachDyldModuleでのエラーがterminalに出るようになるので、
何が原因で起動しないか検証することが可能になる（linkerをallにするとすべてのモジュールでのログが表示されるようになる）

#### 配布パッケージの生成
src/osxbuild下でmake builddmgを実行すると，CueMol2-<version番号>-MacOSX-Intelというフォルダが作成され，その中にもCueMol2.appというのが出来ているが，これはsymbolic linkではなくすべてコピーになっているので，コピーすることで他のMacでも実行できるはず．あとさらに，同じ内容が入ったdmgファイルも作成される．

Finderなどから起動する場合は，Dynamic link library (dylib)のパスを適切に書き換えとかないと，見つからなくて正常に起動できなくなる．dylibファイルに書き込まれているパスをあとで書き換えるためには，ファイル中にある程度スペースが確保されていないと書き換えに失敗する(make builddmgが中断する)．
これを防ぐには，configure時にLDFLAGS=-Wl,-headerpad_max_install_namesを指定して十分なスペースを確保しておけばよい．

### その他注意点
run_config_osx.shは，src/configureが存在する場合はautoconf/automake系のconfigure生成コマンドを実行しないので，強制的に再実行したい場合はsrc/configureを削除する．

`%'-style pattern rules are a GNU make extension
という警告が出るが，gnu makeを使用しているので，気にする必要はない（これはlinuxも同様）

Mozilla build用にMacPortsでautoconfをinstallした場合，Mozillaのサイトにversion 2.13を入れるように指示があるが，それだとautomake系のコマンドがちゃんと動かなくなってしまうので，最新版を入れておく必要がある．（単にsudo port install autoconfとしておけばOK）

現在の所，configure.acがMacOSXでのbuildを検出すると，勝手にgccに-m32オプションをつけるようになっている．（将来的には64bit buildに対応すべきだが）

## メモ
### POV-Ray 3.7のビルド
★以下の方法でbuildは出来るが、renderingしても正常に画像が出力されない。
なので、
http://megapov.inetart.net/povrayunofficial_mac/
で配布されているバイナリーを使用している。（ただしこのbinaryではWxHが2600pxを超えると画像が出力されないという不具合がある）

githubからmasterを持ってくる

BOOSTをbuildする．（上記のCueMol用に作ったのと同じで良い）<br/>
lib*.aだけを持ってきた，boost_staticというdirectoryを作っておく．

付属libpngをbuildする<br/>
libraries/pngで，make -f scripts/makefile.gccを実行<br/>
warningがでるが，build完了<br/>
このままだとconfigureから使えるdirectory構成になっていないので，
lib, include directoryを作り，lib*.aをlibに，*.hをincludeにコピーする

付属zlibをbuildする<br/>
libraries/zlibで，./configureを実行，makeを実行<br/>
warningがでるが，build完了<br/>
このままだとconfigureから使えるdirectory構成になっていないので，
lib, include directoryを作り，lib*.aをlibに，*.hをincludeにコピーする


unixでprebuild.shを実行


以下のscriptでconfigureを実行する．ただし，topdirとboost_dirは適宜変更する．
```
boost_dir=$HOME/proj64/boost_static/
topdir=$HOME/src/povray-3.7-stable
env NON_REDISTRIBUTABLE_BUILD=yes \
CXXFLAGS=-Wno-parentheses-equality \
./configure \
```
 COMPILED_BY="your name <email@address>" \
 --disable-debug \
 --disable-shared \
 --disable-io-restrictions \
 --with-boost=$boost_dir \
 --with-libpng=$topdir/libraries/png/lib \
 --with-zlib=$topdir/libraries/zlib/lib \
 --without-libjpeg \
 --without-libtiff \
```
```

makeを実行．

できるbinaryは，pwdからincを読み込まないようなので，Library_Pathに追加指定する必要がある．
