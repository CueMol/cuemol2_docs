[Documents](../../Documents)
## About Ribbon Display
A protein-specific renderer that represents the main chain of proteins and polypeptides in ribbon form using spline curves.

It has the functionality to display:

*  Helices as ribbons
*  Sheets as plates
*  Coils as tubes

Various properties are available, making it possible to change and adjust the display.

For proper ribbon display, secondary structure must be assigned to the protein molecule.
Secondary structure is usually assigned automatically when reading files, so there's no particular need to worry about it.
However, if you want to change it as desired or manually reassign it, refer to [cuemol2/Prot2ndryStr](../../cuemol2/Prot2ndryStr).

Also, when creating a ribbon renderer for non-protein chain polymers such as RNA and DNA, it simply becomes a tube-like display similar to the [tube renderer](../../cuemol2/TubeRenderer).

## Changing Display with Simple Style Specification
Simple style specification allows you to easily configure commonly used ribbon display settings.

For the concept of styles, refer to [cuemol2/Style](../../cuemol2/Style).

In the Scene panel, right-click on the ribbon renderer to display the context menu, and when you select style, a list of simple styles is displayed as a menu.
When you select a menu item, the style is applied to the corresponding ribbon renderer and the display changes.

Default
:   Default ribbon display settings. Coils are thick tubes, and helices and sheets are plate-like ribbons with square cross-sections. (left figure below)

Fancy1
:   Molscript-style ribbon display settings. The inside of helices and the sides of sheets are painted in whitish colors. The cross-section of helices becomes dumbbell-shaped. (center figure below)

Round
:   Coils are thin tubes, and helices and sheets are round ribbons with elliptical cross-sections. (right figure below)

> ![01-style-default-1](../../assets/images/cuemol2/RibbonRenderer/01-style-default-1.png){ style="zoom: 0.5" .on-glb } ![02-style-fancy1-1](../../assets/images/cuemol2/RibbonRenderer/02-style-fancy1-1.png){ style="zoom: 0.5" .on-glb } ![03-style-round-1](../../assets/images/cuemol2/RibbonRenderer/03-style-round-1.png){ style="zoom: 0.5" .on-glb }

## Detailed Settings by Properties

The following explains the main properties and their setting GUI.

<a id="common_settings"></a>
### Common Settings (Common Tab)

Section detail
:   Specifies the number of polygon divisions in the cross-sectional direction. Larger values result in finer divisions and better display quality, but drawing speed decreases.

Axial detail
:   Specifies the number of polygon divisions in the chain direction. Larger values result in finer divisions and better display quality, but drawing speed decreases.

Smooth color
:   When colors differ between adjacent residues, if ON, the coloring between residues becomes gradated (left figure below). If OFF, the color changes at the center (right figure below).

> ![05-prop-smoothcolor-2](../../assets/images/cuemol2/RibbonRenderer/05-prop-smoothcolor-2.png){ style="zoom: 0.5" .on-glb } ![04-prop-smoothcolor-1](../../assets/images/cuemol2/RibbonRenderer/04-prop-smoothcolor-1.png){ style="zoom: 0.5" .on-glb }

Pivot atom name
:   Specifies the name of the atom through which the ribbon or tube should pass. For proteins, the default is CA (Cα carbon atom), and usually doesn't need to be changed.

Start/End type
:   Specifies the shape of the terminals. Specifying sphere makes them spherical (left figure below), flat makes them flat (center figure below). Specifying none means terminal polygons are not generated, resulting in hole-like openings (right figure below).

> ![06-prop-cap-sphere-2](../../assets/images/cuemol2/RibbonRenderer/06-prop-cap-sphere-2.png){ style="zoom: 0.7" .on-glb } ![07-prop-cap-flat-2](../../assets/images/cuemol2/RibbonRenderer/07-prop-cap-flat-2.png){ style="zoom: 0.7" .on-glb } ![08-prop-cap-none-2](../../assets/images/cuemol2/RibbonRenderer/08-prop-cap-none-2.png){ style="zoom: 0.7" .on-glb }

Also, Basic settings and Edge lines are common setting items found in other renderers. For Edge lines, refer to [cuemol2/EdgeLines#rend_props](../../cuemol2/EdgeLines#rend_props).

### Helix Settings (Helix Tab)
<a id="helix_section"></a>
#### Helix Section
Settings related to the shape of the cross-section of helix portions.

Type
:   Specifies the type of cross-sectional shape.<br/>
From left in the figure below: **Elliptical** (elliptical), **Rectangle** (square), **Round rectangle** (rounded square), **Fancy** (dumbbell-shaped)<br/>
![10-prop-hsectype-oval-2](../../assets/images/cuemol2/RibbonRenderer/10-prop-hsectype-oval-2.png){ .on-glb }
![09-prop-hsectype-rect-2](../../assets/images/cuemol2/RibbonRenderer/09-prop-hsectype-rect-2.png){ .on-glb }
![11-prop-hsectype-rrect-2](../../assets/images/cuemol2/RibbonRenderer/11-prop-hsectype-rrect-2.png){ .on-glb }
![12-prop-hsectype-fancy-2](../../assets/images/cuemol2/RibbonRenderer/12-prop-hsectype-fancy-2.png){ .on-glb }

Back color
:   You can specify and change the color of the inside of helices as shown in the figure below. If Off, no color is specified and both inside and outside are the same color. Default is off.<br/>
![13-prop-hsecbackcol](../../assets/images/cuemol2/RibbonRenderer/13-prop-hsecbackcol.png){ .on-glb }

Width
:   Specifies the thickness of helices. Unit is Å.

Tuber
:   Specifies the width of helices. Specified as a multiple of Width.

Sharpness
:   Meaning differs depending on Type.<br/>
**When Type=Round rectangle**: Specifies how rounded the corners of the rectangle are. Setting to 1 results in a nearly angular shape, but closer to 0 gives a more rounded shape.<br/>
**When Type=Fancy**: Specifies the size of the circles at both ends of the dumbbell shape. Values close to 0 make the thickness thinner and create a more pronounced edge shape (left figure below; value=0), but approaching 0.5 gives a shape closer to Round rect (center figure below; value=0.5). Values above 0.5 result in a shape like the right figure below (value=0.75) (difficult to explain).<br/>
![14-prop-hsecsha1](../../assets/images/cuemol2/RibbonRenderer/14-prop-hsecsha1.png){ .on-glb }
![15-prop-hsecsha2](../../assets/images/cuemol2/RibbonRenderer/15-prop-hsecsha2.png){ .on-glb }
![16-prop-hsecsha3](../../assets/images/cuemol2/RibbonRenderer/16-prop-hsecsha3.png){ .on-glb }

Smoothness
:   At 0, helices become curves that pass through the positions of pivot atoms (default is Cα atoms), but below that, they become smoother curves that don't pass through pivot atoms. (Strictly speaking, this setting is not related to cross-sectional shape, but is included here for convenience)

#### Helix Head
Settings related to the shape of the helix termination (head) portion.

Type
:   Type of shape.<br/>
Specify Round (smooth connection; left figure below), Flat (discontinuous; center figure below), Arrow (arrow-shaped; right figure below)<br/>
![17-prop-hhead-type1](../../assets/images/cuemol2/RibbonRenderer/17-prop-hhead-type1.png){ .on-glb }
![18-prop-hhead-type2](../../assets/images/cuemol2/RibbonRenderer/18-prop-hhead-type2.png){ .on-glb }
![19-prop-hhead-type3](../../assets/images/cuemol2/RibbonRenderer/19-prop-hhead-type3.png){ .on-glb }<br/>
It would be rare to make the terminal of a helix arrow-shaped.<br/>
For Arrow-related settings, refer to the later "Sheet Settings (Sheet Tab)".

Power
:   Specifies the smoothness of connection.<br/>
The figure below shows changes when Type is round and values are changed to 1, 1.5, 3 (for round, specifying values of 1 or less is meaningless).<br/>
![20-prop-hhead-pow1](../../assets/images/cuemol2/RibbonRenderer/20-prop-hhead-pow1.png){ .on-glb }
![21-prop-hhead-pow2](../../assets/images/cuemol2/RibbonRenderer/21-prop-hhead-pow2.png){ .on-glb }
![22-prop-hhead-pow3](../../assets/images/cuemol2/RibbonRenderer/22-prop-hhead-pow3.png){ .on-glb }

Arrow height
:   Only effective when Type is arrow. Specifies the height of the Arrow. Refer to the later "Sheet Settings (Sheet Tab)".

Arrow width
:   Only effective when Type is arrow. Specifies the width of the Arrow. Refer to the later "Sheet Settings (Sheet Tab)".

#### Helix Tail
Settings related to the shape of the helix start (tail) portion.

The content is exactly the same as Helix Head, but is applied to the start portion of helices.

### Sheet Settings (Sheet Tab)
There are similar setting items to those for helix settings.
The meaning of each setting is mostly the same as for helices, so refer to the previous section "Helix Settings".

The following explains only settings that have different meanings for sheets or settings that require attention.

Back color
:   For sheets, not the back surface color, but the side surface color changes to the specified color.<br/>
![29-prop-sheet-bkcol](../../assets/images/cuemol2/RibbonRenderer/29-prop-sheet-bkcol.png){ .on-glb }

Smoothness
:   For sheets, 0 causes too much undulation, so the default is 0.5 (resulting in extended β-sheets). However, when displaying side chains, etc., 0.5 makes side chains appear to float, so it's better to change to 0.<br/>
![23-prop-shead-smo1](../../assets/images/cuemol2/RibbonRenderer/23-prop-shead-smo1.png){ .on-glb }
![24-prop-shead-smo2](../../assets/images/cuemol2/RibbonRenderer/24-prop-shead-smo2.png){ .on-glb }
![25-prop-shead-smo3](../../assets/images/cuemol2/RibbonRenderer/25-prop-shead-smo3.png){ .on-glb }

Arrow settings
:   Setting Type in SheetHead settings to Arrow makes the tip of β-sheets arrow-shaped (it would be rare to make SheetTail (terminal) arrow-shaped).<br/>
In this case, the Power value in SheetHead settings affects the sharpness of the arrow tip. The right figure below is 0.5, center is 1, left is 2.<br/>
![26-prop-shead-pow1](../../assets/images/cuemol2/RibbonRenderer/26-prop-shead-pow1.png){ .on-glb }
![27-prop-shead-pow2](../../assets/images/cuemol2/RibbonRenderer/27-prop-shead-pow2.png){ .on-glb }
![28-prop-shead-pow3](../../assets/images/cuemol2/RibbonRenderer/28-prop-shead-pow3.png){ .on-glb }

Arrow width
:   Specifies the width of the arrow tip portion (see figure below). At 100%, the arrow width becomes three times the width of the sheet body, and at 0%, the width becomes the same as the sheet body width (= no arrow tip portion).

Arrow height
:   Specifies the height of the arrow tip portion (see figure below). Decreasing the value decreases the height of the arrow tip portion.<br/>
![30-prop-shead-arrow](../../assets/images/cuemol2/RibbonRenderer/30-prop-shead-arrow.png){ style="zoom: 0.5" .on-glb }

### Coil Settings (Coil Tab)
Since coil portions don't have the concept of Head/Tail, there are only setting items related to Section (cross-sectional shape).
The meaning of each setting is the same as for helices.
Refer to the Section portion of the previous section "Helix Settings".
