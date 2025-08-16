## About POV-Ray Rendering Dialog
This section explains the POV-Ray rendering dialog.

### How to Execute the Tool
Execute menu "Render" → "POV-Ray rendering ..." to display the POV-Ray rendering dialog.

![povrender-dlg1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg1.png){ style="zoom: 0.33" .on-glb }

### Explanation of Each Setting
Below, we explain the meaning of each setting.
#### Main options

![povrender-dlg2](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg2.png){ style="zoom: 0.5" .on-glb }

W(idth), H(eight)
:   Specify the size of the resulting image in pixel units. By default, it's the same as the current screen size.

DPI
:   Specify the DPI (dots/inch) of the resulting image.

Preset size
:   Several typical sizes can be selected from the dropdown menu on the right. When selected, values are entered into the width/height/dpi fields on the left.

Projection
:   You can select Perspective (perspective projection) or Orthographic (orthographic projection).

Stereo
:   When set to None, no stereo; when set to Right or Left, images for stereoscopic viewing (parallel method) for right and left eyes can be rendered.

Stereo depth
:   When Stereo is enabled, specify the separation between left and right eyes (= the degree of 3D pop-out). Larger values create more protruding images.

CPU
:   Specify the number of CPUs that POV-Ray uses for rendering. Since CueMol actually uses 1 CPU, it's good to specify the number of installed CPUs minus 1.

Transp background
:   Specify whether to make the background color transparent. (However, making it transparent eliminates fog effects. Also, it cannot be made transparent when using radiosity method)

Clipping plane
:   Specify whether to reproduce clipping by slab currently displayed in the molecular view in POV-ray rendering as well.<br/>
**Left**: Clipping plane off, **Right**: Clipping plane on<br/>
![povrender-clip0](../../assets/images/cuemol2/POVRayRenderDialog/povrender-clip0.png){ style="zoom: 0.5" .on-glb }
![povrender-clip1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-clip1.png){ style="zoom: 0.5" .on-glb }

Post-render alpha blending
:   Specify whether to perform alpha blending after POV-Ray rendering. For details, refer to [cuemol2/PostAlphaBlend](../../cuemol2/PostAlphaBlend).

Edge lines
:   Enable edge rendering. For details, refer to [cuemol2/EdgeLines](../../cuemol2/EdgeLines).

Pix labels
:   Enable rendering of text labels etc.

#### POV-Ray options

![povrender-dlg3](../../assets/images/cuemol2/POVRayRenderDialog/povrender-dlg3.png){ style="zoom: 0.5" .on-glb }

Povray-exe-path
:   Specify the POV-Ray executable file to use for rendering. For Windows versions, it must be a console-running povray. (See POV-Ray path etc. settings below)

Povray-inc-path
:   Specify the directory containing inc files that POV-Ray references. (See POV-Ray path etc. settings below)

Radiosity
:   Specify whether to perform radiosity rendering and its mode. For details, refer to [cuemol2/Radiosity](../../cuemol2/Radiosity).

Lighting
:   Configure light sources. For details, refer to [cuemol2/POVRayRenderLighting](../../cuemol2/POVRayRenderLighting).

Shadow
:   Specify whether to render with shadows. It's off by default.<br/>
**Left**: Shadow off, **Right**: Shadow on<br/>
![povrender-shadow0](../../assets/images/cuemol2/POVRayRenderDialog/povrender-shadow0.png){ style="zoom: 0.5" .on-glb }
![povrender-shadow1](../../assets/images/cuemol2/POVRayRenderDialog/povrender-shadow1.png){ style="zoom: 0.5" .on-glb }

### POV-Ray Path etc. Settings
Among the above settings, we'll explain Povray-exe-path and Povray-inc-path.

#### Windows
When installing from an installer downloaded from [Releases](https://github.com/CueMol/cuemol2/releases/), console povray is included, and these values are set to point to the bundled version, so no special preparation is needed.

#### macOS
When installing from a dmg file downloaded from [Releases](https://github.com/CueMol/cuemol2/releases/), console povray is included, and these values are set to point to the bundled version, so no special preparation is needed.

#### When Not Bundled
When POV-Ray is not bundled, such as when building yourself, please compile console version POV-Ray yourself from Unix sources.
For Windows, since this is somewhat troublesome, we've prepared a compiled version.
You can download it [here (povray3.6-mingw32.zip)](http://sourceforge.net/projects/cuemol/files/cuemol2/win32/povray3.6-mingw32.zip/download).

First, extract the prepared file to an appropriate location (such as the desktop).

Now, **assuming CueMol2 is installed in C:\Program Files (x86)\CueMol 2.0**, copy the entire povray folder from the above zip file into it.
(You may get a dialog saying you need administrator privileges to copy, but click OK and copy anyway.)
```
C:\Program Files (x86)\CueMol 2.0\povray\povray.exe
```
should exist, and
```
C:\Program Files (x86)\CueMol 2.0\povray\include
```
should be a folder containing various inc and other files.
The executable file extracted after download may show a warning dialog when run (Windows 7 etc.). Run it once to make sure the warning dialog doesn't appear.

### Starting Rendering and Saving Images
Press the Start button at the bottom to begin rendering.

During rendering, Start changes to a Stop button, so press Stop if you want to interrupt.
As rendering progresses, the rendering image is displayed in the preview area.

When rendering is complete:

*  Press the Save image... button to save as a PNG image.
*  Press the Copy to clipboard button to copy the image to the clipboard for pasting in other software.

Press Close to close the POV-Ray rendering tool.

While the POV-Ray rendering dialog is displayed, you can still operate the main window.
If you edit the scene and return to the displayed POV-Ray rendering dialog to render again, the scene reflecting your editing work will be rendered.

(However, if you switch tabs to move to a different scene, you need to close the dialog once and reopen it, or the previous scene will be rendered.)

### Rendering Log
From CueMol2.1 onwards, information that POV-Ray writes to stdout (or stderr) during rendering is displayed in the log window (see [tutorial](../../Documents/GUIのチュートリアル(CueMol2)/Step1-2)).
If rendering doesn't work properly, please refer to the log window and provide error reports.
