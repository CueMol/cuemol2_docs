## About Cartoon Display
This section explains the cartoon renderer introduced in version 2.0.1.171 and later.
The Cartoon Renderer is a protein-specific renderer that has the functionality to display:

*  Helices as cylinders
*  Sheets as plates
*  Coils as tubes

While the display is similar to the Ribbon renderer, unlike ribbons which basically pass through Cα atoms except for beta sheets by default, cartoon display is smoothed to emphasize only the molecular fold.
(However, it's also possible to force it to pass through by setting smooth values and anchors described later)

Below shows examples of cartoon (left) and ribbon (right) displayed for the same molecule with default parameter values.

> ![cartoon_cartoon1](../../assets/images/cuemol2/CartoonRenderer/cartoon_cartoon1.png){ .on-glb } ![cartoon_ribbon1](../../assets/images/cuemol2/CartoonRenderer/cartoon_ribbon1.png){ .on-glb }

#### Why Now?
This is a familiar display from PyMOL and Molscript, so you might wonder "why now," but **the characteristic of CueMol2's cartoon display is that more detailed options can be specified**.

Below, we explain the main properties.

## Helix Cylinder Display Options
### helix_smooth
Specifies the smoothness of cylinders in helix cylinder display as a real value.
The default is 3.0, which is quite linear, but:

*  Decreasing it approaches a spiral shape following Cα
*  Increasing it becomes almost linear

The figures below show helix_smooth values of 1.0, 2.0, and 4.0 from left to right.

> ![cartoon_helix_smooth_1](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_1.png){ .on-glb } ![cartoon_helix_smooth_2](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_2.png){ .on-glb } ![cartoon_helix_smooth_4](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_smooth_4.png){ .on-glb }

At 4 or higher, it's almost linear with little difference.
At 1 or lower, it becomes twisted.
Negative values and decimal values can also be specified, but the reasonable usage range is probably 2-4.

### helix_waver and helix_wsmooth
helix_waver (meaning helix width averaging) is true by default, and in this state, the cylinder thickness (width) becomes constant at the average value.

On the other hand, when set to false, the cylinder thickness changes according to how much the Cα atoms deviate from the cylinder centerline.

helix_wsmooth is a value effective only when helix_waver=false, specifying the smoothness of cylinder thickness.
Larger values make it smoother. The default is 5.0, which is almost the same as when helix_waver=true, but thickness changes appear by making it smaller.

The figures below show shapes when helix_wsmooth is changed to 0.0, 1.0, 2.0. (Other parameters fixed at helix_waver=false, helix_smooth=3.0)

> ![cartoon_helix_wsmooth_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_0.png){ .on-glb } ![cartoon_helix_wsmooth_1](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_1.png){ .on-glb } ![cartoon_helix_wsmooth_2](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wsmooth_2.png){ .on-glb }

The above fixes helix_smooth value at 3.0, but the appearance changes greatly depending on this value as well.

### helix_wplus
Depending on the structure, the coil part may protrude at the junction between helix cylinder and coil as shown in the figure.
In such cases, increasing helix_wplus increases the cylinder radius by that amount, so set it to hide properly.

The figures below show helix_wplus=0.0, 0.5.

> ![cartoon_helix_wplus_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wplus_0.png){ .on-glb } ![cartoon_helix_wplus_1](../../assets/images/cuemol2/CartoonRenderer/cartoon_helix_wplus_1.png){ .on-glb }

The default value is the same as the coil thickness of 0.2, and it's hidden in most cases, so you don't need to adjust it particularly. Also, it's possible to intentionally specify negative values for thin cylinder display.

## Sheet Display Options
### sheet_smooth
Similar to the helix case, specifies the smoothness of sheet display as a real value.
The default value is 3.0, set to capture the characteristics of sheet bending while being somewhat straight.

The figures below show sheet_smooth=-5.0, 0.0, 3.0. At -2 or below, it generally passes through Cα. At 3 or above, it becomes almost linear.

> ![cartoon_sheet_smooth_-5](../../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_-5.png){ .on-glb } ![cartoon_sheet_smooth_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_0.png){ style="zoom: 0.97" .on-glb } ![cartoon_sheet_smooth_3](../../assets/images/cuemol2/CartoonRenderer/cartoon_sheet_smooth_3.png){ style="zoom: 0.9" .on-glb }

## Coil Display Options
### coil_smooth
Similar to the helix case, specifies the smoothness of coil display as a real value.
The default value is -1.0, set to capture the characteristics of coil bending while providing a clean appearance.

The figures below show coil_smooth=-5.0, -2.0, -1.0, 0.0. At -2 or below, it generally passes through Cα. At 0 or above, it may deviate too much from actual Cα positions.

> ![cartoon_coil_smooth_-5](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-5.png){ .on-glb } ![cartoon_coil_smooth_-2](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-2.png){ .on-glb } ![cartoon_coil_smooth_-1](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_-1.png){ .on-glb } ![cartoon_coil_smooth_0](../../assets/images/cuemol2/CartoonRenderer/cartoon_coil_smooth_0.png){ .on-glb }

## Anchor Settings
When side chains are displayed with cartoon representation, since the main chain display doesn't pass through Cα positions, side chains appear to float in the air, which doesn't look good.

### anchor_sel Property
In CueMol2's cartoon display, it's possible to specify residues in the anchor_sel property to make it pass through Cα as much as possible.

Below shows a figure when anchor_sel is specified as A.76.* (residue at the tip of the loop in the figure) in the case of coil_smooth=-1 (default).

> ![cartoon_anchor_sel0](../../assets/images/cuemol2/CartoonRenderer/cartoon_anchor_sel0.png){ .on-glb } ⇒ ![cartoon_anchor_sel1](../../assets/images/cuemol2/CartoonRenderer/cartoon_anchor_sel1.png){ .on-glb }

In this way, anchors are effectively set for about 1 residue in loops or sheets, but with many residues, it becomes the same as when smooth values are made smaller, so if you want to pass through many Cα atoms, it's better to adjust smooth values.

## Limitations and Bugs

*  When displaying from the middle of secondary structure with selection, it may not display as intended. When doing partial display, it's better to adjust so it breaks at coil parts (planned to be fixed in the future)
