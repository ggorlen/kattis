<?php

fscanf(STDIN, "%d", $n);
$total = 0;

for ($i = 0; $i < $n; $i++) {
    fscanf(STDIN, "%s", $p);
    $total += (int)substr($p, 0, -1) ** (int)$p[-1];
}

echo "$total\n";
