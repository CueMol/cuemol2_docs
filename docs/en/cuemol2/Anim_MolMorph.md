## Molecular Structure Change (Morphing)
This is used to display changes (transformation = morphing) between two identical molecules with different structures as an animation.

In CueMol2.2, morphing by linear interpolation can be used.
With linear interpolation morphing, it is possible to animate local conformational changes.

Sample scene files explained in this section can be downloaded from:

*  [mol_morph1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.2/mol_morph1.qsc): Transducin-alpha structure change morphing

## Preparation
Here, we will explain using the structural change between the GTP bound form ([1TND](http://www.rcsb.org/pdb/explore.do?structureId=1tnd)) and GDP bound form ([1TAG](http://www.rcsb.org/pdb/explore.do?structureId=1tag)) of transducin-alpha as an example.

These two structures are almost identical as molecules, but the positions of the molecules contained in each PDB file are different, so you first need to create a PDB file with both structures superimposed.

In this example, we will superimpose 1TAG onto 1TND.

### Loading Files and Superposition
First, load both 1TAG and 1TND files. You can download them from the PDB site and load them using "Open File...", or you can load them directly from the PDB site using "Get PDB using accession code..." (See [Documents/GUIのチュートリアル(CueMol2)/Step1](../../Documents/GUIのチュートリアル(CueMol2)/Step1)).

1TAG contains only one chain (A), while 1TND contains three chains (A, B, C). Display 1TAG for the entire molecule and 1TND for only chain A using the trace renderer.

![morphmol-1](../../assets/images/cuemol2/Anim_MolMorph/morphmol-1.png){ style="zoom: 0.5" .on-glb }

Next, superimpose the two molecules following "Secondary Structure Matching" in [cuemol2/MolSuperpose](../../cuemol2/MolSuperpose).
Set 1TAG as moving and 1TND as reference, specify "c;A" for the 1TND selection, and execute the superposition to get the result shown in the figure below.

![morphmol-2](../../assets/images/cuemol2/Anim_MolMorph/morphmol-2.png){ style="zoom: 0.5" .on-glb }

Once this is complete, save the moved 1TAG as a PDB file. Execute the menu "File" → "Save File As...", select 1TAG and press OK, then save it as 1TAG-fit.pdb in the file selection dialog that appears.

## Creating a MorphMol Object
### Loading the Starting Structure for the Change
First, load the structure that will be the starting point of the change.
Here, since we will use the already loaded 1TND as the starting point of the change, no special operation is needed, but if you want to use a PDB file on disk as the starting point, load it first.

### Converting from MolCoord to MolMorph Object
To perform morphing, you first need to convert the MolCoord object created by loading a PDB file into a MolMorph object that supports linear interpolation morphing.

When you execute the menu "Tools" → "Mol morphing animation...", the following dialog will be displayed, so select the MolCoord object you want to convert to MolMorph.

![morphmol-3](../../assets/images/cuemol2/Anim_MolMorph/morphmol-3.png){ .on-glb }

In this example, 1TAG and 1TND are displayed in the list, but select 1TND as the starting structure and press the OK button.

After executing as above, the following dialog will be displayed.

![morphmol-4](../../assets/images/cuemol2/Anim_MolMorph/morphmol-4.png){ style="zoom: 0.75" .on-glb }

### Adding Structure Coordinates to the MolMorph Object
With the above operation, 1TND has been converted to a MolMorph object.
The above dialog displays a list of coordinate data held by the MolMorph object.
Since it was just created by converting from one coordinate data, there is only one item (this).

Next, add the coordinate 1TAG-fit corresponding to the endpoint of the structural change.
Press the "+" button in the above dialog, and a file selection dialog will appear. Specify and load the 1TAG-fit.pdb file that was saved after superposition.
Then, an item for the coordinates corresponding to the endpoint will be added as shown below.

![morphmol-5](../../assets/images/cuemol2/Anim_MolMorph/morphmol-5.png){ style="zoom: 0.75" .on-glb }

Once the endpoint has been added, press the OK button to close the dialog.

### Editing the MolMorph Object
To further edit the coordinate data held in the MolMorph object, execute the menu "Tools" → "Mol morphing animation..." again to display the same dialog as above.

To add more coordinates, press "+", and to delete unnecessary coordinates, select the item and press the "−" button to delete it.

## Creating the Animation
### Adding the Animation
Now you are ready to perform morphing.
Next, specify when and how long to perform the morphing from the Animation panel.

![morphmol-6](../../assets/images/cuemol2/Anim_MolMorph/morphmol-6.png){ .on-glb }

Press the "+" button in the Animation panel shown above and select "Mol Morphing" to display the following settings dialog.

![morphmol-7](../../assets/images/cuemol2/Anim_MolMorph/morphmol-7.png){ style="zoom: 0.5" .on-glb }

In this example, we will create an animation that transforms from the starting point to the endpoint over 1 second starting from 0 seconds.

First, confirm that Start time is 0:0:0.0 and Duration is 0:0:1.0, then select the 1TND converted and created above in the Target MorphMol item.

The meanings of the other setting items in MolAnim settings are as follows:

Start value
:   Specifies the structure at the morphing starting point. 0 is the first structure in the structure list held by MorphMol. Conversely, 1 is the last structure.

End value
:   Specifies the structure at the morphing endpoint. 1 is the last structure in the structure list held by MorphMol. Conversely, 0 is the first structure.

That is, if Start value=1 and End value=0, the structural change will occur in the reverse direction.

Press the OK button to add an animation item, and the Animation panel will look like the figure below.

![morphmol-8](../../assets/images/cuemol2/Anim_MolMorph/morphmol-8.png){ .on-glb }

### Executing the Animation
The creation of the morphing animation is now complete.
When you play the animation according to the method in "Executing Animation" in [cuemol2/Anim_Basic](../../cuemol2/Anim_Basic), the structural transformation will be displayed as an animation.

If you display Chain A as a ribbon and add a reverse structural change (startValue=1→endValue=0), the animation will look like this:

<iframe width="425" height="350" src="https://www.youtube.com/embed/4RKA3VUVcPo?mute=1&autoplay=1&loop=1&controls=1&rel=0&playlist=4RKA3VUVcPo"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>

### Notes
#### Mismatch of Molecular Structures at Starting Point, Endpoint, etc.
If not all corresponding residues and atoms exist in the molecular coordinates of the starting point, endpoint, or intermediate points of the change, those atoms are excluded from the morphing calculation.

That is, if atoms corresponding to the main coordinates represented by (this) do not exist in other sub-coordinates, those atoms will remain stationary during the morphing animation.
On the other hand, if atoms that are not in the main coordinates are present in sub-coordinates, they are ignored when loading.

Due to this implementation, morphing between structures determined in different states for exactly the same molecule can be done easily, but transformations between similar but different homologs will not work well as is.
By creating model structures for each molecule through homology modeling etc. and aligning residue numbers, it becomes possible to morph correctly.

#### Large Structural Changes
While it is difficult to express very large domain-level changes with linear interpolation morphing, you can create animations by generating several intermediate structures of structural changes using other software and connecting them with linear interpolation morphing.
