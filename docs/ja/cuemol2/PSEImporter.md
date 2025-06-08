[Documents](../../Documents)

## PyMOL session file の読み込み

CueMolでは，PyMOLからの移行ユーザーのためにPyMOL session file (pse file)を読み込むことが可能です．

メニュー「File」→「Open scene...」を実行すると表示されるOpen scene dialogにて，
ファイル形式からPyMOL Session (*.pse)を選びファイルを開くとpseファイルが読み込まれます．

### 対応状況

現在(2.2.1.349)の実装では，以下のfeaturesが正しく読み込まれるように実装されています．

*  分子座標と色<br />
ただし，色に関しては読み込んだpseをいったんqscとして保存した場合情報が失われる
*  Sticks representation
*  Spheres representation
*  Cartoon representation
*  Lines representation
*  Surface representation
*  Labels (ただし位置offsetは無視される)

今後，徐々に対応機能の拡充を行っていく予定です．