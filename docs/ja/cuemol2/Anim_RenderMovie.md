[Documents](../../Documents)
## アニメーションのレンダリングと動画ファイル作成
このセクションでは，POV-Rayを使用したアニメーションの画像ファイルへのレンダリングと，
FFmpegを利用したquicktimeやAVI等の動画ファイル作成の方法を，
例を挙げながら説明します．
（例で説明している作業は，[前セクション](../../cuemol2/Anim_ShowHide)の続きの操作として説明しています）

## POV-Rayによるレンダリング
静止画の場合と同様に，POV-Rayを使用してアニメーションの各フレームを画像ファイルにレンダリングすることが可能です．

メニュー「Render」→「Animation rendering」を実行すると，
以下のようなAnimation renderingダイアログが表示されます．

![anim-render-1](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-1.png){ style="zoom: 0.5" .on-glb }


上図のようにタブに対応して主に３種類の設定項目がありますが，順に説明します．

### RenderingのMain option
文字通りメインの設定オプションです．

Output dir
:   PNG画像ファイルが出力されるディレクトリーを指定する．
基本的に膨大な数のPNGファイルができるため，何らかの新しいディレクトリを作成しておいて，そこにoutput dirを設定することをお勧めします．

Width, Height
:   出力される画像のサイズ(dimension)を指定．デフォルトでは1000x1000pixelsになっているが，これは大きすぎるので変更するのを忘れないように．右にあるPreset sizeからVGAなどを選ぶと，対応する大きさがwidth/heightの項目に入ります．

Preset size
:   上記のようによく使う動画サイズを簡単に設定できる．（ただしこの項目がVGAになっていても，width/heightの値が違っていたら，width/heightの値が優先される）ふつうのプロジェクターでのプレゼンに使用する場合はVGAかSVGAで十分だろう．

Projection
:   画面の投影法法を指定．
(静止画のPOV-Ray rendering dialogの設定と同じ.
[POV-Rayによるシーンのレンダリング](../../Documents/GUIのチュートリアル(CueMol2)/Step10)参照）

Frame rate
:   １秒間に何フレーム分の画像をレンダリングするか指定する．大きい方が滑らかな動画になるが，ファイルサイズもその分膨大になる．通常は30か24で十分．特にファイルサイズをケチりたい場合は5等にするとよいが，あまり小さくし過ぎるとカクカクになる．

NCPU
:   レンダリングに使用するCPU (thread)数を指定する．
同時実行可能なthread数-1を指定する．
たとえば4 coreあるCPUでhyper threading等をoffにしている場合は，3を指定するとよい．

Loop
:   これをonにすると，最後の1 frameとして最初の1 frameが余計にレンダリングされる．ループしている動画の場合，これをONにすると最初と最後のつながりがスムースになり，カクカクしなくなる場合がある．（ただし，逆にこれをoffにしたほうがカクカクしない場合もあります）

Progress
:   レンダリングの進行状況が表示される．

Log
:   レンダリングの進行に応じて情報が表示される．

例では以下のように指定します．

* output dirをC:\tmp\render_tmpに指定し(フォルダは前もって作っておいてください)，
* Width/heightをQVGA (320x240)に指定
*  Frame rateを24に指定

### Render options
主にPOV-Rayに関する設定を行います．

![anim-render-2](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-2.png){ style="zoom: 0.5" .on-glb }


Povray exe file
:   POV-Rayの実行ファイルを指定する．既に静止画のPOV-Ray rendering dialogを使用してレンダリングを行っている場合は同じ設定が入るので，特にそのままでよい．POV-Ray付属版を使用している場合も，はじめから適切な値が入っているためそのままで問題ない．

Povray inc dir
:   POV-Rayのincludeディレクトリを指定する．既に静止画のPOV-Ray rendering dialogを使用してレンダリングを行っている場合は同じ設定が入るので，特にそのままでよい．POV-Ray付属版を使用している場合も，はじめから適切な値が入っているためそのままで問題ない．

Clipping plane
:   レンダリング時にClipping planeを使用するかどうか．基本的にONでよい．

Post-render alpha blending
:   半透明があるシーンではONにする．
半透明が無いことがわかっている場合はOFFにしたほうがrenderingが速くなる．
（詳しくは[半透明オブジェクトのレンダリング](../../cuemol2/PostAlphaBlend)参照）

Shadow
:   影がrenderingされるようになります．普通影はできな方が良いのでOFFにする．

例では以下のように指定します．

* Clipping planeはON
* Post-render alpha blendingは，アニメーションで半透明が使用されるためONにする．
* ShadowはOFF

### Movie options
主に動画をエンコードするFFmpegに関する設定を行います．

![anim-render-3](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-3.png){ style="zoom: 0.5" .on-glb }


Make movie
:   OFFになっているとPNGファイルへのレンダリングのみ行われ，動画は作成されない．他のソフトウェアで動画を作成する場合や，FFmpegのオプションを細かく変更して何度もエンコードを試みる予定の場合はOFFでよい．

FFmpeg exe file
:   FFmpegの実行ファイルを指定する．FFmpeg同梱版では初めから適切な値が入っているので特に変更する必要はない．

Output format
:   どのような形式の動画ファイルにエンコードするかを指定する．Mac OS Xで使用する場合はQuickTimeに，Windowsで使用する場合はAVIあるいはwmvにするのが良いだろう．ただし，wmvは他の２つに比べ画質は劣る．

Bitrate
:   文字通りビットレートを指定する．デフォルトでは10240 kbit/sになっているが，これは動画１秒間あたり10240 k bit（すなわち1.25M bytes/sec）使用するファイルができることを意味する．作成する動画の長さと，どれくらいのファイルサイズになってほしいかを考えて指定する．

例では以下のように指定しています．

* Make movieはON
* Output formatをQuickTime/H.264に
* Bitrateを10240にする．

## レンダリングの実行
以上の設定をすべて行った後，Startボタンを押すとレンダリングが開始されます．
アニメーションの長さとframe rateにもよりますが，非常に大量の画像がレンダリングされるため結構時間がかかります．

![anim-render-4](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-4.png){ style="zoom: 0.5" .on-glb }

Stopボタンを押すことで，レンダリングを中断することが可能です．

### 出力されるファイル
Progressが100%になり，Logに"All tasks done"と表示され，
Start, Closeボタンが有効になると，レンダリングの終了です．

終了すると，output dirに大量のPNGファイルと（動画エンコードがONになっている場合は動画ファイル）が出来上がります．

（動画エンコードがONになっている場合でも，途中経過であるPNGファイルは削除されずに残っているため，
PNGファイルを入力として用いることができる動画ソフトを用いたエンコードも可能です．）

以上のオプションでエンコードした動画が以下になります．

<iframe width="425" height="350" src="https://www.youtube.com/embed/pHL52i3kzxE?mute=1&controls=1&rel=0&playlist=pHL52i3kzxE"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>
                

ただし，youtubeで画質が低下するため，もとの動画はもっと高画質です．

## PowerPointやiPadなどでの使用のための再エンコーディング
上記の方法で動画まで一気に作成できますが，
レンダリングのステップまでOKでも，動画のエンコードの部分がうまくいかない（あるいはエンコードを変更したい）場合に，再度，動画のエンコーディングのみやり直したい場合があるかもしれません．

CueMolのGUIだけでは，動画のエンコーディングのみやり直すばあいでも，
レンダリングからやり直すしか方法がありませんが，
以下のようにコマンドラインや他のソフトを用いることでエンコーディングのみ行うことが出来ます．

### FFmpegを用いて
CueMolとともにインストールされているFFmpegを用いて，output dirに作成されたPNGファイルを再エンコード可能です．

まず，前回エンコード時のlog windowの最後の方に出ているFFmpegのコマンドライン引数を探し，
それをコピーしておきます（Windowsの場合はCtrl+C，Macの場合はCommand+C）．

Windowsの場合は，コマンドプロンプトを開き，

```
> (CueMolインストールディレクトリ)\ffmpeg\bin\ffmpeg.exe (Logのコマンドライン引数)
```

CueMolインストールディレクトリは，たとえば，C:\Program Files (x86)\CueMol 2.0等です．

(Logのコマンドライン引数)は，上記でコピーしたコマンドライン引数をペーストしたものです．

ただし，これを実行しても再度同じ動画が作成されるだけなので，たとえば-c:v引数でエンコードを変えるなどして実行してください．詳しい引数の説明は，FFmpegのサイトなどを参考にしてください．


### Handbrakeを用いる方法
一方で，FFmpegを用いてパラメータをいろいろ変えてエンコードし直しても，
上記の手順で作成した動画ファイルは，PowerPointに埋め込んで使用すると，

*  異常にカクカクする
*  WindowsではPowerPointがクラッシュする

などの問題が起こる可能性があります．
また，iPad等のmobile deviceでは正常に見られない可能性があります．

これらを回避するには，[Handbrake](http://handbrake.fr/)というソフトで動画を再エンコードするのがお勧めです．


まず，CueMolで動画をエンコードする時点で劣化しないように，QuickTime/Raw encodeを使用します．（raw encodeでエンコードした場合はWindowsのmedia player等で見られないが問題はない）

その後，Handbrakeを起動し，ツールバーの「Source」→「Video File (Ctrl-O)」を実行すると，ファイルを開くダイアログが出てくるので，そこで上記で作成したQuickTime (*.mov)ファイルを選択し，開きます．

次に，「Destination:」の部分に，出力ファイル名を指定します．その右にある「Browse」ボタンを押すとファイルを保存するダイアログが出てくるので，希望するファイル名（拡張子はmp4やm4vになる）を指定します．

### PowerPoint用に設定
次に，右のPresetsパネルで，「Devices」の下にある「iPod」という項目を指定します．

次に，左半分の下側にあるタブパネルから，「Picture」を選びます．iPodにすると勝手に画像サイズがiPod用のサイズになってしまいますが，ここではiPod用に作成するわけではないので，元の動画の画面サイズ（縦ｘ横ピクセル数）に戻します．
（Keep aspect ratioチェックをonにしておくと，誤って縦横比を変えてしまうことを防げます）

**注意**：MacOS版はUIが異なりPicture tabがありませんが、同等の設定をメニュー「Window」→「Picture Settings」で表示されるPicture settings windowから行うことが出来ます。

次に，「Video」タブに移り，「Avg Bitrate (kbps)」の値を必要に応じて変更します．デフォルトは700 kbpsですが，大きくすると画質は向上しファイルサイズが大きくなります．

### 他のdevice用に設定
右のPresetsパネルで対応するデバイスを選んで，適宜Pictureのところにあるサイズや，Videoのところにあるbitrateを変更してください．

### 再エンコードする
以上の設定を行ったうえで，ツールバーの「Start」ボタンを押すと，エンコードが開始され，ファイルが出来上がります．

以上のように，Handbrakeは入力としてPNGファイルを使用できないので，なるべく劣化しないようにCueMol(FFmpeg)でエンコードしてさらにHandbrakeでエンコードする，という手順をとっています．
Handbrakeの使用法は，googleなどで検索すると出てくると思いますので，詳しく知りたい方はそちらの方も参考にしてください．