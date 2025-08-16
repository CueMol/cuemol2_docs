## Combining Multiple Animations

In the previous section [cuemol2/Anim_Basic](../../cuemol2/Anim_Basic), we introduced an example of creating a single Simple spin animation. Here we will explain an example of combining multiple Simple spins with different settings.
(Of course, other types of animations explained in later sections can also be combined in the same way as Simple spin)

A sample scene file can be downloaded from:

*  [lyso_simplespin2.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin2.qsc): Lysozyme simple spin animation (Part 2)

## Adding a Second Simple Spin Animation

Add a Simple spin from the animation panel in the same way as in the previous section [cuemol2/Anim_Basic](../../cuemol2/Anim_Basic).

Here, we will make the second spin (SimpleSpin2) start immediately after the first spin (SimpleSpin1) ends.

### Settings
In the settings dialog, configure as follows:

Name
:   Should default to SimpleSpin2. Leave as is.

Start time
:   Should default to 0:0:0.0. If so, leave as is.

Relative to
:   Since it's being added as a subsequent animation to the last existing animation object (SimpleSpin1), the time specification defaults to relative to SimpleSpin1. Since we want SimpleSpin2 to start immediately after SimpleSpin1, leave this as is.

Duration
:   Defaults to 1 second. Leave as is.

Spin axis
:   Set to Cartesian and configure as (0, -1, 0). (The rotation angle remains 360 degrees, but since the axis is reversed, it will rotate in the opposite direction)

After setting as above and pressing OK, two animation items will appear in the animation panel as shown below.

![anim-panel-cmb1](../../assets/images/cuemol2/Anim_Cmb/anim-panel-cmb1.png){ .on-glb }

The two items in the figure above mean:

1.  SimpleSpin1: 360-degree rotation around the (0,1,0) axis executed over 1 second from start=0 to end=1 second
1.  SimpleSpin2: 360-degree rotation around the (0,-1,0) axis, i.e., -360-degree rotation around the (0,1,0) axis executed over 1 second from start=1 to end=2 seconds

An important point to note here (apologies for the complexity) is that animations are executed according to the start/end times shown on the right, not the order in the list.

### Playback
After making the above settings and pressing the play button on the Animation ribbon:

*  One rotation in the first second
*  One rotation in the opposite direction in the next second

You can see that it becomes an animation that returns to its original position.

## Understanding Relative Time Specification
To confirm the meaning of relative time specification, let's try changing the duration value of SimpleSpin1.

Double-click SimpleSpin1, display the edit dialog, increase the Duration from "0:0:1.0" to "0:0:2.0", and press OK.

As shown below, not only does SimpleSpin1's execution time become longer (rotation becomes slower), but SimpleSpin2's start and end times are also delayed by 1 second.

![relanim1](../../assets/images/cuemol2/Anim_Cmb/relanim1.png){ .on-glb }

When you run the animation, you can confirm that SimpleSpin2 indeed executes after SimpleSpin1 ends.

### Notes on Relative Specification

*  Only the start time can be relatively specified.
*  When the start time is relatively specified to an animation object, it specifies the time from the end point of that animation object.
*  Relative specifications can be chained multiple times. This way, even if you change intermediate times, you don't need to modify subsequent animations.
*  However, be careful not to create circular references in the chain, as this will make it impossible to determine times and prevent the animation from executing.

<a id="quadric"></a>
## Smooth Animation with Quadric Values
The Quadric value controls the smoothness of animations.
With Quadric=0, there is a 1:1 correspondence between animation time progression (starting at 0 and ending at 1 regardless of actual duration) and animation amount (in this example, 0-360 degree rotation). (See figure below)

![quad_graph_0](../../assets/images/cuemol2/Anim_Cmb/quad_graph_0.png)

On the other hand, when the Quadric value is set to 0.25, it becomes as shown in the figure below. The horizontal axis represents time progression, and the vertical axis represents animation amount. What 0.25 means is that quadratic behavior occurs between 0-0.25 and 0.75-1.0.

![quad_graph_025](../../assets/images/cuemol2/Anim_Cmb/quad_graph_025.png)

Furthermore, when the Quadric value is set to 0.5, quadratic behavior occurs throughout the entire range from 0-1.

![quad_graph_05](../../assets/images/cuemol2/Anim_Cmb/quad_graph_05.png)

As described above, when you specify a Quadric value greater than 0, the animation will have acceleration-like movement (= smooth movement) at the start and end of the animation.

### Changing the Quadric Value

Next, change the Quadric value of the above two animation items from 0 to 25% (0.25).

![anim-simplespin-2](../../assets/images/cuemol2/Anim_Cmb/anim-simplespin-2.png){ .on-glb }

(The scene created above can be downloaded from
[lyso_simplespin2.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_simplespin2.qsc))

When you press the play button on the Animation ribbon, the animation will play.
It should look like the YouTube video below.

<iframe width="425" height="350" src="https://www.youtube.com/embed/pgGzhlDSZeE?mute=1&controls=1&rel=0&playlist=pgGzhlDSZeE"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>

Previously, the transition between the end and beginning of rotations (the movement between the first spin and second spin) was jerky, but by setting Quadric to 0.25, you should see that the transition has become smooth.
