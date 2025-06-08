[Documents](../../Documents)
## Software updateの通知機能
CueMol2では，software updateの通知機能が有効になっていると，
ユーザが一定時間（10秒）まったく操作しない状況が続くと，
より新しいバージョンがリリースされているかどうかをwww.cuemol.orgに問い合わせます．
もし，より新しいバージョンがリリースされていると，以下のようなpopup windowが表示されます．


![update_notify1](../../assets/images/cuemol2/UpdateNotification/update_notify1.png)


ここで，Check!!ボタンを押すと現在OS側で設定されている
デフォルトのウェブブラウザーでCueMolのダウンロードページ(英語,
http://www.cuemol.org/en/index.php?Download
)が表示されますので，最新版をダウンロードしてインストールしてください．

一方，このpopup windowは，左上の×ボタンを押すと消すことができますが，
そのままだと次回起動時も毎回チェックが行われ，
通知popup windowが表示されます．
一方で，上記のDon't check for updatesにチェックを入れてからpopupを閉じると，
次回からはsoftware updateのcheckは行われません．

インストールした直後の状態では，
Software updateの告知機能が有効になっています．

このsoftware update checkは，メニュー「Help」→「Check for updates」で手動実行することができます．

### Config dialogでの設定
Update通知機能のon/offは，メニュー「Edit」→「Options」で表示されるOptions dialogからも変更可能です．


![update_config1](../../assets/images/cuemol2/UpdateNotification/update_config1.png){ style="zoom: 0.5" .on-glb }


上記Misc項目中の，Other settingsの中にある，"Disable software update checking"をONにすると，
updateの問い合わせを行わなくなります．