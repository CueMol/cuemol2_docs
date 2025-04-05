[GUIのチュートリアル indexへ戻る](../../Documents/GUIのチュートリアル/)|
[&lt;--前に戻る](../../Documents/GUIのチュートリアル/Step3)|
[次へ--&gt;](../../Documents/GUIのチュートリアル/Step5)



## 複数の分子の読み込み

さらに，他の分子を読み込んでみます(PDBファイルの読み込み参照)．ここでは例としてグルタミルtRNA合成酵素とtRNA(Glu)複合体の結晶構造を用いています
([PDBID: 1G59](http://pdbbeta.rcsb.org/pdb/explore.do?structureId=1g59))．
オブジェクト名は1G59に，Rendererはtraceにします．

![gui_step4_1g59](../../assets/images/Documents/GUIのチュートリアル/Step4/gui_step4_1g59.png){ .on-glb }

"trace"レンダラーでは，デフォルトでは上図のように蛋白質だとCA(α位炭素)原子，
核酸だとP(リン酸基のリン)原子のみが直線でつながれて，表示されます．

## "Workspace"パレット
現在CueMol上に読み込まれているオブジェクトの一覧は，
**Workspaceパレット**に表示されています（下図）．

![gui_step4_wspal](../../assets/images/Documents/GUIのチュートリアル/Step4/gui_step4_wspal.png){ .on-glb }

"Objects"カラムにはオブジェクト名が表示されていますが，
名前の左の"田"をクリックすると，そのオブジェクトにアタッチされているレンダラーが
展開されて表示されます（下図）．

![gui_step4_wspal2](../../assets/images/Documents/GUIのチュートリアル/Step4/gui_step4_wspal2.png){ .on-glb }

"R"の横に表示されているのがレンダラー名です（後述）．
"Type"カラムにはレンダラーのタイプ名が表示されています．
"0"レンダラーの型は"trace"であることがわかります．
ちなみに，レンダラー"(sel)"は選択を表示するためのレンダラーで，
分子を読み込むと勝手に作られます．

Typeの横のカラムには，目玉印がありますが，
これをクリックするとそのレンダラーの表示・非表示がトグルします．
オブジェクトのばあいは，そのオブジェクトの全レンダラーが表示・非表示になります．

さらにその隣には，丸印があるカラムがありますが，
丸がついているオブジェクトは**current object**(現在オブジェクト?)です．
多くの場合，（オブジェクトを指定するコンボボックスなどが無い場合ですが）
current objectが操作のdefaultのターゲットになります．
このカラムの丸印がついてない部分をクリックすると，そのオブジェクトが
current objectになります（ただし，rendererはobjectではないので，クリックしても無視されます）．

あと，View上でモデルをダブルクリックすると，
選択の副次的な効果として，
自動的にその分子のオブジェクトがcurrent objectになります
(シングルクリックでは変更されません)．

### オブジェクトの削除

次に，Workspaceパレットで"1G59"を選択した状態にして，
下の![gui_step4_delbtn](../../assets/images/Documents/GUIのチュートリアル/Step4/gui_step4_delbtn.png){ .on-glb }ボタンをクリックすると
そのオブジェクトが**削除**されます．

CueMolでは，削除したものは完全に消えてしまうわけではありません．
削除に関してそれほど神経質になる必要は無いでしょう．
間違って消してしまった場合は，メニューEdit--&gt;Undoで
取り戻すことが出来ます．

[&lt;--前に戻る](../../Documents/GUIのチュートリアル/Step3)|
[次へ--&gt;](../../Documents/GUIのチュートリアル/Step5)
