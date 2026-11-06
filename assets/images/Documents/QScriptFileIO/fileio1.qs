$pwd = sys.getScriptPath();

$mol = readPDB("$pwd/ECR_MODEL.pdb","ecr");

{
    local $line;
    local $fin = fistream("$pwd/dssp.txt");
    # skip the first 24 lines
    foreach $i (1..24) {
        $line = $fin.readline();
        $line.chomp();
        sys.println($line);
    }

    # read secondary str.
    while ($fin.ready()) {
        $line = $fin.readline();
        $resid = integer($line.substr(5, 5));
        $code = $line.substr(16, 1);
        if ($code == "H") {
            $code = "helix";
        }
        else if ($code == "E") {
            $code = "sheet";
        }
        else {
            $code = "coil";
        }
        $mol.selectResid("_", $resid, $resid);
        $mol.setProp("secondary", $code);
    }
}


$mol.select(se/resn BLK/);
$r_lig = $mol.createRend("lig", "cpk");

$mol.select(se/resi 1:239/);
$r_p = $mol.createRend("p", "ribbon");
$r_p.setProp("helix.width", 0.3);
$r_p.setProp("helix.tuber", 5.0);
$r_p.setProp("sheet.type", 1);
$r_p.setProp("helix_head.type", 0);
$r_p.setProp("helix_tail.type", 0);
$r_p.setProp("helix_tail.gamma", 2.2);
$r_p.setProp("sheet_head.type", 1);
$r_p.setProp("sheet_head.gamma", 1.5);
$r_p.setProp("sheet_tail.type", 0);
$r_p.setProp("sheet_tail.gamma", 4.0);

$mol.select(se/rprop secondary=helix/);
molvis.paint($r_p, color(1,0,0));
$mol.select(se/rprop secondary=sheet/);
molvis.paint($r_p, color(0,0,1));

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
