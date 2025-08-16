## Creating Sophisticated Figures by Editing POV-Ray Files Output from CueMol

While the tutorial
[Step6 Using POV-Ray](../Documents/QScriptのチュートリアル/Step6)
explained the minimum functions necessary to create figures,
here we will explain more advanced techniques from the perspectives of:

*  Creating figures with a unified feel
*  Changing material qualities
*  Making objects semi-transparent

including some esoteric functions that you normally wouldn't think to use.

### Figure Creation Procedure
When creating figures for papers or presentations with CueMol & QScript,
you generally work in cycles following these steps:

1.  Prepare source structure files etc.
1.  Describe scenes using QScript
1.  Edit POV-Ray (.pov) files
1.  Render with POV-Ray
1.  Process with image software

Here we'll explain steps 2-4 in detail, particularly step 3.

### Color Specification in CueMol
When you plan to edit pov files later,
you don't need to specify concrete colors at the CueMol & QScript stage.
This is because you can change colors when setting materials in the pov file.
However, parts of the same renderer with the same color specified
cannot be assigned different colors at the pov file stage.
You should assign some **distinguishable colors** anyway,
and specify materials for each color later.

Furthermore, for papers and presentations, you often need to create
multiple figures of the same molecule with different displayed parts.
In such cases, you want to use consistent coloring across all figures.
**Create a separate script file that defines colors**,
and use the sys.exec() method
([see QScript reference](http://cuemol.sourceforge.jp/manual-ja/))
at the beginning of individual script files to import the definitions.
When you want to change the color of a certain part, you only need to edit one place.

### Using include to Import texture etc. Definitions
In the tutorial
[Editing pov files output from CueMol](../Documents/QScriptのチュートリアル/Step6#content_1_2),
we explained the structure of pov files output from CueMol.

In that example, we defined our own materials and used plastic-like and metallic examples,
but POV-Ray comes with abundant material libraries,
so there's no reason not to use them.

To use these, use include statements at the beginning of the pov file (but must be after the version statement):
```
#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"
```
colors.inc defines commonly used colors,
and metals.inc, woods.inc, stones.inc define
materials/textures for metal, wood, and stone.

There are various other inc files,
but please refer to POV-Ray documentation etc.

### Creating Your Own inc Files
As already mentioned, when creating multiple figures, using
consistent colors, materials, and textures throughout makes them easier to understand.
For example, it's convenient to define materials for protein ribbon models,
materials for displaying residue side chains in ball & stick, etc.
in your own inc files.

```
#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"
```

```
#declare tex_of_hsc = texture {P_WoodGrain1B}
#declare tex_of_ligand = texture {
finish { ambient 0.10 diffuse 0.70 specular 0.60 roughness 0.01}
}
#declare tex_of_resid = texture {finish{F_MetalA}}
#declare tex_of_map = texture {
  finish {ambient 0.10 diffuse 0.78 specular 0.02 roughness 0.05 brilliance 1.50}}
```
Save this as "materials.inc"
and reference it from individual pov files.
Here are explanations for each:

tex_of_hsc
:   Texture and material for ribbon models.
While it should look wood-like, when used together with pov/inc files output by CueMol,
the color gets changed and doesn't look very wood-like.

tex_of_ligand
:   Texture and material for ligands.
Results in plastic gloss similar to the default material output by CueMol.

tex_of_resid
:   Texture and material for use when displaying residue side chains in ball & stick etc.
Matte metallic gloss.

tex_of_map
:   Texture and material for electron density.

### Editing pov Files
Here we'll use the pov file created from **blm_ribbon5.qs**
in the sample files from
[Step4 Displaying Interactions](../Documents/QScriptのチュートリアル/Step3)
as an example (unedited pov file output by CueMol: ![blm_ribbon](../assets/images/POVRay1/blm_ribbon.pov){ .on-glb }).
In this example, proteins are displayed in ribbon model and ligands in stick model.

The protein ribbon model has 6 different colors set for
sheet, helix, and coil of a/b molecules respectively. Also, the default plastic gloss
is specified as texture.
```
#declare _blm_ab_p_tex = texture {
  normal {granite 0.0 scale 1.0}
  finish {
   ambient 0.10
   diffuse 0.70  brilliance 1.00
   specular 0.30  roughness 0.0050
  }
 }
#declare _blm_ab_p_col0 = <0.501961,1.000000,1.000000,0.000000>;
...
#declare _blm_ab_p_col5 = <1.000000,0.749020,0.501961,0.000000>;
```

```
#declare _blm_ab_blm_tex = texture {
...
```
For example, by changing the definition of this _blm_ab_p_tex,
we change the ribbon's material. Here we change it to the previously defined tex_of_hsc.
```
#declare _blm_ab_p_tex = tex_of_hsc
```
Colors can also be changed at this point by modifying _blm_ab_p_col0~5.
We also change the ligand texture:
```
#declare _blm_ab_blm_tex = tex_of_resid
```

### Rendering with POV-Ray
Next, we'll explain the procedure for rendering the modified file
with POV-Ray Windows version (ver3.6).

First, since the default ini file has incorrect image aspect ratios,
you need to create an ini file.
Start POV-Ray and execute menu "Render"→"Edit Settings/Render" to display a dialog.

![povray-inisettings](../assets/images/POVRay1/povray-inisettings.png){ .on-glb }

Use the "Browse" button in the middle of the dialog
to select the "quickres.ini" file from the displayed file dialog,
then press the "Edit" button to display its contents in an editor.
Since the default entries don't have square aspect ratio definitions,
use the editor to add the following new entry:
```
[500x500, AA 0.3]
Width=500
Height=500
Antialias=On
Antialias_Threshold=0.3
```

Execute menu "Render"→"Edit Settings/Render" again to
display the ini file settings dialog,
confirm that "quickres.ini" is selected in the Name field,
select the entry you just created (500x500 something) from Section:,
and press the Render button to start rendering.

![blm_ribbon_c](../assets/images/POVRay1/blm_ribbon_c.png){ .on-glb }

Edited pov file that rendered this image: ![blm_ribbon_c](../assets/images/POVRay1/blm_ribbon_c.pov){ .on-glb }

It looks a bit dark. In such cases,
you could adjust brightness and contrast in Photoshop etc.,
but it's better to change the light source settings in the pov file.
```
light_source {<_stereo*_distance*0.05,0,_distance> color rgb <1,1,1>}
light_source {<-1,1,1>*_distance color rgb 0.7 shadowless}
```
In CueMol's default output, the brightness of the above shadowless light source is 0.5,
but this is quite dark. You can set it to 1 or higher,
so try changing it and rendering various settings.

### Making Things Transparent
Next, let's make some parts semi-transparent.
```
#declare _blm_ab_p_col0 = <0.501961,1.000000,1.000000,0.85>;
```
In the ribbon model color definition, change the transparency from 0 to 0.85.

![blm_ribbon_tp](../assets/images/POVRay1/blm_ribbon_tp.png){ .on-glb }

You can see that all the coil parts of one subunit became semi-transparent.

Since all parts with the same color change together,
for cases where "you want to change transparency later even for parts with the same color,"
use the technique of **deliberately using different colors**
and then **changing them to the same color with different transparency**
when editing the pov file.

### Semi-transparent Ball & Stick Models
On the other hand, trying to make stick models semi-transparent using the same method
doesn't work very well.

![blm_ribbon_tp2](../assets/images/POVRay1/blm_ribbon_tp2.png){ .on-glb }

Since stick models are made of combinations of cylinders and spheres,
when made semi-transparent, spheres inside become visible through bends and tips,
making them look quite ugly.
This is because in the inc files output by CueMol, spheres and cylinders are
combined with union statements (actually all objects in the inc file are combined with union).

If you combine them with merge statements instead, POV-Ray will strictly determine
object intersections and not render internal surfaces.
Edit the inc file to enclose the parts with cylinder and sphere statements
with new merge{...}.
```
merge { // <-- added
cylinder{<-7.880457, 0.385846, 0.826740>, <-8.656734,
...
} // <-- added
} // union
```
Since it's very difficult to tell which parts of CueMol's output inc files
correspond to which renderers, this method might be easier:

1.  Display only the stick model you want to make semi-transparent
1.  Output pov/inc files
1.  Replace union with merge in those files

In this case, you need to write the pov file to
import the stick model inc file.
```
#declare _scene2 = #include "<stick model inc file>"
object{
  _scene2
}
```
Rendering this way makes everything properly semi-transparent as shown below:

![blm_ribbon_tp3](../assets/images/POVRay1/blm_ribbon_tp3.png){ .on-glb }

However, note that using merge statements slows down rendering
due to intersection calculations.

### Texture Blending
From the methods described above, you can see that
**color and semi-transparent gradients/blends** can be done freely.
Color blending is used in parts where colors change smoothly,
such as at secondary structure boundaries in ribbon models.

Here we'll explain how to perform **texture blending**.
For example, you can create rendering where ribbon parts have wood texture
and coil parts have metallic gloss.

To perform texture blending, you first need to specify
the "texblend" option when exporting the scene to pov/inc files.
Since this option setting cannot be done from the GUI, execute the following script
```
gfx.writeScene("<desired output filename>", "pov", {texblend=>true});
```
from the QScript prompt (edit box at the bottom of the Output window),
or create a separate qs file and execute it.

Here's part of a pov file created with the above method:
```
#declare _blm_ab_p_tex = texture {
...
 }
#declare _blm_ab_p_tex0 = texture{ _blm_ab_p_tex pigment{color rgb <0.501961,1.000000,1.000000>}};
...
#declare _blm_ab_p_tex5 = texture{ _blm_ab_p_tex pigment{color rgb <1.000000,0.749020,0.501961>}};
```
While normal output had color definitions separated into 0~5,
here they are separated as texture definitions.
That is, by changing _blm_ab_p_tex0~5, you can independently set
textures for sheet, helix, and coil parts.
Also, since pigment overwriting is not performed in the inc file,
textures like wood and marble are correctly reflected.

Here we rewrite _blm_ab_p_tex3~5 as follows and render:
```
#declare _blm_ab_p_tex3 = texture{ T_Chrome_4D };
#declare _blm_ab_p_tex4 = texture {T_Stone35};
#declare _blm_ab_p_tex5 = texture {T_Wood31};
```
tex3, 4, 5 correspond to coil, helix, and sheet parts respectively,
becoming chrome metal, stone, and wood textures respectively.

![blm_ribbon_txb](../assets/images/POVRay1/blm_ribbon_txb.png){ .on-glb }

Hmm, this looks pretty garish.
If you submitted a paper with something like this, you'd probably get rejected immediately :smile:.
