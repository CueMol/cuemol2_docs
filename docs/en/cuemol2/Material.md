## About Materials
In CueMol2, you can specify material (texture) in addition to color for 3D objects rendered by renderers.

Currently, materials are only supported during POV-Ray raytracing, and are ignored in real-time OpenGL display.

There are two types of materials: those that allow color specification and those where the color is determined by the material itself.
Currently there are only a few types of materials as shown below, but we plan to increase them or implement a UI for users to define their own materials.

### Material Types
#### Materials That Accept Color Specification
These are materials that can change texture while specifying color.
The materials defined in the system in Version 2.0.0.183 are as follows:

*  **default** Default texture, plastic gloss
*  **shadow** Shadow-like texture without "shine"
*  **matte** Matte finish texture
*  **spec_metal** Very high "shine" metallic texture
*  **diff_metal** Matte metallic texture

We plan to increase these or implement a UI for users to define their own materials.

#### Materials That Don't Accept Color Specification
The following materials of the type that ignore color specification are defined in the system:

* metallic_chrome Chrome metallic gloss
* metallic_copper Copper metallic gloss
* stone35 Stone-like pattern/texture
* wood31 Wood-like pattern/texture

These are defined at the system level, but are temporarily for testing and may change in the future.

### How to Specify Materials
#### Specification for Entire Renderer
In the renderer's property dialog (in the Common tab), there is a Material item as shown below.
You can specify materials by changing this value.
By default, it is empty (unspecified), and the default material (defined in [default_style.xml](../../cuemol2/Style)) is applied.

![material_propdlg3](../../assets/images/cuemol2/Material/material_propdlg3.png){ style="zoom: 0.75" .on-glb }

Change this value to shadow.
Since Material doesn't affect OpenGL rendering, the on-screen display doesn't particularly change, but when rendered with POV-Ray, it changes as follows:

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } → ![shadow-ribbon2](../../assets/images/cuemol2/Material/shadow-ribbon2.png){ .on-glb }

Shadow is configured to turn off all shading and just paint colors, which is why it displays this way.
(Since shadow has no highlights (shine), it's suitable for semi-transparent display overlaid with other objects.)

On the other hand, when applying a material that ignores color, such as metallic-chrome, it becomes as follows:

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } → ![metallic-ribbon2](../../assets/images/cuemol2/Material/metallic-ribbon2.png){ .on-glb }

Non-color-specifiable materials, especially metallic gloss materials, are affected by ambient lighting, so in the above example they appear dark. You'll need to devise solutions such as [exporting pov files](../../cuemol2/ImageExport) and adjusting light source specifications to brighten them.

#### Specification by Color
You can specify materials as modifiers when specifying colors.
Specifically, specify using the following format:
```
<color specification>{material: <material specification>}
```
Each specification goes inside the braces.
For example, to make the color yellow and material shadow:
```
yellow{material:shadow}
rgb(1,1,0){material:shadow}
#FF0{material:shadow}
```
(The above three are just different notation methods for the same pure yellow color).

An example actually applied to ribbon coloring is shown below:

> ![default-ribbon2](../../assets/images/cuemol2/Material/default-ribbon2.png){ .on-glb } → ![mixed-ribbon2](../../assets/images/cuemol2/Material/mixed-ribbon2.png)

This was rendered after changing the default secondary structure coloring from the Color panel as follows:

Sheet
:   SteelBlue → SteelBlue{material:stone35}

Helix
:   khaki → khaki{material:wood31}

Other (*)
:   FloralWhite → FloralWhite{material:metallic_chrome}

However, the background is set to white and the ribbon renderer's smooth color property is turned off.

The materials used above all ignore color, so the specification is meaningless, but some color must be specified or it will result in an error, so please specify an appropriate color.

![mixed-ribbon3](../../assets/images/cuemol2/Material/mixed-ribbon3.png){ style="zoom: 0.75" .on-glb }

As shown in the figure above, since the wood grain and stone patterns are fine, they're not very visible unless you zoom in considerably.
Texture sizes etc. can be modified by editing the material definitions in [default_style.xml](../../cuemol2/Style) (though POV-Ray knowledge is required).
We plan to create a mechanism for specifying user-defined materials in the future.
