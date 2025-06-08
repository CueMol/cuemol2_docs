## Multi-gradient coloringによるisosurf rendererなどの着色
Multi-gradient coloringを使用すると、 よくある電顕マップの分解能に応じた着色などが可能になります。

また、MolSurfRendererの着色に使用すると、Heat mapによる静電ポテンシャルマップの着色なども可能になります。

### 準備
以下では、電顕マップの着色を例として説明します。

まず、表示するマップを読み込んでください。（例えば、relion_locres_filtered.mrcなどとします。） デフォルト設定で読み込むと、青色で表面が表示されるでしょう。 （ターゲットによっては、contour levelが低すぎるので、手動で5程度に変更する、さらにはextentを50程度に大きくする必要があるでしょう。）

次に、local resolutionのmap fileを読み込んでください。（例えば、relion_locres.mrcなどとします。） rendererを作成せずにファイルを読み込むことができないので、読み込み時には、contourなど適当なrendererを作成しておいて、あとでrendererを削除してください。

### Coloringの変更
Color panelで、設定対象として、現在表示しているisosurf renderer（例えばrelion_locres_filtered.mrc/isosurf1など）を選びます。 そして、coloringをMulti-grad coloringに変更してください。 （Defaultの設定値が不適切なため、画面からマップの表示が消えてしまうかもしれませんが、気にせずそのまま進みます。）

次に、同じくColor panelにて、Multi-gradient coloring:というラベルの下に、Drop-down listboxが表示されていると思いますが、そのリスト中から、着色に使用するマップ(この場合は、local resolutionのmap、例えば、relion_locres.mrc）を選択します。

そして、その下にある、Edit color...というボタンを押します。

### Multi-gradient coloringの編集
Edit color...というボタンを押すと、Multi-coloring editorのdialogが表示されます。 なにもgradientが設定されていないため、表示が空っぽになっていますが、 次に、下の方にあるLoad presetボタンを押して、ResMapを選択します。

すると、ResMapでよく使用される着色のパターンがlistboxに入ります。 ただ、このままでは分解能範囲が適切でないので、上部のhistgram部分が適切な範囲で表示されていないかもしれません。

### Coloring rangeの設定
Paramの値を変更すればよいのですが、gradientの中間点も全部変更するのは面倒です。 そのため、Keep ratioというボタンをONにしておくと、1点のparam値を変更すると、その前後にあるparam値も比例して変わってくれるようになります。

Keep ratioをONにしたうえで、リストボックスからParamが0.00の青色の項目を選択します。 すると、リストボックスの下の部分が、0.00と青色になるので、0.00の部分を、例えば4.0に変更します。（こうすることで、local resolution mapの場合、表示の最高分解能側が4.0オングストロームになるわけです。）

次に、リストボックスの一番下のentryである、Paramが50.0の紫色の項目を選択します。 すると、リストボックスの下の部分が、50.0と紫色になるので、50.00の部分を、例えば10.0に変更します。（こうすることで、local resolution mapの場合、表示の最低分解能側が10.0オングストロームになるわけです。）

実際の値は、上部に表示されているhistogramや、previewボタンを押して出てくる実際のisosurf rendererの着色を見ながら調節してください。

### 完了
以上で設定が完了したら、OKボタンを押してください。 isosurface rendererの表示が変更されます。気に入らない場合は、undoしたうえで、再度Edit color...をやり直せばOKです。

### Previewとcancel
一方で、previewボタンを押すと、現在のdialogの設定で、isosurf rendererの着色がupdateされます。ただし、まだ変更がcommitされているわけではないので、cancelを押すと、変更はすべてキャンセルされます。 一方で、OKを押すと、変更が実際に行われることとなります（ただし上述のようにundoは可能です）。