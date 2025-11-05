以下では，それぞれのリリースでの変更点をリストアップしてあります．
各OSの各バージョンの[Downloadはこちら](https://github.com/CueMol/cuemol2/releases/)からできます．

### 2.3系統
Githubの[releases](https://github.com/CueMol/cuemol2/releases/)に記載しています。

### 2.2.2系統
[英語版](../en/Updates)

### 2.2.1系統
#### 2.2.1.354

*  Cartoon rendererのsheetが状況によってねじれる現象を修正
*  Ribbon rendererのsheet, helixが場合によって変にねじれる現象を修正
*  Edge renderingでedge線等に対してのみslab設定が無視され不具合を修正
*  Windows版でNAMD coor fileが読めなくなっていたのを修正
*  Selectionにより分子の一部に対してのみ作成されたMol surfaceをregenerateするとき，selectionが無視される不具合を修正
*  Rendererのpropertyでselectionを指定する場合，ユーザが作成したmacro (definition)を使用できなかった不具合を修正
*  Scene panelで，複数のobject/rendererを選択した場合，それらに対して一挙にshow/hideをcontext menuから行えるようにした
*  Namelabelなど文字が出る系のrendererで文字のpixmapが有効に再利用されていなかったバグを修正
*  Pixmap labelのrenderingをoffにしていても実際では内部で作成・破棄され非効率であった点を修正
*  Cameraにvisibility settingsが含まれていることを表すeye iconを（内容に同期して）正しく表示されるように修正
*  選択文法で，aroundの距離指定など数値を指定する部分に不動小数点数を指定できるようにした
*  Isosurf rendererの設定GUIを実装

#### 2.2.1.349

*  小文字のチェイン名などを含むPDBファイルも読み込めるようにした．
*  重複する原子名を含むようなPDB format的にはillegalなファイルも読み込めるようにした．
* MacOSでscene panelにおいてMolSurfObjをコピーしたときにクラッシュする不具合を修正
* MolSurfRendererを$molcolを使用して着色した場合，親となるMolCoordの着色を変更してもMolSurfRendererの着色に即座に反映されない問題点を修正
* Qscファイル読み込みに失敗した場合，その時点で開いていたシーンが初期化されてしまう不具合を修正
* Save file as操作が正しく動作しない不具合を修正
* 分子選択の式で，mol name指定つきaround演算子が正しく動作しないバグを修正
* CPK, ballstick rendererのポリゴン数が大きくなりすぎた場合にdetailを自動で制限するようにした．
* Camera設定に，各object/rendererのshow/hide状態を保存できるようにした([cuemol2/CameraVisFlags](../cuemol2/CameraVisFlags))
* Mol surface cutterで，切断面と切断殻の両方を同時に生成できるようにした([cuemol2/MolSurfCut](../cuemol2/MolSurfCut))
* Tube rendererのputty(B factor等に応じて太さが変化する)を実装・GUI設定を追加([cuemol2/TubeRenderer](../cuemol2/TubeRenderer))
* 文字ラベルなどをPOV-Ray renderingでも表示できるようにした
* POV-Ray rendering dialogでlightingとradiosityの設定を出来るようにした([cuemol2/POVRayRenderLighting](../cuemol2/POVRayRenderLighting)，[cuemol2/Radiosity](../cuemol2/Radiosity))
* アニメーション設定のanimation objectの時間指定を他のanimation objectに対する相対時間設定で指定できるようにした([cuemol2/Anim_Cmb](../cuemol2/Anim_Cmb))．
*  PyMOL session (PSE) fileの読み込み（ただし不完全）([cuemol2/PSEImporter](../cuemol2/PSEImporter))
#### 2.2.1.330

*  POV-Ray 3.7を同梱するように
*  POV-Ray renderingでmulti-cpu renderingを使用可能に([cuemol2/POVRayRenderDialog](../cuemol2/POVRayRenderDialog))
*  POV-Rayを使用したradiosityによるrenderingが使用可能に([cuemol2/Radiosity](../cuemol2/Radiosity))
*  POV-Ray renderingでBackground colorを透明にするオプションを追加([cuemol2/POVRayRenderDialog](../cuemol2/POVRayRenderDialog))
*  MapSurfRenderer (isosurf; contourの表面表示バージョン) を実装
*  MapSurfRenderer (isosurf) の線表示を実装(countourに比べてcootの電子密度表示に近い表示になる)
*  MTZなどdensity map類を読み込んだときにrecenterをonにすると，視点が移動するのではなく，現在の視点はそのままでdensity mapの表示中心を視点に移動するようにした
*  MapMeshRenderer (contour)の表示範囲を分子で制限する機能を用いた場合，設定プロパティーページが正常に動かなかったバグを修正
*  Scene panelで複数選択と複数項目のcopy&paste, drag&dropを可能にした
*  Scene panelでrenderer groupをcopy&paste可能にした
*  Scene panelの＋（追加）ボタンなどで表示されるcreate-renderer dialogでrenderer-groupの作成を可能にした
*  Scene panelのrendererのcontext menuで表示されるcartoon rendererのstyle設定がribbon rendererのものになってしまっていたので修正
*  シーン別名保存時に指定できるEmbed-all optionでstyleとcameraファイルも埋め込まれるように修正
*  MolSurfObjをMolCoordから簡単に(point density等を変更して)再生成できるようにした．
*  Animation rendering tool dialogでrendering結果のpreviewができるようにした．

### 2.2.0系統

#### 2.2.0.321

*  ccp4 mapのgz圧縮版を読めるようにした

#### 2.2.0.320

*  Objectをcopy&paste出来ないバグを修正
*  MorphMolでatom数が一致しない場合でもむりやりmorphing出来るようにした
*  anim_panelにMorphMol/MolAnimの追加UIを実装
*  morphanim-toolを実装（追加のみ）MolCoordからMorphMolへの変換を実装・メニュー起動時にMolCoordからMorphMolへの変換を選べるようにした
*  MorphMol編集ツールにinsertAt, deleteを実装・MorphMolのframeにnameを設定できるようにした
*  Animation関連のtime widgetにバグがあり，1秒以下の時間が無視されるバグを修正
*  MolAnimのproperty設定を実装
*  Animation rendering時の問題点を洗い出しやすいように，ログ（全povrayとffmpeg）を保存できるようにした．
*  Animationのtime spanを0にするとおかしくなるバグを修正
*  Nucl rendererのdefault coloringをsolid($molcol)に変更し，molの方の着色にnucl=>yellowを入れるようにした
*  NAMDCoorReaderでinputがbyte swappedかどうか自動判別するようにした．
*  Interaction toolやMol superpositionにおいて，選択の指定でユーザ定義選択を指定しても認識されないバグを修正
*  Styleのreadonlyをon/off出来るようにした．読み込んだstyleはdefaultでread-onlyになるようにした．

#### 2.2.0.315

*  シーン(qsc)ファイルを移動すると，分子等をファイルに埋め込んでいない場合，外部ファイルへのリンクが切れる問題点を一部修正．
*  Simple, Traceのスタイル（太線化）を追加
*  CPKColoringの簡易設定としてdarkgray, lightgrayを追加
*  Edge線が付けられないrendererにはedgeに関するstyle menuをださないように


#### 2.2.0.313

*  Edge線の接続点を滑らかにつながるようにした．detailが小さい値でもedge線がギザギザにならなくなった
*  Save scene asを実行した後に，ファイル名をMRUリストに入れるようにした
*  Movie renderingで，ffmpegのoptionが適切でなかったためframe rateが適切に設定できていなかったバグを修正．
loopさせるmovieは最後のframeと最初のframeをだぶらせた方が良い場合があるので，Loop optionを作った

*  Macでgroupにrendererをdropできないバグを修正

#### 2.2.0.310

*  PDB Cryst1 record読み込み時にP1, a=b=c=1, ...はNMRのデータと判断し無視するようにした．
*  mtzファイル読み込みによるdensity map表示にバグがあったのを修正．（CCP4のFFTによる結果と一致することを確認）

#### 2.2.0.309

*  File open dialogでファイル形式の選択肢からQDF形式を出さないようにした
*  UndoRedo情報の消去を出来るようにした(menuから実行可)
*  RenderPov dialogで，画像サイズをcmやmm等で指定可能に
*  File open option dialog等で，（recenter等の）checkboxの初期値を，前回の状態と同じになるようにした．
*  相互作用抽出GUIの改善．指定部分（対象1と対象2を指定→その間の相互作用のみ抽出）から指定距離にある原子のリストを生成→atomintrに登録＆logに出力
*  UIによるmol selectionのbysidechをUIで実行できるように
*  Post-render alpha blendingで複数alphaがある時の挙動を改善．近いalpha値のobjectsはまとめて処理（→alpha値は0.1飛びしかありえないように）
*  pov render dialogでimageのcopyができるようになった
*  Disorder rendererのprop設定UIを実装
*  Molviewのtabのdrag&dropを可能に
*  Scene panelでのobject/rendererのdrag&dropを可能に（⇒上下ボタンの廃止）
*  Renderer Groupの実装 object内にfolder(1階層のみ可)を作れるようにして，その中にrendererを入れたりできるようになった．
*  Reassign secondary str dialogで前操作の状態が残るようになった
*  AtomIntrRendererのserializationのコードのバグを修正
*  Pov renderer dialogでStereo eye separation値の指定変更を出来るようにした．
*  Scene panelでobjectを削除後のselection(item)の移動がおかしい (rendererはOK)のを修正した
*  Scene panelでLock columnは廃止
*  Property edit dialogで前操作の状態（タブ選択）が残るようにする
*  WindowsでDisplay設定でDPIを変更（拡大）していたらMolviewの表示位置がおかしくなってしまうバグを修正

#### 2.2.0.298

* Pov renderingでedge線を描画できるようにした
* Pov renderingでのシルエット描画を出来るようにした
* nucl rendererの設定UI
* nucl rendererの新しいタイプ (ballstickとの組み合わせ)を実装．
* nucl rendererでbase pair connectionの描画をon/offに出来るようにした
* Basepairの自動判別機能を実装．PDBFileReaderが自動で読み込み時に呼び出すようにした．
* Disorderの点線を表示するためのrendererを作った
* TubeRendererにpymolのputty相当を実装
* tube, ribbon rendererの断面にmolscript風(pymolのfancy相当)を実装
* ribbon rendererでHelixの裏側と，Sheetの側面の色を別に指定できるようにした
* ribbon rendererでmolscript風になるFancy1というスタイルを追加．
* ribbon rendererの側面色，ballstick rendererのring色などで，$molcolを指定した場合に修飾子が機能するようにした
*  ballstick rendererのデフォルトring色を$molcolにした．（default_styles.xmlで指定）
*  Renderer common pageのMaterial設定を，リストから選ぶようにした．
*  Rendererのchange typeを実装（workspace panelのcontext menuから）
*  Tube rendererのGUIで，tuberではなくwidth1/width2でチューブ形状を指定するように変更
*  Scene panel/molviewの右クリックメニューにaroundとaround byresを入れてみた（試験的）
*  FileのDrag&Dropにおいて，PDB読み込み時に起こるバグを修正
*  MSMSFileを読み込んだ古いバージョンのsceneが読み込めないバグを修正
* xulrunner 23への移行
* MacOSXでGUIもRetina(hidpi)対応
* MacOSX用全画面モードのボタン

### 2.1.0系統
#### 2.1.0.279

*  mouseのsingle clickで何度もclickされるようになるバグを修正．

#### 2.1.0.276

*  Mouseのdouble clickで残基レベルでの選択と解除が出来るようにした．
*  原子を１回クリックするとラベルが表示されるが，再度クリックするとラベルを消すようにした．
*  PDB2PQR/APBS dialogで実行が失敗した時のエラー処理を強化
*  Mol superposition dialogで，重ね合わせに失敗してもdialogが閉じられないようにした
*  Style fileが外部リンクになっている場合に，qscを書き出した時にstyleが外部ファイルも書き出すようにした．
*  Style fileの外部リンク化あるいは埋め込み化がundo/redo出来るようにした
*  Camera関連操作（create, destroy, modify）のUndo/Redoを実装した．Cameraのfile-linked化のUndo/Redoを実装した．
*  MacのRetina display用に，分子ビューのHiDPI display対応を行った（GUIはlow resのまま）．
*  MacOS Xで，dockから出したときに分子ビューが隠れてしまって表示されない問題を解消．

#### 2.1.0.270

*  Create symm objectでsecondary strを再計算するのではなく，originalからコピーしてくるようにした．さらに，mol coloringはdefaultになるようにした．
*  Material設定を使用するとPOVRayレンダリングが正しくできないことがある不具合を修正
*  Cartoon rendererで，helix width modeというpropを設ける→太さを指定値で一定を可能にした
*  AtomIntrRenderer (距離表示)でshow labelを変更しても則時に反映されないというバグを修正した
*  すでにlabelが出ているatomをクリックするとラベルが消えるようにした
*  Animation modeでも，atom click/ctxt menuを使えるようにした
*  DoubleClick時に，residue selectionをtoggleするようにした
*  POV renderingで，line width scaleの計算方法がおかしかったので修正

#### 2.1.0.262

*  Animationのfade in/outでdestinationのalpha値を1以外に設定可能にした
*  Animation rendering dialogで，ffmpegのencodingにrawvideo encodingを追加した．また，command line optionのtextboxを編集可能にし任意のoptionを指定できるようにした．
*  サイクル再生用の動画作成を考慮し，最後のフレーム（＝最初のフレームと同じになる）をrenderingしないようにした．

#### 2.1.0.261

*  Mol surface generationでaltconfがあり，かつ原子の位置が微妙な場合にcrashするbugを修正．（altconfはAに対してのみsurfaceを作るように変更）
*  シーンパネルのpaintメニューが正常に動かなかったのを修正
*  shell open (WinでPDBファイルダブルクリック⇒CueMolでopen等)でqscファイルしか対応していなかったのを改善．drag&drapと同じコードを用いるようにし，pdb等も開けるようにした（基本，拡張子で判断）．同様に，command lineから起動する場合に，pdb等も開けるようにした．
*  Cartoon rendererのproperty dialogを実装した．
*  シーンパネルで，up/down buttonsによりobjectの表示順序変更を可能にした．
*  Renderer作成時あるいは他の場面でも，coloringになるべく$molcolを使用するようにして，積極的に分子オブジェクト側のcoloringが使われるようにした．
*  スタイル定義のUIを一部実装．（色の定義，分子選択の定義，スタイルのimport/export等）

#### 2.1.0.250

*  電子密度マップの境界の設定でクラッシュするバグを修正
*  MacOS X版のbuildを64bitにした

#### 2.1.0.249

* OpenGL shaderを強制的に使用しないようにするオプションを実装した．
* Material設定のたびにLOGが大量に出るのを修正
* MolSurfCutter (CutByPlane2)でcross-sectionのみを生成するoptionを実装した
* Object等の表示・非表示を切り替えるとクラッシュする場合があるバグを修正

#### 2.1.0.245 (iOS版)

*  iPadでDisplay popoverが出っぱなしになるバグを修正
*  Desktop版同様，Labelの表示にalpha testを使用するようにした．
*  AnimationのためのUIを追加 (それに伴い操作法もやや変更)
*  File displayで，inbox (他アプリから開いたqsl/pdbファイルが入るフォルダ)をスキャンし表示するようにした→webなどから開いたqslファイルがアプリ再起動後も正しく表示されるようになった．
*  File displayでEdit buttonから項目を削除したとき，ファイル自体も削除されるようにした．

#### 2.1.0.243

*  Slide in/out animationで移動後のrendererが元に戻らないというバグがあったので修正
*  Shaderを利用したalpha blendingにバグがあったため修正
*  Secondary str toolのGUI(radio buttonによるwidgetのenable/disable)を修正
*  create symm objectを実行するときに，二次構造の再計算も行うように
*  Unit cell rendererを表示すると落ちるバグを修正

#### 2.1.0.241

* Animation関連の機能・UIを実装した
* ActiveX版にもanimationのstart/stop/pauseのUIを追加した
    * ad-hoc animation（１０秒で１周スピン）を実装した
* POV-Ray+FFmpegを使用してanimation movieを作成するUIを実装した
* WindowsでPOV-Ray renderingなどsubprocessが動作する場合にDOS窓が出ないようにした．
* POR-Ray renderingでOrthographic投影の時に影ができないようにした
* POR-Ray renderingでOrthographic/Perspective投影どちらの場合でも影を表示するoptionを付けた
* POR-Ray renderingで正方形以外の画像にもrenderingできるようにした
    * rendering dialogのdefault値が現在のviewのサイズと同じになるようにした．
* POR-Ray renderingで出力PNGのDPIを指定できるようにした
* POV-Ray rendering後のalpha blendingの改善<br/>
複数半透明物体があり，それらが重なっている状況でのblend方法の改善

*  Interaction toolのUNDO/REDOができるようになった
*  GPU geometry shaderを利用したMap mesh rendererを実装した
*  GPU shaderを利用したMap volume rendererを実装した
*  OpenGLでのalpha blendingを，fragment shaderを使って行うように変更
*  PDB読み込み時に，自動secondary strucutre assignmentを行わない場合はPDBのHELIX/SHEET recordを読み込むようにした．
*  自動secondary structure assignmentの再計算を行うUIを作成した．
*  手動でsecondary structure assignmentを行うUIを作成した．
*  文字ラベルの透明・半透明処理を改善（alpha testを用いるようにした）
*  renderer property dialogにapplyボタンをつけた．OKしてdialogを閉じなくてもproperty変更の表示への影響を確認できるようになった．

### 2.0.1系統
#### 2.0.1.212

*  paint coloringの設定変更がundoできなかった不具合を修正
- 
#### 2.0.1.211

*  property dialogで，vector値を編集できるようにした
*  cameraのpropertyを変更しても変更が反映されないバグを修正
*  SSM superposeで，重ね合わせ後の配列アラインメント生成でクラッシュするバグを修正
*  POV-Ray renderingでorthographic投影にすると影が出来てしまうバグを修正
*  Ribbon rendererでHelix-end/Helix-startが隣接している部分で選択によりribbonを切断するとクラッシュするバグを修正

#### 2.0.1.208

*  MacOS X版でInteraction toolがクラッシュするのを修正
*  Interaction toolで出来る相互作用表示作成をundo/redo出来るように修正

#### 2.0.1.207
修正点

*  APBS/PDB2PQR toolで選択で指定した部分だけ静電ポテンシャルマップが作られるようになっていなかったので修正．
*  qscからMapMeshRendererを読み込んだ場合，かつ，読み込みに失敗した場合，直後にクラッシュするバグを修正
*  cartoon rendererで無効なmeshが生成されpovray renderingなどで失敗する場合があったのを修正
*  Windows版でpovray.exeがfドライブをアクセスしてdialogが出てしまう問題を修正（ただし逆にC:ドライブはアクセスしてしまう）
*  半透明合成(blendpng)を３枚以上の画像を合成する場合も正常に動作するように修正
*  分子選択UIで，テキストを選択すると，編集中の文字が消えてしまうバグを修正
*  qscファイル読み込み時に（リンク先が読み込めない等で）失敗した場合に，異常でもあきらめずに最後まで読み込むようにした．
*  Map rendererのpropertyで，buffer sizeを大きく指定するとメモリ不足でクラッシュすることがあったので，200以上は設定できないようにした．
*  OpenGL quadbuffer(hardware stereo)に切り替わる時に分子viewの位置がおかしくなるバグを修正

新しい実装

*  電子密度マップをqscファイル中に埋め込めるようにした
*  Rendererではなく分子(MolCoord)に対する着色を実装．(今後要documentation)
*  相互作用の自動抽出UIを作成．(今後要documentation)
*  cameraを埋め込みだけでなく外部ファイルとして保存し，複数のシーンで共有可能にした．(今後要documentation)
*  NAMD psf/coor読み込みの初期実装
*  Viewにstereo eyeをswapするフラグを追加(for hardware stereo)
*  MacOS Xでdmgをmountしたときに出てくるアイコンをcuemolアイコン付にした．dmgファイル中のフォルダにApplicationへのshortcutを入れてinstallを容易にした．

#### 2.0.1.202 (iOS版)

*  ラベル表示を実装（textureとして表示）
*  Displayパネルの表示がおかしくなる不具合を修正

#### 2.0.1.192

*  QSL形式のファイルタイプが登録されるようになった(win/osx)．アイコンが設定されるようになった．
*  QSL書き出し時にoption dialogが表示されるようになった．detailの一括設定，圧縮設定，書き出したqslファイルを則開く等，のオプションが設定可能．
*  Ribbonでsheetの末端がN末端の場合，かつaxialdetailが奇数の時に，端のtube部分が正しく表示されないバグがあったので修正．
*  MolCoordに対してattachするRendererタイプの分子表面表示を追加(dsurface renderer)．
*  二次構造割り当てで，N末端がいきなりhelixで始まるような構造だとそのhelixの開始終了が正しく認識されないバグがあったので修正．
*  qscファイル中から参照しているファイルのパス名に非アスキー文字が入ると正常に読み込めないバグを修正
*  cpk rendererのproperty dialogを実装（半径の変更UI）
*  QSL書き出しでVBOの分割(unsigned shortに収まるように)を実装した．ポリゴン数が多くても表示されるようになった．
*  QSLに文字ラベルを書き出せるようにした（ただしiOS版は未対応）

#### 2.0.1.188

*  Mobile device等向けViewer用のLight weight sceneファイル形式(qsl)に書き出す機能，読み込む機能を実装した．
*  qscファイルの書き込みの際，次回上書き保存したときに，前回使用したのと同じoption(圧縮等)で保存されるようにした．
*  MacOS X版で，workspace panelにて分子のコピー＆ペーストができないことがある不具合を修正した

#### 2.0.1.183

*  分子重ね合わせで，選択がemptyになるとクラッシュするバグを修正
*  分子重ね合わせで配列アラインメントをログに表示するようにした
*  電子密度のメッシュ表示の領域を，分子選択により制限して表示する方法を改善した
*  分子表面rendererの簡易プロパティー設定GUIを実装した
*  分子表面生成時に使用するvan der Waals半径をCCP4標準のcifファイルの定義値を用いるようにした．
*  電子密度rendererの簡易プロパティー設定GUIを実装した
*  慣性スクロールを実装した（デフォルトではoffになっている）
*  XULRunnerを9.0.1にバージョンアップ(Mac版も含めて)
    *  テキスト表示の方法を変更
*  選択文，around文の距離引数に小数を指定できるように修正した
*  workspace panelで分子のコピー＆ペーストができないバグを修正した


#### 2.0.1.172

*  Cartoonレンダラーを実装
*  ActiveX controlを実装
*  povray出力にdistanceが反映されていなかったのを修正
*  Density map rendererの中心がqscファイルに保存されない不具合を修正
*  Viewメニューから投影方法と，センターマークの変更を可能にした

#### 2.0.1.161

*  crystallographic symmetryの情報を編集するdialogを実装した．（symmetryパネルから表示できる）
*  crystallographic symmetryの情報を編集のundo/redo
*  Protein secondary structure assignmentの改善．特にribbon表示で，２つのhelixが連続している場合でも１つのhelixとして表示されリボンが捻じれたようになってしまっていたが，別々に表示されるようになり改善された．
*  ribbon表示で，selectionによりhelix/sheetの途中で表示を切ってしまうと，表示がおかしくなるバグがあったが，これを断面が表示されるようにした．
*  qscファイルを名前を付けて保存時に，別フォルダに保存し直すと，qscから参照していたPDBファイルなどが読めなくなるバグを修正した．
*  ミニウェブブラウザーのようなものを利用可能にした．

#### 2.0.1.153

*  PHENIX 1.7以降で生成されたmtzファイルを正常に読み込めないバグを修正した．
*  Bond edit dialogを実装した．（SS結合やN糖鎖等，非標準のボンドの追加削除がGUIから可能になった）
*  Mol struct panelで行った選択がhistoryに追加されない不具合を修正
*  Selection panelでcommand panelを優先的に表示されるように．
*  Selection panelから，今までに使った選択のhistoryを容易に参照できるようにした

#### 2.0.1.149

*  Win版、MacOSX版ともに，原子ラベルや距離表示を表示しようとするとクラッシュする，というバグを修正した．

#### 2.0.1.148

*  PaintColoringのエントリーをコピペ/上下移動できるようにした
    *  ただし，undo/redoの動作がおかしい部分がある
*  PNGファイルでのシーン書き出しがちゃんと動かなかったので修正
*  Zoom値が負になる不具合を修正
*  電子密度(Density)パネルの表示範囲(extent)の指定が正しく動作していなかったのを修正
* 電子密度rendererのbufsize property指定が動作するように修正
*  XULRunnerを6.0にバージョンアップ(Mac版も含めて)
    *  MacOSX版では，ファイルを開くダイアログに，形式を選択するドロップダウン・リストボックスが表示されるようになった．ただし，ここでファイル形式を選んでもファイル一覧に表示される内容はフィルタリングされないという問題がある（原因調査中）．
*  ~~Win版、MacOSX版ともに，原子ラベルや距離表示を表示しようとすると，クラッシュする場合がある．[Install](../Install)の「ユーザ設定など」にあるとおりに**Application設定を削除してから起動すると正常動作する**ので，クラッシュした場合は試してみてください．~~ 149以降で修正済みです．

#### 2.0.1.145

*  XULRunnerを5.0にバージョンアップ(Mac版は2.0)
*  Sceneファイル(qscファイル)の保存時にオプション(テキスト形式・圧縮)を指定できるようにした．
*  コピー・ペースト機能の改善（主にObject）
*  Cameraのコピー・ペースト機能
*  ラベル表示時にフォントサイズによっては文字の上下が切れるのを修正
*  メニューの最近使ったファイル項目を実装
*  qscファイルをダブルクリックしたときに，新規ウィンドウではなく新規タブに読み込まれるようにした．
*  trackpadの設定を環境設定→Mouseに移した，現在すでに開いているViewに対しても適用されるようにした(MacOS X)
*  MacOS XでもSceneファイル(qscファイル)をFinderでダブルクリックして開けるようにした．QSCアイコンが表示されるように．
*  静電ポテンシャルマップ関連のバグフィクス

#### 2.0.1.138

*  XULRunnerを2.0にバージョンアップ
*  分子表面(solvent excluded surface)を生成する機能を追加 (MSMS不要)
*  分子表面の切断機能を改良（以前のようにおかしなポリゴンが生じたりしなくなった）
*  gzip圧縮されたpdbファイル(*.pdb.gz)を直接読み込めるようにした．
*  rcsbからのPDBダウンロード時も圧縮版を落とすようにしたので，高速化しているはず．
*  Dial buttonがあるViewパネルを実装
*  Pymolふうの重ね合わせによる半透明のレンダリング機能を追加
*  分子Viewでのmouse bindingを変更可能にした
*  Rendererのコピペ機能
*  Objectのコピペ機能(一部不完全・バグあり)

### 2.0.0系統

#### 2.0.0.125

*  CPKColoringの変更が正しくqscファイルに保存できなかったのを修正．
*  選択文でbysidechなどを使用したときに不正終了するバグを修正．
*  POV-Ray rendering windowsを閉じたときの挙動がおかしかったのを修正．
*  POV-Ray renderingで，clippingを設定すると正常にレンダリングできなくなるバグを修正．

### 1.1.0系統
#### 1.1.0.196 alpha

*  核酸塩基の残基名によっては残基が正しく認識できない場合があったので，aliasに追加した．
*  GeomLineRendererの点線実装がおかしかったので修正．

#### 1.1.0.189 alpha

*  MTZファイルを二度読み込むとおかしくなるのを修正した．
*  Sharpで作成したMTZファイル（一部破損している）を読み込めなかったので，読み込めるように修正．

#### 1.1.0.187 alpha

*  MTZファイルを直接読み込めるようにした。MTZファイル中の指定のColumnを使ってフーリエ変換し、マップが計算されます。
*  MTZから作成したあるいはUnit cellをすべてカバーするマップについては、ユニットセル外についてもマップを表示できるようにした。（周期境界）
*  画面の視点を変更したときに、マップのレンダリングの中心点も自動的に移動されるようにした。（これはmapのレンダラーのオプションでauto updateをoffにするとoffになる）
*  Ribbonやチューブのレンダリングにメッシュを一部使用。
*  Mol structパレットで残基の並びがおかしくなることがあったので修正。
*  その他一部のbugfix

#### 1.1.0.175 alpha

*  MQO形式書き出し
*  メッシュという概念を導入．
*  MolSurf分子表面のレンダリングをメッシュで行うようにし高速化．
#### 1.1.0.162 alpha

* SetScriptColoringが正しく動かなかったのを修正
* PNG形式で書き出しでアンチエイリアシング時に正常に書き出されなかったのを修正。
#### 1.1.0.161 alpha

* Renderer invalidation時にDisplayListが正しく開放されず、メモリリークが起こっていたのを修正。
* TextRendererのfore/background色を指定するようにした。
* PictRendererの位置指定に、halign, valignを指定できるようにした。
* Viewのマウス操作で、ドラッグしていないのに勝手に画面が回ることがあったので修正（特にスクリプトの実行ダイアログでOKを押したときになぜかWM_MOUSEMOVEが送られてきて、勝手に画面が回っていた。原因不明）。

#### 1.1.0.158 alpha

* Renderer毎の剛体としての回転・併進アニメーションを可能にした。
* SeqTimerObj（順序タイマー）の実装。
* TimerObjにViewのスピンを実装
* TimerObj: 時間変化のモードを線形・二乗・４乗から選べるように。
* AVS Scalar Field形式を読み込めるようにした（for MEAD）。
* ElePotMapをMapMeshRenderer/MapSurfRendererと互換性があるようにした→等電位面表示が可能に。
* MolCoord以外がcurrent objectのときに、move-selection, torsion-residueモードに入ると落ちるのを修正した。
* MolCoordの指定部分からある範囲以内のDensityのみを表示できるようにした。（範囲以外はdensity=0にしているだけだが）
* TimerObjを作成、タイマーの実装
* PictObjにスクリプトのクリックハンドラーを設定できるようにした。
* FreeTypeを使ってアンチエイリアスした国際化文字列を出すテストコードを入れた（@PictObj）
* 内部では文字列を全てUTF-8を保持するようにした。国際化と効率を考慮すると、これがベストの方策か。

#### 1.1.0.149 alpha

* MoveSelToolがactiveな状態でUndo/Redoや部分削除をやるとおかしくなることがあったので修正
* Torsionの定義をxmlファイル(torsion_defs.xml)から読み込むようにし、データをResiTopparのプロパティーとして保持するようにした
* TorsionToolを実装した
* geomモジュールに任意のPNGファイルをテキスチャとして表示するためのPictObjとそれにまつわるクラス等を作成した

#### 1.1.0.144 alpha

* molmdl moduleを作る。
* MoveSelToolをQueから修正・移植。
* SymOpDBをQueの古い形式に戻す＋symop.datはon-demandで読込むよう実装。


#### 1.1.0.138 alpha

* DistLabelクラスに分子間距離測定ができないバグがあったので修正
* 暫定的に、角度・二面角を測定するUIをつける

#### 1.1.0.136 alpha

*  ActiveXコントロールで、Evalメソッドにより文字列で指定したスクリプトを実行できるようにした。
*  SecurityManagerを導入し、実行状態により一部の操作（外部プログラム実行、ファイル入出力関連等）を使用禁止するようにした。
*  ActiveXコントロールで、リモートのスクリプトも実行できるようにした。リモートスクリプトの実行時にはローカルファイルのアクセスやプロセス起動は禁止するようにした。
*  ファイル読み込みをバックグラウンドで行い、ダイアログでキャンセルできるようにした。
*  QScript:
    *  mark-sweep法でガベージコレクトするようにした。
    *  loop中のfunctionで例外が発生した場合，LoopInsts.hpp:22でassertion failedが起こっていたのを修正した。
    * 文法を変更し、クラスを定義できるようにした。（但し、コンストラクタの定義などはTODO）
    *  yield文を廃止し、<式>(arg1, ..., argn)形式で任意の関数オブジェクトを呼び出せるようにした。
*  PovRay書き出しの改善:
    * OpenGL画面のPerspective表示と、PovRayレンダリング時の表示が、厳密に同一になるようにした。
    * OpenGL画面表示のFogが、ある程度PovRayレンダリング時にも反映されるようにした。（Fogの表現式が違うので完全一致は無理）
    * PovRayファイルレベルでレンダラーごとに表示非表示を変更できるようにした。_show_XXXXを1に定義しているが、これを0にすることで非表示にできる。


#### 1.1.0.131 alpha

*  HistoryListの振る舞いを修正。ヒストリー中にあるものがappendされた場合（かつbIgnrDup==TRUEの場合）、それを除いた上でappendするようにした。
*  Mol以外がカレントの状態でGUIからsyntax selを実行すると落ちるのを直した。
Windowsのsetup scriptを生成するperlスクリプトperl/iss-version.plで改行エスケープを処理するようにした。（InnoSetupをversion upしたら改行がエスケープできなくなっていたため）

*  実際にDelPhi(linux)で書き出した，グリッドサイズが65以外のphimapで着色できるようにした
*  phimapの拡張子をpotからphiにした（DelPhiのdocumentationにそうあったから）

*  MolSelectionのキャッシュをグローバルではなく，MolCoordが所有するように変更（プロセス内に複数ワークスペースを置くための処置），名前をSelCacheMgrに変更
*  CnstrSelでAROUNDが使用するキャッシュをSelCacheMgrに統合
*  CnstrSelでBYRESがキャッシュを使用するようにして高速化

#### 1.1.0.127 alpha

*  MolSurfオブジェクトを平面で切り断面を生成するCutByPlaneを実装
*  CutByPlaneのGUI（Tools->Cut surface object）を追加
*  molsurfレンダラーで，デフォルトで面の裏側も描画されるようにした．
*  MolSurfオブジェクトのCutByPlane操作をUndoできるようにした．

#### 1.1.0.115 alpha

*  PDBのCRYST1レコードが正しく読めないようだったので，PDBFileReaderに外部ハンドラーをread()を呼び出すたびに登録しなおすようにした．
#### 1.1.0.114 alpha

*  Kabsch&Sanderのアルゴリズムに基づいて，二次構造を計算するルーチンを実装．
*  ファイル読込み時にオプションを設定できるようにした．（二次構造計算の有無・Alternate conformation, Anisotropic B factor, MODEL recordの読込み等）
*  Ribbonモデル表示時に，デフォルトでへリックス・シートが色分けされる
*  マウスのホイールでzoom/unzoomが可能に

#### 1.1.0.112 alpha

*  Bugfix: MSMSで作成した分子表面ファイルを読み込めるように修正した．

#### 1.1.0.111 alpha

*  xyz形式をよみこめるようにした．
*  SplineRendererとそのサブクラスで，残基番号が不連続になっていると落ちるバグを修正．
*  MainChainRendererとそのサブクラスで,pivot間距離がプロパティーautobreak以上の場合にsegmentを切るようにする．残基番号はsegmentの連続・不連続とは関係ないようにする．
*  SplineRendererとそのサブクラスで，末端のキャップの色が黒になるのを修正．
*  MRUファイルのリストが逆になっていたのを直す

#### 1.1.0.108 alpha

*  ActiveX control versionのCueMolを公開した．
*  Fileメニューに，最近使ったファイル(Recently Used Files)の項目を設けた．
*  sysconfig.xmlファイルのエンコーディングをUTF-8にした（日本語ファイル名があっても大丈夫になったはず）
*  分子の選択文法で，残基プロパティーで選択するrprop文を設けた
*  OutputWindow editboxで上キーを押すと落ちるのを直した

#### 1.1.0.97 alpha

*  PDBFileReaderで，バリンなどのgamma protonが水銀になってしまうのを改善
*  チェインでごまかして，複数モデル（ＮＭＲ等）に一応対応した
*  一部のOpenGLドライバーで，原子をクリックすると落ちる・画面が腐る等の問題点が改善された．
*  権限が低いユーザー（ゲストなど）でのインストール時にエラーメッセージを出さないようにした
*  QScript: break/continueで{} scopeを抜けるときに，正しくスコープ（dictionary）を破棄するようにする
*  atom IDで文法select出来るようにする(aid 10,20 aid 1:100など)

#### 1.1.0.92 alpha

*  Threadを使用するための初期実装
*  分子構造ツリーのパレット初期実装
*  LsqFit1Dlgで，selection editにhistory機能をつける
*  分子構造ツリーパレット・状態を保存するように
*  文法選択パレット・ヒストリーをつける
*  OpenGLを使うと、他のWindowのツールチップまでがおかしくなる←原因不明, WinXP SP2で解決，MFC側のバグ？
*  コピペの初期実装・他のアプリとの通信：他へのテキストでのペーストのみ対応
*  PDBFileWriterのPDB準拠改善
*  PDBFileReader MODELがある場合は，モデル１以外は無視
*  コピペと削除の実装
*  ツールバーを新しくする
*  Undo/Redoをツールバーに入れる・ドロップダウンボタンにする
*  権限が低いユーザー（ゲストなど）でのインストールを改善

### 1.0.0系統

#### 1.0.0.63

*  一部のOpenGLドライバーで，原子をクリックすると落ちる・画面が腐る等の問題点が改善された．

#### 1.0.0.62

*  一部のグラフィクスチップのOpenGL driverで，距離表示ラベルを表示させると落ちる問題点を回避．
*  分子重ねあわせdialogで，reference/movingで，"use current selection"/"直接選択文"を入力を混在出来なかったのを修正．

#### 1.0.0.61

*  大体のobject,rendererに関してsession file (*.que)へのdump/restoreを正しく行えるようにした．
#### 1.0.0.60 alpha

*  Queからmap surface renderer (電子密度の表面をsolid surfaceで描画)を復活
*  Unit cell/map mesh/map surface rendererの
property dialog (workspace paletteでrendererの項目を
ダブルクリックするとでるやつ)を追加．
#### 1.0.0.58 alpha

*  分子表面レンダラーの着色関連を強化．

#### 1.0.0.54 alpha

*  静電ポテンシャル表示周りのバグを修正
*  Preference dialogでUndoの制限を0にすることで，Undo/Redoを無効化できるようにした

#### 1.0.0.52 alpha

*  QScript (.qs)，Session dump file (.que)ファイルの関連付け，DnD読込みを出来るようにした．
*  Output window, Standard bar, Tool barの表示・非表示を制御できるようにした．
*  残基に原子がC alphaしかないような分子ファイルを正しく読込めないというバグを修正

#### 1.0.0.50 alpha

*  PNG書出し周りのバグ取り
*  Windowsでのファイル関連付け周りを実装．
関連付けはEdit->Preference dialogのFile associationの項目で
選ばれているものがCueMolに関連付けられます．
関連付けを外すと，一応元の関連付け（あれば）に戻るようになっているはず．

*  Drag and dropでファイルを読めるように．
*  PDBのANISOU recordを読むようにし，anisou rendererを作る(ORTEP風の異方性温度因子表示，デフォルトでは確率20%相当の楕円体で表示されます)

#### 1.0.0.45 alpha

*  (DONE) 同名のオブジェクトを作るだけで落ちるという重大なバグが．．．
*  (DONE) 分子の最小二乗重ね合わせ(LSQ fitting) GUIの改良
*  (DONE) Ribbon rendererのpropertyを設定するGUI追加
*  (DONE) Output windowのprompt edit boxでUP/DOWN keyでhistoryを使えるように

#### 1.0.0.42 alpha

*  (DONE) MapRendererのデバッグ
*  (DONE) NARendererのデバッグ

#### 1.0.0.41 alpha

*  (DONE) deserializeするとメモリリークが起こる（LColor）
*  (DONE) geom moduleのlineをstipple(点線)に対応させるコードを復活させた
*  (DONE) GeomObjの直列化
*  (DONE) 分子の最小二乗重ね合わせ(LSQ fitting)の簡易GUI

#### 1.0.0.39 alpha

*  (DONE) Initialize sessionで落ちる<-Objectを破棄する前にattachしているrenderersを明示的に破棄することで対処
*  (DONE) Perspectiveがおかしい
*  (DONE) QScript try節でexceptionが起こった場合にstack underflowが起こることがある
*  (DONE) QScript 正規表現を使えるようにする
*  (DONE) QScriptからファイル入出力が使えるようにする
*  (DONE) メニューのsave asが実装されていない


#### 1.0.0.38 alpha

*  (DONE) WheelCtrlを実装
*  (DONE) WheelによるView prop変更のPageを追加
*  (DONE) Module unload時に依存関係を見るようにした
*  (DONE) Object-->RendererへのMbObjEventをDisplayMgr経由で処理するのではなく直接Rendererに行くようにした．
*  (DONE) MbEventのListenerをstd::setに保持するようにした
*  (DONE) QScript 選択文法で，%{,%}で囲むよりも，se★,★ (★は任意の記号)に変更（元の書式も一応残す）
*  (DONE) hardware stereoを有効にする
*  (DONE) QScript 引用文字列で，中に変数への参照を埋め込めるように(文字列以外はtostr()が呼び出されるようにする)
*  (DONE) QScriptで書式化出力をできるようにする(printf)
*  (DONE) palibをuifw/winguiに移す

#### 1.0.0.36 alpha

* (DONE) QScript colorのHSB (特にhue周り) のメソッドがおかしい
* (DONE) Symmで同じ名前のSymm分子をオブジェクト化しようとすると，同名エラーとならずに落ちてしまう
* (DONE) RibbonRendererで，*_smoothが効いていない
* (DONE) RibbonRendererで，*_smoothのdeserializationハンドリング
* (DONE) アイコン化して終了すると，パレットがどっかに行ってしまうのを直す．
* (DONE) QScriptレンダラなどのプロパティをハッシュでも渡せるようにする
* (DONE) QScriptからscene書き出しができるようにする（オプション込みで）．
* (DONE) QScript 例外処理の実装
* (NOTE) 最適化オプションSSE命令を無効化（Pen3以前やathlonで動かなかったので）
