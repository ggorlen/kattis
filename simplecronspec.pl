use strict;
use warnings;

sub count_range {
    my ($s, $counter) = @_;
    my ($x, $y) = split /-/, $s;

    while ($x <= $y) {
        $counter->{$x++} = 1;
    }
}

sub frequency_count {
    my %counter;
    my ($s, $limit) = @_;

    if ($s eq "*") {
        $limit--;
        $s = "0-$limit";
    }

    my @chunks = split /,/, $s;

    for my $c (@chunks) {
        if ($c =~ /-/) {
            count_range $c, \%counter;
        }
        else {
            $counter{$c} = 1;
        }
    }

    %counter;
}

my $total = 0;
my %day;

for (1..<>) {
    my ($h, $m, $s) = split /\s+/, <>;
    my %hh = frequency_count $h, 24;
    my %mm = frequency_count $m, 60;
    my %ss = frequency_count $s, 60;
    $total += scalar %hh * scalar %mm * scalar %ss;

    for my $kh (keys %hh) {
        for my $km (keys %mm) {
            for my $ks (keys %ss) {
                $day{"$kh $km $ks"} = 1;
            }
        }
    }
}

print (scalar %day . " $total\n");
