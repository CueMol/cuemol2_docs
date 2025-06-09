[FrontPage](../../en/FrontPage)
### Series 2.2.3
#### Version 2.2.3.443

*  Implemented SDF format molecule file reader
*  Implemented MOL2 format molecule file reader
*  FIXED: Composite renderers are not shown in the renderer-selection dialog opened from PDB-fetch menu.
*  FIXED: Atoms becomes unclickable after doing ssm-superpose

#### Version 2.2.3.437

*  Edge lines now become (semi)transparent according to the color of the belonging triangle edges. This enables "segment end fadeout" display of the ribbon and cartoons with edge lines.
*  Error in the "Mol Superpose" dialog of auto-recenter checkbox is fixed.

#### Version 2.2.3.434

*  APBS and PDB2PQR are now also bundled in the MacOSX release.
*  Multi-gradient coloring for isosurf and molsurf renderers was implemented.
*  GUI for editing the multi-gradient coloring was implemented.(cuemol2/MultiGrad)
*  GUI for changing the grid spacing of FFT to arbitrary number was implemented in the MTZ file reader dialog.
*  Mol surface cutter was improved to allow cutting by multiple intersecting planes.
*  MolSurf object generator of the isosurf renderer was improved to create the meshes with closed boundaries.
*  Maxop prop of symm renderer was implemented to limit the maximum number of symmetry operators to be rendered.
*  Zoom-in action for scalar-field objects was implemented.
*  GUI for changing the PBC option of map renderers was implemented.
*  Contour level setting by absolute value was implemented for mesh and isosurf renderes.
*  The default behaviour of the mol selection widget was improved.
*  Bug fixes:
*  FIXED: The rendering settings (especially, projection type) are not saved after closing the dialog in the pov-ray rendering dialog.
*  FIXED: Renderers using opengl shader function are not displayed after deleting one of the views in the multi-view mode.
*  FIXED: Child processes spawned from CueMol does not inherit env vars, such as LD_LIBRARY_PATH.

#### Version 2.2.3.430

*  Several molecule editor functions were implemented. (cuemol2/MolEdit)
*  Changing the chain name operation was implemented.
*  Changing the residue index operation was implemented.
*  Delete operation of the selected atoms was implemented.
*  Merge operation from one to another molecule objects was implemented.
*  You can now select the download site for PDB and density map in the fetch PDB GUI. cuemol2/FetchPDB
*  The max extent of the isosurf renderer works correctly. In the property dialog of the isosurf renderer, GUI for changing the max extent for the isosurf renderer was implemented.
*  Bug fixes:
    *  FIXED: Cannot copy multiple renderers in the workspace panel.
    *  FIXED: Cannot load PSE file generated pymol version 1.7.6 and later.
    *  FIXED: The max extent value in the density map panel is not updated, when the bufsize prop of the mapmesh renderer is changed.
    *  FIXED: Points noise are displayed in the pov-ray rendering of the MapSurfRenderer.
    *  FIXED: Preview OpenGL edge rendering of the MapSurfRenderer is not displayed correctly.
    *  FIXED: xformMat property of MolCoord object does not work correctly for the embeded molecule in the qsc file.
    *  FIXED: Change of the xformMat property of MolCoord object is ignored by the ribbon, cartoon, and namelabel renderers
    *  FIXED: Sequence panel's contents are not displayed after loading the PDB file.
    *  FIXED: Default duration of the new anim objs becomes zero.
    *  FIXED: Animation slider does not work correctly.

#### Version 2.2.3.422

*  BUGFIX: Crashes when creating symmetry-related molecule

#### Version 2.2.3.421

*  "show unit-cell" button was added in the density panel.
*  Now coordinates files are fetched from RCSB web site in the mmCIF format that supports large molecules.
*  Internal representation unit of the time value was changed from milli-second to nano-second to increase the animation precision.
*  You can now specify start/end cap properties separately in the atomintr renderer settings. (documents??)
*  You can now copy the amino-acid seqences in the sequence panel in text format (cuemol2/SequenceDisplayPanel).
*  Pre-view of the edge rendering for cylinder of ballstick was implemented.
*  You can mix the opaque edge lines and semitransparent surfaces (document??)
*  xform_mat property of objects was implemented (document?)
*  BUGFIX: Load of OpenDX format file generated other than APBS fails by "Invalid map format" exception.
*  BUGFIX: Animation rendering (and CueMol app itself) crashes when rendering applications (ffmpeg, povray) cannot be launched in MacOS X.
*  BUGFIX: The chains containing residues with non-descendent order are not displayed correctly in the sequence panel.
*  BUGFIX: Sequence and name are misaligned when a large number of molecules and chains are loaded in the sequence panel.
*  BUGFIX: Drag&drop of multiple files does not work correctly.
*  BUGFIX: CPK renderer is not displayed in GDI-generic implementation of windows OpenGL.
*  BUGFIX: Atoms outside the slab planes are clickable.
*  BUGFIX: CPK renderer does not support color proofing
*  BUGFIX: Alpha (transparency) notation of color syntax does not function correctly (cuemol2/ColorSyntax)

#### Version 2.2.3.412

*  Improvements of dsurface renderer (To do: documentation)
*  Back-face display option for dsurface renderer were implemented
*  The electrostatic potential coloring mode for the dsurface renderer was implemented.
*  Electrostatic potential coloring option for dsurface renderer were implemented
*  The property to change the ramp-above value for electrostatic coloring was implemented.
*  Back-face display of molsurf and dsurface renderers are turned on by default (when edge/silhouette line is disabled)
*  The option for the protein secondary structure assignment was implemented to eliminate a small segment of coils between helices (cylinders) in the cartoon renderer (cuemol2/Prot2ndryStr)
*  The selection renderer is now auto-created by changing selection.
*  gpu_mapmesh render now supports transparency and line width properties
*  The implementation of the atom picking routine was improved
*  The donwload source of electron density map was changed from EDS to EBI server
*  RectSelection tool now works correctly, when the selection rect spans more than two molecules.
*  BUGFIX: POV-Ray Rendering crashes when the scene contains dot surface (molsurf renderer with dot display mode)
*  BUGFIX: Hi/Mid/Lo colors in the Elepot color panel don't work
*  BUGFIX: LuxRender exporter outputs spheres with smaller than the actual sizes
*  BUGFIX: Import of PyMOL session file containing negative number residues fails by exception
*  BUGFIX: User-defined color names do not appear in color picker GUI of the solid coloring
*  BUGFIX: Double bonds are not correctly displayed when the coordinates contain hydrogen atoms

#### Version 2.2.3.403

*  Supported 64bit version (Windows 7 and later)
*  Supported reading molecular coordinates in mmCIF file format
*  Implemented new qsc file format (version 2), with LZMA (xz) compression and new molecular structure format (without limitation of atom number, residue number, chain name length, etc).
*  Implemented "reset to default style" menu in the coloring panel.
*  Implemented GUI for setting cylinder helix properties of Cartoon renderer.
*  Separated the detail values of sections to those of helix, sheet, and coil in GUI of cartoon renderer settings.
*  Added new LuxRender background types (plane and box)
*  BUGFIX: Electrostatic potential coloring of the surface renderes does not correctly work if there are more than two potential objects and surface objects.
*  BUGFIX: Changing the coloring of the trace renderers from the coloring panel GUI does not work correctly.
*  BUGFIX: The context menu of dark/light-CPK coloring in the scene panel do not use styles.
*  BUGFIX: Hydrogen atom of hydroxyl groups (HO3', etc) recognized as Ho (holmium) atom
*  BUGFIX: Atom data corupts when large mol was saved into the qsc (ver1) file.




### Series 2.2.2
#### Version 2.2.2.366

*  BUGFIX: Support for Windows XP
*  BUGFIX: Fixed bug in the Windows version installer
*  BUGFIX: Support for MacOS X 10.6 and later

#### Version 2.2.2.365

*  BUGFIX: PDB file reader cannot read SSBOND record without trailing spaces
*  BUGFIX: Pov file rendering fails with spheres with nearly-zero radius
*  BUGFIX: Animation rendering dialogbox does not remember the output prefix
*  XULRunner is updated to version 39.0<br />
Build environment for Win32 is updated to VS2013<br />
Build environment for MacOS X is updated to clang-6.1 (Xcode 6.4)

*  Implementation of density map loader by PDB ID from EDS server (see: [cuemol2/FetchPDB](../../en/cuemol2/FetchPDB))
*  Implementation of chain or secondary-structure based coloring in RainbowColoring class
*  Implementation of sequence display panel (see: [cuemol2/SequenceDisplayPanel](../../en/cuemol2/SequenceDisplayPanel))
*  Implementation of ribbon style helix rendering by CartoonRenderer (see: [cuemol2/CartoonRenderer](../../en/cuemol2/CartoonRenderer))
*  Support for MRC-type map file
*  Rendering of spheres and cylinders (cpk and ballstick renderers) using GL shader (see: [cuemol2/CPKRenderer](../../en/cuemol2/CPKRenderer) and [cuemol2/BallStickRenderer](../../en/cuemol2/BallStickRenderer))
*  Dropped the support for the CueMol2 ActiveX control in the Windows version.

### Other releases
[Japanese page](../../Updates)

#googletrnsl