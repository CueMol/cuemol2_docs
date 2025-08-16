## Camera Movement Animation
This section explains animations that change camera parameters (viewpoint position, orientation, magnification, etc.) with examples.
(The work explained in the examples is described as a continuation of operations from the [previous section](../../cuemol2/Anim_Cmb))

Sample qsc scene files can be downloaded from the following:

*  [lyso_cammotion1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_cammotion1.qsc): Lysozyme camera movement animation

### Initial Camera
At the start of an animation, you want the viewpoint to start from a determined position. (This may not be as important for simple rotations, etc.)

In the animation panel, there is a setting called **Start cam** as shown in the figure below, which determines from which camera viewpoint the screen is viewed at the start of the animation.

> ![anim-panel-cmb1](../../assets/images/cuemol2/Anim_Cmb/anim-panel-cmb1.png) ⇒ ![anim-startcam-1](../../assets/images/cuemol2/Anim_CameraMotion/anim-startcam-1.png)

When it shows (none) as in the figure, no camera change is made at the start (i.e., it starts from the state when the play button is pressed).

Save the viewpoint where you want to start the animation as a camera in the scene panel, and select the corresponding camera (camera_0 in the figure above) from this dropdown list.

After making the above settings, when you run the animation, you can see that the animation always starts from the specified camera_0, regardless of the viewpoint when the play button is pressed.

### Adding Camera Animation and Setting Destination
Before adding camera animation, add the destination camera in advance.
Change the viewpoint appropriately and save it as a camera in the scene panel (we assume it's saved as camera_1 in the following explanation).

Then, press the "+" button in the animation panel and select the Camera motion menu.

![anim-cammot-1](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-1.png)

### CamMotion Settings
The following settings dialog then appears:

![anim-cammot-2](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-2.png){ style="zoom: 0.5" .on-glb }

The Common settings part contains setting items common to other animations such as SimpleSpin.

The CamMotion settings part contains settings specific to camera animations.

Target camera
:   Destination camera setting

Ignore rotation, etc.
:   When checked on, the corresponding item is ignored during animation. For example, if you want to change only the viewpoint center to the target camera, check everything except Ignore center.

In this example:

*  Start time is 0:0:2.0 (should be default. If not, set it this way)
*  Set Duration to 0:0:2.0 (default is 1 second which is a bit too fast, so change to 2 seconds)
*  Set Quadric to 0.25
*  Set Target camera to camera_1

After making the above changes, press the OK button.

## Verifying Created Animation
After performing the above work, the animation panel will finally look like this:

![anim-cammot-3](../../assets/images/cuemol2/Anim_CameraMotion/anim-cammot-3.png){ .on-glb }

What this panel display means is:

*  Animation is 4 seconds total (Duration is 0:0:4.0)
*  Animation starts from camera_0
*  0-1 seconds: SimpleSpin1 rotates 360 degrees
*  1-2 seconds: SimpleSpin2 rotates -360 degrees
*  2-4 seconds: CamMotion1 moves viewpoint to camera_1

(The scene created above can be downloaded from
[lyso_cammotion1.qsc](http://downloads.sourceforge.net/project/cuemol/sample-files/2.1.0.241/lyso_cammotion1.qsc))

## Animation Playback
Press the play button in the Animation ribbon to play the animation.
It should look like the following YouTube video:

<iframe width="425" height="350" src="https://www.youtube.com/embed/V-Vtkx0vnxw?mute=1&controls=1&rel=0&playlist=V-Vtkx0vnxw"
        title="YouTube video player"
        frameborder="0"
        allow="autoplay; encrypted-media"
        allowfullscreen>
</iframe>
