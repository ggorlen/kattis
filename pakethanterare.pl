use strict;
use warnings;

my ($t, $b) = split / /, <>;
my @pkgs = split / /, <>;
my %counts;

for (my $i = 0; $i < $t; $i++) {
    my ($pkg, $cnt) = split / /, <>;
    $counts{$pkg} = $cnt;
}

for (@pkgs) {
    my $total = 0;

    for (my $i = 0; $i < $_; $i++) {
        my ($pkg, $cnt) = split / /, <>;
        $total += $counts{$pkg} - $cnt;
    }

    print "$total\n";
}
