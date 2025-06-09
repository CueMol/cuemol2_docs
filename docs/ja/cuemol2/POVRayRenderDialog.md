[Documents](../../Documents)

## POV-Ray rendering dialogについて
このセクションでは，
POV-Ray rendering dialogについて説明しています．

### ツールの実行方法
メニューの「Render」→「POV-Ray rendering ...」を実行すると，
POV-Ray rendering dialogが表示されます．

![povrender-dlg1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg1.png){ style="zoom: 0.33" .on-glb }


### 各設定の説明
以下では，各設定の意味を説明しています．
#### Main options

![povrender-dlg2](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg2.png){ style="zoom: 0.5" .on-glb }

W(idth), H(eight)
:   出来上がる画像のサイズをピクセル単位で指定する．Defaultでは，現在の画面サイズと同じになっている．

DPI
:   出来上がる画像のDPI (dot/inch)を指定する．

Preset size
:   何種類かの典型的なサイズが右のdropdown menuから選択可能．選択すると値が左のwidth/height/dpiに入るようになっている．

Projection
:   Perspective(透視投影)，Orthographic(正投影)を選択できる．

Stereo
:   Noneにすると，ステレオなし，Right, Leftにすると，立体視（平行法）で右目用と左目用の画像がレンダリングできる．

Stereo depth
:   Stereoが有効な場合，左右の目の離れ具合（＝立体図の飛び出し具合）を指定する．大きくするほど飛び出した画像になる．

CPU
:   POV-RayがRenderingに使用するCPU数を指定する．実際にはCueMolが1CPU使用するので，実際に搭載されているCPU数-1を指定するのが良い．

Transp background
:   背景色を透明にするかどうかを指定する．（ただし透明にするとFog効果がなくなる．またradiosity法使用時には透明には出来ない）

Clipping plane
:   現在分子ビューに表示されているslabによるclippingをpovray renderingにおいても再現するかどうかを指定する．<br />

**Left**：Clipping plane off，**Right**：Clipping plane on<br />
![povrender-clip0](../../assets/images/cuemol2/POVRayRenderDialog/povrender-clip0.png){ style="zoom: 0.5" .on-glb }
![povrender-clip1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-clip1.png){ style="zoom: 0.5" .on-glb }
Post-render alpha blending
:   POV-Ray rendering後にalpha blendingを行うかどうかを指定する．詳しくは，[cuemol2/PostAlphaBlend](../../cuemol2/PostAlphaBlend)を参照．

Edge lines
:   Edge renderingを有効にする．詳しくは，[cuemol2/EdgeLines](../../cuemol2/EdgeLines)を参照．

Pix labels
:   文字ラベルなどのrenderingを有効にする．


#### POV-Ray options

![povrender-dlg3](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg3.png){ style="zoom: 0.5" .on-glb }

Povray-exe-path
:   Renderingに使用するPOV-Rayの実行ファイルを指定する．Windows版の場合は，consoleで動くpovrayでなければならない．（下記POV-Rayのpath等の設定を参照）

Povray-inc-path
:   POV-Rayが参照するincファイルが入ったdirectoryを指定する．（下記POV-Rayのpath等の設定を参照）

Radiosity
:   Radiosity renderingを行うかどうか，あるいはそのモードを指定する．詳しくは，[cuemol2/Radiosity](../../cuemol2/Radiosity)を参照．

Lighting
:   光源の設定を行う．詳しくは，[cuemol2/POVRayRenderLighting](../../cuemol2/POVRayRenderLighting)を参照．

Shadow
:   影が出るようにrenderingするかどうかを指定する．Defaultではoffになっている．<br />

**Left**：Shadow off，**Right**：Shadow on<br />
![povrender-shadow0](../../assets/images/cuemol2/POVRayRenderDialog/povrender-shadow0.png){ style="zoom: 0.5" .on-glb }
![povrender-shadow1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-shadow1.png){ style="zoom: 0.5" .on-glb }

### POV-Rayのpath等の設定
上記の設定のうち，Povray-exe-pathとPovray-inc-pathについて説明します．

#### Windows
〜-povray-setup.exeというファイルからインストールすると，console用povrayが同梱されており，これらの値は同梱版を指すように設定されているため，特に何も準備する必要はありません．

**非同梱版の場合**<br />
一方で，POV-Ray非同梱版(povrayという文字列が入っていないインストーラー)にはPOV-Rayは含まれていません．
CueMol2と連携させるにはconsole版POV-Rayが必要なのですが，
Windows版のPOV-Rayにはconsole版が同梱されていません．
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
〜+povray.dmgというファイルからインストールすると，console用povrayが同梱されており，これらの値は同梱版を指すように設定されているため，特に何も準備する必要はありません．


### Renderingの開始と画像の保存
下方にあるStartボタンを押すとrenderingが開始されます．

Rendering中はStartはStopボタンに変化するので，中断する場合は，Stopを押せばよい．
Renderingの進捗に従って，preview部分にrendering中の画像が表示されます．

Renderingが完了すると，

*  Save image...ボタンを押すとPNG画像として保存することができます．
*  Copy to clipboardボタンを押すと画像をclipboardにcopyされるので，他のsoftwareでpasteして使用できます．

Closeを押すと，POV-Ray rendering toolを閉じることができます．

POV-Ray rendering dialogが表示中も，メインのウィンドウを操作することが可能です．
シーンを編集し，再度表示中のPOV-Ray rendering dialogに戻ってRenderingを行うと，
編集作業が反映されたシーンがrenderingされます．

（ただし，タブを切り替えて別のシーンに移った場合は，いったんdialogを閉じて，再度dialogを開かなければ
前のシーンがレンダリングされてしまいますので注意してください．）

### RenderingのLog
CueMol2.1以降では，レンダリング時にPOV-Rayがstdout(or stderr)に書き出す情報が，log window ([チュートリアル](../../Documents/GUIのチュートリアル(CueMol2)/Step1-2)参照)に表示されるようになっています．
もし，うまくレンダリングが行われない場合は，log windowを参照して，エラーレポートをお願いいたします．