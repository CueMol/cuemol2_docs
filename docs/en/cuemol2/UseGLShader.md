[Documents](../../Documents)
## About OpenGL Shader Functionality
In Version 2.1, rendering using OpenGL shader functionality has become available.

Currently (Version 2.1.0.243), shaders are used in the following functions:

*  [GPU-based electron density display](../../cuemol2/GPUDensityMap)
*  [Fade animation](../../cuemol2/Anim_ShowHide)

### OpenGL Version and Available Shader Functions

When CueMol starts up, OpenGL information is displayed in the log screen.
Depending on the GLSL version number, the following functions may or may not be available.

For example, if OpenGL is version 4.2 or higher as shown below, all functions can be used.
```
--- OpenGL Info ---
Vendor:   ATI Technologies Inc.
Renderer: AMD Radeon HD 7800 Series
Version:
  OpenGL 4.2.11554 Compatibility Profile Context
  GLEW 1.7.0
  GLSL 4.20
-------------------
```

When OpenGL is version 3 or 2, etc.:

*  Geometry shaders cannot be used

Also, with drivers other than ATI or nVidia:

*  Compatibility profile does not work properly

There appear to be issues such as these. Particularly in the latter case, shaders may be used incompletely and CueMol may not function properly, so please disable shaders following the procedure below.

## Disabling OpenGL Shader Functionality

With some graphics drivers, normal operation may not work due to problems such as bugs on the CueMol side or driver side (Compatibility profile not working properly?).

Turning OpenGL shader functionality on/off is done from the Options dialog displayed by menu "Edit" → "Options".

In the Misc items, in Other settings, when "Use OpenGL Shader" is turned ON, OpenGL shader functionality will be used.

In Version 2.1.0.248, it is off by default immediately after installation.

**After changing options, CueMol needs to be restarted.**

### Confirming Disabling or Enabling
If the following is displayed in the startup log, it is properly disabled:
```
OglView> shaders disabled
```

On the other hand, when enabled, a log showing that default shaders have been loaded is displayed as follows:
```
PO> Loading shader: %%CONFDIR%%/data/shaders/default_vert.glsl
PO> Loading shader OK
PO> Loading shader: %%CONFDIR%%/data/shaders/default_frag.glsl
PO> Loading shader OK
```
