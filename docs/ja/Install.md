
CueMol1については，[Install-1.1](/Install-1.1)を参照してください．

## Windows版

### バイナリー配布からのinstall
まず，[Download](/Download)のページからinstallerをdownloadしてください．

#### Installerを実行する前に
一般的な他のソフトウェアと同じように，インストーラーを実行するとインストールされます．
前のバージョンが既にインストールされていると上書きinstallされます．
ただし，古いcuemol1(1.1系統)とは別アプリになっており，上書きされずに残るので併用が可能です．
Uninstallは，コンパネ→プログラムと機能 (Win7)から行えます．

注意：<br />
トポロジーファイルをカスタマイズしている場合は，再インストールによりデフォルトのファイルに置き換わってしまうので，手動でバックアップを取り，インストール後にカスタマイズしたものに置き換えるなどしてください．

#### Installerの実行
英語でいろいろ出てきますが，基本的にはウィザードのNextボタンを押していけばインストールは完了します．

#### ユーザ設定など
Applicationの設定の多く（windowやpanelの位置など）は，applicationとは別のprofile directoryに保存されています．そのため，uninstallしてもprofileは残ったままとなります．Profile directoryはOSのversionによって異なる場所に保存されています．（OSの起動ディスクをCドライブとする．）
Windows7
:   C:\Users\<User name>\AppData\Roaming\BKR-LAB\CueMol2_GUI

Windows Vista
:   同上

WindowsXP
:   C:\Documents and Settings\<User name>\Application Data\BKR-LAB\CueMol2_GUI


**CueMol2がクラッシュする等，正常動作しない場合**は，CueMol2が起動していないことを確認した上でこのCueMol2_GUI directoryを削除した後，再度起動してみてください．

### Sourceからのinstall

-  [cuemol2/Build](/cuemol2/Build)を参照してください．

## MacOS X版
### バイナリー配布からのinstall
まず，[Download](/Download)のページからdmg fileをdownloadしてください．

特にインストーラーはありません．ダウンロードしたdmgファイルをダブルクリックすると，CueMol2のアプリケーションが入ったフォルダが開きますので，システムのアプリフォルダなど適当な場所にドラッグしてコピーしてください．

#### ユーザ設定など
Applicationの設定の多く（windowやpanelの位置など）は，applicationとは別のprofile folderに保存されています．そのため，uninstallしてもprofileは残ったままとなります．Profile folderは，
```
/Users/<User name>/Library/Application Support/CueMol2_GUI
```

です．ただし<User name>はユーザ名．

**CueMol2がクラッシュする等，正常動作しない場合**は，CueMol2が起動していないことを確認した上でこのCueMol2_GUI folderを削除した後，再度起動してみてください．

### Sourceからのinstall

-  [cuemol2/Build](/cuemol2/Build)を参照してください．


## UNIX版
準備中
### Sourceからのinstall

-  [cuemol2/Build](/cuemol2/Build)を参照してください．
