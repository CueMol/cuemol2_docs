## Exporting Scenes to Image Files
Direct export of scenes to image files (PNG) can be performed through menu "Rendering" → "Export Scene...".

**Note**: If the OpenGL version is 3.0 or earlier, exporting to PNG files is not possible.

## Exporting in PNG Format
It is possible to directly export to PNG format image files (without rendering with POV-Ray, etc.). When you execute the menu, a save file selection dialog appears. In this dialog, set the file type to PNG and specify the file to export.

After that, the following settings dialog appears:

![png_export_opt](../../assets/images/cuemol2/ImageExport/png_export_opt.png)

The explanation of each setting is as follows:

Resolution
:   Specifies the image resolution in DPI (dots per inch).
However, though somewhat confusing, this value does not directly affect the actual size (in pixel dimensions) of the exported file. It affects the actual physical dimensions on paper when the PNG file is pasted into other software such as PowerPoint or Illustrator and printed.

Width
:   Specifies the width of the image. Units can be specified from the list on the right. Units other than pixels are linked to the Resolution setting above. When finally printing to paper, etc., it is convenient to set considering cm or mm units + the DPI above.

Height
:   Specifies the height of the image. The unit is always the same as Width.

Retain aspect ratio
:   Makes the aspect ratio of the image the same as the current View. That is, when ON, changing the Width value will automatically change the Height value (to maintain the ratio) and vice versa.

Transparent PNG
:   When ON, a PNG with transparent (alpha) channel is generated. The background is rendered to be transparent regardless of color. When OFF, a PNG file with RGB (24bit) per pixel is generated.

### Usage Example of Transparent PNG
For example, if you set the background to white, turn ON Transparent PNG and export, then paste into PowerPoint, text and other elements behind will show through transparently as shown below.
(However, since OpenGL does not properly display semi-transparency considering front-back relationships, the display may be incorrect if there are semi-transparent objects)

![transp_png_example2](../../assets/images/cuemol2/ImageExport/transp_png_example2.png){ style="zoom: 0.3" .on-glb }
