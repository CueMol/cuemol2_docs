[Documents](../../Documents)
## OpenGL shader機能について
Version 2.1ではOpenGLのshader機能を使用した描画が行えるようになっています．

現時点(Version2.1.0.243)では以下の機能で，shaderが使用されています．

*  [GPUを用いた電子密度表示](../../cuemol2/GPUDensityMap)
*  [Fadeアニメーション](../../cuemol2/Anim_ShowHide)


### OpenGLのバージョンと使用できるshader機能

CueMol起動時に，ログ画面にOpenGLの情報が表示されますが，
GLSLのバージョン番号により以下の機能が使用できたり，できなかったりします．

例えば以下のようにOpenGLが4.2以上のバージョンであればすべての機能が使用できます．
```
--- OpenGL Info ---
Vendor:   ATI Technologies Inc.
Renderer: AMD Radeon HD 7800 Series
Version:
  OpenGL 4.2.11554 Compatibility Profile Context
  GLEW 1.7.0
  GLSL 4.20
-------------------
```

OpenGLが3あるいは2等の場合は，

*  Geometry shaderが使用できない

あと，ATIやnVidia以外のドライバーの場合

*  Compatibility profileが正常に動作しない

などの問題があるようです．特に後者の場合は，中途半端にshaderが使用されてcuemolが正常に動作しない場合もあるため，以下の手順に従ってshaderを無効化してください．

## OpenGL shader機能の無効化

一部のグラフィクスドライバーでは，
CueMol側あるいはドライバー側のバグ等(Compatibility profileが正常に動作していない？)の問題で正常動作しない場合があります．

OpenGL shader機能のon/offは，メニュー「Edit」→「Options」で表示されるOptions dialogから行います．

Misc項目中の，Other settingsの中にある，"Use OpenGL Shader"をONにすると，
OpenGL shader機能が使用されるようになります．

Version 2.1.0.248では，インストール直後はdefaultでoffになっています．

**オプションの変更後は，CueMolの再起動が必要です．**

### 無効化あるいは有効化されていることの確認
起動時のログに，以下のように表示されている場合は，ちゃんと無効化されています．
```
OglView> shaders disabled
```

一方で，有効化されていると以下のようにdefaultのshaderがロードされたというログが表示されます．
```
PO> Loading shader: %%CONFDIR%%/data/shaders/default_vert.glsl
PO> Loading shader OK
PO> Loading shader: %%CONFDIR%%/data/shaders/default_frag.glsl
PO> Loading shader OK
```
