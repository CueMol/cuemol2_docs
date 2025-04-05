[Documents](../../Documents)

## Crash時のcrash dump file送付のお願い
CueMolがバグ等でクラッシュした場合は，所定の場所に直前のメモリーイメージのcrash dump fileが作成されます．

もしデバッグにご協力いただけるようでしたら，crash dump fileをご送付いただければ大きなバグ解決の糸口になります．

### メモリーイメージファイルが作成されるフォルダ
前もって，どこにcrash時のcrash dump fileが作成されるか確認してください．
CueMolのメニュー「Help」→「Test crash reporter」を実行すると，以下のようなdialogが表示されます．

![crashreportertest](../../assets/images/cuemol2/CrashReporter/crashreportertest.png){ .on-glb }


この，crash dump path:以降に記されたフォルダーにイメージファイルが作成されます．
（このダイアログの文字列はcopy&pasteできるので，Windowsの場合は，選択してcopyしexplorerのaddress barのところに貼り付ければフォルダーを表示できます）

**Cancel buttonを押す**と正常にdialogが閉じられます．

ここで，OKを押すと実際crashが起こりアプリケーションが異常終了し，crash dump fileが出来ることを確認できます．（なのでcrashさせたくない場合は**不用意にOKを押さないでください！！！**）．


### 実際crashした場合
実際crashした場合は，上記のcrash dump pathを開くとcrash dump fileが出来ていると思います．
ファイルが作成された時間などを確認し，最新のものを探します．

#### メールでの送付
Crash dump fileを，使用していたCueMolのversion (メニュー「Help」→「About CueMol2」(Windowsの場合)で確認できる)やcrash時の状況なども添えて，

> ![mm1](../../assets/images/cuemol2/CrashReporter/mm1.png)![mm2](../../assets/images/cuemol2/CrashReporter/mm2.png)

までご連絡ください．

#### プライバシー等について
crash dump fileはcrash時の一部（stack領域）のメモリー情報のみが含まれたもので，
メモリ上のすべての情報が含まれているわけではありません．
なので，そのとき読み込んでいた分子などの情報をcrash dump fileから復元することは出来ません．

ただ，それでもプライバシー等気になるようなら，
無理に送付いただかなくても問題ありません．
