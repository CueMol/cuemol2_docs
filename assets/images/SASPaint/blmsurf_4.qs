$pwd = sys.getScriptPath();
sys.exec("$pwd/../bleomycin/2ndry.qs");

$surf = readMSMS($pwd+"blm.face", "surf");
$r_sf = $surf.createRend("r_sf", "molsurf");

$mol = readPDB($pwd+"blm_ab_nosec.pdb","blm_ab");

$mol.select(se/resn blm/);
$r_blm = $mol.createRend("r_blm", "ballstick");
$r_blm.setProp("sphr", 0.5);
$r_blm.setProp("bondw", 0.4);

$r_sf.setProp("scalarobj", "blm_ab");
$r_sf.setProp("colormode", 3);

$a_col = color.hsb(0, 0.5, 1.0);
$b_col = color.hsb(180, 0.5, 1.0);
$mol.select(se/chain A/);
molvis.paint($r_sf, $a_col);
$mol.select(se/chain A/ & $helix);
molvis.paint($r_sf, $a_col.addhue(30.0));
$mol.select(se/chain A/ & $sheet);
molvis.paint($r_sf, $a_col.addhue(-30.0));
$mol.select(se/chain B/);
molvis.paint($r_sf, $b_col);
$mol.select(se/chain B/ & $helix);
molvis.paint($r_sf, $b_col.addhue(30.0));
$mol.select(se/chain B/ & $sheet);
molvis.paint($r_sf, $b_col.addhue(-30.0));
$mol.deselect();

gfx.setCenter($r_blm.getCenter());
gfx.updateView();

