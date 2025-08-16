## About Renderer Groups

When working with molecular objects (MolCoord) and similar items, you tend to create a large number of renderers, which can become cumbersome to manage.

In such cases, creating and managing groups based on the meaning or role of the renderers can help reduce errors and confusion.

> ![rendgroup1](../../assets/images/cuemol2/RendGroup/rendgroup1.png){ style="zoom: 0.75" .on-glb } → ![rendgroup2](../../assets/images/cuemol2/RendGroup/rendgroup2.png){ style="zoom: 0.75" .on-glb }

Groups can be collapsed and expanded as shown in the figure above. You can also toggle visibility on and off for each group (described later).

### Creating a Renderer Group
In the Scene panel, when you right-click on an object such as MolCoord, the following object context menu will be displayed.

![mol-ctxtmenu1](../../assets/images/cuemol2/RendGroup/mol-ctxtmenu1.png){ style="zoom: 0.75" .on-glb }

When you select New Group..., a dialog for specifying a new group name will appear as shown below. Enter a name (or leave it as default) and click OK. This will create a group with the specified name.

> ![newgrp1](../../assets/images/cuemol2/RendGroup/newgrp1.png){ style="zoom: 0.75" .on-glb } → ![newgrp2](../../assets/images/cuemol2/RendGroup/newgrp2.png){ style="zoom: 0.75" .on-glb }

### Moving Renderers to a Renderer Group
You can add other renderers to a group by dragging and dropping items in the Scene panel.

For example, to add the simple1 (simple) renderer below to group1, drag the simple1 (simple) item and drop it on group1, and simple1 will be moved into group1.

> ![dragdrop-grp1](../../assets/images/cuemol2/RendGroup/dragdrop-grp1.png){ style="zoom: 0.75" .on-glb } → ![dragdrop-grp2](../../assets/images/cuemol2/RendGroup/dragdrop-grp2.png){ style="zoom: 0.75" .on-glb } → ![dragdrop-grp3](../../assets/images/cuemol2/RendGroup/dragdrop-grp3.png){ style="zoom: 0.75" .on-glb }

### Adding Renderers to a Renderer Group

When you right-click on a group in the Scene panel, the following renderer group context menu will be displayed.

![grp-newrend1](../../assets/images/cuemol2/RendGroup/grp-newrend1.png){ style="zoom: 0.75" .on-glb }

When you click New renderer..., the renderer creation dialog will appear. When you click OK to create the renderer, the new renderer will be created as a renderer that belongs to that group from the beginning.

> ![grp-newrend2](../../assets/images/cuemol2/RendGroup/grp-newrend2.png){ style="zoom: 0.5" .on-glb } → ![grp-newrend3](../../assets/images/cuemol2/RendGroup/grp-newrend3.png){ style="zoom: 0.75" .on-glb }

### Modifying Renderer Group Settings
In the Scene panel, clicking the eye icon to the left of a Renderer group will hide all renderers belonging to the group, and the eye icon will disappear. (Conversely, when hidden, the eye icon is not displayed, but clicking the same position will show all renderers belonging to the group, and the eye icon will also be displayed.)

> ![grpprop_vis1](../../assets/images/cuemol2/RendGroup/grpprop_vis1.png){ style="zoom: 0.75" .on-glb } → ![grpprop_vis2](../../assets/images/cuemol2/RendGroup/grpprop_vis2.png){ style="zoom: 0.75" .on-glb }

Also, when you double-click on a Renderer group item in the Scene panel (or press the property settings button below), a group name change dialog will appear.
Enter a new group name and click OK to change the group name of the corresponding group.
