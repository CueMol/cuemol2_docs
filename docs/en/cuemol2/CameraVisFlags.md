## Saving Renderer etc. Show/Hide States to Camera
In addition to current viewpoint information, it is possible to save the show/hide states of objects/renderers to cameras.

This is useful in cases such as:

*  When many MolCoord (molecular structure) objects are loaded or many renderers are created, managing the show/hide states of each object/renderer becomes troublesome

*  When you want to create images corresponding to multiple figures in one scene

### Saving Display States
When you want to save show/hide states (vis flags) to a camera, right-click on the target camera and execute "Save from scene (with vis flags)" in the displayed context menu.

![camvis-ctxtmenu1](../../assets/images/cuemol2/CameraVisFlags/camvis-ctxtmenu1.png){ style="zoom: 0.5" .on-glb }

When you execute "Save from scene (with vis flags)", the show/hide states of all objects/renderers in the current scene are saved to the target camera.

When show/hide states (vis flags) are saved to a camera, an eye icon is displayed next to that camera item (however, in the current version, there is a bug where it may not be displayed).

![camvis-visset1](../../assets/images/cuemol2/CameraVisFlags/camvis-visset1.png){ .on-glb }

### Restoring Saved Show/Hide States

When you want to restore show/hide states (vis flags) saved to a camera, right-click on the target camera and execute "Load to scene (with vis flags)" in the displayed context menu.

Alternatively, double-clicking on the camera has the same effect.

At this time, in addition to the saved show/hide states, viewpoint information etc. is also applied to the current view, similar to "Apply to view" in the context menu.

### Editing Show/Hide States
When you execute "Edit vis flags..." from the above context menu, you can edit the show/hide states (vis flags) saved to the relevant camera. The following dialog is displayed:

![camvis-editdlg1](../../assets/images/cuemol2/CameraVisFlags/camvis-editdlg1.png){ .on-glb }

Central Obj/Rend column
:   Objects/renderers in the current scene are displayed similar to the scene panel.

Left Inc column
:   Check marks may or may not be displayed, but those that are displayed indicate that show/hide state information (vis flag) is saved to the (currently being edited) camera.<br/>
That is, when "Load to scene (with vis flags)" is executed, the show/hide state of this object (or renderer) will change to either visible or hidden.<br/>
Conversely, for items with nothing displayed, the corresponding object (or renderer) is grayed out and no vis flag is saved. Therefore, even if "Load to scene (with vis flags)" is executed, the show/hide state of the relevant object (or renderer) in the scene will not change.

Right Vis column
:   Eye icons may or may not be displayed, but those that are displayed indicate that the vis flag is saved in the visible state to the (currently being edited) camera. So, when you double-click this camera (or execute "Load to scene (with vis flags)" from the context menu), the object (or renderer) corresponding to this item will become visible.<br/>
Conversely, for items with nothing displayed, the vis flag is saved in the hidden state. Therefore, when "Load to scene (with vis flags)" is executed, the corresponding object (or renderer) will become hidden.

### Clearing All Show/Hide States
When you execute "Clear vis flags" from the above context menu, all show/hide states (vis flags) saved to the target camera are deleted.

Furthermore, when show/hide states are deleted, the eye icon displayed next to that camera item disappears (however, in the current version, there is a bug where it may not disappear).

### Other Notes
For the existing menu items:

*  Save from view
*  Apply to view

Only the camera's viewpoint settings etc. are applied to the current view, show/hide states are ignored, and there is no effect on the show/hide states of objects and renderers in the scene.

Using this (somewhat tricky), you can copy only the show/hide states (vis flags) from one camera (A) to another camera (B):

1.  Copy camera (A) to create camera (copy1_A).
1.  Select camera (B) and execute "Apply to view"
1.  Select camera (copy1_A) and execute "Save from view"
1.  Delete camera (B) and rename camera (copy1_A) to camera (B). (However, this step is unnecessary if there's no problem keeping B)

**Note**: For other items in the camera context menu, refer to [Documents/GUIのチュートリアル(CueMol2)/Step9](../../Documents/GUIのチュートリアル(CueMol2)/Step9) and [cuemol2/CameraFile](../../cuemol2/CameraFile).
