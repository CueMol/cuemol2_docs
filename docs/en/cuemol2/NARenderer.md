## Nucleic Acid Renderer - nucl
Nucleic Acid Renderer ''nucl'' is a renderer dedicated to nucleic acids such as RNA and DNA. In addition to tubular display of the main chain similar to the Tube renderer, it can display base residues in various shapes such as sticks.

![fig1-2](../../assets/images/cuemol2/NARenderer/fig1-2.png){ style="zoom: 0.75" .on-glb }

## Settings by Properties
### Nucleic acid Tab
#### Show Tube
Specifies whether to display the main chain tube. By turning off tube display and using other tube renderers to display the main chain, more complex displays can be achieved. The left figure below shows the state with Show tube turned off, and the right shows an example combining two different main chain displays with other tube renderers.

> ![nucl-showtube1-2](../../assets/images/cuemol2/NARenderer/nucl-showtube1-2.png){ style="zoom: 0.75" .on-glb } ![nucl-showtube2-2](../../assets/images/cuemol2/NARenderer/nucl-showtube2-2.png){ style="zoom: 0.75" .on-glb }

#### Connect base pair
When residues form base pairs, specify whether to display two residues with one stick (on) or with two separate sticks (off). The figure below shows the case when turned off.

> ![nucl-connbp1-2](../../assets/images/cuemol2/NARenderer/nucl-connbp1-2.png){ style="zoom: 0.75" .on-glb }

#### Base type

basepair
:   Mode to display residues in stick form as shown above (default).

simple1
:   Similar to basepair, displayed in stick form, but becomes a bent shape at the N-glycosyl bond between base and sugar. The left figure below shows Connect base pair=on, and the right shows the display with it off.<br/>
![nucl-basetype-simple1-1](../../assets/images/cuemol2/NARenderer/nucl-basetype-simple1-1.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-simple1-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-simple1-2.png){ style="zoom: 0.75" .on-glb }

detail1
:   Mode where the base part is displayed as plates. (No display change due to base pair formation)<br/>
![nucl-basetype-detail1](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail1.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-detail1-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail1-2.png){ style="zoom: 0.85" .on-glb }

detail2
:   In addition to detail1, mode where the ribose part is also displayed as plates. (No display change due to base pair formation)<br/>
![nucl-basetype-detail2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail2.png){ style="zoom: 0.75" .on-glb } ![nucl-basetype-detail2-2](../../assets/images/cuemol2/NARenderer/nucl-basetype-detail2-2.png){ style="zoom: 0.85" .on-glb }

#### Detail
Similar to the detail value of Ballstick renderer, represents the fineness of residue display. Higher values result in smoother display but increase polygon count and processing load. Ignored during POV-Ray rendering except when using [Edge rendering](../../cuemol2/EdgeLines).

#### Base size
Specifies the size of residue display. Specifies the radius of cylinders in stick-like parts in angstrom units.

#### Base thick
In Base type=detail1, detail2 displays, specifies the thickness of bases etc. displayed as plates.
At 100%, the plate thickness and stick thickness are the same, resulting in the display shown above, but for example at 50%, the plate thickness becomes half, resulting in the display shown below (for detail2).
> ![nucl-basethick-1](../../assets/images/cuemol2/NARenderer/nucl-basethick-1.png){ style="zoom: 0.85" .on-glb }

### Tube Tab
Since the main chain display of the Nucl renderer is the same as the tube renderer, the Tube tab properties are the same as the tube renderer settings.
Here we only explain items that seem necessary to change in nucl.
For details, refer to Tube renderer settings.

Pivot atom name
:   Specifies the name of the atom through which the tube should pass. The default is P (phosphorus atom of main chain phosphate), but this tends to make the tube take too wide a detour compared to actual residues.
In some cases, changing the pivot atom name to C5' (5' position carbon of ribose group) etc. may improve appearance (especially dependent on the Base type mentioned above).<br/>
![nucl-tube-pivot-1](../../assets/images/cuemol2/NARenderer/nucl-tube-pivot-1.png){ style="zoom: 0.85" .on-glb }

## Base Pair Detection
In current CueMol (ver 2.2), when reading PDB files, the structure is checked, and when two residues are determined to form Watson-Crick base pairs, they are automatically marked as forming base pairs.
Base pair determination considers hydrogen bond distances and planarity between the two bases.

The Nucl renderer performs base pair display only for those determined to be forming base pairs when reading PDB files.
In the current version (ver 2.2), it is not possible to manually force specified residues to form base pairs or delete base pairs.
