# wrong answer on group 3. maybe 1:: is wrong?
use strict;
use warnings;

my $s = <>;
chomp $s;

if ($s =~ /:/) {
    my @parts = split /:/, $s;
    my $needed = 9 - (scalar @parts);
    my @x;
    my $handled_space = 0;

    for (1..$needed) {
        push @x, '0';
    }

    my $res = '';

    for my $p (@parts) {
        if ($p eq '' && !$handled_space) {
            $handled_space = 1;

            for my $x (@x) {
                $res = ".0.0.0.$x" . $res;
            }
        }
        else {
            $res = '.' . (join('.', reverse(split //, $p))) .
                ('.0' x (4 - length $p)) . $res;
        }
    }

    $res =~ s/\.\./\./g;
    $res =~ s/^\.//g;
    print "$res.ip6.arpa.\n";
}
else {
    my $rev = join('.', (reverse(split /\./, $s)));
    print $rev . ".in-addr.arpa.\n";
}
