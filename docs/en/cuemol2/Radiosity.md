## Rendering with Depth Using Radiosity Method
The [Radiosity method](https://en.wikipedia.org/wiki/Radiosity_(computer_graphics)) simulates light behavior closer to real-world phenomena, enabling more realistic rendering of surface shading on objects compared to [ray tracing](https://en.wikipedia.org/wiki/Ray_tracing_(graphics)).

>![radiosity-sample1](../../assets/images/cuemol2/Radiosity/radiosity-sample1.png){ .on-glb }　　![radiosity-sample2](../../assets/images/cuemol2/Radiosity/radiosity-sample2.png){ .on-glb }

The right image was created using the Radiosity method, and the left using ray tracing.
As shown, depth perception becomes particularly clearer, but the computational load increases accordingly, making rendering take longer.

In CueMol, you can perform radiosity rendering by specifying it in the POV-Ray rendering dialog.

![radiosity-dlg1](../../assets/images/cuemol2/Radiosity/radiosity-dlg1.png){ .on-glb }

### Radiosity Rendering Modes
As shown in the Radiosity settings in the dialog above, radiosity rendering has the following modes:

Disable
:   Does not use radiosity method; uses ray tracing method (default)

Fast
:   Performs radiosity rendering using a simple method.

OutdoorLQ
:   Performs radiosity rendering using a simple method.

OutdoorHQ
:   Performs radiosity rendering using a high-precision method.

Others
:   Various other settings exist, but these are not commonly needed.

OutdoorHQ (and Final, IndoorHQ) take a very long time to compute.
It's recommended to first try with a smaller image using OutdoorLQ, then render the required size image with OutdoorHQ.
For rendering image size settings, refer to [About POV-Ray rendering dialog](../POVRayRenderDialog).

### Light Source Configuration
Light source configuration becomes important in radiosity rendering. For details, refer to [About Light Source Configuration](../POVRayRenderLighting).
