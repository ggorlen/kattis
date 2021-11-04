<?php

fscanf(STDIN, "%d", $n);
$total = 0;

while (fscanf(STDIN, "%f %f", $q, $y) === 2) {
    $total += $q * $y;
}

echo "$total\n";
