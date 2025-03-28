$pwd = sys.getScriptPath();

$surf = readMSMS($pwd+"blm.face", "surf");
$r_sf = $surf.createRend("r_sf", "molsurf");

$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");

$mol.select(se/resn blm/);
$r_blm = $mol.createRend("r_blm", "ballstick");
$r_blm.setProp("sphr", 0.5);
$r_blm.setProp("bondw", 0.4);

$r_sf.setProp("scalarobj", "blm_ab");
$r_sf.setProp("colormode", 2);
$r_sf.setProp("simple.colormode", 1);
$r_sf.setProp("simple.lowcol", color(0,0,1));
$r_sf.setProp("simple.lowpar", 20.0);
$r_sf.setProp("simple.highcol", color(1,1,0));
$r_sf.setProp("simple.highpar", 80.0);

$mol.deselect();
gfx.setCenter($r_blm.getCenter());
gfx.updateView();
