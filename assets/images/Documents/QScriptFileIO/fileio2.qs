$pwd = sys.getScriptPath();

$mol = readPDB("$pwd/ECR_MODEL.pdb","ecr");

$smin=1.0e10;
$smax=-1.0e10;
{
    local $line;
    local $re = re/avg\s+\w\s+(\d+)\s+([\d\.]+)/;
    local $fin = fistream("$pwd/verify3d.txt");
    # read verify3d score
    while ($fin.ready()) {
        $line = $fin.readline();
        if (!$re.match($line)) {
            sys.println("Invalid line: $line");
            continue;
        }
        $resid = integer($re.at(1));
        $score = real($re.at(2));
        if ($score<=$smin)
          $smin = $score;
        if ($score>=$smax)
          $smax = $score;

        $mol.selectResid("_", $resid, $resid);
        $mol.forEachAtom() ($atom) {
            $atom.setBfac($score);
        };
    }
    sys.printf("max score: %f, min score: %f\n", [$smax, $smin]);
}


$mol.select(se/resn BLK/);
$r_lig = $mol.createRend("lig", "cpk");

$mol.select(se/resi 1:239/);
$r_p = $mol.createRend("p", "trace");
$r_p.setProp("linew", 5.0);
$r_p.setProp("coloring.colormode", 1);
$r_p.setProp("coloring.lowpar", $smin);
$r_p.setProp("coloring.highpar", $smax);
$r_p.setProp("coloring.lowcol", color(1.0, 0.0, 0.0));
$r_p.setProp("coloring.highcol",  color(1.0, 1.0, 1.0));

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
