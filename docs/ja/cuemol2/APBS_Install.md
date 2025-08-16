## APBSとPDB2PQRのインストール

CueMol2からAPBS(http://www.poissonboltzmann.org/
)を使って，
まあまあある程度は手軽に静電ポテンシャルマップを計算することができます．

このページでは，静電ポテンシャルマップの計算に使用するAPBSとPDB2PQRのインストール方法について説明しています．

## Windowsの場合

CueMol 2.1.0以降のAPBS付属版(Windows版のみ)では，CueMolインストール時にAPBSもPDB2PQR簡易版もインストールされるので，特にユーザーが何かしらする必要はありません．

[静電ポテンシャルマップの計算](../../cuemol2/APBS_ElePot)に進んでください

## MacOS Xの場合
CueMol 2.2.3.434以降ではAPBとPDB2PQRが付属しているので，特にユーザーが何かしらする必要はありません．

[静電ポテンシャルマップの計算](../../cuemol2/APBS_ElePot)に進んでください


### APBSのinstall
MacOS Xの場合は，
Sourceforgeの[APBSのサイト](../../https://sourceforge.net/projects/apbs/files/apbs/)からダウンロードします．

現在(2014/8)の最新版は1.4.1ですが，

*  https://sourceforge.net/projects/apbs/files/apbs/apbs-1.4.1/

にある，APBS-1.4.1-binary.dmg
というのをダウンロードしてください．

その後，dmgファイルをダブルクリックで開き，出てきたAPBSアイコンをApplication等にコピーしてインストールしてください．

### pdb2pqrのinstall
静電ポテンシャルを計算するには，
分子中の各原子に電荷（部分電荷）を割り当てる必要があります．
あと，元になるpdbファイル中にはたいてい水素原子がないので，
水素原子も生やしてやる必要があります．
NやOについている水素原子はプラスチャージを持っているので，
ちゃんと静電ポテンシャルを計算するには，これは結構重要です．

電荷を割り当てたり水素を生やしたりするには，
pdb2pqr (http://www.poissonboltzmann.org/
)を使うのがベストです．
（CueMol自体に電荷を割り当てる機能があるにはあるのですが，pdb2pqrを使った方が良いです．）


MacOS Xの場合は，
Sourceforgeの[PDB2PQRのサイト](../../https://sourceforge.net/projects/pdb2pqr/files/pdb2pqr/)
からダウンロードします．

現在(2014/8)の最新版は1.9.0ですが，

*  https://sourceforge.net/projects/pdb2pqr/files/pdb2pqr/pdb2pqr-1.9.0/

にある，pdb2pqr-osx-bin-1.9.0.tar.gz
というのをダウンロードしてください．

その後，ダウンロードフォルダにあるtar.gzファイルをダブルクリックすると展開され，

> pdb2pqr-osx-bin-1.9.0

というフォルダが同じ場所（ダウンロードフォルダ）できます．
これを適当な場所（例えば/Application）に移動してください．


## 使用方法
以上が完了したら，
[静電ポテンシャルマップの計算](../../cuemol2/APBS_ElePot)に進んでください．