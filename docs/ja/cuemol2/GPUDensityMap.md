[Documents](../../Documents)

## GPUを用いた電子密度表示
この項ではversion 2.1.0.241以降で導入された，
GPUを用いた電子密度表示
について説明します．

### 準備
[cuemol2/UseGLShader](../../cuemol2/UseGLShader)の記述を参考に，使用しているグラフィクスデバイスがshaderに対応しているか確認し，
shaderを有効化してください．

注意：環境によってはshader機能が正常に動作しない場合があります．主にATIとnVidiaのドライバーでは動作テストしているので問題なく動く場合が多いと思います．

## 高速メッシュ表示
通常のメッシュ表示の高速版です．

OpenGLのGeometry shaderを使用できる（上記のログでGLSLが4以上のバージョン）環境で使用できます．

mtzファイルなどを開き，rendererを選択するダイアログで，countourではなくgpu_mapmeshを指定すると使用できます．

表示は基本contourと同じですが，

*  広範囲の表示を行っても非常に高速
*  Levelの変更が非常に高速
*  povray renderingなどはできない（何も表示されない）
*  分子を利用した表示範囲制限はできない
という特徴があります．
特にlevelが0に近い，かつ広範囲の場合は，通常のcontour rendererでは非常に低速になりますが，
gpu_mapmeshでは高速に表示可能です．

ただし，パフォーマンスはGPUの性能にかなり大きく左右されます．
ここ１年で発売されたようなビデオカードで３〜５万円する3Dゲーム用のやつだと結構速いです（２０１２年現在）．

## Volume rendering
電子密度のvolume renderingを行うrendererです．

OpenGLのshaderを使用できる（上記のログでGLSLが2以上のバージョン）環境で使用できます．

mtzファイルなどを開き，rendererを選択するダイアログで，countourではなくgpu_mapvolを指定すると使用できます．

色は，densityは低→高に従い，赤→緑→青→紫（虹色）の順に着色されます．
今のところ着色方法の変更はできません．
Contour levelは，色の不透明度が0（完全に透明）になるレベルを指定するようになっています．

以下はLysozyme(1QIO)の2Fo-Fcマップを1.1 sigmaで表示したものです．
硫黄原子はdensityが高いため，核付近が紫色で表示されています．

![gpu_mapvol1](../../assets/images/cuemol2/GPUDensityMap/gpu_mapvol1.jpg){ style="zoom: 0.5" .on-glb }


以下は0 sigmaで表示したものです．meshと異なり，0 sigmaでもdensityの様子が把握できる点が利点です．
また，分子間の溶媒領域は平坦ではなく，低いながらもdensityの強弱があることが分かります．

![gpu_mapvol2](../../assets/images/cuemol2/GPUDensityMap/gpu_mapvol2.jpg){ style="zoom: 0.33" .on-glb }


## 注意点
GPUを使用するrendererを含むシーンをqscに保存し，同等の機能を持たないGPUを備えたパソコンで開いた場合に，シーンが正常に開けなくなります．複数のパソコンで使用することを想定している場合は，以上の機能を使用しないほうが良いでしょう．