## Cutting Molecular Surface Objects by Planes
CueMol2 can generate cross-sections of molecular surfaces similar to CueMol1.

In particular, compared to previous versions, it has become possible to generate cross-sectional polygon meshes using more enhanced algorithms.

### Creating Molecular Surfaces
First, load an appropriate molecular file.
(Here, we use a 1CRN file obtained from the PDB site.
For acquisition methods, see [Documents/GUIのチュートリアル(CueMol2)/Step1](../../Documents/GUIのチュートリアル(CueMol2)/Step1).)

Next, execute menu "Tools" → "Mol surface generation..." to create a molecular surface.
Since 1CRN is a small molecule, density is set to 3.

For details, refer to [cuemol2/MsmsMolSurface](../MsmsMolSurface.md).

![cbp_surf1](../../assets/images/cuemol2/MolSurfCut/cbp_surf1.jpg){ style="zoom: 0.5" .on-glb }

### Specifying the Cutting Plane
First, adjust the viewing direction, Z-direction translation of the viewpoint, and slab (see [GUI Tutorial](../../Documents/GUIのチュートリアル(CueMol2)/Step2)) to create a state where the molecular surface is cut by the slab and the inside is visible, as shown in the figure below.

![cbp_surf2](../../assets/images/cuemol2/MolSurfCut/cbp_surf2.jpg){ style="zoom: 0.5" .on-glb }

In the above figure, we deliberately set the slab to create a complex-shaped cross-section that CueMol1 could not calculate correctly.

### Executing the Cut
Next, execute menu "Tools" → "Mol surface cutter...".

![cbp_surf_dlg2](../../assets/images/cuemol2/MolSurfCut/cbp_surf_dlg2.png)

The meaning of each setting is as follows:

Target surface
:   Specifies the target molecular surface object to be cut.
Here, select sf_1CRN, which is the molecular surface object of 1CRN created above.

Cross section type
:   Specifies options such as whether to generate cross-sections, or whether to generate only cross-sections.
The following options are available:

    **Complete** Generate the cut surface object and cross-section as the same MolSurfObj
    **Separately** Generate the cut surface object and cross-section as separate MolSurfObjs (specify this if you want to color the cross-section and other parts differently)
    **Section only** Generate only the cross-section
    **No section** Generate only the cut surface object (creates a surface with holes without cross-sections)

Section mesh density
:   Specifies the density of triangular mesh generated for the cross-section.
The default is 5.0, but this is too fine, so set it to 1.0.
In most cases 1.0 is sufficient, but increase it if you want to generate fine mesh.
(Increasing it increases computational load and takes more time)

When you press OK, the MolSurf object is actually cut by the current slab cross-section.
However, immediately after pressing OK, it may overlap with the slab cutting and appear as if nothing happened on the screen.
In any case, by rotating or maximizing the slab, you can confirm that it has been cut as shown in the figure above.

![cbp_surf3](../../assets/images/cuemol2/MolSurfCut/cbp_surf3.jpg){ style="zoom: 0.5" .on-glb }
![cbp_surf4](../../assets/images/cuemol2/MolSurfCut/cbp_surf4.jpg){ style="zoom: 0.6" .on-glb }

The left shows the state after cutting, and the right shows the mesh in wireframe display.
As shown, even in cases where normal cross-sections could not be generated in the previous version, correct cross-sections are generated.
Also, since the triangular mesh of the cross-section becomes uniform, cross-section coloring has become smoother.

### Saving Cut MolSurf Objects
When saving the scene, the molecular surface object in its cut state is embedded and saved in the qsc file.

### Important Notes
Still, if you cut with a plane that interferes with a previously cut surface, an error occurs and cross-section generation is not performed (errors occur when the cutting plane contains straight lines).

In some cases CueMol may crash (we apologize...), so it's better to save the scene before performing cross-section generation.
