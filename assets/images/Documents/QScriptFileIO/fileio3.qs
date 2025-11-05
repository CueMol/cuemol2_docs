$pwd = sys.getScriptPath();

$mol = readPDB("$pwd/ECR_MODEL.pdb","ecr");

$smin=1.0e10;
$smax=-1.0e10;
$scores=dict();
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
        $resid_str = $re.at(1);
        $score = real($re.at(2));
        if ($score<=$smin) $smin = $score;
        if ($score>=$smax) $smax = $score;

        $scores{$resid_str} = $score;
    }
    sys.printf("max score: %f, min score: %f\n", [$smax, $smin]);
}


$mol.select(se/resn BLK/);
$r_lig = $mol.createRend("lig", "cpk");

$mol.select(se/resi 1:239/);
$r_p = $mol.createRend("p", "tube");

local $col1 = color(1.0, 0.0, 0.0);
local $col2 = color(1.0, 1.0, 1.0);
molvis.setScriptColoring($r_p) ($atom, $res, $mol) {
    local $sc = $scores{$res.index().tostr()};
    if ($sc<$smin)
      return $col1;
    else if ($sc<$smax)
      return color.gradient($col2, $col1, ($sc-$smin)/($smax-$smin));
    else
      return $col2;
};

$mol.deselect();
gfx.setCenter($r_p.getCenter());
gfx.updateView();
