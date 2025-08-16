## Installing APBS and PDB2PQR

Using APBS (http://www.poissonboltzmann.org/) from CueMol2, you can calculate electrostatic potential maps with reasonable ease.

This page explains how to install APBS and PDB2PQR, which are used for calculating electrostatic potential maps.

## For Windows

In CueMol 2.1.0 and later versions with bundled APBS (Windows version only), both APBS and a simplified version of PDB2PQR are installed when CueMol is installed, so users don't need to do anything special.

Please proceed to [Calculating Electrostatic Potential Maps](../../cuemol2/APBS_ElePot).

## For macOS

In CueMol 2.2.3.434 and later versions, APBS and PDB2PQR are included, so users don't need to do anything special.

Please proceed to [Calculating Electrostatic Potential Maps](../../cuemol2/APBS_ElePot).

### Installing APBS
For macOS, download from the [APBS site](../../https://sourceforge.net/projects/apbs/files/apbs/) on Sourceforge.

The current latest version (as of 2014/8) is 1.4.1:

*  https://sourceforge.net/projects/apbs/files/apbs/apbs-1.4.1/

Please download APBS-1.4.1-binary.dmg from this location.

After that, double-click to open the dmg file and copy the APBS icon that appears to Applications or elsewhere to install it.

### Installing pdb2pqr
To calculate electrostatic potential, you need to assign charges (partial charges) to each atom in the molecule.
Also, since the original PDB files usually don't contain hydrogen atoms, you need to add hydrogen atoms.
Hydrogen atoms attached to N or O have positive charges, so this is quite important for properly calculating electrostatic potential.

To assign charges and add hydrogens, it's best to use pdb2pqr (http://www.poissonboltzmann.org/).
(While CueMol itself has a charge assignment feature, using pdb2pqr is better.)

For macOS, download from the [PDB2PQR site](../../https://sourceforge.net/projects/pdb2pqr/files/pdb2pqr/) on Sourceforge.

The current latest version (as of 2014/8) is 1.9.0:

*  https://sourceforge.net/projects/pdb2pqr/files/pdb2pqr/pdb2pqr-1.9.0/

Please download pdb2pqr-osx-bin-1.9.0.tar.gz from this location.

After that, double-clicking the tar.gz file in the Downloads folder will extract it, creating a folder called:

> pdb2pqr-osx-bin-1.9.0

in the same location (Downloads folder).
Move this to an appropriate location (for example, /Applications).

## Usage
Once the above is complete, please proceed to [Calculating Electrostatic Potential Maps](../../cuemol2/APBS_ElePot).
