[Documents](../../Documents)

## 矩形(rectangle)による原子の選択
Home ribbonには，下図のようにツールバーボタンとRotateボタン以外に，Rect selectというボタンがあります．

![rectsel_homeribbon1](../../assets/images/cuemol2/RectSelection/rectsel_homeribbon1.png){ .on-glb }

Defaultでは，Rotateが選ばれていて，この状態で画面をドラッグすると画面が回転しますが，Rect selectの方を選択すると，**矩形選択(Rect select)モード**に入ります．

### Rect select mode
この状態になっていると，画面を(左ボタン)ドラッグすると下図のように画面に矩形が描かれます．

![rectsel_drag1](../../assets/images/cuemol2/RectSelection/rectsel_drag1.png){ .on-glb }

左ボタンを離すと，以下のように矩形の中に入っている原子のみが選択されます．

![rectsel_selected1](../../assets/images/cuemol2/RectSelection/rectsel_selected1.png){ .on-glb }

このように，画面水平方向に関しては表示されている通りに選択されますが，奥行き(Z)方向については，スラブによって隠れている部分は選択の対象にはなりません．

選択が実行された後も，Rect select modeのままで，Rotate modeには自動的には戻りませんので注意してください．
少々面倒ですが，Rect selectから抜けるには，上記のRotateボタンをクリックして，Rotateモードにしてください．

### Rendererによる違い
上図のように，simpleや，他ballstickなど，原子すべてが描画されるタイプのrendererのばあいには，矩形に入っている原子のみが（残基に関係なく）選択されます．

一方で，traceやribbonなど，主鎖のみが描画されるタイプのrendererでは，
主鎖のpivot原子(タンパク質の場合はCα)が矩形に入ると，その残基すべてが選択されることになります．

![rectsel_drag2](../../assets/images/cuemol2/RectSelection/rectsel_drag2.png){ .on-glb } → ![rectsel_selected2](../../assets/images/cuemol2/RectSelection/rectsel_selected2.png){ .on-glb }