## Animation
This section explains the animation creation functionality introduced in version 2.1.0.241 and later.

Sample scene files can be downloaded from the following:

* [lyso_simplespin1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin1.qsc): Simple spin animation of Lysozyme (Part 1)

### Animation Palette
From CueMol2.1 onwards, the following animation palette has been added to the side panel.

![anim-palette1](../../assets/images/cuemol2/Anim_Basic/anim-palette1.png)

If it's not displayed, you can show it via menu "Window" → "Panels" → "Animation".

Normally, newly created scenes will have empty items as shown above, with no animations.

### Adding Animations
We'll explain how to add new animations using a simple spin animation as an example.

First, please open an appropriate PDB file and display it in ribbon mode.
In this example, we use Lysozyme (1QIO), but others are fine as well.
Then, center the screen on the Lysozyme.

Next, press the "+" button in the animation palette to display a dropdown menu as shown below.
Select Simple spin from there.

![anim-palette2](../../assets/images/cuemol2/Anim_Basic/anim-palette2.png)

### Animation Settings
When you add an animation (Simple spin), the following Simple spin settings dialog is displayed.

![anim-simplespin-2](../../assets/images/cuemol2/Anim_Basic/anim-simplespin-2.png){ style="zoom: 0.5" .on-glb }

#### Common Settings
Animation settings include common settings and settings specific to individual animations.
The Common settings items in the dialog are setting items common to other types of animations.
Here, we explain the common settings.

Name
:   The name of the animation. By default, a name that doesn't conflict with other animations is assigned, but change it if you want to give it a unique name.

Disabled
:   When checked, the animation is treated as if it doesn't exist. Used for testing operations.

Start time
:   The start time of the animation.
By default, the start time is the last time of existing animations (i.e., newly added animations are added to the end).
For time specification format, see below.

Relative to
:   Select whether the Start time specification is absolute time from the animation start (absolute) or relative specification to other Animation objects. Since there's only one Animation object here, select absolute and set start time to 0. (Relative specification is explained with concrete examples later in [cuemol2/Anim_Cmb](../../cuemol2/Anim_Cmb))

Duration
:   Specifies the duration of the animation.
By default, it's an animation that lasts 1 second.

Quadric
:   Specifies the style of reaction coordinate change relative to animation time progress. (This may be difficult to understand, so we explain with concrete examples later in [cuemol2/Anim_Cmb#quadric](../../cuemol2/Anim_Cmb#quadric))

#### Time Specification
Time specifications are all done with widgets like the one shown below:

![time_widget](../../assets/images/cuemol2/Anim_Basic/time_widget.png){ .on-glb }

From the leftmost digit, specify "hour", "min", "sec", and "msec".

So, when you specify:
```
0:0:1.23
```
it means 1 second 23 milliseconds = 1.023 seconds, not 1.23 seconds.

### Simple Spin Specific Settings
The SimpleSpin settings items in the dialog are setting items specific to Simple spin.

Rotation angle
:   Specifies the rotation angle of the spin. By default, it's set to rotate 360 degrees for one rotation. Due to GUI constraints, you cannot specify more than 360 degrees. (If you want to rotate multiple times, please specify the angle property directly from the Generic tab described later)

Spin axis
:   Specifies the spin axis. When you specify X, Y, Z axis in the left dropdown listbox, it spins around each respective axis. The Y-axis is perpendicular to the screen, and the X-axis is the horizontal axis.
When set to Cartesian, you can specify numerical values in the right edit box, so manually input the X, Y, Z coordinate values of the axis. By default, it rotates around the Y-axis.

The meaning of the settings is as described above, but first, press the OK button with all initial values unchanged.
Then, the animation item added to the palette is displayed as shown below.

![anim-palette3](../../assets/images/cuemol2/Anim_Basic/anim-palette3.png){ style="zoom: 0.5" .on-glb }

The scene created above can be downloaded from:
[lyso_simplespin1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin1.qsc).

### Running Animations
Next, let's run the created animation.
Among the tabs at the top of the toolbar, click on Animation to display the Animation ribbon (animation playback UI).

![anim-ribbon1](../../assets/images/cuemol2/Anim_Basic/anim-ribbon1.png)

The role of each button etc. is explained below:

Play
:   Starts animation playback. When started, it changes to Pause.

Pause
:   Not displayed before playback, but when pressed during playback, the animation pauses.

Stop
:   Stops animation playback.

Loop
:   When checked, the animation automatically returns to the start and begins playback again after completion (loop playback).

Slider
:   Shows which time you are currently at in the animation time. You can jump to a specified time by dragging.

When you perform playback using the Animation bar above, it should look like the following YouTube video:

<iframe width="425" height="350" src="https://www.youtube.com/embed/ufYOyzHft9E?mute=1&autoplay=1&loop=1&controls=1&rel=0&playlist=ufYOyzHft9E"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>

### Changing Animation Item Settings
With the above, you have an animation that rotates one full turn around the Y-axis, but if you want to change the animation settings, select the relevant item from the animation panel (in this case, only SimpleSpin1 exists) and double-click.

![anim-palette3](../../assets/images/cuemol2/Anim_Basic/anim-palette3.png){ style="zoom: 0.5" .on-glb }

Then, the settings dialog explained above appears, and you can change settings such as rotation angle.

![anim-simplespin-2](../../assets/images/cuemol2/Anim_Basic/anim-simplespin-2.png){ style="zoom: 0.5" .on-glb }

For example, if one rotation in 1 second is too fast, change the Duration in the settings dialog to, for example, 5 seconds (0:0:5.0) and try playing again. It should change to take 5 seconds for one rotation.
