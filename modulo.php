<?php

for ($i = 0; $i < 10; $i++) {
    fscanf(STDIN, "%d", $n);
    $unique[$n%42] = 1;
}

echo count($unique) . "\n";
