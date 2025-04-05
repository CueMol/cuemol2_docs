[Documents](../Documents)
## Multi-touch trackpadの使用方法
MacOS X (10.6以降)では，デバイス自体にもよりますがMulti-touch trackpadの機能が使用できるようになっています(古いMacBookなどでは使用できない)．

### 設定
アプリケーションメニュー→環境設定あるいはコマンド＋「，」のショートカットで，
環境設定ダイアログが表示されます．Mouse項目に以下のようなチェックボタンがありますが，これをONにしておくとMultitouch trackpadが使用できるようになります．


![multitouch-osx](../assets/images/cuemol2/MultiTouchPad/multitouch-osx.png)



### 動作
今のところ，動作の割り当ては以下の表のようになっています．
|Gesture|機能|備考|h
|2-Finger Drag Up/Down/Left/Right|視点の併進移動(Trans-X, Trans-Y)|Multitouchを有効にしていないと，Up/DownはZoom In/Outになる．|
|2-Finger Click|右クリック(context menu等)|Multitouchを有効にしていなくとも使用可|
|2-Finger Pinch|Zoom out||
|2-Finger Expand|Zoom in||
|2-Finger Rotate (Clockwise or Counter Clockwise)|Z(画面に垂直な軸)まわりに回転||
|3-Finger Swipe (left/right)|Slab sizeの変更|Lion以降ではうまく動作しない（代わりに3-finger dragで画面回転になる）|

2-Finger Dragでは，電子密度などの中心やViewパネルの中心座標値が視点の移動にすぐには追随しないですが，
他の操作（clickやdrag等）を行うと，更新されます．

### 2.0.0以前のバージョン
設定はMouseではなくMiscにあります．

設定を変更しても直ちに反映されず，Viewを新しく作るか，あるいは一度アプリを再起動する必要があります．

2-Finger Dragでは，電子密度などの中心が視点の移動に追随しないという問題点があります．

他のOSでも，上記同様の設定はありますが，機能しません．
