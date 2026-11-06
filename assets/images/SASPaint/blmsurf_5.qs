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

local $col1 = color.hsb(180, 0.8, 1.0);
local $col2 = color.hsb(135, 0.8, 1.0);
local $col3 = color.hsb(90, 0.8, 1.0);
local $col4 = color.hsb(45, 0.8, 1.0);
local $col5 = color.hsb(0, 0.8, 1.0);

molvis.setScriptColoring($r_sf) ($atom, $res, $mol) {
  local $bfac = $atom.bfac();
  if ($bfac<10.0)
    return $col1;
  else if ($bfac<20.0)
    return color.gradient($col2, $col1, ($bfac-10.0)/10.0);
  else if ($bfac<30.0)
    return color.gradient($col3, $col2, ($bfac-20.0)/10.0);
  else if ($bfac<40.0)
    return color.gradient($col4, $col3, ($bfac-30.0)/10.0);
  else if ($bfac<60.0)
    return color.gradient($col5, $col4, ($bfac-40.0)/20.0);
  else
    return $col5;
};

gfx.setCenter($r_blm.getCenter());
gfx.updateView();

