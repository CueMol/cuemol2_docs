[cuemol2](../cuemol2)

## iOSでのbuild方法
CueMol2 iOS版はdesktop版と異なりすべての機能が実装されていないため，以下のライブラリのみ必要。

-  boost

### boostのbuild
iostreamはbuildしない。（自分でGZipStreamとか持っているので不要になった）

#### cmakeでやってみる方法
2011/11/27の時点で1.41が最新。（なぜか更新されていない）

1. cmakeのインストール
http://www.cmake.org/cmake/resources/software.html
1. boost.orgよりCMake対応のソースをSVNのリポジトリから/usr/local/srcにチェックアウトする
```
$ cd ~/proj/
```
```
$ mkdir boost; cd boost
```
```
$ svn co http://svn.boost.org/svn/boost/branches/CMake/release (←時間がかかる)
```
```
$ mv release boost-1.41.0-cmake
```
1. Xcode 用のプロジェクトファイルを生成するために、以下のコマンドを順番に実行する。
```
$ cd boost-1.41.0-cmake
```
```
$ cmake -GXcode .
```
```
$ cmake -DCMAKE_IS_EXPERIMENTAL=YES_I_KNOW . (←これは不要では？)
```
1. Xcodeから Boost.xcodeprojを開く
```
$ open Boost.xcodeproj
```
開くと非常に重い。
1. ビルド設定をする<br />
「プロジェクト」→「プロジェクト設定を編集」でウインドウが開く<br />
「一般」タグ内の「すべての構成のベースSDK」を「iOS x.x」に設定する<br />
1. 使用したいスタティックライブラリをビルドする
メインウインドウの左上のボタンで「アクティブＳＤＫ」「アクティブな構成」を適当に設定<br />
メインウインドウの左のペインの「ターゲット」リストから、使用している以下のライブラリを見つけてビルドする。

    -  date_time

    -  thread

    -  system

    -  filesystem

sharedライブラリはビルドエラーになる。"*.static"のプロジェクトのみビルド可能<br />
Debugビルドの場合、lib/Debug/libboost_XXXX-mt.aが生成される。<br />

#### Bjam+scriptで行う方法
http://gitorious.org/boostoniphone/boostoniphone

1.44.0にのみ対応。一応こっちを使ってやってみる。

boost.shを編集して必要なものだけbuildするようにする。
```
date_time thread system filesystem
```

あと、default visibilityがhiddenになっていると他とlinkしたときに警告が出まくるので、defaultにする。
```

- fvisibility=hidden -fvisibility-inlines-hidden
```
を
```

- fvisibility=default
```
に書き換えたり戻したりいろいろいじくっているうちに警告は出なくなった。（なんで１回で行かなかったかは謎）

boost.frameworkというのができる。（lipoでちゃんとuniversal binになっているっぽい）

Makefileからの利用のため、~/iosproj/boost-$(arch)/以下にinclude, libのsymlinkを張る。

## 本体のbuild
qlib, qsysなどcuemolのcoreはmakefileでbuildする。$(top)/iosbuild以下でrun_config_ios.shというスクリプトがあるので，（適宜内容を変更後）スクリプトを走らせてconfigure後，make installを実行する．

iOSではstatic libraryしか使用できない。
→すべて.aにして、xcodeでbuildするときにリンク。(boostもこのときlinkすればよい)

### アプリ自体
アプリ自体はxcodeでbuildする。（というかそうせざるを得ない）
$(top)/iosbuildというdirectoryにxcodeprojファイルがあるのでそれを開いてbuildすればOK．
ただし，サンプルのqslファイルとpdbファイルはsvn repositoryに入っていないので，
適当なqslやpdbファイルをコピーしてきてからbuildする．

以上でエミュで動かせるようになる．


こうするとすべてObjC++でcompile使用としてしまうため、ObjC++にするものだけ別libraryにしておいて、あとでlinkするようにしなければならない。
