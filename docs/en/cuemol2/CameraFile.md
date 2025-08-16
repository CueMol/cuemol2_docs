## Using the Same Camera in Multiple Scenes
The basic concepts of cameras are introduced in [Documents/GUIのチュートリアル(CueMol2)/Step9](../../Documents/GUIのチュートリアル(CueMol2)/Step9), but there are cases where you want to use the same camera (viewpoint/viewing direction) in multiple scenes.
For example, this is a common case in structural comparison figures.

While it is possible to display molecules with the same camera by copying and pasting the camera itself between scenes using the [cuemol2/ObjRendCopyPaste](../../cuemol2/ObjRendCopyPaste) method, when you change the camera, you need to copy and paste everything again, which is quite inconvenient.

## Camera and External cam Files
Therefore, in version 2.0.1.207, we implemented a method to save only camera settings in a separate file (cam file) and share camera settings by referencing it from multiple scenes.

### Context Menu for Camera Settings
When you create a camera, an item like the one shown in the figure appears in the scene panel. Right-clicking on this displays a context menu.

![camera_ctxtmenu1](../../assets/images/cuemol2/CameraFile/camera_ctxtmenu1.png){ .on-glb }

Among the menu functions, we list items related to camera setting files:

Load file...
:   Load an external cam file

Reload file
:   Reload an external cam file

Save file as...
:   Export the selected camera item as an external file

Save file
:   Overwrite and save current settings to an external cam file

Below, we explain each function step by step.

### Exporting Camera Settings to cam File
When you execute "Save file as..." mentioned above, the selected camera item is exported as an external cam file.
At this time, a file save dialog is displayed, so please save the cam file in an appropriate location.
(It's safer to save it in the same location as the qsc file or in a location with a clear relative position (like one directory up))

After saving, a file icon is displayed on the left side of the item.

![camera_icon1](../../assets/images/cuemol2/CameraFile/camera_icon1.png){ .on-glb }

This file icon indicates that this camera item is linked to an external file rather than being inside the qsc file.

### Loading cam File from Another Scene for Sharing
Next, open or create another scene qsc file, right-click on the Camera parent item in the scene panel (see figure below) to display the context menu, and click "Load file...".
(If there are already child camera items, you can also right-click on any of them)

![camera_ctxtmenu2](../../assets/images/cuemol2/CameraFile/camera_ctxtmenu2.png){ .on-glb }

A file open dialog will appear, so specify the cam file you exported earlier.
Then, as shown in the figure, a new camera item with a file icon will be created.

![camera_icon1](../../assets/images/cuemol2/CameraFile/camera_icon1.png){ .on-glb }

When you double-click this, the viewpoint etc. saved in the cam file is applied to the current view and the screen changes.

If the camera name saved in the cam file is the same as an existing camera name, it will be renamed to copyN_xxx (where N is a number) and loaded.

### Updating cam Files
Furthermore, when you change camera items linked to external files using "Save from view" or "Properties..." from the context menu, the state in CueMol and the contents of the cam file become inconsistent.

#### Overwriting to cam File
In this case, by selecting "Save file" from the context menu of the relevant camera item, the contents of the external file are overwritten with the current camera setting values in CueMol.
(This operation cannot be undone, so be careful)

Incidentally, when you overwrite and save a scene (qsc file), cameras linked to external files are also overwritten and saved to their respective files.

#### Reloading from cam File
Furthermore, when you perform overwrite saving etc. as described above, the contents of external cam files and camera items in CueMol in other scenes become inconsistent.

In this case, by selecting "Reload file" from the context menu of the relevant camera item, the contents of the external file are loaded (that is, the current camera setting values in CueMol are overwritten).

Incidentally, similar to the overwrite save case, when you reload a scene (qsc file), cameras linked to external files are also reloaded similarly.

## cam File Format
cam files are in XML format like qsc, and are formatted as if only the camera tag portion from qsc was exported externally.
For example, when opened with a text editor, they have the following format:
```
<?xml version="1.0" encoding="utf-8"?>
<camera center="(-10.837787,13.999697,15.037303)"
 centerMark="crosshair" distance="200"
 name="camera_0" perspec="false"
 rotation="(0.774185,-0.124804,0.245019,0.570112)"
 slab="50" stereoDist="1" stereoMode="none" zoom="50"/>
```

The meaning of the tag attribute values is as follows:

center
:   Coordinate values of the viewpoint center. In Å units.

centerMark
:   Type of center mark. One of crosshair, axis, or none.

distance
:   Distance between viewpoint and camera. In Å units.

name
:   Camera name

perspec
:   true for perspective projection, false for orthographic projection

rotation
:   Quaternion value representing viewing direction. (0,0,0,1) represents the Z direction, but since it's not intuitively clear, manual changes are not recommended.

slab
:   Slab thickness. In Å units.

stereoDist
:   Distance between left and right eyes for stereoscopic viewing. In Å units.

stereoMode
:   Stereoscopic viewing mode. One of none, hardware (if supported), cross, or para. However, cross/para are not implemented in current versions.

zoom
:   Magnification value. Specifies the distance between screen top and bottom in Å units.

You can also change camera settings by manually editing these values with a text editor and performing the reload operation described above.
