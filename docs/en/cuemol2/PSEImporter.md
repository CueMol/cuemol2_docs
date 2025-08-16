## Loading PyMOL Session Files

CueMol can load PyMOL session files (pse files) for users migrating from PyMOL.

Execute menu "File" → "Open scene..." to display the Open scene dialog, select PyMOL Session (**.pse) from the file format options, and open the file to load the pse file.

### Support Status

In the current implementation (2.2.1.349), the following features are implemented to load correctly:

*  Molecular coordinates and colors<br/>
However, regarding colors, information is lost when the loaded pse is saved as qsc

*  Sticks representation
*  Spheres representation
*  Cartoon representation
*  Lines representation
*  Surface representation
*  Labels (however, position offsets are ignored)

We plan to gradually expand supported features in the future.
