[Documents](../Documents)



## CueMolの出力したPOV-Rayファイルを編集して手の込んだ図を作る

チュートリアルの
[Step6 POV-Rayを使う](../Documents/QScriptのチュートリアル/Step6)
で最低限図を作るのに必要な機能は説明しましたが，
ここではさらに
*  統一感のある図を作る
*  質感を変える
*  半透明にする

という観点から，普通だったら使いそうにもないマニアックな機能も含めて
解説していきたいと思います．

### 作図の手順
CueMol&amp;QScriptで論文やプレゼン用の図を作る場合は，
大体以下のような手順のサイクルで作業します．
1.  元となる構造などのファイルの準備
1.  QScriptによるシーンの記述
1.  POV-Ray(.pov)ファイルの編集
1.  POV-Rayによるレンダリング
1.  画像ソフトによる加工

ここでは2〜4のステップ，特に3について詳しく説明します．

### CueMolでの色の指定
後でpovファイルを編集するつもりの場合は，
CueMol&amp;QScriptの段階で具体的な色を指定する必要はありません．
povファイルでmaterial（質感）を設定するときに，色も変更できるからです．
ただし，同じレンダラーの同じ色が指定されている部分は，
povファイルの段階では別の色を指定することは出来ません．
何らかの**区別できる色**を兎も角も付けておき，
その色毎に後でmaterialを指定するようにします．

さらに，論文やプレゼンなどでは同じ分子について，
表示する部分等を変えて，いくつも図を作る必要が出てきます．
こういう場合は，なるべく全図にわたってconsistentな色使いをしたいものです．
**色を定義するスクリプトファイルを別に作成**しておいて，
個々のスクリプトファイルの冒頭部分で，sys.exec()メソッド
([QScriptのリファレンス参照](http://cuemol.sourceforge.jp/manual-ja/))
を使用して定義を取り込むようにします．
ある部分の色を変更したい場合でも，ひとつの部分を編集すれば済むわけです．

### includeでtexture等の定義を取り込む
チュートリアルの
[CueMolの出力したpovファイルを編集する](../Documents/QScriptのチュートリアル/Step6#content_1_2)
で，CueMolの出力したpovファイルの構成を説明しました．

この例では独自にmaterialを定義してプラスチック風と金属風の例を
使用していましたが，
POV-Rayには豊富なmaterialのライブラリが付属しているので
それを利用しない手はありません．

これらを利用するには，povファイルの冒頭(ただし，version文より後でなければならない)でinclude文を使用します．
<pre>
#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"
</pre>
colors.incはよく使用される色が定義されており，
metals.inc, woods.inc, stones.incは金属・木・石の
material/textureが定義されています．

他にもいろいろなincファイルがありますが，
POV-Rayのドキュメントなどを参照してください．

### 独自のincファイルを作っておく
すでに述べたように，複数の図を作る場合は，全体でconsistentな
色・質感・テキスチャを使用したほうがわかりやすくなります．
例えば，蛋白のリボンモデルのmaterial，
残基の側鎖をball&amp;stickで出す時のmaterial，等々を
独自のincファイルで定義しておけば便利です．

<pre>
#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"

#declare tex_of_hsc = texture {P_WoodGrain1B}
#declare tex_of_ligand = texture {
finish { ambient 0.10 diffuse 0.70 specular 0.60 roughness 0.01}
}
#declare tex_of_resid = texture {finish{F_MetalA}}
#declare tex_of_map = texture {
```
 finish {ambient 0.10 diffuse 0.78 specular 0.02 roughness 0.05 brilliance 1.50}}
```
</pre>
これを"materials.inc"という名前で
保存しておき，個々のpovファイルから参照するようにします．
一応以下にそれぞれの説明を書いておきます．

tex_of_hsc
:   リボンモデルのテキスチャと質感．

木っぽくなってほしいところですが，CueMolが吐いたpov/incファイルと併用すると
色が変更されてしまってあまりそれっぽくならないみたいです．
tex_of_ligand
:   リガンド用のテキスチャと質感．

CueMolが吐くデフォルトの質感と似た，プラスチック光沢になります．
tex_of_resid
:   残基の側鎖をball&amp;stickで表示する場合などに

使用するテキスチャと質感．つや消しの金属光沢．
tex_of_map
:   電子密度用のテキスチャと質感．


### povファイルの編集
ここでは，
[Step4 相互作用の表示](../Documents/QScriptのチュートリアル/Step3)
にあるサンプルファイル中の，**blm_ribbon5.qs**
から作成したpovファイルを例として使用します(CueMolが出力した
編集前のpovファイル:![blm_ribbon](../assets/images/POVRay1/blm_ribbon.pov){ .on-glb })．
この例では，蛋白をリボンモデルで，リガンドをスティックモデルで
表示しています．

蛋白のリボンモデルには，a/b分子のsheet, helix, coilそれぞれ6通りの
色が設定されています．また，テキスチャとしてデフォルトのプラスチック光沢が
指定されています．
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
#declare _blm_ab_p_col0 = <0.501961,1.000000,1.000000,0.000000>;
...
#declare _blm_ab_p_col5 = <1.000000,0.749020,0.501961,0.000000>;

#declare _blm_ab_blm_tex = texture {
...
</pre>
例えば，この_blm_ab_p_texの定義を変えることで，
リボンの質感を変更します．ここでは，先ほど定義しておいたtex_of_hscに変えます．
<pre>
#declare _blm_ab_p_tex = tex_of_hsc
</pre>
また，色についても，_blm_ab_p_col0〜5を変更することで，この時点でも変更可能です．
さらに，リガンドのテキスチャも変更しておきます．
<pre>
#declare _blm_ab_blm_tex = tex_of_resid
</pre>

### POV-Rayでレンダリング
次に，以上で変更したファイルをPOV-Ray windows版（ver3.6）
でレンダリングする場合の手順を説明します．

まず，デフォルトのiniファイルでは画像のアスペクト比がおかしいので
iniファイルを作成してやる必要があります．
POV-Rayを起動してメニューの"Render"→"Edit Settings/Render"を実行すると
ダイアログが表示されます．


![povray-inisettings](../assets/images/POVRay1/povray-inisettings.png){ .on-glb }


ダイアログの真ん中あたりの"Browse"ボタンで
表示されるファイルダイアログから"quickres.ini"ファイルを選び，
さらに"Edit"ボタンを押すとエディターにその内容が表示されます．
デフォルトのエントリーでは正方形のアスペクト比の定義がないので，
エディターを使って以下のエントリーを新たに追加してやります．
<pre>
[500x500, AA 0.3]
Width=500
Height=500
Antialias=On
Antialias_Threshold=0.3
</pre>

もう一度メニューの"Render"→"Edit Settings/Render"を実行して
iniファイル設定ダイアログを表示し，
Nameのところに"quickres.ini"が選択されていることを確認して，
Section:から，先ほど作成したエントリー(500x500なんちゃら)を選んで
Renderボタンを押すとレンダリングが始まります．


![blm_ribbon_c](../assets/images/POVRay1/blm_ribbon_c.png){ .on-glb }

この画像をレンダリングした編集後povファイル：![blm_ribbon_c](../assets/images/POVRay1/blm_ribbon_c.pov){ .on-glb }

ちょっと暗い感じがします．こういう場合
Photoshopなどで明るさ・コントラストなどをいじってやってもよいのですが，
povファイルの光源設定を変えるのが良いでしょう．
<pre>
light_source {<_stereo*_distance*0.05,0,_distance> color rgb <1,1,1>}
light_source {<-1,1,1>*_distance color rgb 0.7 shadowless}
</pre>
CueMolが吐いたデフォルトでは，上記のshadowless光源の明るさが0.5になっていますが
これは結構暗いです．1やそれ以上にも出来るので，
いろいろ変えてレンダリングしてみてください．

### 透明にしてみる
次は一部分を半透明にしてみましょう．
<pre>
#declare _blm_ab_p_col0 = <0.501961,1.000000,1.000000,0.85>;
</pre>
リボンモデルの色の定義の部分で，透明度を0から0.85にします．

![blm_ribbon_tp](../assets/images/POVRay1/blm_ribbon_tp.png){ .on-glb }

片側のサブユニットのコイル部分が全部半透明になったのがわかると思います．

このように，同じ色の部分が全部変わってしまうので，
「色が同じでも透明度を後で変えたい」というケースでは，
**わざと違う色にしておいて**後でpovファイル編集時に
**同じ色かつ違う透明度の色に変える**
という技を使います．

### Ball&amp;stick modelの半透明
一方で，前節と同じ方法でスティックモデルを半透明にしようとすると，
あまりうまくいきません．

![blm_ribbon_tp2](../assets/images/POVRay1/blm_ribbon_tp2.png){ .on-glb }

スティックモデルは円柱と球の組み合わせで出来ているので，
半透明にすると，折れ曲がりや先端で中にある球が透けて見えたりし，
かなり格好悪くなってしまいます．
これは，CueMolが出力したincファイルでは，球や円柱をunion文で
結合させているのが原因です（実際にはincファイル中にある全オブジェクトがunionで結合されている）((POV-Rayは，Unionで結合したオブジェクトについては，交差の判定を行わず，全部描画してしまうためこういうことが起こる；その反面，レンダリングは高速になる))．

Merge文で結合させてやれば，POV-Rayが物体の交差を厳密に判定して，内部にある面を描画しないようになります．
incファイルを編集して，cylinder文やsphere文がある部分を新たにmerge{...}で
囲います．
<pre>
merge { // <-- 追加
cylinder{<-7.880457, 0.385846, 0.826740>, <-8.656734,
...
} // <-- 追加
} // union
</pre>
CueMolの出力したincファイルはどこからどこまでがどのレンダラーに対応するのか
非常にわかりにくいので，
1.  半透明にしたいスティックモデルだけ表示させる
1.  pov/incファイルを出力
1.  そのファイル中のunionをmergeに書き換える

という方法のほうが簡単かもしれません．
この場合は，povファイルでスティックモデルのincファイルを
取り込むように記述しておく必要があります．
<pre>
#declare _scene2 = #include "<スティックモデルのincファイル>"
object{
```
 _scene2
```
}
</pre>
これでレンダリングすれば以下のように全部きちんと半透明になります．

![blm_ribbon_tp3](../assets/images/POVRay1/blm_ribbon_tp3.png){ .on-glb }

ただし，merge文を使用すると交差の計算のためレンダリングが遅くなるので
注意が必要です．

### テキスチャのブレンド
以上で述べた方法により，**色と半透明のグラジエント／ブレンド**
が自由に出来ることがわかったと思います．
リボンモデルの二次構造の境界の色などで，滑らかに色が変化している部分で
色のブレンドが使用されています．

ここではさらに，**テキスチャのブレンド**を行う方法を説明します．
例えばリボンの部分は木のテキスチャ，コイルの部分は金属光沢，
という風なレンダリングができるようになります((別にそんなの必要ないとか言われそうですが．．．))．

まずテキスチャのブレンドを行うには，
シーンのpov/incファイルへの書き出しの時点で，
"texblend"というオプションを指定する必要があります．
GUIからこのオプション設定は出来ないので，以下のスクリプト
<pre>
gfx.writeScene("<出力したいファイル名>", "pov", {texblend=>true});
</pre>
をQScriptのプロンプト（Outputウィンドウの下のほうにあるエディットボックス）
から実行するか，別にqsファイルを作って実行してください．

上記の方法で作成したpovファイルの一部です．
<pre>
#declare _blm_ab_p_tex = texture {
...
```
}
```
#declare _blm_ab_p_tex0 = texture{ _blm_ab_p_tex pigment{color rgb <0.501961,1.000000,1.000000>}};
...
#declare _blm_ab_p_tex5 = texture{ _blm_ab_p_tex pigment{color rgb <1.000000,0.749020,0.501961>}};
</pre>
通常の出力では色の定義が0〜5まで分かれていましたが，
ここではテキスチャの定義として分かれています．
すなわち_blm_ab_p_tex0〜5を変更することで
シート・へリックス・コイル部分のテキスチャを独立に設定できるわけです．
また，incファイル内でpigmentの上書きを行っていないので，
木や大理石等のテキスチャが正しく反映されるという利点もあります．

ここでは，_blm_ab_p_tex3〜5を以下のように書き換えてレンダリングします．
<pre>
#declare _blm_ab_p_tex3 = texture{ T_Chrome_4D };
#declare _blm_ab_p_tex4 = texture {T_Stone35};
#declare _blm_ab_p_tex5 = texture {T_Wood31};
</pre>
tex3，4，5がそれぞれコイル，へリックス，シート部分に対応しており，
それぞれクロム金属，石，木のテキスチャになります((textureの定義については，metals.inc等を見てください．他にもいろいろなテキスチャが定義されています．Windowsの場合はインストール先の"include"というディレクトリの下に在ります．))．

![blm_ribbon_txb](../assets/images/POVRay1/blm_ribbon_txb.png){ .on-glb }

う〜ん，なんかすごい悪趣味ですね．
こんなん載せて論文投稿したら一発でrejectくらいそうです(笑)．