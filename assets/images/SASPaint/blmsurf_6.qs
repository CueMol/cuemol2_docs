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

molvis.setScriptColoring($r_sf) ($atom, $res, $mol) {
    local $x = $atom.pos().x()/50.0*360.0;
    return color.hsb($x,1,1);
};

gfx.setCenter($r_blm.getCenter());
gfx.updateView();

