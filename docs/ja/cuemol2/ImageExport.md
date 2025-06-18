[Documents](../../Documents)
## シーンの画像ファイルへの書出し(Export)
シーンの画像ファイル(PNG)への直接書き出(export)しは，
メニュー「Rendering」→「Export Scene...」で行うことができます．

**注意**：OpenGLのversionが3.0以前だとPNGファイルへの書き出しができません．

## PNG形式で書き出す
PNG形式の画像ファイルに（POV-Ray等でレンダリングせずに）直接書き出すことが可能です．メニューを実行すると現れる，保存ファイル選択のダイアログで，ファイルの種類をPNGにしたうえで，書き出すファイルを指定してください．

その後，以下のような設定ダイアログが現れます．

![png_export_opt](../../assets/images/cuemol2/ImageExport/png_export_opt.png)

各設定の説明は以下の通りになります．

Resolution
:   画像の解像度をDPI(dot per inch)で指定．
ただし，ややわかりにくいですが，この値は，実際に書き出されるファイルの（ピクセルサイズでの）大きさには直接影響しない．PNGファイルをPowerPointやIllustratorなど他のソフトウェアに張り付けて印刷した場合の，紙上での実寸に影響．

Width
:   画像の幅を指定．右横のリストから単位を指定できる．pixel以外の単位は，上記Resolutionと連動している．最終的に紙などに印刷する場合はcmやmmの単位＋上記DPIも考慮して設定すると便利．

Height
:   画像の高さを指定．単位はWidthと常に同じになる．

Retain aspect ratio
:   画像の縦横の比が，現在Viewのものと同じようになるようにする．すなわち，ONになっていると，Widthの値を書き換えると連動してHeight値も（比を保つように）書き換わる．逆もまたしかり．

Transparent PNG
:   ONになっていると，透明（アルファ）チャネルを含むPNGが生成される．背景は色に関わらず透明になるようにレンダリングされる．一方でOFFになっていると，1 pixelあたりRGB (24bit)のPNGファイルが生成される．

### 透明PNGの使用例
例えば，背景を白にしたうえでTransparent PNGをONにして書き出し，PowerPointに張り付けると，以下のように，背後にある文字などが透けて見えるようになります．
（ただしOpenGLでは半透明はちゃんと前後関係を考えて表示されないため，半透明のオブジェクトがあると表示がおかしくなるかもしれません）

![transp_png_example2](../../assets/images/cuemol2/ImageExport/transp_png_example2.png){ style="zoom: 0.3" .on-glb }
