[../](../../cuemol2/)

## Linuxでのbuild
CentOS 5.Xでの場合．(それ以外のdistrでも，xulrunnerがちゃんと動くようなら一応動くのでは．未確認．)

Ubuntu amd64では動くようです（Biochem_fanさんに感謝！）． http://pastebin.com/uHcmVrE8

### 必要なソフトウェア・ライブラリ類のインストール

-  xulrunner SDK 

-  BOOST C++ Libraries

-  FFTW

-  CGAL

-  glew

※ライブラリーのうちBOOST以外は特定のモジュールからしか使用されていないので、
以下の例ではなるべくstatic libraryとして作ってリンクするようにしている。
（もちろん全部shared libraryとして作って実行時リンクするようにしても構わない。）

#### xulrunner SDK
[MacOSXの場合](../../cuemol2/Build_MacOSX)と同様．

[ftp](../..///ftp.mozilla.org/pub/xulrunner/releases/)からdownloadできる．
CueMol2のバージョンに合ったバージョンのSDKを用いる必要がある。

2.2.0では23.0.1を使用している。

SDKのほうを，　~/src/xulrunner/xulrunner-sdk/以下に展開する．

Runtimeのほうを，　~/src/xulrunner/xulrunner/以下に展開する．

Xulrunner 23.0.1を使用した場合は，SDKとruntimeを使用すればOK. Sourceからbuildする必要はなかった．













#### BOOST C++ Libraries
多くのlinux distributionでは，パッケージとしてBOOSTが最初から入っている場合が多い．それでコンパイルできて動く場合は問題ないが，うまくいかない場合は自前で最新版を入れた方がよい．

Version 2.1.0では1.44.0を使用している．ちなみに1.52.0を使用したらconfigureが通らない（他のlibにboost_systemへの依存が出来ているため．要改善）

自前で入れる場合はhttp://www.boost.org/から取得できる．
方法はMacOSXの場合と大体同様．
すべてのlibraryのbuildを行う必要はない．~/app/boost以下にインストールされるべくbuild．

ただし，MacOSXの場合と同様にsoが配置されない場合は，手動でコピーする必要有り．

具体的には：まずソースを展開後、bjamをbuildする。
```
cd boost_1_44_0
```
```
./bootstrap.sh --prefix=~/app/boost
```

次に、bjamでビルドする。以下のようなshell scriptを作成して必要なものだけbuildするようにした。
```
#!/bin/sh
```
```
instpath=~/app/boost
```
```
./bjam \
```
```
  --prefix=$instpath \
```
```
  --exec-prefix=$instpath \
```
```
  --libdir=$instpath \
```
```
  --includedir=$instpath \
```
```
  --with-date_time \
```
```
  --with-filesystem \
```
```
  --with-iostreams \
```
```
  --with-program_options \
```
```
  --with-regex \
```
```
  --with-system \
```
```
  --with-thread \
```
```
  link=shared,static threading=multi install
```

ただし、上記iostreamsはbzip2の開発環境（bzip2-develなど）がinstallされていないとbuildに失敗する。
（iostreamsは使用していないので省いても良いかも）

実際にはinstallしてもうまくいかない。bjamのscriptが期待するdirectory構成と違うようにinstallされてしまうため。以下のようにファイルを移動してcuemolのautoconf scriptから参照しやすいようにした。

-  1.44では、$instpathに直にインストールされていたので、$instpath/libを作って、そこに移動。

-  include filesも、$instpathに直にインストールされてしまうので、$instpath/includeを作って、boostをそこに移動

#### FFTWのインストール
http://www.fftw.org/download.htmlから取得可能。

基本的に、configure/makeでOK。あと、defaultでstatic libraryがbuildされるが、それでOK.
最終的にはsoとしてbuildされるため，-fPICは(static libraryであっても)つけておく必要がある．

```
env CFLAGS="-fPIC -DPIC" \
```
```
    ./configure \
```
```
    --enable-float \
```
```
    --prefix=$HOME/proj/fftw \
```
```
    --disable-fortran \
```
```
    --disable-shared
```

#### CGAL

-  version 3.8を使用

-  CMakeはOSのパッケージのものでOK

-  cmakeの実行
```
cd CGAL-3.8
```
```
cmake -DBOOST_ROOT=$HOME/proj/boost/ \
```
```
      -DCMAKE_INSTALL_PREFIX=$HOME/proj/CGAL-3.8/ \
```
```
      -DBUILD_SHARED_LIBS=FALSE \
```
```
      -DCMAKE_CXX_FLAGS="-fPIC -DPIC" .
```

-  makeの実行

-  make installの実行

※-fPICは入れないとsoとlinkできない

#### glewのインストール

-  version 1.7.0を使用

-  Sourceを展開して単にmake．configureとかはない．以下のように環境変数GLEW_DESTを指定してinstall先を変更($HOME/proj/glew)．
```
env GLEW_DEST=$HOME/proj/glew CFLAGS.EXTRA="-fPIC -DPIC" make
```
```
env GLEW_DEST=$HOME/proj/glew make install
```

-  $GLEW_DEST/lib64以下にlibraryがinstallされるが、shared objectは使わないので消しておく。消さないとsoの方が優先的にリンクされてしまう。

※当たり前だがX11やOpenGLの開発パッケージがインストールされている必要がある。<br />
CFLAGS.EXTRAでPICオプションを指定しないと、後々shared libraryとしてリンクできなくなる。

### Repositoryからチェックアウト
[MacOSXの場合](../../cuemol2/Build_MacOSX)と同様．すなわち，

-  Anonymous (http)
```
git clone https://github.com/CueMol/cuemol2.git cuemol2
```

-  特定ユーザー (ssh)<br />
```
git clone git@github.com:CueMol/cuemol2.git cuemol2
```

以下では~/proj/cuemol2以下にcheckoutしたとする．

### configureスクリプトの実行とbuild
以下buildは，~/proj/cuemol2/uxbuildにて行うのでcdで移動．

configureを走らせるためのスクリプトrun_config.shが，~/proj/cuemol2/uxbuildにあるので，必要に応じて編集．（これを使わなくても出来なくもないが，いちいちキーボードから入力するのは面倒なので）

library等のインストール位置を上述から変更していない場合は，
CVS repositoryにあるrun_config.shは，ライブラリーのインストール位置が
上述と合致しないため，変更が必要．
<pre>
gecko_sdk_dir=$HOME/src/xulrunner/xulrunner-sdk/
gecko_rt_dir=$HOME/src/xulrunner/xulrunner/
boost_dir=$HOME/app/boost
</pre>

エラー無くconfigureスクリプトが生成され，さらにMakefileが生成されたら，makeコマンドを実行．buildが行われる．


-  基本的に出来上がりはすべてso (shared object)になるので環境によっては-PIC -fPIC引数が必要(ubuntu amd64の場合)．
### 試し実行
make installを行うと，~/proj/cuemol2/xul_gui以下に必要なファイル類が配置される．xulrunnerの引数に，~/proj/cuemol2/xul_gui/application.iniを与えて起動すれば動くはず．
<pre>
~/src/xulrunner/xulrunner-sdk/bin/xulrunner ~/proj/cuemol2/xul_gui/application.ini
</pre>

うまくはしらない場合は，MacOSXの場合と同様
```
setenv NSPR_LOG_MODULES linker:5
```

を使うこともできるが，あまり有用な情報は出ない模様．
一方，ld.soの設定LD_DEBUGをつかって
```
setenv LD_DEBUG libs
```

とすると，どのsymbolがみつからなくてどのsoのloadがコケたか詳しく出てくる．



### インストールパッケージの生成
~/proj/cuemol2/uxbuild/uxdistに移動し、make distを実行するとインストールパッケージ（tar.bz2形式）が作られる。
```
cd uxdist
```
```
make dist
```

できるファイルは、CueMol2-<version>-Linux-Intel64.tar.bz2になる。
このパッケージ中のbin/cuemol2を実行すると起動する。
