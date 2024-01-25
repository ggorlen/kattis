<?php
fscanf(STDIN, "%d %d", $n, $p);
$hand = [[], [], [], []];

for ($i = 0; $i < $n; $i++) {
    if ($i === $p) {
        // check if we were we dealt a win. TODO: speed up?
        for ($ii = 0; $ii < count($hand); $ii++) {
            for ($jj = 0; $jj < count($hand[$ii]); $jj++) {
                if (
                    array_key_exists($jj, $hand[$ii]) &&
                    array_key_exists($jj + 1, $hand[$ii]) &&
                    array_key_exists($jj + 2, $hand[$ii])
                ) {
                    echo 1;
                    exit;
                }
        
            }
        }
    }

    fscanf(STDIN, "%d %d", $c, $k);
    $hand[$c][$k] = 1;

    if ($i >= $p) {
        $lo = 1;
        $hi = 1;

        for (; $hi < 3; $hi++) {
            if (!array_key_exists($k + $hi, $hand[$c])) {
                break;
            }
        }

        for (; $lo < 3; $lo++) {
            if (!array_key_exists($k - $lo, $hand[$c])) {
                break;
            }
        }

        if ($hi + $lo > 3) {
            echo ($i - $p + 1);
            exit;
        }
    }
}

echo "Neibb";
