[Documents](../Documents)

## Model building機能
### 選択部分の併進・回転

まず、動かしたい部分を選択します。
例えば、下図のTrp残基を移動したい場合は、（Navigation mode![navimode](../assets/images/Documents/ModelBuilding/navimode.png)がactiveの状態で）Trp残基中の原子をダブルクリックすると残基全体が水色でハイライト表示されます。

![sel-trp1](../assets/images/Documents/ModelBuilding/sel-trp1.png)


次に、![move-sel1](../assets/images/Documents/ModelBuilding/move-sel1.png)
をクリックして併進・回転モードにします。
すると、下図のように選択部分を囲む枠等が出現します。

![mov-trp1](../assets/images/Documents/ModelBuilding/mov-trp1.png)


この状態で、**四隅の白色正方形**の部分（アンカー）を、

-  左ボタンドラッグすると、併進

-  右ボタンドラッグすると、回転

します。

そこで、実際にアンカーをドラッグすると、以下のように白色の残基のコピー（フロート）が移動します。ただしこの状態では、まだ実際に原子は移動していません。フロートの表示が移動しているだけなのです。

![move-sel2](../assets/images/Documents/ModelBuilding/move-sel2.png)

この状態では、アンカー以外の部分をドラッグすると、Navigation modeの時と同じく画面の視点の移動＆回転が可能です。
最低、直交する二方向から見て意図する位置にフロートが移動したか確認します。
移動に満足したら、アンカー部分を右クリックしてください。コンテキストメニューが表示されます。

![mov-trp3](../assets/images/Documents/ModelBuilding/mov-trp3.png)

ここで、**Cancel moving**を実行すると、今までのフロートの移動がキャンセルされます。逆に**Commit moving**を実行すると、フロートの移動が実際の原子位置の移動に反映され、描画も更新されます。

次に回転ですが、すでに書いたようにアンカーを右ドラッグすると回転します。ただしこれもフロートが回転しているだけで、Commit movingするまで実際の原子位置には反映されません。
あと、フロートは、白色四角の中心あたりに描画されている**+**マークを中心に回転します。
この**+**マークは左ドラッグで移動できるので、回転中心を変えたい場合は適宜移動させてください。
回転中心の移動は、上記コンテキストメニューの**Stick rotcen to atom**でも移動できます。これを実行すると、現在の回転中心が選択のうちの最寄の原子に移動します。
回転中心の位置は、Cancel moving/Commit movingを実行するとリセットされます。

フロートの表示ですが、１残基だけ移動させている場合は原子まで表示されたほうが見やすいですが、分子全体を移動する場合などは逆に見づらくなるでしょう。その場合は、上記コンテキストメニューの**Show trace**でフロートを主鎖のみの表示にすることができます。

![mov-all](../assets/images/Documents/ModelBuilding/mov-all.png)


併進・回転モードに入っていても、基本的に他の全ての操作

-  Workspace paletteを使ってrendererを表示・非表示

-  Workspace paletteを使ってrendererを作成・削除

等を行うことができます。
フロート以外の（水色の）選択表示や元の移動前の表示がじゃまで見難い場合は
非表示にすることができます。（上図はその例）

### Side chainのdihedral angleの回転
### 原子のCopy and Paste
