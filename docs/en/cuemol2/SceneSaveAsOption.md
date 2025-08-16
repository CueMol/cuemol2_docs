## Scene Save Options

From CueMol2 2.0.1.145 onwards, when performing a "Save As" operation for Scene saving, the following option settings dialog is now displayed.

![save_qsc_option1](../../assets/images/cuemol2/SceneSaveAsOption/save_qsc_option1.png)

### Object Embedding Settings
For molecular (MolCoord) and molecular surface (MolSurf) objects, etc., by default, they are automatically embedded and saved in qsc format files only when necessary.

For example, when molecules have been moved through superposition, etc., and their coordinates have changed from the original loaded file, they will be embedded in the qsc file. However, if not, only link information to the molecular PDB file is saved in the qsc file.

Therefore, if you move only the qsc file, link breakage can occur and the qsc file may no longer be openable. (There would be no problem if you properly move the PDB file together as well...)

So, by turning on the **Embed all objects** checkbox above when saving the qsc file, molecular objects, etc., will always be embedded and saved in the qsc file, regardless of whether there are changes or not.

#### Notes
As of Version 2.0.1.145, some objects such as electron density cannot be embedded. Even when this setting is ON, they are still saved as links, so when taking out qsc files, the original data must also be taken out simultaneously.

### File Version
Specifies the version information of the qsc file to be exported.

#### QDF0
The default is QDF0. By setting it to QDF0, it will be saved in a format that can be read by versions of CueMol2 prior to 2.0.1.145.

#### QDF1
On the other hand, the QDF1 format introduced from version 2.0.1.145 enables file compression, etc., but becomes a format that cannot be read by older versions.

**Enable text encoding** means that all embedded object information is base64 encoded and saved in text format. If you plan to edit the contents of the saved qsc file with a text editor, etc., it would be safer to save with this option ON. As a drawback of base64 encoding, the file size increases by approximately 4/3 times.

When **Enable compression** is turned ON, embedded object information is saved with gzip compression. The resulting qsc file size becomes smaller (depending on the case).
