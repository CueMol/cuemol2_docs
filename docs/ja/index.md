## CueMol


**CueMol** (きゅうもる) は[Mozilla xulrunner](http://www.mozilla.org/projects/mozilla-based.html)ベースの生体高分子の構造を見るためのソフトウェアです．

近年ちまたには，フリーのも含め結構な数の分子ビューワー/モデリングプログラムが出回ってます．
しかし，それぞれかなりくせがあり，
いちいちマニュアルを熟読しないと使い方がわからないものが多いと思いませんか？

というわけで，OSのGUIとシームレスでかつ，
わかりやすいユーザーインタフェイスを目指して開発を進めています．

さらに，論文やプレゼンのための高品位の分子グラフィクスを作成できるという特徴もあります．[Gallery](./en/Gallery)をご覧ください．



>> ![snapshot2_1](./assets/images/index/snapshot2_1.jpg){ style="zoom: 0.25" .on-glb } ![snapshot2_2](./assets/images/index/snapshot2_2.jpg){ style="zoom: 0.25" .on-glb }


>> ![snapshot2_2m](./assets/images/index/snapshot2_2m.jpg){ style="zoom: 0.28" .on-glb } ![snapshot2_1m](./assets/images/index/snapshot2_1m.jpg){ style="zoom: 0.28" .on-glb } 

CueMolについてのコメント，質問，要望は

*  ![mm1](./assets/images/index/mm1.png)![mm2](./assets/images/index/mm2.png)
*  ![icn-twitter](./assets/images/index/icn-twitter.gif) [Twitter@cuemolnohito](https://x.com/cuemolnohito)<br/>
（CueMol関連情報は#cuemolハッシュタグつきで）

*  あるいは[メーリングリスト](./MailingList)にお願いします．

### What's new?

2025/11/4
:   バージョン2.3.0.461 Windows・MacOS X版を公開しました．変更点は[Releases](https://github.com/CueMol/cuemol2/releases/tag/v2.3.0.461)に掲載しました．

2025/8/14
:   バージョン2.3.0.460 Windows・MacOS X版を公開しました．変更点は[Releases](https://github.com/CueMol/cuemol2/releases/tag/v2.3.0.460)に掲載しました．

2025/1/16
:   バージョン2.3.0.454 Windows・MacOS X版を公開しました． 変更点は[Updates(en)](./en/Updates)に掲載しました．

2019/1/14
:   バージョン2.2.3.443 Windows・MacOS X版を公開しました． 変更点は[Updates(en)](./en/Updates)に掲載しました．

2018/6/8
:   Bugfix版バージョン2.2.3.437 Windows・MacOS X版を公開しました． 変更点は[Updates(en)](./en/Updates)に掲載しました．

2018/5/8
:   バージョン2.2.3.434 Windows・MacOS X版を公開しました． 変更点は[Updates(en)](./en/Updates)に掲載しました．

2018/2/6
:   バージョン2.2.3.430 Windows・MacOS X版を公開しました． 変更点は[Updates(en)](./en/Updates)に掲載しました．


### 主な機能
Version 2における主な機能は以下のとおりです．

* 先進的なユーザインタフェイス
    *  タブブラウザのようなユーザインタフェイス
    *  複数シーン，マルチ・ビューのサポート
    *  シーン内，シーン間での分子や表示等のコピー＆ペースト
    *  シーンごとに独立したUndo/Redo機能
* 分子Viewerとしての機能
    *  クリックによる分子残基の選択 
    * ドラッグ矩形による分子残基の選択 
    * 文（chain, residue number, atom nameなど）による分子の選択 
    * 選択分子の表示 
    * 結晶学的対称分子の表示 
    * 単位胞(Unit cell)の表示 
    * 原子間の距離,角度,二面角の表示 
    * Stereo support (crystal eyes/nvidia 3D vision) 
* 蛋白質・核酸分子の表示機能
    * PDB形式読み込み 
    * Ball&amp;stick model 
    * CPK model 
    * Tube model
    * [Ribbon model](./cuemol2/RibbonRenderer)
    * [Cartoon model](./cuemol2/CartoonRenderer)
    * Molecular surface (solvent-excluded surface)の生成
* 電子密度の表示機能
    * Map (CCP4形式) 
    * Structure factor (CCP4 mtz形式) 
    * 等電荷面のメッシュ状表示 (動的にcontour levelを変更可能) 
    * 任意の(立方体)範囲の電子密度を表示 
* セッション・ファイルの保存，読込み 
    *  XML形式のセッション・ファイル(テキストエディタでの編集も可能)
* 分子間の最小二乗重ね合わせ
* タンパク質分子の二次構造に基づいた重ね合わせ
* アニメーション作成機能
    * [単純スピン回転](./cuemol2/Anim_Basic)
    * カメラのスムースな移動
    * 表示(renderer)のfade in/out, slide in/out
    * 分子の[morphing](./cuemol2/Anim_MolMorph)
    * などなど
* 外部プログラムとの連携
    *  APBS(+pdb2pqr)による静電ポテンシャル計算
    *  POV-Rayによるレンダリング
    *  FFmpegによる動画作成

