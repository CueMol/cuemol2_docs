[GUIのチュートリアル indexへ戻る](../../Documents/GUIのチュートリアル/)



## 分子の重ね合わせ
二つの分子を，できるだけ重なるように
（厳密には指定した各原子間の距離の二乗和が最小になるように）
移動することができます．
進化的に近縁の蛋白質同士を比較する場合などに便利です．

Version 1.0.0での実装では，どの原子とどの原子を重ねるかを
手動で正しく設定してやらなければなりません．
もともと配列が同じもの同士を重ね合わせるのは簡単ですが，
homologue同士などを配列アラインメント等から重ねあわせるのは，
少々骨が折れます．

### LSQ fittingダイアログで重ねる原子を指定して実行

まず例としてHuman p21 RasのGTP結合型（[1QRA](http://pdb.protein.osaka-u.ac.jp/pdb/cgi/explore.cgi?job=summary&pdbId=1QRA)）と
GDP結合型（[4Q21](http://pdb.protein.osaka-u.ac.jp/pdb/cgi/explore.cgi?job=summary&pdbId=4Q21)）
を重ね合わせてみます．

先ず，両者の構造をtrace rendererで表示させて，
見やすいように色も変えておきます．

![2ras](../../assets/images/Documents/GUIのチュートリアル/StepA5/2ras.png){ .on-glb }

さらに，Naviパレットやファイルの中身を直接見ることで，

-  重ね合わせる蛋白のchain名

-  重ね合わせる残基の番号

をチェックしておきます．今回の場合は
1QRA
:   chain A, residue Met1-His166

4Q21
:   chain 4, residue Met1-His166


です．

メニュー"Tool"→"Fit two molecules"で，LSQ fittingダイアログが表示されます．

![2ras_fitdlg1](../../assets/images/Documents/GUIのチュートリアル/StepA5/2ras_fitdlg1.png){ .on-glb }

まず，どちらを基準(reference)にして，どちらを動かすか(moving)にするかを決めます．
この例では，1QRAは固定して，4Q21を動かして重ねあわせを行うことにしますので，
上下それぞれの**Mol:**の横にあるドロップダウン・コンボボックスからオブジェクト名を
選んでください．

さらに，Reference, Movingとも，
ラジオボタンが**Selection(...)**を選択した状態にして，
エディットボックスに文字が入力できる状態にします．
そして，各エディットボックスに重ね合わせる部分を指定する**選択文**を入力します（選択文の文法に関しては[分子選択文のリファレンス](../../Documents/MolSelSyntax)参照）．

ここでは，上記で示したように
Reference
:   A.1:166.CA (chain A and residue 1:166 and name CA と同義）

Moving
:   4.1:166.CA (chain 4 and residue 1:166 and name CA と同義）


と入力しています．
そしてOKボタンを押すと最小二乗重ね合わせが実行されます．


![2ras_fit1](../../assets/images/Documents/GUIのチュートリアル/StepA5/2ras_fit1.png){ .on-glb }


さらに，Output windowには以下のようにr.m.s.d.(=root mean square deviation; 小さいほどよく重なっている)が表示されます．
```
LSQ fit> RMSD 1.466300
```

### 重ね合わせのエラー
最小二乗重ね合わせを実行する場合，当たり前ですが，両者の重ね合わせるべき原子が一対一に対応してなければなりません．
なので，もし選択文を間違えて，一対一に対応付けできない（つまり選択を評価した結果選ばれた原子の数がreferenceとmovingで違ってしまった）場合は，エラーになります．
```
LsqFit> Reference mol(4Q21[1]) nsel (78) != Fitting mol(1QRA[1]) nsel (227)
```
nselのあとの括弧の中の数がそれぞれ選択された原子の数で，それが違うので重ね合わせることができないということです．

あと，選択文が誤っていてもたまたま原子数が一致してしまった場合は，CueMol側では知る由もないので変な原子を対応させて無理に重ね合わせてしまいます．
こういう場合は大体r.m.s.d.値が変になったり，
結果が明らかに変になるのでわかると思います．

### Sel1/Sel2パレットで選択しておいて重ね合わせる
LSQ Fittingダイアログで選択文を記述して重ね合わせるのは，
インタラクティブに選択が実行できないので，
結構面倒です．

そこで，
普通にSel1/Sel2パレット等でreference/movingの原子をそれぞれ選択しておいて
重ね合わせることも可能です．

ここでは，GTP/GDP結合で構造が変わらない部分のみに対して重ねあわせを実行してみます．
全体を重ね合わせた結果を見ると，残基番号1〜29, 75〜166で重ね合わせればよさそうです．
Sel2パレットに***.1:29,75:166.CA**と入力し，1QRA，4Q21両者ともにこの選択を適用してやります．

![2ras_fit_selpal](../../assets/images/Documents/GUIのチュートリアル/StepA5/2ras_fit_selpal.png){ .on-glb }

具体的には，上図のように入力し，**Mol**コンボボックスで1QRAを選んで**select**ボタンを押し，同様に4Q21を選んでselectを押します．

このケースでは蛋白のchainがそれぞれ1つしかないのでこれでうまくいきますが，
大概はCA原子を持つ他のchainがあって残基番号がかぶっていたりするので，
reference/moving分子それぞれに選択文を指定してselectしてやる必要があるでしょう．

![2ras_2sel2](../../assets/images/Documents/GUIのチュートリアル/StepA5/2ras_2sel2.png){ .on-glb }

上図のように正しく選択されていることを確認したうえで，**Fit two molecules...**メニューを実行します．
今回はラジオボタンの**Use current selection**の方が選択されている事を確認し，
reference/movingの分子オブジェクトを指定してOKを押します．

![2ras_2sel2_fit](../../assets/images/Documents/GUIのチュートリアル/StepA5/2ras_2sel2_fit.png){ .on-glb }

Switch region以外はほとんど構造は同じようです．
r.m.s.d.値も非常に小さくなりました．
```
LSQ fit> RMSD 0.488393
```

### 注意点・問題点（バグ？）
重ね合わせるべき原子の対応付けですが，選択文に書いた残基の順に，それぞれ重ね合わせられているわけではありません．なので，

- reference: **resi 1:11,20:30**

- moving: **resi 20:30,1:11**

と書いても，

-  referenceの1〜11⇔movingの20〜30

-  referenceの20〜30⇔movingの1〜11

が重ねあわされるわけではありません．

-  referenceの1〜11⇔movingの1〜11

-  referenceの20〜30⇔movingの20〜30

が重ねあわされる結果となります．

原子の対応付けは，以下のような手順で行われます．
1.  選択された原子の集合を作成（reference, moving分子両方に対してそれぞれ作成される）
1.  各集合内で，以下の規則にしたがって原子を並び替える
  1.  チェイン名はアルファベット順(i.e. AよりBが後)
  1.  チェイン名が同じ場合，残基番号が小さい順(i.e. 1より2が後)
  1.  チェイン名，残基番号が同じ場合，原子名がアルファベット順(i.e. CAよりCBが後)
1.  並び替えた順番にしたがって，reference, moving分子内の各々の原子が対応付けられる

したがって，選択文をどういう表現で書いたとしても，結果として選択される原子の集合が全く同じなら，全く同じ原子を対応させて重ね合わせるようになるので，重ね合わせの結果も同じになります．


以上のような仕様のため，選択している原子のうち，一部の残基中に欠損している原子があると，意図しない対応付けになってしまう可能性があります．
（例えば，CA(Cα)，CB(Cβ)原子で重ね合わせようとしたとき，reference側の一部の残基のみ側鎖がCB以降かけている場合は，その残基から対応付けがずれてしまいます．）
