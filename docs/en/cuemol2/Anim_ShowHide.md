## Show/Hide Toggle Animation
This section explains animations for toggling renderer show/hide display with examples.
(The work explained in the examples is described as a continuation of operations from the [previous section](../Anim_CameraMotion))

There are two types of show/hide toggles:

*  Show/Hide (fade in/out)
*  Slide in/out

The qsc scene file that will be completed in this section can be downloaded from:

*  [lyso_showhide1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_showhide1.qsc)

## Show/Hide Animation
Show/Hide animation is an animation where renderers gradually appear/disappear while becoming semi-transparent.
As an option, you can also make them suddenly appear/disappear without becoming semi-transparent.

### Preparation
First, create the renderer that will be the target for show/hide operations.

In this example, we create a renderer "ballstick1" that displays Lysozyme's Glu35 and Asp52 residues (A.35,52.*) in ballstick mode.
(For detailed procedures, refer to [Tutorial - Adding and Removing Renderers](../../Documents/GUIのチュートリアル(CueMol2)/Step4), etc.)

### Adding Show/Hide Animation
After creating the renderer, press the add "+" button in the animation panel.

![anim-fadeio-1](../../assets/images/cuemol2/Anim_ShowHide/anim-fadeio-1.png)

* Show corresponds to fade in
* Hide corresponds to fade out

In the example, please select Show.

### Fade in/out Animation Settings

When you add an animation, the following settings dialog is displayed:

![anim-fadeio-2](../../assets/images/cuemol2/Anim_ShowHide/anim-fadeio-2.png){ style="zoom: 0.5" .on-glb }

The Common settings part contains setting items common to other animations such as SimpleSpin.

The Show/Hide settings part contains settings specific to Show/Hide animations.

Target renderers
:   Select the target renderers to control show/hide. Multiple selections are possible.<br/>
You can add with the "+" button on the right. Also, you can delete by selecting an item and pressing the "-" button on the right.

Show/Hide
:   You can choose whether to show or hide. (Even if you intended to Hide but mistakenly selected Show, you can switch to Hide here)

Fade
:   When unchecked, show/hide switches suddenly without becoming semi-transparent.

In this example, we change the settings as follows:

* Name remains ShowAnim1 (should be default. If not, set it this way)
* Start time is 0:0:4.0 (should be default. If not, set it this way)
* Duration remains 0:0:1.0
* Add ballstick1 to Target renderers

### Verifying Changes and Playback
When you press OK in the settings dialog and close it, the animation panel will look like this:

![anim-fadeio-3](../../assets/images/cuemol2/Anim_ShowHide/anim-fadeio-3.png)

You can see that ShowAnim1 has been added at the end from 4-5 seconds.

Furthermore, by selecting the Animation ribbon and pressing the play button, you can try running the animation.
You can see that after rotation and magnification, the Asp and Glu residues gradually appear.

> **Note**: Such semi-transparent animations can become very slow if OpenGL doesn't support shaders.
To check if it's supported, look at the OpenGL Info section that appears in the log screen at startup. If GLSL and its version are not displayed, it means shaders are not supported. (This may occur with old video cards or when using CueMol via remote desktop)

## Slide In/Out Animation
Slide In/Out animation is an animation where renderers move from off-screen to appear, or move off-screen to disappear.

> **Note**: Version 2.1.0.241 has a bug where repeatedly playing and editing scenes with slide in/out animations may cause target renderers to not display correctly. In such cases, save the scene once, restart CueMol, and reload it to display animations normally.

### Adding Slide In/Out Animation
After creating the renderer, press the add "+" button in the animation panel.

![anim-slideio-1](../../assets/images/cuemol2/Anim_ShowHide/anim-slideio-1.png)

In the example, please select Slide out.

### Slide in/out Animation Settings

When you add an animation, the following settings dialog is displayed:

![anim-slideio-2](../../assets/images/cuemol2/Anim_ShowHide/anim-slideio-2.png){ style="zoom: 0.5" .on-glb }

The Common settings part contains setting items common to other animations such as SimpleSpin.

The Slide in/out settings part contains settings specific to Slide in/out animations.

Target renderers
:   Select the target renderers to control show/hide. (Same as Show/Hide case)

Direction angle
:   Specify the direction of sliding. The angle is specified clockwise with the 9 o'clock direction of the screen as 0 degrees. You can easily input angles from directions using the dropdown list on the right.

Distance
:   Specify the sliding distance. The distance unit is specified with W/2 (half the screen width) as 1. The default is 1.0, which is sufficient distance for objects in the center to completely disappear off-screen (or come from off-screen to the center). However, if the window is abnormally tall (or wide), they may not disappear from the screen, so you need to adjust the value appropriately.

Show/Hide
:   You can choose whether to show (slide in) or hide (slide out).

In this example, we change the settings as follows:

* Name remains SlideOutAnim1 (should be default. If not, set it this way)
* Start time is 0:0:6.0 (default is 0:0:5.0, but we're leaving a 1-second gap from the end of the fade in set above)
* Duration remains 0:0:1.0
* Set Quadric to 50%
* Add ballstick1 to Target renderers
* Set Direction angle to 90 degrees (Up)
* Distance remains 1.0

### Verifying Changes
When you press OK in the settings dialog and close it, the animation panel will look like this:

![anim-slideio-3](../../assets/images/cuemol2/Anim_ShowHide/anim-slideio-3.png)

The meaning of this panel display is as follows:

*  Animation is 7 seconds total (Duration is 0:0:7.0)
*  Animation starts from camera_0
*  0-1 seconds: SimpleSpin1 rotates 360 degrees
*  1-2 seconds: SimpleSpin2 rotates -360 degrees
*  2-4 seconds: CamMotion1 moves viewpoint to camera_1
*  4-5 seconds: ShowAnim1 displays ballstick1
*  5-6 seconds: static state
*  6-7 seconds: SlideOutAnim1 hides ballstick1

(The scene created above can be downloaded from
[lyso_showhide1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_showhide1.qsc))

## Animation Playback
Press the play button in the Animation ribbon to play the animation created above.
It should look like the following YouTube video:

<iframe width="425" height="350" src="https://www.youtube.com/embed/pHL52i3kzxE?mute=1&controls=1&rel=0&playlist=pHL52i3kzxE"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>
