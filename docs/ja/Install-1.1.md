

## Windows版

### バイナリー配布からのinstall
まず，[Download](./Download)のページからinstallerをdownloadしてください．


#### Installerを実行する前に
一般的な他のソフトウェアと同じように，インストーラーを実行すると
インストールされます．前のバージョンが既にインストールされていると
問題なく上書きされるようですが，uninstallしてからinstallしたほうが
無難でしょう（コンパネ→プログラムの追加と．．．からuninstall出来ます）．

注意：<br />
Uninstallした後にinstallを行うと，前のバージョンで使用していた
設定類（palette windowの位置等）が初期化されてしまいます．
また，トポロジーファイルをカスタマイズしている場合は，
再インストールによりデフォルトのファイルに置き換わってしまうので，
手動でバックアップを取り，インストール後にカスタマイズしたものに
置き換えるなどしてください．

#### Installerの実行
英語でいろいろ出てきますが，基本的にはウィザードのNextボタンを押していけばインストールは完了します．

#### ActiveXのinstall
Version 1.1.0.**108**以降では，途中の画面でActiveXコントロールの
インストールに関するオプションが増えています．


![installer1](./assets/images/Install-1.1/installer1.png)


Register the CueMol ActiveX Controlをチェックすると，
分子表示用ActiveXコントロールがインストールされます．

はじめのインストールでインストールし忘れた場合でも，
インストーラーをもう一度起動して，上記画面でチェックを入れた上で
インストールすれば，後からActiveXコントロールをインストールすることが出来ます．

Uninstallは，CueMolのuninstallと同時に，uninstallされます．ActiveXコントロールだけuninstallする方法は今のところ設けていませんが，
ActiveXコントロールを兎も角も削除したい場合は，
CueMolディレクトリにある，「CueMolCtl.ocx」を削除してください．

### 起動時のエラーについて (Version 1.0.0)
普通にインストールすれば，だいたい普通に動くのですが，
バージョン1.0.0ではいくつかの条件で，ちゃんと動かなかったりします．
例えば，Administratorでインストールして権限の低いuserで動かすと
起動時に以下のようなエラーが出ます．


![errormsg](./assets/images/Install-1.1/errormsg.png){ .on-glb }


この状態でOKして起動すると，
メッセージのとおり，"sysconfig.xml"という設定ファイルが正しく
読まれていないため，ちゃんとモジュール等が
ロードされていない状態で上がってしまい，機能がまったく使えません．

"sysconfig.xml"はCueMolがinstallされているdirectoryにあるはずなので
メニュー”Edit→Preferences...”で環境設定のdialogを出し，Systemタブ
にある"System configuration file location"に正しいdirectory名を
入れてやって，CueMolを再起動すればOKのはずです．


![sysconfig1](./assets/images/Install-1.1/sysconfig1.png){ .on-glb }


**Version 1.1.0以降**では，adminより低い権限のユーザーでも，
そのユーザーが書き込めるフォルダーにインストールすれば，
問題なく動くようになりました．

### Sourceからのinstall

-  [Documents/BuildFromSrc](./Documents/BuildFromSrc) (準備中)


## UNIX版
準備中
