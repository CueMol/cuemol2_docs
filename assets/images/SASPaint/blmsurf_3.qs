$pwd = sys.getScriptPath();

$surf = readMSMS($pwd+"blm.face", "surf");
$r_sf = $surf.createRend("r_sf", "molsurf");

$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");

$mol.select(se/resn blm/);
$r_blm = $mol.createRend("r_blm", "ballstick");
$r_blm.setProp("sphr", 0.5);
$r_blm.setProp("bondw", 0.4);

$r_sf.setProp("scalarobj", "blm_ab");
$r_sf.setProp("colormode", 3);
$mol.select(se/resn ARG,LYS/);
molvis.paint($r_sf, color(0,0,1));
$mol.select(se/resn GLU,ASP/);
molvis.paint($r_sf, color(1,0,0));
$mol.deselect();

$r_sf.setProp("fancy.default", color(1,1,1));

gfx.setCenter($r_blm.getCenter());
gfx.updateView();

