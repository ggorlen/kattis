use strict;
use warnings;

my $first = 1;

while (<>) {
    chomp $_;
    my $x = $_;
    my @m;
    my $longest = 0;

    if ($x eq 0) {
        last;
    }

    if ($first eq 0) {
        print "\n";
    }

    $first = 0;

    for (1..$x) {
        my $s = <>;
        chomp $s;
        push(@m, $s);
        $longest = length $s > $longest ? length $s : $longest;
    }

    for my $row (@m) {
        $row .= " " x ($longest - length $row);
    }

    my @rotated;

    for (my $i = 0; $i < length $m[0]; $i++) {
        for (my $j = 0; $j < scalar @m; $j++) {
            my $x = substr($m[$j], $i, 1);
            $rotated[$i][$j] = $x;
            $rotated[$i][$j] = "|" if ($x eq "-");
            $rotated[$i][$j] = "-" if ($x eq "|");
        }
    }

    for my $row (@rotated) {
        $row = reverse @{$row};
        $row =~ s/ +$//g;
        print ((join "", $row) . "\n");
    }
}
