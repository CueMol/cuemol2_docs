[QScriptのチュートリアルへ戻る](../../../Documents/QScriptのチュートリアル/)



## POV-Ray形式の出力

さらに美しい図を作成するには，[POV-Ray](http://www.povray.org/)
によるレイトレーシングで画像をレンダリングします．
Queで書き出したPOV-Ray形式のファイルをレンダリングするには
バージョン3.5以上のPOV-Rayが必要です．

まず，上記のblm_intr2.qsスクリプトを実行した上で，
Windows版の場合は[Step5](../../../Documents/QScriptのチュートリアル/Step5)のPNG形式に書き出した節と
同様にし，形式選択のところを，pov形式にして書き出せばOKです．

QScriptから行う場合は，以下のコマンドを実行します． 
```
Que> gfx.writeScene("blm_intr.pov", "pov");
```

これで，ファイルblm_intr.povと，blm_intr.incにPOV-Ray用のデータが書き出されます．


書き出されたファイルの内訳は以下のようになっています． 

:<ファイル名の基本部>.pov|
メインのファイル．ビューの設定や物体(オブジェクト)の質感(マテリアル)の情報などが記述されている．これを編集することで，より高度な質感の表現(金属光沢など)などができる． 
:<ファイル名の基本部>.inc|
物体の形状などが記述されているファイル．普通は編集する必要はない． 

さらに，QScriptから出力する場合は書き出しのオプションが指定でき，上述のincファイルの名前を変えることも出来ます．
```
gfx.writeScene("test2.pov", "pov", {incfile=>"test.inc"});
```
後述のように，povファイルを手動で変更している場合は，このように元の名前と違う名前で書き出して，（incのほうは同じにして）povファイルが上書きされるのを防ぐことが出来ます．

## POV-Rayでレンダリングする

単にファイルをレンダリングするには，シェルから以下のように入力します． 
```
> povray file.pov
```
出力画像の大きさなどを指定する場合は，以下のようにします． 
```
> povray +W1200 +H1200 file.pov
```

Windows版のPOV-Rayでは，何とか.povファイルをダブルクリックし，起動したPOV-Rayでrenderボタンをクリックするとレンダリングが始まります．

![blm_pov1](../../../assets/images/Documents/QScriptのチュートリアル/Step6/blm_pov1.png){ .on-glb }


POV-Rayの詳しい使い方は，ここでのチュートリアルの目的から外れますので， POV-Rayに関連したサイトを参照してください．

## CueMolの出力したpovファイルを編集する
とくにCueMolの出力したpovファイルをいじらなくても，
そこそこ使える図は作れますが，
さらに凝った図を作ろうとすると，povファイルの編集は必須です．
POV-Rayの入力ファイルの詳しい説明は他に譲りますが，
ここではCueMolが吐くファイルの簡単な説明をします．

#### ヘッダ
ヘッダ部分です．テクスチャ定義などの他のファイルをインクルードする場合はバージョン指定より下に追加します．
<pre>
/*
```
 POV-Ray output from CueMol (Version 1.0.0  Build 38)
```
```
*/
```

#version 3.5;
</pre>

#### 背景色
背景色を指定します．白背景にしたい場合は，{}内部をcolor rgb <1,1,1>(あるいはcolor rgb 1でもOK)に変更してください．
<pre>
background {color rgb <0.000000,0.000000,0.000000>}
</pre>

#### カメラ
カメラ関連の設定です．
*  _perspectiveを0にすることで，投影法を遠近投影法から正射投影法に変更できます．
*  _distanceを小さくすると，中心部分にクローズアップすることができます(遠近投影の場合のみ).
*  _stereoは立体視の画像を作成する場合に変更します．1にすると平行視で右目用の，-1では左目用の画像をレンダリングできます．
*  _iodは立体視の場合の視差の大きさです。大きくすることでより飛び出して見えるようになります。但し、大きくしすぎると立体視しにくくなり、目が非常に疲れます。
<pre>
#declare _stereo = 0;
#declare _perspective = 1;
#declare _iod = 0.03;

camera {
```
#if (_perspective)
```
```
perspective
```
```
direction <0,0,-1>
```
```
up <0,1,0>
```
```
right <1,0,0>
```
```
angle 8.481158
```
```
location <_stereo*_distance*_iod,0,_distance>
```
```
look_at <0,0,0>
```
```
#else
```
```
orthographic
```
```
direction <0,0,-1>
```
```
up <0,_distance/2.2,0>
```
```
right <_distance/2.2,0,0>
```
```
location <_stereo*_distance*_iod,0,_distance>
```
```
look_at <0,0,0>
```
```
#end
```
}
</pre>

#### 光源
光源に関する設定です．暗過ぎる，明るすぎると思う場合はPOV-Rayのマニュアルなどを参考に変えてみてください．
<pre>
light_source {<_stereo*_distance*_iod,0,_distance> color rgb 1}
light_source {<-1,1,1>*_distance color rgb 0.5 shadowless}
</pre>

#### フォグ（霧？）
&lt;
**注意:** 以下は1.1.0.133以前のバージョンについての記述です。最新版ではFogも書き出されますが、以下の記述はFogの濃さを手動で調節する場合に参考になります。
&gt;

あと，CueMolの現バージョンでは，デプスキューイング（奥に行くほど暗くなるやつ）の情報は書き出されません． POV-Rayのfog命令で霧を入れてやる必要があります．大体以下のようにすればいいのですが，霧の濃さや霧が始まる奥行きなどは試行錯誤で変えてみなければなりません．~~（今後のバージョンアップで，CueMolのOpenGLでのレンダリングがPOV-Ray出力に反映されるようになるかもしれません．．．） ~~

fog_offsetで霧が始まる場所を指定します．0だと，丁度視中心から奥側に霧がかかります．負の値を指定すると，霧が始まる部分がさらに奥に移動しますが，正の値を指定すると手前にきます．
distanceで霧の濃さを指定します．大きい値にするほど霧が薄くなります．(指定した値だけ光が進むと64%になるようになっているようです)
値はÅになるようになっているので，それを基準にいくらくらいにするかを判断します．
<pre>
fog {
```
 distance 5
```
```
 color rgbf <1,1,1,1>
```
```
 fog_type 2
```
```
 fog_offset -5
```
```
 fog_alt .001
```
```
 up <0,0,1>
```
}
</pre>

#### レンダラーごとの設定
以降は出力するシーンによって変わりますが，(CueMol内における)
レンダラー毎にmaterial(質感)やテクスチャ等を設定するようになっています． 

ここでは，分子オブジェクト"blm_ab"のレンダラー"p"に対応する部分の設定です（テクスチャなどの名前のプレフィクスは，"<object name>_<renderer name>"になる）． &lt;...&gt;_texは質感等の指定です．デフォルトではプラスチック風になります．<br />
&lt;...&gt;_col0は色の指定です．複数の色で着色されている場合はcol1, col2などができます．この部分を変更することで，あとから（QScriptの段階まで戻らずに）色を変えることができるので便利です．色の第4要素を変えることで，半透明にしたりもできます． 
<pre>
#declare _blm_ab_p_tex = texture {
```
 normal {granite 0.0 scale 1.0}
```
```
 finish {
```
```
  ambient 0.10
```
```
  diffuse 0.70  brilliance 1.00
```
```
  specular 0.30  roughness 0.0050
```
```
 }
```
```
}
```
#declare _blm_ab_p_col0 = <1.000000,0.698039,0.698039,0.000000>;
</pre>


![blm_pov2](../../../assets/images/Documents/QScriptのチュートリアル/Step6/blm_pov2.png){ .on-glb }

背景を白にして霧をかけてみた．紙に印刷する場合は背景が白のほうが見やすいしトナーの節約にもなります．


![blm_pov3](../../../assets/images/Documents/QScriptのチュートリアル/Step6/blm_pov3.png){ .on-glb }

金属光沢にしてみた例．ここまでやるとさすがに品がないですね．

最後に，incファイルをインクルードする部分ですが，Windows版でGUIから書き出した場合はincファイルがフルパスになってしまいます．
これでもレンダリングはできるみたいですが，ファイルを移動したときなどに面倒なことになるので，ファイル名だけに書き換えておいたほうが良いでしょう．
<pre>
...
...
#declare _scene = #include "C:\Documents and Settings\Administrator\デスクトップ\tmp.inc"
object{
```
 _scene
```
}
</pre>