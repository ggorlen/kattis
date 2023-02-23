<?php

fscanf(STDIN, "%d %d", $n, $k);
$houses = [];

for ($i = 0; $i < $k; $i++) {
    fscanf(STDIN, "%d", $h);
    $houses[$h-1] = 1;
}

$next_house = -1;
$total = 0;

for ($i = $n - 1; $i >= 0; $i--) {
    if (array_key_exists($i, $houses)) {
        $total += $n - $i;
        $next_house = $i;
    }
    else if ($next_house >= 0) {
        $total += $n - $next_house;
    }
}

echo $total . "\n";
