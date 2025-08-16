[Documents](../../Documents)
## Rendering with Edge Lines
From CueMol 2.2 onwards, you can perform rendering with edge lines (contour lines) using POV-Ray.

> ![01-edgelines-1](../../assets/images/cuemol2/EdgeLines/01-edgelines-1.png){ style="zoom: 0.5" .on-glb }   ![16-edgelines-2](../../assets/images/cuemol2/EdgeLines/16-edgelines-2.png){ style="zoom: 0.5" .on-glb }

### Specification by Renderer Style
In the Scene panel, you can easily turn renderer edge line display on/off by specifying the renderer style.

![edgelines-ui-2](../../assets/images/cuemol2/EdgeLines/edgelines-ui-2.png){ .on-glb }

The meaning of each item in the renderer's context menu is as follows:

No edge line
:   No edge lines. Default setting.

Edge line (normal)
:   Edge lines enabled, normal line thickness (0.06Å)

Edge line (thick)
:   Edge lines enabled, thick line thickness (0.15Å)

Edge line (thin)
:   Edge lines enabled, thin line thickness (0.03Å)

The thickness unit is in Å rather than pixels, so when you increase the image size during rendering, the lines will become proportionally thicker accordingly.


The thickness for each setting looks like the following:

*  Normal (0.06Å)<br/>
![05-edgelines-normal](../../assets/images/cuemol2/EdgeLines/05-edgelines-normal.png){ .on-glb }

*  Thick (0.15Å)<br/>
![04-edgelines-thick](../../assets/images/cuemol2/EdgeLines/04-edgelines-thick.png){ .on-glb }

*  Thin (0.03Å)<br/>
![03-edgelines-thin](../../assets/images/cuemol2/EdgeLines/03-edgelines-thin.png){ .on-glb }

Even when you change the settings, the display in Mol view does not change.
Please note that edge line settings only affect POV-Ray rendering output.

### POV-Ray Rendering
After changing the style as described above, perform POV-Ray rendering from Menu → "Render" → "POV-Ray rendering".

At this time, if you turn on the Edge lines checkbox and perform rendering, lines will be displayed according to the edge line settings.
(If you want to temporarily hide all lines, turn this off and perform rendering)

![07-edgelines-povrendui](../../assets/images/cuemol2/EdgeLines/07-edgelines-povrendui.png){ .on-glb }

<a id="rend_props"></a>
### Specification by Renderer Properties
If you want to make more detailed specifications than the style settings, configure edge line settings from the renderer properties.

All renderer property dialogs have an item called "Edge lines:" in the common tab.

![06-edgelines-proppage](../../assets/images/cuemol2/EdgeLines/06-edgelines-proppage.png){ .on-glb }

#### Edge Line Types
The meaning of each item in the drop-down menu next to "Edge lines:" is as follows:

None
:   No edge lines. Default setting.

Edges
:   Display edge lines

Silhouette
:   Display silhouette lines

The lines for each setting look like the following:

*  Edges (0.06Å)<br/>
![05-edgelines-normal](../../assets/images/cuemol2/EdgeLines/05-edgelines-normal.png){ .on-glb }

*  Silhouette (0.03Å)<br/>
![08-edgelines-silhouette](../../assets/images/cuemol2/EdgeLines/08-edgelines-silhouette.png){ .on-glb }

In the case of silhouette lines, lines are displayed only on the contour portions.

#### Edge Line Thickness
Specify in Å units. Please adjust by referring to the above figures for the relationship between values and visual appearance.

#### Color
Specify the line color. While black is commonly used, you can specify any color, such as white lines on a black background.

> ![09-edgelines-red](../../assets/images/cuemol2/EdgeLines/09-edgelines-red.png){ .on-glb } ![10-edgelines-green](../../assets/images/cuemol2/EdgeLines/10-edgelines-green.png){ .on-glb } ![11-edgelines-blue](../../assets/images/cuemol2/EdgeLines/11-edgelines-blue.png){ .on-glb }

### Edge Line Precision
How accurately edge lines are extracted and drawn depends greatly on the renderer's polygon subdivision count (detail value in properties).
The following figures show examples where the line thickness is 0.1Å, and the detail value of the ballstick renderer is increased from left to right: 2, 5, 10, 20.

> ![12-edgelines-det2](../../assets/images/cuemol2/EdgeLines/12-edgelines-det2.png){ .on-glb } ![13-edgelines-det5](../../assets/images/cuemol2/EdgeLines/13-edgelines-det5.png){ .on-glb } ![14-edgelines-det10](../../assets/images/cuemol2/EdgeLines/14-edgelines-det10.png){ .on-glb }  ![15-edgelines-det20](../../assets/images/cuemol2/EdgeLines/15-edgelines-det20.png){ .on-glb }

As shown above, the larger the detail value, the more beautifully and continuously the lines are drawn. Also, when the detail value is small, lines tend to become fragmented, and this becomes more noticeable with thinner lines. Therefore, especially when making lines thicker, it's better to be careful to increase the detail value.

In particular, while the default detail value for ballstick is 5, from the above examples, when the line thickness is 0.1Å, it can be seen that it would be better to increase it beyond the default value to 10 or more.
