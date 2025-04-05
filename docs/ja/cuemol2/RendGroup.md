## Renderer groupについて

分子オブジェクト(MolCoord)などにはどうしても大量のrendererを作成してしまいがちですが，
そうなると管理が面倒になってきます．

そのような場合は，rendererの意味や役割ごとにグループを作成して管理すると，間違えや混乱が少なくできます．


> ![rendgroup1](../assets/images/cuemol2/RendGroup/rendgroup1.png){ style="zoom: 0.75" .on-glb } → ![rendgroup2](../assets/images/cuemol2/RendGroup/rendgroup2.png){ style="zoom: 0.75" .on-glb }

グループは，上図のように折たたみ＆展開をすることができます．また，グループごとに可視・不可視を切り替えられます（後述）．


### Renderer groupの作成
Scene panelにおいて，
MolCoordなどのobjectを右クリックすると，以下のようなobjectのcontext menuが表示されます．


![mol-ctxtmenu1](../assets/images/cuemol2/RendGroup/mol-ctxtmenu1.png){ style="zoom: 0.75" .on-glb }


ここで，New Group...を選択すると，以下のような新規group名を指定するdialogが表示されますので，名前を入力し（あるいはdefaultのままで），OKを押します．すると，指定した名前でgroupが作成されます．


> ![newgrp1](../assets/images/cuemol2/RendGroup/newgrp1.png){ style="zoom: 0.75" .on-glb } → ![newgrp2](../assets/images/cuemol2/RendGroup/newgrp2.png){ style="zoom: 0.75" .on-glb }



### Renderer groupへのrendererの移動
Scene panelにてitemをdrag&dropすることで，groupに他のrendererを追加することができます．

例えば，以下のsimple1 (simple) rendererをgroup1に追加するには，
simple1 (simple)の項目をdragして，group1上でdropすれば，
simple1はgroup1中に移動されます．


> ![dragdrop-grp1](../assets/images/cuemol2/RendGroup/dragdrop-grp1.png){ style="zoom: 0.75" .on-glb } → ![dragdrop-grp2](../assets/images/cuemol2/RendGroup/dragdrop-grp2.png){ style="zoom: 0.75" .on-glb } → ![dragdrop-grp3](../assets/images/cuemol2/RendGroup/dragdrop-grp3.png){ style="zoom: 0.75" .on-glb }


### Renderer groupへのrendererの追加

Scene panelにて，groupを右クリックすると，以下のようなrenderer groupのcontext menuが表示されます．

![grp-newrend1](../assets/images/cuemol2/RendGroup/grp-newrend1.png){ style="zoom: 0.75" .on-glb }


ここでNew renderer...をクリックすると，renderer作成dialogが表示され，OKをおしてrendererを作成すると，
新たなrendererは初めからそのgroupに属したrendererとして作成されます．


> ![grp-newrend2](../assets/images/cuemol2/RendGroup/grp-newrend2.png){ style="zoom: 0.5" .on-glb } → ![grp-newrend3](../assets/images/cuemol2/RendGroup/grp-newrend3.png){ style="zoom: 0.75" .on-glb }

### Renderer groupの設定変更
Scene panelにて，
Renderer groupの左にある目玉iconをクリックすると，グループに属するrendererすべてが非表示になり，目玉iconが消えます．
（逆に，非表示になっている場合は目玉アイコンは表示されていないですが，同じ位置をクリックすることで，
グループに属するrendererすべてが表示されい，目玉iconも表示されます．）


> ![grpprop_vis1](../assets/images/cuemol2/RendGroup/grpprop_vis1.png){ style="zoom: 0.75" .on-glb } → ![grpprop_vis2](../assets/images/cuemol2/RendGroup/grpprop_vis2.png){ style="zoom: 0.75" .on-glb }

また，Scene panelにてRenderer groupの項目をdouble clickする（あるいは下のプロパティ設定ボタンを押す）と
グループ名変更ダイアログが出てきます．
新たなグループ名を入力してOKを押すと，該当groupのグループ名が変更されます．


[Documents](../Documents)
