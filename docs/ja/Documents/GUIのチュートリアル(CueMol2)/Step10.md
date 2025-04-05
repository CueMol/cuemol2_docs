[ [GUIのチュートリアル indexへ戻る](../../Documents/GUIのチュートリアル(CueMol2)/) |
[&lt;--前に戻る](../../Documents/GUIのチュートリアル(CueMol2)/Step9) |
[次へ--&gt;](../../Documents/GUIのチュートリアル(CueMol2)/Step12) ]

## POV-Rayによるシーンのレンダリング
CueMol2からは，CueMol2から直接POV-Rayを呼び出してレイトレーシングによる画像を作成できるようになりました．

最新版ではGUIが微妙に変更されているのと，
機能が追加されているため，
詳しくは[cuemol2/POVRayRenderDialog](../../cuemol2/POVRayRenderDialog)を参照してください．


### 準備
#### Windows
〜-povray-setup.exeというファイルからインストールすると，povrayも入っているので特に何も準備する必要はありません．

**非同梱版の場合**<br />
一方で，POV-Ray非同梱版(povrayという文字列が入っていない)にはPOV-Rayは含まれていません．
CueMol2と連携させるにはコマンドライン版POV-Rayが必要なのですが，
Windows版のPOV-Rayにはコマンドライン版が同梱されていません．
[MinGW](http://www.mingw.org/)をインストールしてunix用のソースからコンパイルすればよいのですが，
少々面倒なので，コンパイルしたものを用意しました．
[ここ(povray3.6-mingw32.zip)](http://sourceforge.net/projects/cuemol/files/cuemol2/win32/povray3.6-mingw32.zip/download)からダウンロードできます．

ダウンロードしたものを，まず適当なところ（デスクトップなど）に展開します．

今，CueMol2が**C:\Program Files (x86)\CueMol 2.0にインストールされているとする**と，
その中に，上記のzipファイル中のpovrayフォルダごとコピーしてください．
（場合によっては管理者でないとコピーできないというダイアログが出てくるかもしれませんがOKしてコピーしてください．）
```
C:\Program Files (x86)\CueMol 2.0\povray\povray.exe
```
というファイルがある，かつ
```
C:\Program Files (x86)\CueMol 2.0\povray\include
```
というフォルダ中にいろいろincなどのファイルがあるようになっていればOKです．
ダウンロード後展開した実行ファイルは，実行すると警告ダイアログが出る場合があります(Windows7など)．一度実行して，警告ダイアログが出ないようにしておいてください．

#### MacOS X
〜+povray.dmgというファイルからインストールすると，povrayも入っているので特に何も準備する必要はありません．

#### 注意点
POV-RayとmegapovはCueMol2と別のソフトウェアです．[POV-Rayのライセンス](http://www.povray.org/povlegal.html)に同意したうえでインストールしてください．

### レンダリングする
CueMol2の方で，適当なレンダリングしたい画面にビューを調整します．
そして，メニューの「Render」→「POV-Ray rendering」を実行すると，
以下のようなウィンドウが表示されます．

![gui-step10-povrender1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step10/gui-step10-povrender1.png){ style="zoom: 0.5" .on-glb }

いろいろ設定項目がありますが，普通に変える必要があるのはHeightのみだと思います．デフォルトだと高さ1000pixelの画像がレンダリングされます．Widthの設定はありませんが，常にHeightと同じ値になります（すなわち正方形の画像しか作れない）．
大きいと時間がかかるので，ここではHeightを300くらいにしてください（時間がかかってもよかったら1000のままでも良いですが）

そして，下のRenderボタンを押すと，レンダリングが勝手に始まります．

![gui-step10-rendered1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step10/gui-step10-rendered1.png){ style="zoom: 0.5" .on-glb }

無事終わったら，上図のような状態になります．「Save image...」ボタンを押して，ファイルを適当なところに保存してください．（保存しないと消えてしまう）

上記のPOV-Rayのインストールがちゃんとできていないと，以下のようなエラーが出てレンダリングが始まらないです．

![gui-step10-render-error1](../../assets/images/Documents/GUIのチュートリアル(CueMol2)/Step10/gui-step10-render-error1.png)

ちゃんと指定したところに意図したファイルがあるかどうか確認してください．

POV-Rayレンダリングウィンドウが出ている状態でも，CueMol2のメインウインドウは操作できます．ビューの視点や向きなどを変えて，POV-Rayレンダリングウィンドウに戻り，ふたたびRenderボタンを押すと向きなどが変わって画像が表示されます．
（ただし，タブを切り替えて別シーンに移っても，そのシーンの方がレンダリングされるようにはなりません．その場合は一度レンダリングウィンドウを閉じて，再度メニューからレンダリングウィンドウを出してください）

### 立体視や投影法など
Stereoの横のdropdown listはデフォルトでnoneになっていますが，
これをleft eye, right eyeに変えてそれぞれ画像をレンダリングすると，
平行法の立体視画像を作成することができます．

Projectionはデフォルトでperspectiveになっています．これは奥に行くほど小さくなる投影法で遠近感が出ます．ただ，CueMol2のビューの方はデフォルトでは奥に行っても小さくならないorthographic投影のため，レンダリングした時と見え方が若干変わってくるかもしれません．そういう場合は，ProjectionをOrthographicにすれば，厳密に同じ投影法になります．（ただ，Orthographicにするとライトの影が映ってしまってビューの方とはそれはそれで違った見え方になってしまうのですが．）

以上では，直接POV-Rayでレンダリングさせる方法を例として説明しましたが，

-  povファイルを生成して，POV-Rayから手動でレンダリング

-  POV-Rayを使用せずに，PNGファイルに直接書き出す

ことが可能です．[cuemol2/ImageExport](../../cuemol2/ImageExport)を参照してください．

[ [&lt;--前に戻る](../../Documents/GUIのチュートリアル(CueMol2)/Step9) |
[次へ--&gt;](../../Documents/GUIのチュートリアル(CueMol2)/Step12) ]
