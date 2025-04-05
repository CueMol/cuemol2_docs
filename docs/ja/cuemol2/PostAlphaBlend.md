[Documents](../../Documents)

## 半透明オブジェクトの効率的なレンダリング

CueMol1のころから着色の透明度を1以下にすることで，半透明の表示等は可能でしたが，
特にPOV-Rayによるレンダリング時に以下のような問題点がありました．

-  半透明の（おおきな）オブジェクトがあるとレンダリングが極端に遅くなる．

-  物体の裏面まで正しく計算される．また半透明の物体が重なると不透明度が増す．<br />
これは物理的な現象としては正しいのですが，見栄えとしてはごちゃごちゃして非常に見難くなります．


![alpha_scene_rendering2](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_rendering2.jpg){ style="zoom: 0.5" .on-glb }


CueMol2.0.1.X以降では，POV-Rayレンダリング時に半透明として計算するのではなく，
レンダリング後に（半透明として）重ね合わせることで，
より簡単に見やすい図を作成可能になりました．

~~※現在のバージョン(2.0.1.145)では，半透明オブジェクトが２つ以上あると正しくレンダリングされないという不具合が見つかっています．今後鋭意修正予定です．~~ バージョン2.1.0.241である程度改善されました

### 半透明物体があるシーンの作成
まず，例として半透明物体があるシーンを作成します．

以下の手順を実行して作成できますが，

![post_alpha_example1](../../assets/images/cuemol2/PostAlphaBlend/post_alpha_example1.qsc){ .on-glb }

以上から作成済みのqscファイルがダウンロードできます．


#### 分子の読み込みとリボン表示
[チュートリアル](../../Documents/GUIのチュートリアル(CueMol2)/Step1)を参照して，
ネットから1CRNを読み込みます．
この時，作成するrendererはribbonにしておきます．


![alpha_scene_colorpanel5](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel5.jpg){ style="zoom: 0.5" .on-glb }


#### 分子表面の作成と表示設定
さらに，[分子表面の生成](../../cuemol2/MsmsMolSurface)を参照して，1CRNの分子表面，sf_1CRNを作成します．
デフォルトではsf_1CRNのレンダラーmolsurf1はCPKColoringになっていますが，
これを以下のようにして表示変更します．
1.  Colorサイドパネルを表示させる(以下では1CRN/ribbon1が選ばれている)<br />

![alpha_scene_colorpanel2](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel2.png)

1.  Drop-down listboxから，sf_1CRN/molsurf1 (sf_1CRNのレンダラーmolsurf1)を選ぶ(以下のようなCPKColoringのパネルが表示される)<br />

![alpha_scene_colorpanel3](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel3.png)

1.  Drop-down listbox横の▼ボタンを押し，PaintColoring→Defaultを選ぶ<br />

![alpha_scene_colorpanel4](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel4.png)





分子ビューの方は，下図のようになるはずです．

![alpha_scene_colorpanel4](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel4.jpg){ style="zoom: 0.5" .on-glb }


#### 半透明表示の設定
次に，molsurf1レンダラーの設定を変更し，半透明表示にします．
Sceneサイドパネルでmolsurf1を右クリックしてコンテキストメニューを表示させ，
メニュー中から「Properties...」を選択します
（あるいはSceneサイドパネルでmolsurf1をダブルクリックします）

すると，以下のようなダイアログが表示されます．

![alpha_scene_colorpanel6](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel6.png){ style="zoom: 0.5" .on-glb }

図のように，Opacityの右のスライダーを操作して値を0.5になるようにします．

OKボタンを押してダイアログを閉じると，以下のように分子表面が半透明っぽくなります．

![alpha_scene_colorpanel7](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_colorpanel7.jpg){ style="zoom: 0.5" .on-glb }

ただし，OpenGLでの表示では半透明が正しく表示できないため，
上図のようなおかしな表示になってしまいます．

★さらに**背景を白色にしてください**．

### POV-Ray renderingウィンドウでレンダリングを行う
次に，メニュー「Render」→「POV-Ray rendering...」を実行して，
POV-Ray renderingウィンドウを表示します．

ここで，**「Post-render alpha blending」というチェックボックスがON**になっていることを確認してください．

そして，Heightを適当な大きさに変更してRenderボタンを押してレンダリングを開始します．
(POV-Ray renderingウィンドウの操作の詳細は[チュートリアル](../../Documents/GUIのチュートリアル(CueMol2)/Step10)を参照してください)

二度レンダリングが行われた後，2つのイメージが合成され，以下のような画像が出来上がります．
二度行われるにしても，Post-render alpha blendingをoffにしての1度のレンダリングに比べて全然早いです．

![alpha_scene_rendering1](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_rendering1.jpg){ style="zoom: 0.5" .on-glb }

ちなみに，下図が従来の半透明レンダリングの結果（Post-render alpha blending=off）です．

![alpha_scene_rendering2](../../assets/images/cuemol2/PostAlphaBlend/alpha_scene_rendering2.jpg){ style="zoom: 0.5" .on-glb }

一般的に，Post-render alpha blendingの方が透明度が高めに見えるようになります．
場合に応じて，見やすい値に調整する必要が有るでしょう．
