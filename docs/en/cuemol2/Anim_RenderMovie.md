## Animation Rendering and Movie File Creation
This section explains how to render animations to image files using POV-Ray and create movie files such as QuickTime or AVI using FFmpeg, with examples.
(The operations explained in the examples are described as a continuation of the operations from the [previous section](../Anim_ShowHide))

## Rendering with POV-Ray
As with still images, it is possible to render each frame of an animation to image files using POV-Ray.

When you execute the menu "Render" → "Animation rendering", the following Animation rendering dialog will be displayed.

![anim-render-1](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-1.png){ style="zoom: 0.5" .on-glb }

As shown in the figure above, there are mainly three types of setting items corresponding to tabs, which will be explained in order.

### Rendering Main Options
These are literally the main configuration options.

Output dir
:   Specifies the directory where PNG image files will be output.
Since a huge number of PNG files will be created, it is recommended to create a new directory and set it as the output dir.

Width, Height
:   Specifies the size (dimensions) of the output images. The default is 1000x1000 pixels, but this is too large, so don't forget to change it. Selecting VGA etc. from the Preset size on the right will enter the corresponding size in the width/height fields.

Preset size
:   Allows easy setting of commonly used video sizes as above. (However, even if this item is set to VGA, if the width/height values are different, the width/height values take priority) VGA or SVGA should be sufficient for presentations with regular projectors.

Projection
:   Specifies the screen projection method.
(Same as the settings in the still image POV-Ray rendering dialog.
See [Rendering Scenes with POV-Ray](../../Documents/GUIのチュートリアル(CueMol2)/Step10))

Frame rate
:   Specifies how many frames of images to render per second. Higher values result in smoother videos, but the file size also becomes correspondingly larger. Usually 30 or 24 is sufficient. If you particularly want to save on file size, you can set it to 5, but if it's too small, it will become choppy.

NCPU
:   Specifies the number of CPUs (threads) to use for rendering.
Specify the number of simultaneously executable threads minus 1.
For example, if you have a 4-core CPU with hyper-threading turned off, specify 3.

Loop
:   When this is on, the first frame is rendered again as an extra last frame. For looping videos, turning this ON can make the connection between the beginning and end smoother and less choppy. (However, in some cases, turning this off may actually reduce choppiness)

Progress
:   Displays the rendering progress.

Log
:   Displays information as rendering progresses.

In the example, specify as follows:

* Specify output dir as C:\tmp\render_tmp (please create the folder beforehand)
* Specify Width/height as QVGA (320x240)
* Specify Frame rate as 24

### Render Options
Mainly configure settings related to POV-Ray.

![anim-render-2](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-2.png){ style="zoom: 0.5" .on-glb }

Povray exe file
:   Specifies the POV-Ray executable file. If you have already rendered using the still image POV-Ray rendering dialog, the same settings will be entered, so you can leave it as is. If using the bundled POV-Ray version, appropriate values are already entered from the beginning, so there's no problem leaving it as is.

Povray inc dir
:   Specifies the POV-Ray include directory. If you have already rendered using the still image POV-Ray rendering dialog, the same settings will be entered, so you can leave it as is. If using the bundled POV-Ray version, appropriate values are already entered from the beginning, so there's no problem leaving it as is.

Clipping plane
:   Whether to use the clipping plane during rendering. Basically, leave it ON.

Post-render alpha blending
:   Turn ON for scenes with transparency.
If you know there is no transparency, turning it OFF will make rendering faster.
(For details, see [Rendering Transparent Objects](../PostAlphaBlend))

Shadow
:   Enables shadow rendering. Usually it's better not to have shadows, so turn it OFF.

In the example, specify as follows:

* Clipping plane is ON
* Post-render alpha blending is ON because transparency is used in the animation
* Shadow is OFF

### Movie Options
Mainly configure settings related to FFmpeg for encoding videos.

![anim-render-3](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-3.png){ style="zoom: 0.5" .on-glb }

Make movie
:   When OFF, only rendering to PNG files is performed, and no movie is created. This can be OFF if you plan to create a movie with other software or if you plan to try encoding multiple times with detailed FFmpeg option changes.

FFmpeg exe file
:   Specifies the FFmpeg executable file. The bundled FFmpeg version has appropriate values from the beginning, so there's no need to change it.

Output format
:   Specifies what format to encode the movie file to. For use on Mac OS X, QuickTime is good, and for Windows, AVI or wmv is good. However, wmv has inferior quality compared to the other two.

Bitrate
:   Literally specifies the bitrate. The default is 10240 kbit/s, which means a file using 10240 k bits (i.e., 1.25M bytes/sec) per second of video will be created. Specify considering the length of the video to be created and the desired file size.

In the example, the following is specified:

* Make movie is ON
* Output format is QuickTime/H.264
* Bitrate is 10240

## Executing the Rendering
After making all the above settings, press the Start button to begin rendering.
Depending on the animation length and frame rate, a very large number of images will be rendered, so it takes quite a while.

![anim-render-4](../../assets/images/cuemol2/Anim_RenderMovie/anim-render-4.png){ style="zoom: 0.5" .on-glb }

You can interrupt rendering by pressing the Stop button.

### Output Files
When Progress reaches 100%, "All tasks done" is displayed in the Log, and the Start and Close buttons become enabled, rendering is complete.

Upon completion, a large number of PNG files (and a movie file if movie encoding is ON) will be created in the output dir.

(Even when movie encoding is ON, the intermediate PNG files remain without being deleted, so encoding is also possible using video software that can use PNG files as input.)

The video encoded with the above options is shown below.

<iframe width="425" height="350" src="https://www.youtube.com/embed/pHL52i3kzxE?mute=1&controls=1&rel=0&playlist=pHL52i3kzxE"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>

However, the quality is degraded on YouTube, so the original video is of higher quality.

## Re-encoding for Use in PowerPoint or iPad
While the above method can create a movie in one go, even if the rendering step is OK, if the movie encoding part doesn't work well (or if you want to change the encoding), you may want to redo only the movie encoding.

With CueMol's GUI alone, even when redoing only the movie encoding, the only method is to redo from rendering, but you can perform only encoding using the command line or other software as follows.

### Using FFmpeg
You can re-encode the PNG files created in the output dir using FFmpeg installed with CueMol.

First, find the FFmpeg command line arguments appearing near the end of the log window from the previous encoding, and copy them (Ctrl+C on Windows, Command+C on Mac).

On Windows, open Command Prompt and:

```
> (CueMol installation directory)\ffmpeg\bin\ffmpeg.exe (Log command line arguments)
```

The CueMol installation directory is, for example, C:\Program Files (x86)\CueMol 2.0, etc.

(Log command line arguments) is where you paste the command line arguments copied above.

However, executing this will just create the same movie again, so execute with changes such as changing the encoding with the -c:v argument. For detailed argument explanations, refer to the FFmpeg website, etc.

### Using Handbrake
On the other hand, even if you re-encode with various parameter changes using FFmpeg, the movie files created by the above procedure may have the following problems when embedded in PowerPoint:

*  Abnormally choppy playback
*  PowerPoint crashes on Windows

There's also a possibility that they cannot be viewed properly on mobile devices like iPads.

To avoid these issues, it's recommended to re-encode the video with software called [Handbrake](http://handbrake.fr/).

First, use QuickTime/Raw encode when encoding the movie in CueMol to avoid degradation. (Videos encoded with raw encode cannot be viewed in Windows Media Player, etc., but this is not a problem)

Then, start Handbrake and execute "Source" → "Video File (Ctrl-O)" from the toolbar. A file open dialog will appear, so select the QuickTime (*.mov) file created above and open it.

Next, specify the output filename in the "Destination:" section. Press the "Browse" button to the right to bring up a save file dialog, and specify the desired filename (extension will be mp4 or m4v).

### Settings for PowerPoint
Next, in the Presets panel on the right, select "iPod" under "Devices".

Next, select "Picture" from the tab panel at the bottom left. When you select iPod, the image size automatically changes to iPod size, but since we're not creating for iPod here, return it to the original video screen size (height × width in pixels).
(Keeping the "Keep aspect ratio" check on prevents accidentally changing the aspect ratio)

**Note**: The macOS version has a different UI and doesn't have a Picture tab, but equivalent settings can be made from the Picture settings window displayed by menu "Window" → "Picture Settings".

Next, go to the "Video" tab and change the "Avg Bitrate (kbps)" value as needed. The default is 700 kbps, but increasing it improves quality and increases file size.

### Settings for Other Devices
Select the corresponding device in the Presets panel on the right, and appropriately change the size in Picture and the bitrate in Video.

### Re-encoding
After making the above settings, press the "Start" button in the toolbar to begin encoding and create the file.

As described above, since Handbrake cannot use PNG files as input, we follow the procedure of first encoding with CueMol (FFmpeg) with minimal degradation, then encoding again with Handbrake.
For detailed usage of Handbrake, you can find information by searching on Google, etc., so please refer to those sources if you want to know more.
